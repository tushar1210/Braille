//
//  ViewController.swift
//  vibrationsTest
//
//  Created by Tushar Singh on 11/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {
    @IBOutlet weak var touchView: UIView!
    @IBOutlet weak var vibButton1 : UIButton!
    @IBOutlet weak var vibButton2 : UIButton!
    @IBOutlet weak var vibButton3 : UIButton!
    @IBOutlet weak var vibButton4 : UIButton!
    @IBOutlet weak var vibButton5 : UIButton!
    @IBOutlet weak var vibButton6 : UIButton!
    @IBOutlet weak var vibButton7 : UIButton!
    @IBOutlet weak var vibButton8 : UIButton!
    @IBOutlet weak var vibButton9 : UIButton!

    var touchOrigin : CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: touchView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        touchOrigin = view.frame.origin
        //vibButton.backgroundColor = .orange
        
    }
   
    
    func vibratePhone() {
        //vibButton.backgroundColor = .red
        if (UIDevice.current.model == "iPhone") {
            AudioServicesPlaySystemSound(1352) //1352 1113 vibration code
        }
        else {
            AudioServicesPlayAlertSound(1105)
        }
        
    }
    
    
    //MARK :- Touch gesture
    
    @objc func tap(_ recognizer: UIGestureRecognizer?) {
        let tappedPoint: CGPoint? = recognizer?.location(in: view)
        let xCoordinate: CGFloat? = tappedPoint?.x
        let yCoordinate: CGFloat? = tappedPoint?.y
        let x = tappedPoint!.x
        let y = tappedPoint!.y
        touchView.frame = CGRect(x: x-15, y: y-15, width: 30, height: 30)
        
        
        print("Touch Using UITapGestureRecognizer x : \(xCoordinate ?? 0.0) y : \(yCoordinate ?? 0.0)")
    }
    

    
    //MARK :- Pan Gesture
    func addPanGesture(view:UIView){
            let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
            view.addGestureRecognizer(pan)
            print("Gesturre")
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer){
        let view = sender.view
        let translation = sender.translation(in: view)
        switch sender.state{
        case .ended,.changed:
            view?.center = CGPoint(x: (view!.center.x) + translation.x, y: (view!.center.y) + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            print("translating")
          //  for i in 0...vibCollection.count{
            if view!.frame.intersects(vibButton1.frame)||view!.frame.intersects(vibButton2.frame)||view!.frame.intersects(vibButton3.frame)||view!.frame.intersects(vibButton4.frame)||view!.frame.intersects(vibButton6.frame)||view!.frame.intersects(vibButton5.frame)||view!.frame.intersects(vibButton7.frame)||view!.frame.intersects(vibButton8.frame)||view!.frame.intersects(vibButton9.frame){
                vibratePhone()
               
                
                }
            //}
            break
       
        default : print("a")
            break
            
        }
        
    }

    
   
}

