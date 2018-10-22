Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0057.outbound.protection.outlook.com [104.47.2.57])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEF374C4D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 05:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0wNRVpq58VMW5DnL6Qk2BBux8VW+CN3QbTcXlXopuzU=;
	b=sMOynt+sukgmql/bU/+eWn1+EJvmFTTPHOULOtYzqOmZnR3SbPv6El5Z8KkauGAIUnVsIXdLrG9nK7rP7SOJ5wKVcok74qyvBUIJFTsYLin90C+G2KIKSNVQGu+6r6C8bfwsQFdqVX1OL9TE0Aq9AZYenluMHm23keEMywoQTrs=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB2688.eurprd08.prod.outlook.com (10.175.245.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.30; Mon, 22 Oct 2018 22:47:46 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1250.028;
	Mon, 22 Oct 2018 22:47:44 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv
Thread-Index: AQHUaduDON+arP2etkmO5Es78l/AxKUr1k8AgAADpf4=
Date: Mon, 22 Oct 2018 22:47:44 +0000
Message-ID: <VI1PR08MB36314F901C4C74C8C3E82F6F98F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>
In-Reply-To: <a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [80.194.25.81]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB2688;
	6:u1tXX3B7U/+qKEEEFEALr2Kih9yuZoM/7qJKI3GVef5XYvQOqtjbLUa6orO+VlC/JvdSWKmdV6YMUW5wBiOnaERe1lA5klj7dxmHbLGVMcvQT+L2k9sOPb1wgtMIX7E+nbNLy5l+3c4pr2H22fCVasJgXTMJbxUA9a2KjXNCSstzSeab8wTcCPVFEwKXKINi7ST0b1JCOaYhiO84bpMoF03UTORAjbvj9Sm7FiaKhKhEHpZ8pqtJkKY9TsBSCfHP2G9jgl0Lfokme1DLxp2szSyriYU89ihHgROEf8mrUTcgq+XGNIRqy8rn/680cFywYagMijzir5PMsAKSmoDQ2M7BIRYFS23spqzB8A15u30NcbD23uheWOMhOzlAxdXk0jSf4Wog2QWN1myGh33Ex2g386k4Oory+Obv5TsOVeQGzZiuNwovuT73Pnq//BkYr9i+CLH8ziYcEhIvLnTjiQ==;
	5:mviSQMMFqj0Jd1YoZ/14MhuuMq4tr36IYkcetoPpy4p1UeRFvrutXVS6U29oJia2JA3XtC6IfDDB2T2v8UWL9jvfwzFe1dr189GnoG9KXl0uKuSzwsW1I1E0QIxXI0g4KW/LbnHA8tyVpkc85pENKD6opRQct5cdm7kbIIWp+0A=;
	7:opd5bfDjkegPlOQgr13ErzwK/nHHSLHUUvisBOVeRsr+jiziEV/1JaDUB3bKOC6GNjuyoXd0Byio+AKIIgsaS95+1OwNMaC0IOH6n+j60N5Y2dLaBf8jWlE6hJwSR3g4CAktBk9nVN7ZrsxXCI27c6ZIGzQ8daXnxRtLH7+9SREqNYlUxiMijCFqXAUh8sVSxVDDPbvY86pC2MfspSknSCeh6Bk5M4OUg9/LUrSb2WODOftR1llWa69OVg0MOO7X
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: b37ae6c3-e343-4256-d81e-08d63870617a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB2688; 
x-ms-traffictypediagnostic: VI1PR08MB2688:
x-microsoft-antispam-prvs: <VI1PR08MB2688A389B878649A2997493C98F40@VI1PR08MB2688.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(163750095850)(192813158149592)(264703809997249)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB2688; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB2688; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(40434004)(6306002)(81156014)(102836004)(9686003)(76176011)(99286004)(86362001)(19627405001)(53546011)(6506007)(68736007)(8676002)(55236004)(6246003)(55016002)(6606003)(486006)(14444005)(21615005)(97736004)(81166006)(11346002)(476003)(54906003)(6116002)(3846002)(71190400001)(110136005)(8936002)(71200400001)(33656002)(26005)(186003)(256004)(5024004)(66066001)(2900100001)(2501003)(7736002)(5250100002)(606006)(4326008)(74316002)(25786009)(53936002)(229853002)(1015004)(6436002)(2906002)(236005)(316002)(446003)(105586002)(72206003)(478600001)(106356001)(39060400002)(14454004)(966005)(7696005)(54896002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2688;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: D6aQ9XLRI3H2S2l5OnnJBK/d9twkvCPSsnPrRl1ietKWjsSmQ0doheU9phmw88El+bDjwzMxkFYbQXPdZ/JfgxFrjeBiy+2dW/vwPMchhMrAtM6bmbFdwioI7gWo7AnRyeGRLt8FVIL4fK+v4+kfO2IpMaIRK1jcraOJVVKBT5CV46HbbekRcPsZFpjPope8Ru17RNxg5KCBuJK/J5AsSm+xRHa67skvVtJPIJm3fbrNglWlKBeGzMQjQJkKyDjLlX+Bp74B/IRAuUc0LnudmCcoSRlPbkivGUBjhlLr58Vl9yJy5szKezR3zxHYRSKZzDkPpLb9SDUVzgn+m3xHuRWucAo7fL/1YeDKKEBb8fg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37ae6c3-e343-4256-d81e-08d63870617a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 22:47:44.1036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2688
Cc: Diego Russo <Diego.Russo@arm.com>, Jeremy Johnson <Jeremy.Johnson@arm.com>,
	"aehs29@gmail.com" <aehs29@gmail.com>
Subject: Re: PATCH: Fixing python3-pyvenv and adding python3-venv
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
X-List-Received-Date: Tue, 23 Oct 2018 05:20:13 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB36314F901C4C74C8C3E82F6F98F40VI1PR08MB3631eurp_"

--_000_VI1PR08MB36314F901C4C74C8C3E82F6F98F40VI1PR08MB3631eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Alejandro,

I submitted the patch using git send-email since that email.


pyvenv and venv are not the same. pyvenv depends on venv to run.

See the entire content of pyvenv:
---------------------------------------------------
#! /usr/bin/python3.5
if __name__ =3D=3D '__main__':
    import sys
    rc =3D 1
    try:
        import venv
        venv.main()
        rc =3D 0
    except Exception as e:
        print('Error: %s' % e, file=3Dsys.stderr)
    sys.exit(rc)
----------------------------------------------------
As you can see, pyvenv depends on venv to run. Because it is confusing to h=
ave both pyvenv and venv; pyvenv has been deprecated in python 3.6.

They should be two seperate packages not a single because they are differen=
t things. Read here for more information: https://docs.python.org/3/library=
/venv.html


I do not understand what you mean by the cached files as I did not add it. =
After modifying the JSON I ran create_manifest3.py which added that, the rd=
epends content on venv was also added automatically after runny that script=
. My changes are only adding pyvenv and venv in the JSON.


I will submit another patch which removes pyvenv in the python3 recipe.


Regards,


Hugues




________________________________
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com=
>
Sent: 22 October 2018 23:17:26
To: Hugues Kamba; openembedded-core@lists.openembedded.org
Cc: Diego Russo; Jeremy Johnson; aehs29@gmail.com
Subject: Re: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv


Hello Huges,


I cannot reply inline because you sent the patch as an attachment, please s=
end it using git send-email next time.


Also, something doesnt add up here:



+    "pyvenv": {
+        "summary": "Allow you to create virtual environments so we can iso=
late our project dependencies. Deprecated in Python 3.6",
+        "rdepends": [
+            "core",
+            "venv"


This doesnt make sense, since you are saying that the python3-pyvenv packag=
e depends on python3-venv?, shouldnt they be the same package?


+        ],
+        "files": [
+            "${bindir}/pyvenv*"



Again, this should probably on one single package.




 +        ],
+        "cached": []
+    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
@@ -1107,6 +1118,21 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]




This is wrong because, cached files shouldnt be on rdepends.



Everything from there to the bottom is probably ok.

 },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual envi=
ronments with their own site directories, optionally isolated from system s=
ite directories",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [




Also, this patch is missing the changes to the python3 recipe file where th=
e python3-pyvenv package was being previously created, if were now doing it=
 through the manifest, then we dont need it in the recipe.


Thanks!


Alejandro




On 10/22/2018 11:48 AM, Hugues Kamba wrote:

Dear All,


As it currently is, python3-pyvenv is broken because it is missing the venv=
 module run-time dependency.


The patch I am submitting is to add the venv module dependency to python3-p=
yvenv.

The dependency has been added using the newly added venv package (python3-v=
env).

The python3-venv package has been added for future proofing since pyvenv ha=
s been deprecated in Python 3.6 and creation of virtual environment is done=
 using the venv module directly (i.e python3 -m venv my_venv).


Regards,


Hugues Kamba

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB36314F901C4C74C8C3E82F6F98F40VI1PR08MB3631eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Hi Alejandro,<br>
<br>
I submitted the patch using git send-email since that email.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">pyvenv and venv are not the same.=
 pyvenv depends on venv to run.<br>
</p>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=3D=
"font-size: 12pt;">See the entire content of pyvenv:</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>---------------------------------------------------</=
i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>#! /usr/bin/python3.5&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i=
></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>if __name__ =3D=3D '__main__':&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; import sys&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; rc =3D 1&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; try:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; &nbsp; &nbsp; import venv&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;=
</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; &nbsp; &nbsp; venv.main()&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;=
</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; except Exception as e:&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; &nbsp; &nbsp; print('Error: %s' % e, fi=
le=3Dsys.stderr)&nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size: 10pt;"><i>&nbsp; &nbsp; sys.exit(rc)&nbsp;&nbsp;</i></span></fo=
nt><font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=
=3D"font-size: 12pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></fo=
nt></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">
<font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=3D=
"font-size: 12pt;">----------------------------------------------------</sp=
an></font></div>
As you can see, pyvenv depends on venv to run.&nbsp;<span style=3D"font-fam=
ily: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quo=
t;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;=
, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;">Because it is =
confusing
 to have both pyvenv and venv; pyvenv has been deprecated in python 3.6.</s=
pan>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">They should be two seper=
ate
 packages not a single because they are different things. Read here for mor=
e information:&nbsp;<a href=3D"https://docs.python.org/3/library/venv.html"=
 class=3D"OWAAutoLink">https://docs.python.org/3/library/venv.html</a></spa=
n></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">I do not understand what
 you mean by the cached files as I did not add it. After modifying the JSON=
 I ran create_manifest3.py which added that, the rdepends content on venv w=
as also added automatically after runny that script. My changes are only ad=
ding pyvenv and venv in the JSON.</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">I will submit another pa=
tch
 which removes pyvenv in the python3 recipe.</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">Regards,</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">Hugues</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;"><br>
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p></p>
</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alejandro Hernandez &=
lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;<br>
<b>Sent:</b> 22 October 2018 23:17:26<br>
<b>To:</b> Hugues Kamba; openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Diego Russo; Jeremy Johnson; aehs29@gmail.com<br>
<b>Subject:</b> Re: [OE-core] PATCH: Fixing python3-pyvenv and adding pytho=
n3-venv</font>
<div>&nbsp;</div>
</div>
<meta content=3D"text/html; charset=3DWindows-1252">
<div style=3D"background-color:#FFFFFF">
<p>Hello Huges,</p>
<p><br>
</p>
<p>I cannot reply inline because you sent the patch as an attachment, pleas=
e send it using git send-email next time.</p>
<p><br>
</p>
<p>Also, something doesnt add up here:</p>
<p><br>
</p>
<p><br>
</p>
<pre class=3D"x_moz-quote-pre">&#43;    &quot;pyvenv&quot;: {
&#43;        &quot;summary&quot;: &quot;Allow you to create virtual environ=
ments so we can isolate our project dependencies. Deprecated in Python 3.6&=
quot;,
&#43;        &quot;rdepends&quot;: [
&#43;            &quot;core&quot;,
&#43;            &quot;venv&quot;


This doesnt make sense, since you are saying that the python3-pyvenv packag=
e depends on python3-venv?, shouldnt they be the same package?
&nbsp;

&#43;        ],
&#43;        &quot;files&quot;: [
&#43;            &quot;${bindir}/pyvenv*&quot;



Again, this should probably on one single package.




&nbsp;&#43;        ],
&#43;        &quot;cached&quot;: []
&#43;    },
     &quot;resource&quot;: {
         &quot;summary&quot;: &quot;Python resource control interface&quot;=
,
         &quot;rdepends&quot;: [
@@ -1107,6 &#43;1118,21 @@
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.p=
yc&quot;
         ]




This is wrong because, cached files shouldnt be on rdepends.



Everything from there to the bottom is probably ok.

&nbsp;},
&#43;    &quot;venv&quot;: {
&#43;        &quot;summary&quot;: &quot;Provides support for creating light=
weight virtual environments with their own site directories, optionally iso=
lated from system site directories&quot;,
&#43;        &quot;rdepends&quot;: [
&#43;            &quot;compression&quot;,
&#43;            &quot;core&quot;,
&#43;            &quot;logging&quot;,
&#43;            &quot;shell&quot;,
&#43;            &quot;stringold&quot;,
&#43;            &quot;unixadmin&quot;
&#43;        ],
&#43;        &quot;files&quot;: [
&#43;            &quot;${libdir}/python${PYTHON_MAJMIN}/venv&quot;
&#43;        ],
&#43;        &quot;cached&quot;: []
&#43;    },
     &quot;xml&quot;: {
         &quot;summary&quot;: &quot;Python basic XML support&quot;,
         &quot;rdepends&quot;: [</pre>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<p>Also, this patch is missing the changes to the python3 recipe file where=
 the python3-pyvenv package was being previously created, if were now doing=
 it through the manifest, then we dont need it in the recipe.</p>
<p><br>
</p>
<p>Thanks!</p>
<p><br>
</p>
<p>Alejandro<br>
</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 10/22/2018 11:48 AM, Hugues Kamba wrote=
:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"">
<p style=3D"margin-top:0; margin-bottom:0">Dear All,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">As it currently is, python3-pyve=
nv is broken because it is missing the venv module run-time dependency.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">The patch I am submitting is to =
add the venv module dependency to python3-pyvenv.&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">The dependency has been&nbsp;<sp=
an style=3D"font-size:12pt">added&nbsp;</span><span style=3D"font-size:12pt=
">using the newly added venv package (python3-venv).</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">T=
he python3-venv package has been added&nbsp;for future proofing since pyven=
v has been deprecated in Python 3.6 and creation of virtual environment is =
done using the venv module directly (i.e
 python3 -m venv my_venv).</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt"><=
br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">R=
egards,</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt"><=
br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">H=
ugues Kamba</span></p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"">
<p style=3D""></p>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you. <br>
<fieldset class=3D"x_mimeAttachmentHeader"></fieldset> </blockquote>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB36314F901C4C74C8C3E82F6F98F40VI1PR08MB3631eurp_--
