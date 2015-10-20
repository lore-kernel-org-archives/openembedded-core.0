Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8F94776710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 10:12:02 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZoTti-0007iQ-1G from Noor_Ahsan@mentor.com ;
	Tue, 20 Oct 2015 03:12:02 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Tue, 20 Oct 2015 11:12:01 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] U-boot file is being removed when image-recipe is
	rebuild which uses wic.bz2
Thread-Index: AdEKhKgGSnfGRIbXS9+W9PrdxyfvIwAmtdIw
Date: Tue, 20 Oct 2015 10:12:01 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095FA549@EU-MBX-01.mgc.mentorg.com>
References: <365E1805BC95084CBE82381A0B86999401095F9A9A@EU-MBX-01.mgc.mentorg.com>
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095F9A9A@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Larson,
	Chris" <Chris_Larson@mentor.com>, "Krishnakar,
	Srikanth" <Srikanth_Krishnakar@mentor.com>
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
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
X-List-Received-Date: Tue, 20 Oct 2015 10:12:02 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_365E1805BC95084CBE82381A0B86999401095FA549EUMBX01mgcmen_"

--_000_365E1805BC95084CBE82381A0B86999401095FA549EUMBX01mgcmen_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Ed Bartosh,

Just to be clear the u-boot-mx6-solox.imx gets deleted when wic create comm=
and is executed. Kindly let us know what to do. We are stuck with our relea=
se.

Noor

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
Sent: Monday, October 19, 2015 8:42 PM
To: ed.bartosh@linux.intel.com
Cc: Krishnakar, Srikanth; Larson, Chris; openembedded-core@lists.openembedd=
ed.org
Subject: [OE-core] U-boot file is being removed when image-recipe is rebuil=
d which uses wic.bz2

Hello,

We are using wi.bz2 as our image fstypes. The image gets created smoothly f=
or the first time. Our wks file uses -sourceparam argument and mention the =
u-boot file

part u-boot --source rawcopy --sourceparams=3D"file=3Du-boot-mx6-solox.imx"=
 --ondisk mmcblk --no-table --align 1

The issue comes when something is added to image recipe and it get rebuild.=
 At that time somehow u-boot-mx6-solox.imx gets deleted from deploy folder =
and we get this error

Error: exec_cmd: du -Lbks /home/noor/SB/release_2015.12/build_soloX/tmp/dep=
loy/images/mx6-solox/u-boot-mx6-solox.imx returned '1' instead of 0
Checking basic build environment...
Done.


I was able to reproduce the error by cleaning image recipe and rebuilding i=
t. I got the same error. So something is being done in wic setup which remo=
ves the u-boot file. I need some help on this to resolve the issue of remov=
al of u-boot.

Noor

--_000_365E1805BC95084CBE82381A0B86999401095FA549EUMBX01mgcmen_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hello Ed Bartosh,<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Just to be clear the u=
-boot-mx6-solox.imx gets deleted when wic create command is executed. Kindl=
y let us know what to do. We are stuck with our release.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Noor<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D"><o:p>&nbsp;</o:p></span></a></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Ahsan, Noor<br>
<b>Sent:</b> Monday, October 19, 2015 8:42 PM<br>
<b>To:</b> ed.bartosh@linux.intel.com<br>
<b>Cc:</b> Krishnakar, Srikanth; Larson, Chris; openembedded-core@lists.ope=
nembedded.org<br>
<b>Subject:</b> [OE-core] U-boot file is being removed when image-recipe is=
 rebuild which uses wic.bz2<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are using wi.bz2 as our image fstypes. The image =
gets created smoothly for the first time. Our wks file uses &#8211;sourcepa=
ram argument and mention the u-boot file
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">part u-boot --source rawcopy --sourceparams=3D&quot;=
file=3Du-boot-mx6-solox.imx&quot; --ondisk mmcblk --no-table --align 1<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The issue comes when something is added to image rec=
ipe and it get rebuild. At that time somehow u-boot-mx6-solox.imx gets dele=
ted from deploy folder and we get this error<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Error: exec_cmd: du -Lbks /home/noor/SB/release_2015=
.12/build_soloX/tmp/deploy/images/mx6-solox/u-boot-mx6-solox.imx returned '=
1' instead of 0<o:p></o:p></p>
<p class=3D"MsoNormal">Checking basic build environment...<o:p></o:p></p>
<p class=3D"MsoNormal">Done.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was able to reproduce the error by cleaning image =
recipe and rebuilding it. I got the same error. So something is being done =
in wic setup which removes the u-boot file. I need some help on this to res=
olve the issue of removal of u-boot.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Noor<o:p></o:p></p>
</div>
</body>
</html>

--_000_365E1805BC95084CBE82381A0B86999401095FA549EUMBX01mgcmen_--
