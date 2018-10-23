Return-Path: <Hugues.Kamba@arm.com>
X-Greylist: delayed 82687 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Oct 2018 22:24:29 UTC
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30052.outbound.protection.outlook.com [40.107.3.52])
	by mail.openembedded.org (Postfix) with ESMTP id E058179B05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 22:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ncxzS1NwQKXIjJunTxoXSqY+Hp/NCn5wC4VKG8bslAk=;
	b=D5HERIvQrWOU/qQYl3Y6HXThB2GD+fJMIYjtcfMbT7zpuzRiZUBB9alai/svtK4RHFcXz8/n1Q/AD35iO2WpD9Rz4YSKV8U38D/rkJuj+C1tEy8wAvNHV4rEIa4TCYnVceo6t/3mDq/BFndWxovMceVugvqcipEhNBvYQM0nfmQ=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB1117.eurprd08.prod.outlook.com (10.166.45.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.30; Tue, 23 Oct 2018 21:51:32 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1250.028;
	Tue, 23 Oct 2018 21:51:32 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv
Thread-Index: AQHUaduDON+arP2etkmO5Es78l/AxKUr1k8AgAADpf6AAAo/1IABdhqAgAAHGzw=
Date: Tue, 23 Oct 2018 21:51:32 +0000
Message-ID: <VI1PR08MB3631BACCB45FB0385733BD8D98F50@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>
	<VI1PR08MB36314F901C4C74C8C3E82F6F98F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<e574592b-8b68-2604-d337-c2086637cab1@xilinx.com>
In-Reply-To: <e574592b-8b68-2604-d337-c2086637cab1@xilinx.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [40.119.148.137]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB1117;
	6:1Ii/7B3/pk8XT6p9gTNGuCdVaeQ811WRanegEOCojaqxkyls/TXeo5zOZj8VQ8nGLNnKazMZ/W9+6n3owT7PLgzhocHwJvrwAXfU0/wI/r2Y/O8faanDsVc0SqpylLeQw3sFeiSwsen3VVTUVw3N03kO2F5BkHfl4haE+bgeUheYTj2hyl+c7Ge67NS9zWWNMjSlvV9zqJAkd9n4FK187NLWwWUWR9Pqnh+TbjnCrUshNsqCBDnJ3lb4Ju73XXes6SpXcZ0DLC1WBUm0lTw4OFfw6ydBcdQc72Z2LlOgTBjdJK4XOh+ONh8DiXtdegZkOeFe4IEPjaaUBCZQU1JAQwV8P0GKiWfseX9pe0/ArolIlV6RgZF7ElGHPY9UhP+s7W854jwsa7GKSEe65YGpPUcYkpd481f3myqRu4XbtrwQkdgEnsufGMHmHA4HPAstAVZa4lHXwfbR7V3wcIOU4A==;
	5:sf2JD71+gi++Cfv12XtrB6kWxcPDYpyae/vxCocdWs2Q3Z4wM73FU2pw+JIXpUpErDFPMJD1LQW84Z6Sq0uxZS8xB/Lo78n2OSlP2NgQu6NwFD0k+JYYOyrnAU+/Cg72RtoAfkDNS+qoL8QVD0mT3G6r0QNDscvs2PMtrZlektA=;
	7:SiZIQoQXc5cBaA8MkzOFbzeAD6Nt2/RIW1jocIZWsCLnpH7DuTSB+5u8QPDoMjWIqRI4IjdCeQCRz9+uTGgBqlLTJDfCZ5PWEcPqtd7R0UPdbCmP2IuuqjuqK/93Tj4evnyAfVYy/Z6PHEF3cW2CcE/4HRO8Aa4xSTWLkhAlOGacCKLRYM3E1E5mg1ti/uLR20htNVmf9l8cQVLjnC0isrkhRg34Rg9WyIlTqQ6MeBrT6QyjYPwc4Yuuq2+OBPyn
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 970a21b2-7493-44d1-90ec-08d63931b264
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB1117; 
x-ms-traffictypediagnostic: VI1PR08MB1117:
x-microsoft-antispam-prvs: <VI1PR08MB1117250625641B62860B2CF598F50@VI1PR08MB1117.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192813158149592)(264703809997249)(85827821059158)(163750095850)(265313219721884);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB1117; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB1117; 
x-forefront-prvs: 0834BAF534
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(40434004)(1015004)(21615005)(86362001)(68736007)(3846002)(72206003)(5660300001)(54906003)(6116002)(71200400001)(71190400001)(110136005)(105586002)(106356001)(19627405001)(478600001)(2906002)(74316002)(7736002)(8936002)(33656002)(606006)(81166006)(316002)(8676002)(93886005)(81156014)(66066001)(25786009)(2900100001)(39060400002)(476003)(45080400002)(4326008)(6246003)(5024004)(229853002)(14444005)(55016002)(6306002)(236005)(9686003)(6436002)(7696005)(54896002)(486006)(53936002)(14454004)(256004)(186003)(76176011)(99286004)(446003)(966005)(26005)(53546011)(5250100002)(102836004)(6506007)(2501003)(97736004)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB1117;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 1Wl4Wa+W7tT7jLiHhTNOOre77ZRU8oJNvHTQAcJMEOqb2B5YlP4icIr+LKeObOeCB1fBbS7u3RkiHvQ4Cq9ekSsflRSlQPPHRebzQoVBdRrZNrN680ye9vgZWqIrandUzrsS8t+Y5CfmyMPwGc1mRCC2MxY3OCZf2kjNygwhcicj2GmhO0jevdSt712I9NOoq/rcGLs+QqlB6osgEJURU0qIqNmcIzjTtjHWKVhYvWOXDBTMStLKCin6IdMCCpfi9Iy1hrO8NCz7LTI4ULsSlx9Q9bYHZwPaq+TZ/BVmK6OLHjIbGEw8O/x+DfATBjiB6+TzzcywrJpgfiEyHqkL5wJp+96vtGJ2l6qY4RcApkg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970a21b2-7493-44d1-90ec-08d63931b264
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2018 21:51:32.7458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB1117
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
X-List-Received-Date: Tue, 23 Oct 2018 22:24:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB3631BACCB45FB0385733BD8D98F50VI1PR08MB3631eurp_"

--_000_VI1PR08MB3631BACCB45FB0385733BD8D98F50VI1PR08MB3631eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Although I disagree with having them bundled together (for the simple reaso=
n they are not the same), if there has to be only one it should be python3-=
venv and not python3-pyvenv as it currently is the case. Debian for example=
 has a python3-venv package.

Including python3-venv should allow creation of virtual envs without the ne=
ed to call on the pyvenv  script (python3-runpy must also be included). Pyv=
env should be optional prior to python 3.6 and not there at all from 3.6.

In any case, python3-pyvenv as currently provided by OE is broken because i=
t is missing the venv module depency.

Thanks
Hugues

Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com=
>
Sent: Tuesday, October 23, 2018 10:26:07 PM
To: Hugues Kamba; Alejandro Hernandez; openembedded-core@lists.openembedded=
.org
Cc: Diego Russo; Jeremy Johnson; aehs29@gmail.com
Subject: Re: [OE-core] PATCH: Fixing python3-pyvenv and adding python3-venv


Hello Huges,


On 10/23/2018 12:12 AM, Hugues Kamba wrote:

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



I do understand what you are saying, they are two different things, and whi=
le the purpose of the manifest

is to provide more granularity on what goes or doesn't go on an image, we s=
till have to be careful on

how we package things, in this case I simply don't see any reason why we wo=
uld need two separate packages,

specially because nothing else RDEPENDS on venv , and I don't see the point=
 in creating a package that only

contains a single binary.


I believe it makes more sense to package them both together in a single pac=
kage, we are upgrading to python 3.7 soon,

and I believe having a single vnenv package should work for that too.


Cheers,

Alejandro


Thanks!


Hugues
________________________________
From: Hugues Kamba
Sent: 22 October 2018 23:47:44
To: Alejandro Hernandez; openembedded-core@lists.openembedded.org<mailto:op=
enembedded-core@lists.openembedded.org>
Cc: Diego Russo; Jeremy Johnson; aehs29@gmail.com<mailto:aehs29@gmail.com>
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
><mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>
Sent: 22 October 2018 23:17:26
To: Hugues Kamba; openembedded-core@lists.openembedded.org<mailto:openembed=
ded-core@lists.openembedded.org>
Cc: Diego Russo; Jeremy Johnson; aehs29@gmail.com<mailto:aehs29@gmail.com>
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
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB3631BACCB45FB0385733BD8D98F50VI1PR08MB3631eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta content=3D"text/html; charset=3DWindows-1252">
</head>
<body bgcolor=3D"#FFFFFF">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hi Alejandro,<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Although I disagree with having them bundled together (for the simple reaso=
n they are not the same), if there has to be only one it should be python3-=
venv and not python3-pyvenv as it currently is the case. Debian for example=
 has a python3-venv package.
<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Including python3-venv should allow creation of virtual envs without the ne=
ed to call on the pyvenv&nbsp; script (python3-runpy must also be included)=
. Pyvenv should be optional prior to python 3.6 and not there at all from 3=
.6.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
In any case, python3-pyvenv as currently provided by OE is broken because i=
t is missing the venv module depency.
<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Thanks<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hugues<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Get <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alejandro Hernandez &=
lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;<br>
<b>Sent:</b> Tuesday, October 23, 2018 10:26:07 PM<br>
<b>To:</b> Hugues Kamba; Alejandro Hernandez; openembedded-core@lists.opene=
mbedded.org<br>
<b>Cc:</b> Diego Russo; Jeremy Johnson; aehs29@gmail.com<br>
<b>Subject:</b> Re: [OE-core] PATCH: Fixing python3-pyvenv and adding pytho=
n3-venv</font>
<div>&nbsp;</div>
</div>
<div>
<p>Hello Huges,</p>
<p><br>
</p>
<div class=3D"moz-cite-prefix">On 10/23/2018 12:12 AM, Hugues Kamba wrote:<=
br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">Hi Alenjandro,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">More information here:&nbsp;<a h=
ref=3D"https://www.python.org/dev/peps/pep-0405/#creating-virtual-environme=
nts" class=3D"OWAAutoLink">https://www.python.org/dev/peps/pep-0405/#creati=
ng-virtual-environments</a></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">What I am proposing is also a go=
od idea for when python 3.6 is available in Yocto.&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">With Python 3.5 one can create v=
irtual environment by including python3-pyvenv OR&nbsp;python3-venv&#43;pyt=
hon3-runpy.</p>
<p style=3D"margin-top:0; margin-bottom:0">With Python 3.6 one will only be=
 able to create virtual environments with python3-venv&#43;python3-runpy.</=
p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">I hope I made it a bit clearer n=
ow.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
</blockquote>
<p><br>
</p>
<p>I do understand what you are saying, they are two different things, and =
while the purpose of the manifest</p>
<p>is to provide more granularity on what goes or doesn't go on an image, w=
e still have to be careful on</p>
<p>how we package things, in this case I simply don't see any reason why we=
 would need two separate packages,</p>
<p>specially because nothing else RDEPENDS on venv , and I don't see the po=
int in creating a package that only</p>
<p>contains a single binary.</p>
<p><br>
</p>
<p>I believe it makes more sense to package them both together in a single =
package, we are upgrading to python 3.7 soon,</p>
<p>and I believe having a single vnenv package should work for that too.<br=
>
</p>
<p><br>
</p>
<p>Cheers,</p>
<p>Alejandro<br>
</p>
<p><br>
</p>
<blockquote type=3D"cite">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">Thanks!</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"">
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
Hugues
<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" styl=
e=3D"">
<tbody>
</tbody>
</table>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Hugues Kamba<br>
<b>Sent:</b> 22 October 2018 23:47:44<br>
<b>To:</b> Alejandro Hernandez; <a class=3D"moz-txt-link-abbreviated" href=
=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a><br>
<b>Cc:</b> Diego Russo; Jeremy Johnson; <a class=3D"moz-txt-link-abbreviate=
d" href=3D"mailto:aehs29@gmail.com">
aehs29@gmail.com</a><br>
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
<div style=3D""><font size=3D"3" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:12pt">See the entire content of pyvenv:</span></=
font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>---------------------------------------=
------------</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>#! /usr/bin/python3.5&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>if __name__ =3D=3D '__main__':&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div=
>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; import sys&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; rc =3D 1&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></di=
v>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; try:&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font><=
/div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; import venv=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;&nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; venv.main()=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;&nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; except Exception as e:&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; &nbsp; &nbsp; print('Erro=
r: %s' % e, file=3Dsys.stderr)&nbsp;&nbsp;</i></span></font></div>
<div style=3D""><font size=3D"2" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:10pt"><i>&nbsp; &nbsp; sys.exit(rc)&nbsp;&nbsp;<=
/i></span></font><font size=3D"3" face=3D"Calibri,sans-serif" color=3D"blac=
k"><span style=3D"font-size:12pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp=
;</span></font></div>
<div style=3D""><font size=3D"3" face=3D"Calibri,sans-serif" color=3D"black=
"><span style=3D"font-size:12pt">------------------------------------------=
----------</span></font></div>
As you can see, pyvenv depends on venv to run.&nbsp;<span style=3D"">Becaus=
e it is confusing to have both pyvenv and venv; pyvenv has been deprecated =
in python 3.6.</span>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"">They should be =
two seperate packages not a single because they are different things. Read =
here for more information:&nbsp;<a href=3D"https://docs.python.org/3/librar=
y/venv.html" class=3D"x_OWAAutoLink">https://docs.python.org/3/library/venv=
.html</a></span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"">I do not unders=
tand what you mean by the cached files as I did not add it. After modifying=
 the JSON I ran create_manifest3.py which added that, the rdepends content =
on venv was also added automatically
 after runny that script. My changes are only adding pyvenv and venv in the=
 JSON.</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"">I will submit a=
nother patch which removes pyvenv in the python3 recipe.</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"">Regards,</span>=
</p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"">Hugues</span></=
p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D""><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D""></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alejandro Hernandez
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alejandro.enedino.hernand=
ez-samaniego@xilinx.com">
&lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;</a><br>
<b>Sent:</b> 22 October 2018 23:17:26<br>
<b>To:</b> Hugues Kamba; <a class=3D"moz-txt-link-abbreviated" href=3D"mail=
to:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a><br>
<b>Cc:</b> Diego Russo; Jeremy Johnson; <a class=3D"moz-txt-link-abbreviate=
d" href=3D"mailto:aehs29@gmail.com">
aehs29@gmail.com</a><br>
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
<div id=3D"x_x_divtagdefaultwrapper" dir=3D"ltr" style=3D""></div>
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
 or store or copy the information in any medium. Thank you. </blockquote>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB3631BACCB45FB0385733BD8D98F50VI1PR08MB3631eurp_--
