Return-Path: <bhas_purk@hotmail.com>
X-Greylist: delayed 3630 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Aug 2018 02:26:34 UTC
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092010063.outbound.protection.outlook.com [40.92.10.63])
	by mail.openembedded.org (Postfix) with ESMTP id B911478F82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 02:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EjDfd/PwGQhpLPMxzEcTm5Sz0pbUGqgCqUMlFQsjYIk=;
	b=D4QYudks4Gc8XPLTjEFTvfMfvWthM2SCLL6dQM0oSC0fimfHPQuuK1zYOzEqDu7uG61LxMNZOHQHiFRkiTYac6CMnwF/ynNEcL7wL20Fl7xg03yB9Omk5xnQoD9mO4cVnhS9KhRsws7fLOaYbmpZ9lMs6pZCKZNhxRkW7ewC2A9CbRiW5+voCfyipLK5RyMCp4WwH8WX/9ggbO3jU5FHbaKDwmLaEAeB9q7uMWuYLc+LduLd6A72YdbTgom9CisJtGZ3KAKolSp3+87VFAXleokADqzEcUxNyEp2SkeX/qHa+OQovd1qaijKAM6XWZs9Nuimdjjpxnpta2DHx3P+Pg==
Received: from BN3NAM04FT021.eop-NAM04.prod.protection.outlook.com
	(10.152.92.56) by BN3NAM04HT234.eop-NAM04.prod.protection.outlook.com
	(10.152.93.158) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1059.14;
	Mon, 13 Aug 2018 22:51:37 +0000
Received: from SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM (10.152.92.57) by
	BN3NAM04FT021.mail.protection.outlook.com (10.152.92.150) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.1059.14 via Frontend Transport; Mon, 13 Aug 2018 22:51:36 +0000
Received: from SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM
	([fe80::fc39:3e8d:54aa:b77]) by SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM
	([fe80::fc39:3e8d:54aa:b77%8]) with mapi id 15.20.1038.025;
	Mon, 13 Aug 2018 22:51:35 +0000
From: bhas_purk <bhas_purk@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: adding python modules
Thread-Index: AQHUM1cVFKEX3+ADrkOmz1lbqtCVYw==
Date: Mon, 13 Aug 2018 22:51:35 +0000
Message-ID: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C9B52D7B22587B5550B51022D25C761A5D1CF3D2EA141CDF7114CECB582ABF9D;
	UpperCasedChecksum:95389CC0B5881E400B325660D90831B6F2471B425C5667B78A6AC8FCC273E02E;
	SizeAsReceived:6866; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [AxbEoU5SVQjZWKm8v3F4EYeBddOG2jex]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN3NAM04HT234;
	6:0OeKt9hx2jACQ/YHXIUkz+2QRLMAUDubbOqgik4eB3+ZCkiM/NT4Uri8mAI1qho144oSorVA+ozvOVIBx7rqO0LdwWkHJoUuMo939ickklUBTwAI+bqFU894BksCZRj7XtRl4wOCYgMe/f5ms5b6VRPnpFQiPqRYrrHy2VVOBK2yY+5cjzThUFWbhrbzDDHgEr/FbIv+Rw1qHT+9hL9dWZwMwl45l56yVQlPkq9nkjcTQLcUOKvNc3F2/qm0eQJbXj9qa1gKkiShU4Q4u2AMBQdR/NV6IA+QWrU9JMqIqseycoAPiQnyqj2d1THO3QW7xhFf64rciECC419t+gVC2TqQgeBnpQZ64FIEKEQqyryke0GB/vseO3/FAyMayFlf8AkVcvB2Bo+yEwxsJddsQeQ7vll7lYGeD4iBohDORA/uLAOScz6jWUtuuIS+Qc83ZBLrZgJmzSnBv08O/Va+/A==;
	5:yVAfiZWWfkdoeTJdeWNno6bQU9/qW57RcKbR+kD3fi4apDi//rcEasjlBqnvvaZo1xHmLiVbT5vIwSykbTDZhDGi6tsUXeIneP8cUwiLSkKjNoaJmL+Gy6kKxkDT+nvRXJkQfpDmxplAU8ODdlp3er3529vn4U97Feg5R6sv104=;
	7:Cw5S10KNJiY0Neic4BcCfFbLT/hCDm/foYkHYMe8Jyt798YMHPvA9BleVl/UXJ8fshjkyoVhKdYdlM5MCvNTtoR0YPKJSgNwYXwLO51dfVa3E3EFebTtRdNhWfK/4m0OzDWEUxLwzbQ72dWc3OGyTGrq/9GWky8XuTrFp4TJacWaLhy9+CH0LdK2SBOkJ/W4tr9AeSwjgr20iEjNTsHnT3Bg6W/RIxBUM4s/d1WLAdlA+DcPJ4FSeY/hnWjpzXwi
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101475)(1601125500)(1701031045);
	SRVR:BN3NAM04HT234; 
x-ms-traffictypediagnostic: BN3NAM04HT234:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
	SRVR:BN3NAM04HT234; BCL:0; PCL:0; RULEID:; SRVR:BN3NAM04HT234; 
x-forefront-prvs: 07630F72AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(7070007)(199004)(189003)(3480700004)(6346003)(7696005)(486006)(476003)(104016004)(6506007)(9686003)(56003)(74316002)(81156014)(54896002)(26005)(97736004)(8676002)(256004)(86362001)(8936002)(102836004)(20460500001)(19627405001)(105004)(33656002)(73972006)(5660300001)(2351001)(7116003)(83332001)(87572001)(68736007)(5640700003)(105586002)(106356001)(55016002)(14454004)(6436002)(6916009)(5250100002)(82202002)(2501003)(2900100001)(25786009)(99286004)(15852004)(133083001);
	DIR:OUT; SFP:1901; SCL:1; SRVR:BN3NAM04HT234;
	H:SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hotmail.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bhas_purk@hotmail.com; 
x-microsoft-antispam-message-info: cYBQ6K4x8pEqP7UcyWEBpJG+4UXAlY5J8qC8XIi+t4+8WHXELEJMrCT+wpl+RvguwffYYgdkkW8MOY8lhuewHj2I+q8pNzIfAdFFMiUyMrx3sK3gLra6nvELdLeb4EWa3whNJm1iylWLHJl/8DAKs3SVMVuL5mrg/LWN8CKmrvc/cHkoWmKTWVcih1xk8AZGlKGnCH1GeGNoxzeYdoZroLjYXUVKUKy19z2h9cBpVgk=
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 7181d4b0-87d6-4f4e-ba33-0d3746212cec
X-MS-Exchange-CrossTenant-Network-Message-Id: f01a9791-41f2-4a56-ada0-08d6016f5262
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 7181d4b0-87d6-4f4e-ba33-0d3746212cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2018 22:51:35.4075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT234
Subject: adding python modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 02:26:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SC1P152MB138947050EB80F8E776671CB94390SC1P152MB1389LAMP_"

--_000_SC1P152MB138947050EB80F8E776671CB94390SC1P152MB1389LAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
I am new to yocto, and we are using this for an Intel SOC.
I am creating a console-image, and wanted to get python3 in the rootfs.

So I added python3 in the recipe file -
layers/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-ba=
sic.bb
This gave me python3 in the rootfs and I can run ptyhon3. So that is great!


Now I would like to add some modules to python such that they are built in,=
 and I dont have to do a pip install for the modules.

I see that there is a script file which generates the manifest for all modu=
les will be there.
openembedded-core/scripts/contrib/python/generate-manifest-3.5.py


I would like to edit this file to some python modules, and am wondering how=
.

For example, one of the existing modules in the script is defined like this=
-
  m.addPackage( "${PN}-argparse", "Python command line argument parser", "$=
{PN}-core ${PN}-codecs ${PN}-textutils",
    "argparse.*" )


So my question is, for the modules I would like to add, how do I know the d=
ependencies etc? And more importantly, is this the right way to add modules=
 to python3 in the rootfs.


Thank you
Bhaskar





--_000_SC1P152MB138947050EB80F8E776671CB94390SC1P152MB1389LAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I am new to yocto, and we are using this for an Intel SOC.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I am creating a console-image, and wanted to get python3 in the rootfs.</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
So I added python3 in the recipe file -</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-s=
erif; font-size: 12pt;">layers/meta-openembedded/meta-oe/recipes-core/packa=
gegroups/packagegroup-basic.bb</span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-s=
erif; font-size: 12pt;">This gave me python3 in the rootfs and I can run pt=
yhon3. So that is great!</span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Now I would like to add some modules to python such that they are built in,=
 and I dont have to do a pip install for the modules.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I see that there is a script file which generates the manifest for all&nbsp=
;modules will be there.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-s=
erif; font-size: 12pt;">openembedded-core/</span><span style=3D"color: rgb(=
0, 0, 0); font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;">sc=
ripts/contrib/python/generate-manifest-3.5.py</span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I would like to edit this file to some python modules, and am wondering how=
.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
For example, one of the existing modules in the script is defined like this=
-</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>&nbsp; m.addPackage( &quot;${PN}-argparse&quot;, &quot;Python command=
 line argument parser&quot;, &quot;${PN}-core ${PN}-codecs ${PN}-textutils&=
quot;,<br>
</span>
<div>&nbsp; &nbsp; &quot;argparse.*&quot; )<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
So my question is, for the modules I would like to add, how do I know the d=
ependencies etc? And more importantly, is this the right way to add modules=
 to python3 in the rootfs.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thank you&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Bhaskar</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_SC1P152MB138947050EB80F8E776671CB94390SC1P152MB1389LAMP_--
