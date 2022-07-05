//
//  ContentView.swift
//  BMI_Calculator
//
//  Created by Chumporn Kaewpitak on 5/7/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @State var resultName:String = "BMI Calculator"
    @State var weight:String = ""
    @State var height:String = ""
    
    
    var body: some View {
        VStack {
            Text(self.resultName)
                .multilineTextAlignment(.center)
                .padding()
            HStack {
                Text("Height : ")
                TextField("Centimeters", text: $height)
                    .keyboardType(.numberPad)
            }.padding()
            HStack {
                Text("Weight : ")
                TextField("Kikograms", text: $weight)
                    .keyboardType(.numberPad)
            }.padding()
            Button("Calculator") {
                var result = Double(self.weight)! / pow(Double(self.height)! / 100.0, 2)
                result =  round(result * 100) / 100.0
                
                var descriptions:String = ""
                if(result<18.50){
                    descriptions = "you're in the underweight range"
                }else if(result>=18.50 && result<=24.9){
                    descriptions = "you're in the healthy weight range"
                }
                else if(result>=25 && result<=29.9){
                    descriptions = "you're in the overweight range"
                }
                else if(result>=30 && result<=39.9){
                    descriptions = "you're in the obese range"
                }

                self.resultName = "BMI is "+String(result)+"\n"+descriptions
            }
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
