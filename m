Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1D00465CB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 07:51:33 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Tue, 16 Sep 2014 09:51:27 +0200
From: Adrian Calianu <Adrian.Calianu@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: aarch64: correct path for ld-linux-aarch64.so
Thread-Index: Ac/RgwMf/Evdb4LlTTiJlRXynpmbcw==
Date: Tue, 16 Sep 2014 07:51:27 +0000
Message-ID: <A1661D2DDD942248A02617DE63569A0125D3C72F@SESTOEX04.enea.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.161]
MIME-Version: 1.0
Subject: aarch64: correct path for ld-linux-aarch64.so
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
X-List-Received-Date: Tue, 16 Sep 2014 07:51:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A1661D2DDD942248A02617DE63569A0125D3C72FSESTOEX04enease_"

--_000_A1661D2DDD942248A02617DE63569A0125D3C72FSESTOEX04enease_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

   Building a core-image-minial with poky distro for a new aarch64 machine =
I found that the ld-linux-aarch64.so is stored under /lib64 folder into roo=
tfs.
   Due to this issue the init process doesn't start. I think the correct lo=
cation is under /lib folder.

Kernel panic - not syncing: No working init found.  Try passing init=3D opt=
ion to kernel. See Linux Documentation/init.txt for guidance.

   Is there any configuration that need to be done or patch for this issue?

Thank you in advance,
Adrian





--_000_A1661D2DDD942248A02617DE63569A0125D3C72FSESTOEX04enease_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Courrier New";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.SourceCode, li.SourceCode, div.SourceCode
	{mso-style-name:SourceCode;
	mso-style-link:"SourceCode Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-autospace:none;
	mso-element:frame;
	mso-element-wrap:around;
	mso-element-anchor-vertical:paragraph;
	mso-element-anchor-horizontal:column;
	mso-element-top:.05pt;
	mso-height-rule:exactly;
	font-size:11.0pt;
	font-family:"Courrier New";}
span.SourceCodeChar
	{mso-style-name:"SourceCode Char";
	mso-style-link:SourceCode;
	font-family:"Courrier New";}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Building a core-image-minial with poky =
distro for a new aarch64 machine I found that the ld-linux-aarch64.so is st=
ored under /lib64 folder into rootfs.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Due to this issue the init process does=
n&#8217;t start. I think the correct location is under /lib folder.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rrier New&quot;">Kernel panic - not syncing: No working init found.&nbsp; T=
ry passing init=3D option to kernel. See Linux Documentation/init.txt for g=
uidance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Is there any configuration that need to=
 be done or patch for this issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you in advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Adrian<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rrier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rrier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rrier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_A1661D2DDD942248A02617DE63569A0125D3C72FSESTOEX04enease_--
