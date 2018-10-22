Return-Path: <Hugues.Kamba@arm.com>
X-Greylist: delayed 10876 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Oct 2018 02:45:25 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7438D79BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DrAb9kyBRkmpNgJeantcR4NrmX9TViXgKw+dyq8VSV4=;
	b=MfZ2mLJtrmWxqukXfYYuRiKAnmGOWloXy+YEqhIzMtCy1EAThvbxtEKtCr5hQLMKlNSaYVa9028gITaI7auz/LaI1vTkFnFu5p6SuCmN73T4Y2UsU3m86VJh1gXjyOBLGeXV1gjgms5QFr+iqsLCBcRTnhBLhWYg4TuN7f95GhM=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3309.eurprd08.prod.outlook.com (52.134.31.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.30; Mon, 22 Oct 2018 23:12:24 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1250.028;
	Mon, 22 Oct 2018 23:12:24 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv
Thread-Index: AQHUaduDON+arP2etkmO5Es78l/AxKUr1k8AgAADpf6AAAo/1A==
Date: Mon, 22 Oct 2018 23:12:23 +0000
Message-ID: <VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>,
	<VI1PR08MB36314F901C4C74C8C3E82F6F98F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB36314F901C4C74C8C3E82F6F98F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [80.194.25.81]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3309;
	6:dP1vB6L0g3+c4ktVfnpoG8DB2QE9u7bf+9Pb3QxkbHWkWZVoqHC+zR/lRg3RcsaZzhWttVu2QQx9zR2nwnZ/p0EwUT4J1ckXJf5PAnMDX0pCHjUE2fcRPdOxnuoF/px/09G5RTWzzT61mWuT2TPC3JZ0xcXDPP+r9lpx43I/yj33XArXQ8Z+Q1dWlF7dO4z9K7xAKu+Izee8oWkYDCdkD67u1tUjGv2ZvHWAywmAIOia9orZxSV6CbARLisV01HPLIrZb85LJk67FkeaTfsNtBi3b95hKCt8aXgs60QEbRYpG/w2yvn3RNpSpTHi1FYjTttKazYa3FGZzTD5kv5pql7xmIPmRYhOPnovxP/4XRyHwQqMWHLGmKA1baDSQ25IWN7C3EpbHNnyX7DckNtgIoV5yP952aqFqzr4lzc2e6K/702oiM3bfJ+QXosMuMWExeST/hLflTImtJBVZbYcDQ==;
	5:7y1UMleijXkeNh82gVMAxdgeAFHtt7hidTsKTXkxCbb9hsX6vuXH4qBb7g4bnRpGunZ1lg7/VA1Vu/JC0FBlCWYv3/vAV6voEk/aSH/weVlZ+GYJ6ukHrS0687jkLBSoYjk7bHdUXP4xqU2Z/dyqg/RJhTBAJUl/PPMvm5EHHXU=;
	7:JixOItYchELyZMui3wOt2e2STMrq8YiKtrycWpD7haXaIkqMKtbosM11lArkWo8OFIB2w+mtVvDzjTxuvpyl4apuphkPRMvNngUqrGHIY0dR4Lzh9UCz9vmcAbCWOGe/tHAQe1UbHN4eSheWFZJ1/JxHD7DAye78E/oV/y3rY+4LeyTqQl1ENJrxkgsoFadrpplNzus5cNe2azF+GArhPPtEAqzLjEzEYzNNTsoRCgOvfVZ1yr3dIPK2G/YhnA9R
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: d0d23da4-8114-4d38-0c06-08d63873d394
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB3309; 
x-ms-traffictypediagnostic: VI1PR08MB3309:
x-microsoft-antispam-prvs: <VI1PR08MB3309DCD2450FCAC786EE785C98F40@VI1PR08MB3309.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(85827821059158)(163750095850)(192813158149592);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3309; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3309; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(40434004)(1015004)(39060400002)(68736007)(25786009)(72206003)(2940100002)(54896002)(81166006)(110136005)(81156014)(8936002)(606006)(5250100002)(11346002)(6116002)(316002)(476003)(93156006)(2501003)(446003)(33656002)(966005)(2906002)(54906003)(105586002)(486006)(55236004)(71190400001)(21615005)(71200400001)(102836004)(86362001)(99286004)(76176011)(74316002)(5024004)(19627405001)(4326008)(229853002)(8676002)(97736004)(7736002)(7696005)(26005)(186003)(106356001)(14454004)(53546011)(3846002)(2900100001)(236005)(66066001)(6246003)(53936002)(14444005)(256004)(5660300001)(6506007)(6306002)(6606003)(9686003)(478600001)(6436002)(55016002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3309;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: UauIpZ3CowKCCUT6Hmz3+42R/CemPJeXPWwUksQY6g6PdYQSzpy2BSARL5WlSlr4RcDsWA7QgXg9EKTqljBIG+d1vQg71C4cI6F0KZtrupBVvb3PtudqoJPuMMCa+vETUMHgixm+w7SPeg25mJdq1M3Ot9667wL0c7QTolsOvJfYHToRSx4LMYDojMIAe7dC8GCGqjzyEfJWE40nbjyFZ2fqCV+TLqq7Kk38GrytZlJAUEnvGl8i9Qz86Yna+3sgsQiW8/7kPdJN4Ctsn0RjqZXHeFldtMuxuXLm6wLZy2958t9fpZ5iHPRkjBpzHL4xgYMM4qdgulzdv1yvLAw5ggGHu2DFdQksmwuyRdzOzyo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d23da4-8114-4d38-0c06-08d63873d394
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 23:12:23.9842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
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
X-List-Received-Date: Tue, 23 Oct 2018 02:45:26 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB3631EBC976E8E5A79335589698F40VI1PR08MB3631eurp_"

--_000_VI1PR08MB3631EBC976E8E5A79335589698F40VI1PR08MB3631eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alenjandro,


More information here: https://www.python.org/dev/peps/pep-0405/#creating-v=
irtual-environments


What I am proposing is also a good idea for when python 3.6 is available in=
 Yocto.

With Python 3.5 one can create virtual environment by including python3-pyv=
env OR python3-venv+python3-runpy.

With Python 3.6 one will only be able to create virtual environments with p=
ython3-venv+python3-runpy.


I hope I made it a bit clearer now.


Thanks!


Hugues

________________________________
From: Hugues Kamba
Sent: 22 October 2018 23:47:44
To: Alejandro Hernandez; openembedded-core@lists.openembedded.org
Cc: Diego Russo; Jeremy Johnson; aehs29@gmail.com
Subject: Re: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv



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

--_000_VI1PR08MB3631EBC976E8E5A79335589698F40VI1PR08MB3631eurp_
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
<p style=3D"margin-top:0;margin-bottom:0">Hi Alenjandro,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">More information here:&nbsp;<a hr=
ef=3D"https://www.python.org/dev/peps/pep-0405/#creating-virtual-environmen=
ts" class=3D"OWAAutoLink">https://www.python.org/dev/peps/pep-0405/#creatin=
g-virtual-environments</a></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">What I am proposing is also a goo=
d idea for when python 3.6 is available in Yocto.&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0">With Python 3.5 one can create vi=
rtual environment by including python3-pyvenv OR&nbsp;python3-venv&#43;pyth=
on3-runpy.</p>
<p style=3D"margin-top:0;margin-bottom:0">With Python 3.6 one will only be =
able to create virtual environments with python3-venv&#43;python3-runpy.</p=
>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I hope I made it a bit clearer no=
w.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Thanks!</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
Hugues
<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" styl=
e=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quo=
t;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:=
15px; border-collapse:collapse; margin-right:6.75pt; margin-left:6.75pt">
<tbody>
</tbody>
</table>
<p></p>
</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hugues Kamba<br>
<b>Sent:</b> 22 October 2018 23:47:44<br>
<b>To:</b> Alejandro Hernandez; openembedded-core@lists.openembedded.org<br=
>
<b>Cc:</b> Diego Russo; Jeremy Johnson; aehs29@gmail.com<br>
<b>Subject:</b> Re: [OE-core] PATCH: Fixing python3-pyvenv and adding pytho=
n3-venv</font>
<div>&nbsp;</div>
</div>
<meta content=3D"text/html; charset=3Dus-ascii">
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Hi Alejandro,<br>
<br>
I submitted the patch using git send-email since that email.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">pyvenv and venv are not the same=
. pyvenv depends on venv to run.<br>
</p>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=3D=
"font-size:12pt">See the entire content of pyvenv:</span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>---------------------------------------------------</i>=
</span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>#! /usr/bin/python3.5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i><=
/span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>if __name__ =3D=3D '__main__':&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; import sys&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; rc =3D 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; try:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; import venv&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</=
i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; venv.main()&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</=
i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; except Exception as e:&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; print('Error: %s' % e, file=
=3Dsys.stderr)&nbsp;&nbsp;</i></span></font></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"2" color=3D"black"><span style=3D=
"font-size:10pt"><i>&nbsp; &nbsp; sys.exit(rc)&nbsp;&nbsp;</i></span></font=
><font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=
=3D"font-size:12pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></font=
></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<font face=3D"Calibri,sans-serif" size=3D"3" color=3D"black"><span style=3D=
"font-size:12pt">----------------------------------------------------</span=
></font></div>
As you can see, pyvenv depends on venv to run.&nbsp;<span style=3D"font-fam=
ily:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;A=
ndroid Emoji&quot;,EmojiSymbols; font-size:16px">Because it is confusing to=
 have
 both pyvenv and venv; pyvenv has been deprecated in python 3.6.</span>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px">They should be two seperate package=
s
 not a single because they are different things. Read here for more informa=
tion:&nbsp;<a href=3D"https://docs.python.org/3/library/venv.html" class=3D=
"x_OWAAutoLink">https://docs.python.org/3/library/venv.html</a></span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px">I do not understand what you mean b=
y
 the cached files as I did not add it. After modifying the JSON I ran creat=
e_manifest3.py which added that, the rdepends content on venv was also adde=
d automatically after runny that script. My changes are only adding pyvenv =
and venv in the JSON.</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px">I will submit another patch which r=
emoves
 pyvenv in the python3 recipe.</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px">Regards,</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px">Hugues</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Em=
oji&quot;,EmojiSymbols; font-size:16px"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe =
UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p></p>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alejandro Hernandez=
 &lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;<br>
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
<pre class=3D"x_x_moz-quote-pre">&#43;    &quot;pyvenv&quot;: {
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
<div class=3D"x_x_moz-cite-prefix">On 10/22/2018 11:48 AM, Hugues Kamba wro=
te:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div id=3D"x_x_divtagdefaultwrapper" dir=3D"ltr" style=3D"">
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
<div id=3D"x_x_Signature">
<div id=3D"x_x_divtagdefaultwrapper" dir=3D"ltr" style=3D"">
<p style=3D""></p>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you. <br>
<fieldset class=3D"x_x_mimeAttachmentHeader"></fieldset> </blockquote>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB3631EBC976E8E5A79335589698F40VI1PR08MB3631eurp_--
