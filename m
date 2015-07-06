Return-Path: <junhuix.zhang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC89737A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 05:18:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2015 22:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,413,1432623600"; 
	d="c'?zip'48?bb'48?scan'48,208,217,48";a="723454496"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2015 22:18:37 -0700
Received: from cdsmsx151.ccr.corp.intel.com (172.17.4.38) by
	PGSMSX106.gar.corp.intel.com (10.221.44.98) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 6 Jul 2015 13:18:35 +0800
Received: from cdsmsx102.ccr.corp.intel.com ([169.254.2.245]) by
	CDSMSX151.ccr.corp.intel.com ([169.254.3.194]) with mapi id
	14.03.0224.002; Mon, 6 Jul 2015 13:18:32 +0800
From: "Zhang, JunhuiX" <junhuix.zhang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: How to build native binary file for host dynamically
Thread-Index: AdC3qruvL0NbXZo8S++SQDHeVP76zg==
Date: Mon, 6 Jul 2015 05:18:31 +0000
Message-ID: <D62068B99B8DA3449B64550386B430A32B1EB860@CDSMSX102.ccr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.6.105]
MIME-Version: 1.0
Subject: How to build native binary file for host dynamically
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
X-List-Received-Date: Mon, 06 Jul 2015 05:18:39 -0000
X-Groupsio-MsgNum: 67538
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_"

--_004_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_
Content-Type: multipart/alternative;
	boundary="_000_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_"

--_000_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

To test the communication protocols between test host (PC) and target devic=
e, I need compile some native binaries for host dynamically.
I have added "-native" postfix to bb file name like "hello-native.bb",  or =
tried "BBCLASSEXTEND =3D "native" to bb file,  but seems like the host bina=
ry is not generated based on host's arch when I " bitkbak hello-native".
Attachment is my test tar ball, hello is for target device and hello-host i=
s for host PC.
Pls. give me some hints

Bset regards
Zhang, junhui


--_000_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">To test the communication proto=
cols between test host (PC) and target device, I need compile some native b=
inaries for host dynamically.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have added &#8220;-native&#82=
21; postfix to bb file name like &#8220;hello-native.bb&#8221;,&nbsp; or tr=
ied &#8220;BBCLASSEXTEND =3D &quot;native&quot; to bb file,&nbsp; but seems=
 like the host binary is not generated based on host&#8217;s arch when I &#=
8220; bitkbak hello-native&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Attachment is my test tar ball,=
 hello is for target device and hello-host is for host PC.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Pls. give me some hints<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bset regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Zhang, junhui<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_--

--_004_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_
Content-Type: application/x-zip-compressed; name="recipes-test.zip"
Content-Description: recipes-test.zip
Content-Disposition: attachment; filename="recipes-test.zip"; size=3493;
	creation-date="Mon, 06 Jul 2015 05:02:02 GMT";
	modification-date="Mon, 06 Jul 2015 05:09:04 GMT"
Content-Transfer-Encoding: base64

UEsDBAoAAAAAAAZn5kYAAAAAAAAAAAAAAAANAAAAcmVjaXBlcy10ZXN0L1BLAwQKAAAAAAAGZ+ZG
AAAAAAAAAAAAAAAAGAAAAHJlY2lwZXMtdGVzdC9oZWxsby1ob3N0L1BLAwQUAAIACABNZ+ZGXJtJ
QPsAAABGAQAAJwAAAHJlY2lwZXMtdGVzdC9oZWxsby1ob3N0L2hlbGxvLW5hdGl2ZS5iYl2QXUvD
MBSG7/MrQtiFXrit2/oxZRddGtuwfpF06EAotY2s0C1FyxyU/neTiiieq8N5zvuel8P3UeSyA9xA
FIimkfBTvjcVAh7hmNE0o0msWSc+Oli0bVOXRVfLMwJBEpHU9Ymmx65r72ez63VaytMMgZBiEvMR
+Wl4WYyT/JGGhOc42KmbGr3VjVAqnKQHRv0gezhV5ma5WpeOvRDzuWUZpikMx3BebcdaLx3HtooV
AhBwhvM9o388jjr6tIQvAP7Wf39FEeBaNemfErbzKBsQqGSuQrdq9+YW9qN+0mM8wB/PO/ndggFs
tzh0OSfPGYk9bXRWz7gIBL4AUEsDBAoAAAAAABZp5kYAAAAAAAAAAAAAAAAeAAAAcmVjaXBlcy10
ZXN0L2hlbGxvLWhvc3QvaGVsbG8vUEsDBBQAAgAIAI6LyEYekK9VwgEAAAwDAAAnAAAAcmVjaXBl
cy10ZXN0L2hlbGxvLWhvc3QvaGVsbG8vQ09QWVJJR0hUhZJPb9swDMXv+RTv2AJuFmfbocjJDZLW
QP7BdlDkqNh0LEyRPEl24G8/Wu2Qw4btJkp8Pz6SygfXSy09pMPStIOVl8bjYfmI+Pk5fprPZt+w
lT87UuiFRn41xpI+d/YymQBA0bCwteZixXVk1JYIztT+JiwtMJgOJessVdJ5K8+dJ3A1oasvxuJq
KlkPAcSXna7IwjcET/bqYOoQvO6OeCVNVigcurOSJTayJO0IgmuPN66hCucACpL16CL/cMGRYbLw
0ugFSPK7RU/WcYz5Z5HfxAjGBsqD8KN5C9OOwkd2PEAJf9dO/z6Ae58VpA7sxrTEByZKj5tUCmdC
56juVBQYnI33tHjbHwskuxPekyxLdsVpgRvbNfxKPX2w5LVVktHcmBXaD+w/ILarbPnGmuQl3aTF
CcZinRa7VZ5jvc+Q4JBkRbo8bpIMh2N22OerKZATjdRA+MeY67AqS6jIC6ncZ+sn08GxPVWhET3B
UkmyZ3MCJX+l/+8vUIQy+hIa5ez7LBeQNbTxEW5WeoI3f2426O/bjZDqchrhe8xpQv9QUiNnwFrW
DF8rY2yEF+P8mLpNgNk8jmdP8ddZjGOeTH4BUEsDBBQAAgAIAFtn5kYzdxdbWwAAAGEAAAAlAAAA
cmVjaXBlcy10ZXN0L2hlbGxvLWhvc3QvaGVsbG8vaGVsbG8uYxXJsQ5AMBRG4f0+xR8WRMROzB7C
0rRFk7qVqxjEu9PtnHy5Y+1PY9Ef0bjQrAOBHEdsynGRQsmia+hVSVWluUrQQ8Auv85FNlrvA+4g
3kycld1PYuMpjLajlz5QSwMECgAAAAAABmfmRgAAAAAAAAAAAAAAABMAAAByZWNpcGVzLXRlc3Qv
aGVsbG8vUEsDBAoAAAAAAAZn5kYAAAAAAAAAAAAAAAAZAAAAcmVjaXBlcy10ZXN0L2hlbGxvL2Zp
bGVzL1BLAwQUAAIACACOi8hGHpCvVcIBAAAMAwAAIgAAAHJlY2lwZXMtdGVzdC9oZWxsby9maWxl
cy9DT1BZUklHSFSFkk9v2zAMxe/5FO/YAm4WZ9uhyMkNktZA/sF2UOSo2HQsTJE8SXbgbz9a7ZDD
hu0mSnw/PpLKB9dLLT2kw9K0g5WXxuNh+Yj4+Tl+ms9m37CVPztS6IVGfjXGkj539jKZAEDRsLC1
5mLFdWTUlgjO1P4mLC0wmA4l6yxV0nkrz50ncDWhqy/G4moqWQ8BxJedrsjCNwRP9upg6hC87o54
JU1WKBy6s5IlNrIk7QiCa483rqEK5wAKkvXoIv9wwZFhsvDS6AVI8rtFT9ZxjPlnkd/ECMYGyoPw
o3kL047CR3Y8QAl/107/PoB7nxWkDuzGtMQHJkqPm1QKZ0LnqO5UFBicjfe0eNsfCyS7E96TLEt2
xWmBG9s1/Eo9fbDktVWS0dyYFdoP7D8gtqts+caa5CXdpMUJxmKdFrtVnmO9z5DgkGRFujxukgyH
Y3bY56spkBON1ED4x5jrsCpLqMgLqdxn6yfTwbE9VaERPcFSSbJncwIlf6X/7y9QhDL6Ehrl7Pss
F5A1tPERblZ6gjd/bjbo79uNkOpyGuF7zGlC/1BSI2fAWtYMXytjbIQX4/yYuk2A2TyOZ0/x11mM
Y55MfgFQSwMEFAACAAgAFGfmRjN3F1tbAAAAYQAAACAAAAByZWNpcGVzLXRlc3QvaGVsbG8vZmls
ZXMvaGVsbG8uYxXJsQ5AMBRG4f0+xR8WRMROzB7C0rRFk7qVqxjEu9PtnHy5Y+1PY9Ef0bjQrAOB
HEdsynGRQsmia+hVSVWluUrQQ8Auv85FNlrvA+4g3kycld1PYuMpjLajlz5QSwMEFAACAAgAMGfm
RiYlTrYMAQAAhwEAABsAAAByZWNpcGVzLXRlc3QvaGVsbG8vaGVsbG8uYmJdjltvgjAYhu/7K740
XmwXCqgc3OKFKQwaQUjRLCZLCAKLJOUQJZsJ4b+P4k7aq7bP+z7fF+48b8X2sATsZJxX8FmdeIqR
aYWE0WBL/Y1gTXZuIK5rnidxk1clYOT4nhWsbEvgY9PUT5J0uUySqpAwcimxNuGA7MD9mA4/0Qt1
rTAizrofKtB7zrO+Rfxgz6jtbJ+LVF3O5ovE0KeZLGuaoqqZYijGQTe0xcwwdC2eYwQoZCTaMfrP
cRS7TxJ4Q/B37v09xQiFojZqX322NinrMEqrqN+67sMPj9AOglFLSAc/0nF1vaIOgUjn5bmJOf9N
f79hnPZFsxu1h7xM81N3CwuQdVW9mu5yHfoCUEsBAhQACgAAAAAABmfmRgAAAAAAAAAAAAAAAA0A
JAAAAAAAAAAQAAAAAAAAAHJlY2lwZXMtdGVzdC8KACAAAAAAAAEAGABAsZAUqLfQAUCxkBSot9AB
ABVWB5C30AFQSwECFAAKAAAAAAAGZ+ZGAAAAAAAAAAAAAAAAGAAkAAAAAAAAABAAAAArAAAAcmVj
aXBlcy10ZXN0L2hlbGxvLWhvc3QvCgAgAAAAAAABABgAQLGQFKi30AFAsZAUqLfQAQD4gmWQt9AB
UEsBAhQAFAACAAgATWfmRlybSUD7AAAARgEAACcAJAAAAAAAAAAgAAAAYQAAAHJlY2lwZXMtdGVz
dC9oZWxsby1ob3N0L2hlbGxvLW5hdGl2ZS5iYgoAIAAAAAAAAQAYAFBe4mSot9ABAPiCZZC30AEA
+IJlkLfQAVBLAQIUAAoAAAAAABZp5kYAAAAAAAAAAAAAAAAeACQAAAAAAAAAEAAAAKEBAAByZWNp
cGVzLXRlc3QvaGVsbG8taG9zdC9oZWxsby8KACAAAAAAAAEAGADwJRjVqbfQAfAlGNWpt9ABAMbx
ec2h0AFQSwECFAAUAAIACACOi8hGHpCvVcIBAAAMAwAAJwAkAAAAAAAAACAAAADdAQAAcmVjaXBl
cy10ZXN0L2hlbGxvLWhvc3QvaGVsbG8vQ09QWVJJR0hUCgAgAAAAAAABABgAAMbxec2h0AEAxvF5
zaHQAQDG8XnNodABUEsBAhQAFAACAAgAW2fmRjN3F1tbAAAAYQAAACUAJAAAAAAAAAAgAAAA5AMA
AHJlY2lwZXMtdGVzdC9oZWxsby1ob3N0L2hlbGxvL2hlbGxvLmMKACAAAAAAAAEAGAAAeVd1qLfQ
AQDG8XnNodABAMbxec2h0AFQSwECFAAKAAAAAAAGZ+ZGAAAAAAAAAAAAAAAAEwAkAAAAAAAAABAA
AACCBAAAcmVjaXBlcy10ZXN0L2hlbGxvLwoAIAAAAAAAAQAYAECxkBSot9ABQLGQFKi30AEAxvF5
zaHQAVBLAQIUAAoAAAAAAAZn5kYAAAAAAAAAAAAAAAAZACQAAAAAAAAAEAAAALMEAAByZWNpcGVz
LXRlc3QvaGVsbG8vZmlsZXMvCgAgAAAAAAABABgAQLGQFKi30AFAsZAUqLfQAQDG8XnNodABUEsB
AhQAFAACAAgAjovIRh6Qr1XCAQAADAMAACIAJAAAAAAAAAAgAAAA6gQAAHJlY2lwZXMtdGVzdC9o
ZWxsby9maWxlcy9DT1BZUklHSFQKACAAAAAAAAEAGAAAxvF5zaHQAQDG8XnNodABAMbxec2h0AFQ
SwECFAAUAAIACAAUZ+ZGM3cXW1sAAABhAAAAIAAkAAAAAAAAACAAAADsBgAAcmVjaXBlcy10ZXN0
L2hlbGxvL2ZpbGVzL2hlbGxvLmMKACAAAAAAAAEAGACwLwUlqLfQAQDG8XnNodABAMbxec2h0AFQ
SwECFAAUAAIACAAwZ+ZGJiVOtgwBAACHAQAAGwAkAAAAAAAAACAAAACFBwAAcmVjaXBlcy10ZXN0
L2hlbGxvL2hlbGxvLmJiCgAgAAAAAAABABgAoNqfRKi30AEAxvF5zaHQAQDG8XnNodABUEsFBgAA
AAALAAsAxQQAAMoIAAAAAA==

--_004_D62068B99B8DA3449B64550386B430A32B1EB860CDSMSX102ccrcor_--
