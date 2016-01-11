Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B953265CC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:57:13 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aIc25-0000Er-CX from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jan 2016 04:57:13 -0800
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.50]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Mon, 11 Jan 2016 12:57:11 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: some dev pkg bring extra target packages when installed in rootfs
Thread-Index: AdFMb5TAT/9RimbkRWu5YXGRFGP71A==
Date: Mon, 11 Jan 2016 12:57:10 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940127CB4348@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "Larson, Chris" <Chris_Larson@mentor.com>
Subject: some dev pkg bring extra target packages when installed in rootfs
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
X-List-Received-Date: Mon, 11 Jan 2016 12:57:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_365E1805BC95084CBE82381A0B8699940127CB4348EUMBX01mgcmen_"

--_000_365E1805BC95084CBE82381A0B8699940127CB4348EUMBX01mgcmen_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed one thing that when we add dev-pkg in IMAGE_FEATURE variable it n=
ot only install the dev package of corresponding target packages present in=
 rootfs rather it also brings in extra target packages. I investigated it a=
nd I found that the reason of inclusion of extra target packages I rootfs i=
s due to dependency of a dev package on dev package of packages present in =
DEPENDS. In order to make it clear let's take example of readline recipe. I=
t is dependent on ncurses. If we analyze ipk file of readline-dev package w=
e will see that it ipk is Recommending ncurses-dev package

Recommends: libc6-dev, libgcc-s-dev, ncurses-libtinfo-dev, ncurses-dev

So when readline-dev will be installed in rootfs it will also install ncurs=
es-dev. Now analyze ncurses-dev ipk, it will show that it is dependent on n=
curses main package

Depends: libtinfo5, ncurses (=3D 5.9-r15.1.6), libpanelw5, libform5, libtic=
5, libmenuw5, libformw5, libpanel5, libmenu5, libticw5

So ncurses main package is installed indirectly if we install readline-dev.

I thought that we should discuss this in community so that we can comeup wi=
th common decision.

Noor


--_000_365E1805BC95084CBE82381A0B8699940127CB4348EUMBX01mgcmen_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:black">Hello,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">I noticed one thing that=
 when we add dev-pkg in IMAGE_FEATURE variable it not only install the dev =
package of corresponding target packages present in rootfs rather it also b=
rings in extra target packages. I investigated
 it and I found that the reason of inclusion of extra target packages I roo=
tfs is due to dependency of a dev package on dev package of packages presen=
t in DEPENDS. In order to make it clear let&#8217;s take example of readlin=
e recipe. It is dependent on ncurses.
 If we analyze ipk file of readline-dev package we will see that it ipk is =
Recommending ncurses-dev package<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Recommends: libc6-dev, l=
ibgcc-s-dev, ncurses-libtinfo-dev, ncurses-dev<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">So when readline-dev wil=
l be installed in rootfs it will also install ncurses-dev. Now analyze ncur=
ses-dev ipk, it will show that it is dependent on ncurses main package<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Depends: libtinfo5, ncur=
ses (=3D 5.9-r15.1.6), libpanelw5, libform5, libtic5, libmenuw5, libformw5,=
 libpanel5, libmenu5, libticw5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">So ncurses main package =
is installed indirectly if we install readline-dev.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">I thought that we should=
 discuss this in community so that we can comeup with common decision.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Noor <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_365E1805BC95084CBE82381A0B8699940127CB4348EUMBX01mgcmen_--
