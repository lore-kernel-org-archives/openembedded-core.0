Return-Path: <chiz.chikwendu@Haemonetics.com>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Sep 2014 12:15:02 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.16])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD7C6FE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 12:15:02 +0000 (UTC)
Received: from [216.82.250.19:25933] by server-16.bemta-12.messagelabs.com id
	AA/B7-10985-CA091145; Thu, 11 Sep 2014 12:08:12 +0000
X-Env-Sender: chiz.chikwendu@Haemonetics.com
X-Msg-Ref: server-6.tower-87.messagelabs.com!1410437290!24935204!1
X-Originating-IP: [12.94.3.150]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5406 invoked from network); 11 Sep 2014 12:08:11 -0000
Received: from unknown (HELO mail.haemonetics.com) (12.94.3.150)
	by server-6.tower-87.messagelabs.com with AES128-SHA encrypted SMTP;
	11 Sep 2014 12:08:11 -0000
Received: from BRS-EXCH02.haemo.net ([169.254.2.195]) by BRS-Exch01.haemo.net
	([169.254.1.211]) with mapi id 14.03.0195.001;
	Thu, 11 Sep 2014 08:08:10 -0400
From: Chiz Chikwendu <chiz.chikwendu@Haemonetics.com>
To: "Openembedded List (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: bzImage not included in rootfs
Thread-Index: Ac/NuQqbyNbec55cRIGxKCHHjsJZBg==
Date: Thu, 11 Sep 2014 12:08:09 +0000
Message-ID: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.77]
MIME-Version: 1.0
Cc: "darren.hart@intel.com" <darren.hart@intel.com>
Subject: bzImage not included in rootfs
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
X-List-Received-Date: Thu, 11 Sep 2014 12:15:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A0F68394C677A9428EE03709453BAAEC7959C76CBRSExch02haemon_"

--_000_A0F68394C677A9428EE03709453BAAEC7959C76CBRSExch02haemon_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am new to Openembedded (and yocto).

I have built an image with poky build environment.



I noticed that the kernel's bzImage is not included in the rootfs.

How do I get the system to include "bzImage" in the rootfs (boot/bzImage-)?



I've done some research, and I saw a note about setting the parameter:

RDEPENDS_kernel-base =3D "zImage"



This should override the kernel settings and build the kernel into the root=
fs. I tried it, however it is not working for me.



Can anyone help?

Thanks,
Chiz

--_000_A0F68394C677A9428EE03709453BAAEC7959C76CBRSExch02haemon_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoPlainText">I am new to Openembedded (and yocto). <o:p></o:p>=
</p>
<p class=3D"MsoPlainText">I have built an image with poky build environment=
. <o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I noticed that the kernel&#8217;s bzImage is not =
included in the rootfs.
<o:p></o:p></p>
<p class=3D"MsoPlainText">How do I get the system to include &#8220;bzImage=
&#8221; in the rootfs (boot/bzImage-)?<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I&#8217;ve done some research, and I saw a note a=
bout setting the parameter:<o:p></o:p></p>
<p class=3D"MsoPlainText">RDEPENDS_kernel-base =3D &#8220;zImage&#8221;<o:p=
></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">This should override the kernel settings and buil=
d the kernel into the rootfs. I tried it, however it is not working for me.=
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Can anyone help?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Chiz<o:p></o:p></p>
</div>
</body>
</html>

--_000_A0F68394C677A9428EE03709453BAAEC7959C76CBRSExch02haemon_--
