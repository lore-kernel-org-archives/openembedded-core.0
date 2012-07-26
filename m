Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1SuTFE-00073o-GH
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:57:08 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6QIjbYq025943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 11:45:37 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.203]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Thu, 26 Jul 2012 11:45:36 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: EXCLUDE_FROM_WORLD
Thread-Index: Ac1rXXJgZ1SXUA3UTPSRnt48UNUAsg==
Date: Thu, 26 Jul 2012 18:45:36 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF841FF7D6FA@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Thu, 26 Jul 2012 18:57:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF841FF7D6FAALAMBBcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF841FF7D6FAALAMBBcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Could somebody clarify excluding things from world?  I see EXCLUDE_FROM_WOR=
LD =3D "1" in
many places, including libx11.inc, and I'm sure there's plenty of libx11 st=
uff in world.

I also see package specific exclusions in world-broken.inc.

If one wants to exclude items for a particular bsp, would it be best to put=
 exclusions
in a conf file for the bsp, or to put exclusions in another conf file in th=
e form of

EXCLUDE_FROM_WORLD_pn-whatever_bsp-name =3D "1"

Oh, and is it necessary to exclude things on a recipe-by-recipe basis?

Thanks,

Joe


--_000_007BD92917A2324FA403BCF9A464CF841FF7D6FAALAMBBcorpadwrs_
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could somebody clarify excluding things from world?&=
nbsp; I see EXCLUDE_FROM_WORLD =3D &quot;1&quot; in<o:p></o:p></p>
<p class=3D"MsoNormal">many places, including libx11.inc, and I'm sure ther=
e's plenty of libx11 stuff in world.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I also see package specific exclusions in world-brok=
en.inc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If one wants to exclude items for a particular bsp, =
would it be best to put exclusions<o:p></o:p></p>
<p class=3D"MsoNormal">in a conf file for the bsp, or to put exclusions in =
another conf file in the form of<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">EXCLUDE_FROM_WORLD_pn-whatever_bsp-name =3D &quot;1&=
quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Oh, and is it necessary to exclude things on a recip=
e-by-recipe basis?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF841FF7D6FAALAMBBcorpadwrs_--
