Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RT1gK-0006YV-9S
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 02:31:24 +0100
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 59BF35EA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 17:24:49 -0800 (PST)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 367015E7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 17:24:49 -0800 (PST)
Received: from NAEMCASHT02.na.leapfrog.com (10.12.2.36) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 22 Nov 2011 17:24:48 -0800
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 22 Nov 2011 17:24:48 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Overriding a variable only in our layer
Thread-Index: Acypfq/dic6blehRRZqDGFdgcP2TEw==
Date: Wed, 23 Nov 2011 01:24:47 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F04246AAE@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Overriding a variable only in our layer
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
X-List-Received-Date: Wed, 23 Nov 2011 01:31:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_E7A9054A5ACABE48B0E540E46E862B0F04246AAENAEMMAIL01nalea_"

--_000_E7A9054A5ACABE48B0E540E46E862B0F04246AAENAEMMAIL01nalea_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey everyone,

I ran into an interesting problem today that I need some help with. I'm not=
 sure if this is a bitbake issue or an oe-core one so I thought I'd try her=
e first. We have our own layer that overlays on top of oe-core, meta-oe, an=
d meta-angstrom. Our layer has a bunch of recipes that pull projects from o=
ur local SVN, including a recipe for u-boot. We have a build configuration =
file that has lines like the following:

SRCREV_pn-u-boot =3D "563"

We pull in this conf at build time using bitbake's -R argument. Just recent=
ly we switched u-boot's SRCREV from ${AUTOREV} to an actual revision number=
 and bitbake started choking trying to parse recipes. It looks like it chok=
es while trying to parse oe-core's u-boot git recipe because the SRCREV is =
meant for SVN, not GIT (even though our PREFERRED_VERSION is set up only to=
 build our u-boot). Is there a way to override this SRCREV variable only wh=
en parsing recipes in our layer? I know I can do it directly in the recipe,=
 but that loses us the advantages of having all of the SRCREVs in one file =
(which makes specific full rebuilds very easy).

Thanks,

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com


--_000_E7A9054A5ACABE48B0E540E46E862B0F04246AAENAEMMAIL01nalea_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">Hey everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I ran into an interesting problem today that I need =
some help with. I&#8217;m not sure if this is a bitbake issue or an oe-core=
 one so I thought I&#8217;d try here first. We have our own layer that over=
lays on top of oe-core, meta-oe, and meta-angstrom.
 Our layer has a bunch of recipes that pull projects from our local SVN, in=
cluding a recipe for u-boot. We have a build configuration file that has li=
nes like the following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">SRCREV_pn-u-boot =3D &#8220;563&#8221;<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We pull in this conf at build time using bitbake&#82=
17;s &#8211;R argument. Just recently we switched u-boot&#8217;s SRCREV fro=
m ${AUTOREV} to an actual revision number and bitbake started choking tryin=
g to parse recipes. It looks like it chokes while trying
 to parse oe-core&#8217;s u-boot git recipe because the SRCREV is meant for=
 SVN, not GIT (even though our PREFERRED_VERSION is set up only to build ou=
r u-boot). Is there a way to override this SRCREV variable only when parsin=
g recipes in our layer? I know I can do
 it directly in the recipe, but that loses us the advantages of having all =
of the SRCREVs in one file (which makes specific full rebuilds very easy).<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Dan Lazzari Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Firmware Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">dlazzari@leapfrog.com<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_E7A9054A5ACABE48B0E540E46E862B0F04246AAENAEMMAIL01nalea_--
