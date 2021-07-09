import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Day 1',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logoImage = 'assets/images/logo-1.jpg';
  double _weightSliderValue = 70;
  double _heightSliderValue = 170;
  double _bmi = 0;
  String _message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator',
        style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text('BMI Calculator', style: TextStyle(fontSize: 28),),
              SizedBox(height: 8,),
              Image.asset(logoImage,width: 240,),
              Text('We care about you'),
              SizedBox(height: 9,),
              Text(" Height - ${_heightSliderValue.toStringAsFixed(1)} cm",
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
              SizedBox(height: 9,),
              Slider(
                value: _heightSliderValue,
                min: 100,
                max: 220,
                label: _heightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _heightSliderValue = value;
                  });
                },
              ),
              Text(" Weight - ${_weightSliderValue.toStringAsFixed(1)} kg",
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
              SizedBox(height: 9,),
              Slider(
                value: _weightSliderValue,
                min: 0,
                max: 200,
                label: _weightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _weightSliderValue = value;
                  });
                },
              ),
              SizedBox(height: 8,),
              _bmi != 0 ? Text('Your BMI is: ${_bmi.toStringAsFixed(0)}..$_message')
                : Container(),
              TextButton.icon(
                  onPressed: (){
                    var tempBmi = _weightSliderValue / pow((_heightSliderValue/100),2);
                    var tempMessage = "";
                    if (tempBmi < 18) {
                      tempMessage = 'You are underweight';
                    }
                    else if (tempBmi < 25) {
                      tempMessage = " You are normal";
                    }
                    else if (tempBmi < 30){
                      tempMessage = 'You are overwight';
                    }
                    else {
                      tempMessage = 'You are OBESE!';
                    }
                    setState(() {
                      _bmi = tempBmi;
                      _message = tempMessage;
                    });
                  },
                  icon: Icon(Icons.favorite),
                  label: Text('Calculate'))
            ],
          ),
        ),
      ),
    );
  }
}




