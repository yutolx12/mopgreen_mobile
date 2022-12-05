// ignore_for_file: camel_case_types

part of 'pages.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class selamatdatang extends StatefulWidget {
  const selamatdatang({Key? key}) : super(key: key);

  @override
  State<selamatdatang> createState() => _selamatdatangState();
}

class _selamatdatangState extends State<selamatdatang> {
  bool _isHiddenPassword = true;
  bool _isHiddenConfrimPassword = true;

  final namadepanController = TextEditingController();
  final namabelakangController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final asalinstitusiController = TextEditingController();
  final kegiatanController = TextEditingController();
  Future userLogin(String email, String password) async {
    HttpOverrides.global = MyHttpOverrides();

    // SERVER LOGIN API URL
    var url = 'https://20.20.0.245/1.%20KULIAH/MOP-Green/login.php';
    //  Uri.parse(url);

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};
    // var errorcode = true;

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = response.statusCode;
    //var datauser = response.body;
    //var hasiluser = jsonDecode(datauser);
    // var namadepan = hasiluser['nama_depan'];
    // var namabelakang = hasiluser['nama_belakang'];
    return response.statusCode == 200;
  }

  _showDialog(context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Error'),
              content: Text('Incorrect Email or Password'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));

    // _showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultmargin),
          children: [
            const SizedBox(
              height: 110,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            // Text(
            //   "Selamat Datang",
            //   style: selamatdatangTextStyle.copyWith(
            //       fontSize: 34,
            //       fontWeight: FontWeight.w600,
            //       color: button2Color),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            Text(
              "MOP Green merupakan sebuah sistem informasi \n monitoring dan controlling green house, tersedia dalam versi web untuk admin dan guest serta mobile untuk user.",
              style: deskripsiTextStyle.copyWith(
                  fontSize: 14, color: Color(0xff737373)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 150,
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultmargin,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  //* Bagian Modal
                                  Container(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: backgroundColor,
                                            // gradient: LinearGradient(
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            //   colors: [
                                            //     Color(0xFF16D682),
                                            //     Color(0xFF05BE5E)
                                            //   ],
                                            // ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(40),
                                                topLeft: Radius.circular(40))),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: defaultmargin),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //jarak
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Registrasi",
                                                        style:
                                                            registrasiTextStyle
                                                                .copyWith(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        //!Ketika Icon di tekan maka popup akan close
                                                        Navigator.pop(context);
                                                      },
                                                      child: Image.asset(
                                                          'assets/images/close.png',
                                                          height: 24,
                                                          width: 24),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),

                                              TextField(
                                                  controller:
                                                      namadepanController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Nama Depan",
                                                    labelText: "Nama Depan",
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              TextField(
                                                  controller:
                                                      namabelakangController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Nama Belakang",
                                                    labelText: "Nama Belakang",
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              // TextField(
                                              //     decoration: InputDecoration(
                                              //   border: OutlineInputBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(10),
                                              //   ),
                                              //   hintText: "Username",
                                              //   labelText: "Username",
                                              // )),
                                              // const SizedBox(
                                              //   height: 10,
                                              // ),

                                              TextField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Email",
                                                    labelText: "Email",
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              TextField(
                                                  controller:
                                                      asalinstitusiController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Asal Institusi",
                                                    labelText: "Asal Institusi",
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              TextField(
                                                  controller:
                                                      kegiatanController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Kegiatan",
                                                    labelText: "Kegiatan",
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              TextField(
                                                  controller:
                                                      passwordController,
                                                  obscureText:
                                                      _isHiddenPassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Password",
                                                    labelText: "Password",
                                                    suffixIcon: IconButton(
                                                        icon: Icon(_isHiddenPassword
                                                            ? Icons
                                                                .visibility_off
                                                            : Icons.visibility),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isHiddenPassword =
                                                                !_isHiddenPassword;
                                                          });
                                                        }),
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              TextField(
                                                  controller:
                                                      passwordController,
                                                  obscureText:
                                                      _isHiddenConfrimPassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText:
                                                        "Confirm Password",
                                                    labelText:
                                                        "Confirm Password",
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                            _isHiddenConfrimPassword
                                                                ? Icons
                                                                    .visibility_off
                                                                : Icons
                                                                    .visibility),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isHiddenConfrimPassword =
                                                                !_isHiddenConfrimPassword;
                                                          });
                                                        }),
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      2 * defaultmargin,
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton.styleFrom(
                                                          primary: button2Color,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                      child: Text(
                                                        'Registrasi',
                                                        style: buttonStyle
                                                            .copyWith(
                                                          color:
                                                              backgroundColor,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ))),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("Sudah punya Akun? ",
                                                      style: deskripsiTextStyle
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff737373),
                                                              fontSize: 14)),
                                                  Text("Login",
                                                      style: deskripsiTextStyle
                                                          .copyWith(
                                                              color:
                                                                  buttonColor,
                                                              fontSize: 14))
                                                ],
                                              ),
                                              SizedBox(
                                                height: defaultmargin,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            });
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: button2Color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'Register',
                      style: deskripsiTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: backgroundColor),
                    ))),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultmargin,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  //* Bagian Modal
                                  Container(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: backgroundColor,
                                            // gradient: LinearGradient(
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            //   colors: [
                                            //     Color(0xFF16D682),
                                            //     Color(0xFF05BE5E)
                                            //   ],
                                            // ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(40),
                                                topLeft: Radius.circular(40))),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: defaultmargin),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //jarak
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Login",
                                                        style:
                                                            registrasiTextStyle
                                                                .copyWith(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        //!Ketika Icon di tekan maka popup akan close
                                                        Navigator.pop(context);
                                                      },
                                                      child: Image.asset(
                                                          'assets/images/close.png',
                                                          height: 24,
                                                          width: 24),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),

                                              TextField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Your Email",
                                                    labelText: "Email",
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),

                                              TextField(
                                                  controller:
                                                      passwordController,
                                                  obscureText:
                                                      _isHiddenPassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Password",
                                                    labelText: "Password",
                                                    suffixIcon: IconButton(
                                                        icon: Icon(_isHiddenPassword
                                                            ? Icons
                                                                .visibility_off
                                                            : Icons.visibility),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isHiddenPassword =
                                                                !_isHiddenPassword;
                                                          });
                                                        }),
                                                  )),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(children: const [
                                                Text("Forgot Password ?")
                                              ]),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      2 * defaultmargin,
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        try {
                                                          String useremail =
                                                              emailController
                                                                  .text;
                                                          String userpassword =
                                                              passwordController
                                                                  .text;
                                                          if (useremail
                                                                  .isNotEmpty &&
                                                              userpassword
                                                                  .isNotEmpty) {
                                                            bool response =
                                                                await userLogin(
                                                                    useremail,
                                                                    userpassword);
                                                            if (response) {
                                                              Navigator
                                                                  .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const navigasiPage(),
                                                                ),
                                                              );
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder: (_) =>
                                                                      AlertDialog(
                                                                        title: Text(
                                                                            'Error'),
                                                                        content:
                                                                            Text('Email dan password salah'),
                                                                        actions: <
                                                                            Widget>[
                                                                          ElevatedButton(
                                                                            child:
                                                                                Text('Close'),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          )
                                                                        ],
                                                                      ));
                                                            }
                                                          } else {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Error'),
                                                                      content: Text(
                                                                          'Email dan password harus diisi'),
                                                                      actions: <
                                                                          Widget>[
                                                                        ElevatedButton(
                                                                          child:
                                                                              Text('Close'),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        )
                                                                      ],
                                                                    ));
                                                          }
                                                        } catch (err) {
                                                          print(err);
                                                          // print(errorcode);
                                                          // print(
                                                          //     'error =  $err');
                                                          // if (errorcode ==
                                                          //     false) {
                                                          //   _showDialog(
                                                          //       context);
                                                          // }
                                                        }
                                                        // userLogin();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: button2Color,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                      child: Text(
                                                        'Login',
                                                        style: buttonStyle.copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                backgroundColor),
                                                      ))),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("Belum punya Akun? ",
                                                      style: deskripsiTextStyle
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff737373),
                                                              fontSize: 14)),
                                                  Text("Registrasi",
                                                      style: deskripsiTextStyle
                                                          .copyWith(
                                                              color:
                                                                  buttonColor,
                                                              fontSize: 14))
                                                ],
                                              ),
                                              SizedBox(
                                                height: defaultmargin,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            });
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: backgroundColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: button2Color, width: 3),
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'Login',
                      style: buttonStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: button2Color),
                    ))),
          ],
        ),
      ),
    );
  }
}
