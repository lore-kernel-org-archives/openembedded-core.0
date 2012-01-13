Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B39320@freescale.com>) id 1RlaHn-00060n-Bu
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 07:06:47 +0100
Received: from mail68-tx2-R.bigfish.com (10.9.14.239) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jan 2012 05:43:47 +0000
Received: from mail68-tx2 (localhost [127.0.0.1])	by mail68-tx2-R.bigfish.com
	(Postfix) with ESMTP id 740464C01C0	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 05:43:47 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzc85fhzz1202hzz8275bh8275dhz2dhc1ahc1bhc1ahc1bhc1ahc1bh54h2a8h668h839h8e2h8e3hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail68-tx2 (localhost.localdomain [127.0.0.1]) by mail68-tx2
	(MessageSwitch) id 1326433427152857_14897;
	Fri, 13 Jan 2012 05:43:47 +0000 (UTC)
Received: from TX2EHSMHS038.bigfish.com (unknown [10.9.14.249])	by
	mail68-tx2.bigfish.com (Postfix) with ESMTP id 1EFB86C0098	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 05:43:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS038.bigfish.com
	(10.9.99.138) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jan 2012 05:43:46 +0000
Received: from 039-SN1MPN1-005.039d.mgd.msft.net ([169.254.7.210]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Thu, 12 Jan 2012 23:43:45 -0600
From: Bansal Aneesh-B39320 <B39320@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Valgrind : Unhanded instructions mfatbu and mfatbl
Thread-Index: AczRsR9YlGkoFGc9RvmFXM+lC3L1iwABRaKw
Date: Fri, 13 Jan 2012 05:43:45 +0000
Message-ID: <60B477D225E93B419F9F82BF988B2449D99334@039-SN1MPN1-005.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.232.132.228]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Garg Vakul-B16394 <B16394@freescale.com>
Subject: Valgrind : Unhanded instructions mfatbu and mfatbl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2012 06:06:47 -0000
X-Groupsio-MsgNum: 15955
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_";
	type="multipart/alternative"

--_004_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_
Content-Type: multipart/alternative;
	boundary="_000_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_"

--_000_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

PowerPC uses two alternate time base registers which are read from user spa=
ce
by using PPC instructions mfatbu and mfatbl . However these instructions ar=
e
not supported by Valgrind.
CPU : e500mc
Here are the logs when an application executing such instruction is execute=
d
with Valgrind 3.7.0:

dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
disInstr(ppc): unhandled instruction: 0x7C0F82A6
                 primary 31(0x1F), secondary 678(0x2A6)
=3D=3D2204=3D=3D valgrind: Unrecognized instruction at address 0x10003dfc.
=3D=3D2204=3D=3D    at 0x10003DFC: ??? (in /usr/bin/simple_crypto)
=3D=3D2204=3D=3D    by 0x1000181B: ??? (in /usr/bin/simple_crypto)
=3D=3D2204=3D=3D    by 0xFE179E7: ??? (in /lib/libpthread-2.13.so)
=3D=3D2204=3D=3D    by 0x40EEA9B: ??? (in /lib/libc-2.13.so)
=3D=3D2204=3D=3D Your program just tried to execute an instruction that Val=
grind
=3D=3D2204=3D=3D did not recognise.  There are two possible reasons for thi=
s.
=3D=3D2204=3D=3D 1. Your program has a bug and erroneously jumped to a non-=
code
=3D=3D2204=3D=3D    location.  If you are running Memcheck and you just saw=
 a
=3D=3D2204=3D=3D    warning about a bad jump, it's probably your program's =
fault.
=3D=3D2204=3D=3D 2. The instruction is legitimate but Valgrind doesn't hand=
le it,
=3D=3D2204=3D=3D    i.e. it's Valgrind's fault.  If you think this is the c=
ase or
=3D=3D2204=3D=3D    you are not sure, please let us know and we'll try to f=
ix it.
=3D=3D2204=3D=3D Either way, Valgrind will now raise a SIGILL signal which =
will
=3D=3D2204=3D=3D probably kill your program.


We have developed a patch to fix the issue and submitted the patch upstream=
 to Valgrind community for processing.


Regards,
Aneesh Bansal
[cid:image001.jpg@01CCD1E4.693FCF80]
Plot No. - 18 | Sector-16 A, Noida - 201301
Phone  : 0120395 x3320


--_000_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">PowerPC uses two alternate time base registers which=
 are read from user space<o:p></o:p></p>
<p class=3D"MsoNormal">by using PPC instructions mfatbu and mfatbl . Howeve=
r these instructions are<o:p></o:p></p>
<p class=3D"MsoNormal">not supported by Valgrind.<o:p></o:p></p>
<p class=3D"MsoNormal">CPU : e500mc<o:p></o:p></p>
<p class=3D"MsoNormal">Here are the logs when an application executing such=
 instruction is executed<o:p></o:p></p>
<p class=3D"MsoNormal">with Valgrind 3.7.0:<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">disInstr(ppc): unhandled instruction: 0x7C0F82A6<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary 31(0x1F), secondary 678(0x2A=
6)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D valgrind: Unrecognized instruction at add=
ress 0x10003dfc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; at 0x10003DFC: ??? (in =
/usr/bin/simple_crypto)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; by 0x1000181B: ??? (in =
/usr/bin/simple_crypto)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; by 0xFE179E7: ??? (in /=
lib/libpthread-2.13.so)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; by 0x40EEA9B: ??? (in /=
lib/libc-2.13.so)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D Your program just tried to execute an ins=
truction that Valgrind<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D did not recognise.&nbsp; There are two po=
ssible reasons for this.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D 1. Your program has a bug and erroneously=
 jumped to a non-code<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; location.&nbsp; If you =
are running Memcheck and you just saw a<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; warning about a bad jum=
p, it's probably your program's fault.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D 2. The instruction is legitimate but Valg=
rind doesn't handle it,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; i.e. it's Valgrind's fa=
ult.&nbsp; If you think this is the case or<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D&nbsp;&nbsp;&nbsp; you are not sure, pleas=
e let us know and we'll try to fix it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D Either way, Valgrind will now raise a SIG=
ILL signal which will<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D probably kill your program.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">We have developed a patch to fix the issue and submi=
tted<span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;">
</span>the patch upstream to Valgrind community for processing.<span style=
=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><b>Aneesh Bansal<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b><img width=3D"97" height=3D"30" id=3D"Picture_x00=
20_3" src=3D"cid:image001.jpg@01CCD1E4.693FCF80"><o:p></o:p></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Plot No. &#8211; 18=
 | Sector-16 A, Noida &#8211; 201301<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Phone&nbsp; : 01203=
95 x3320<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_--

--_004_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=1402;
	creation-date="Fri, 13 Jan 2012 05:43:44 GMT";
	modification-date="Fri, 13 Jan 2012 05:43:44 GMT"
Content-ID: <image001.jpg@01CCD1E4.693FCF80>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIf
IiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCAAeAGEDASIA
AhEBAxEB/8QAGwAAAgIDAQAAAAAAAAAAAAAAAAQFBwEDBgL/xAAvEAACAgIBAwIEBAcBAAAAAAAB
AgMEABEFBhIxIUEiUWFxEzKBkRQVFiM1QlKh/8QAGAEBAQADAAAAAAAAAAAAAAAAAAMBAgT/xAAf
EQACAwACAgMAAAAAAAAAAAAAAgEDERIhBJEiMaH/2gAMAwEAAhEDEQA/ALjyK5PmJadhK9fj57Tt
6kqNIB77Y+mSbukSF3YBR5JPjI5OXrXklTjjHbeM6dd6A/fzkbX4r95PsrUuzsxsfnsZgvwTg9sg
2uu4ewPy34ONb2M5KRaPKcnFTmr2pjCdSJACsKH6g6/cY/e6n43ieWqcGsc01uwPhhrqG/DXxtiS
ND/3NfHd3XXwzdWqZm7J0OGLJdqyKXSzCyqO4lZAQB889V7Va1GZa9iKZB6Fo3DAfqM6CJvwxavd
qWu/+HtQzdno34cgbt++vGYgv07Ujx17cEzp+ZY5AxH3AwBrDFobtWeZoIrMMkifmRJAWX7geM8x
8jSmnavFcgkmXzGkqlh+m94A3hkLxPU/G8xTs3IZGhr1p2gaWfSKzL50d+MlIrEE6K0MySK42pRg
QR8xgG7DDDAIvmZbS0ylWgt1n+Eo7AKPqQfIzTR4rdSIWoo4WTzDXJEeTGsNemRspV5+XcFItmF4
r0CqFGgNAZXdvgbr9UdT83Hw3c6VFi4/+2u5ZSvrIv1375Y2GWJlTXOhrnG9JcLBR42Qs7o/MLXV
WmkA9QO0nTAEn4fGYs9K80OnuXn42ncgkvTRLJW1FE8kK/mKxp6KT417jLawwCq6vTVlIeSvQ8Ty
0aS0xTWOJIK0rqSNsEX3XXknZxal011FFxHLLx3HrCVpCGlYnqx17ZOx3LtT/wA7Gz6nLN5HjXvM
jLdnr9gI1Edb3i/9Pjt/yFvu1ru/EO9YByFHj2qcI9niehmr8jSomOKSz2o8sjaDDQO29NnZI+Qy
K4np/l4ebp34+HnhjocfPJGprxw907KQEAU78n/Y7yxf5Idr3XrBUeVDa38/3981jp9g5lHJ2gxT
s7t/F2/f5/XAK3TpXm6VbgEtcfbmqQ15JZoq8McxWy7EkvG50fTQ37Z3nQ/CPwfBGKaKWGSeZ5jD
KyExd3sO30A9N6HjePHgdv3i9YVioUlTrx67++8k68S14EiVmYKAu2OyfqTgG7DDDAP/2Q==

--_004_60B477D225E93B419F9F82BF988B2449D99334039SN1MPN1005039d_--
