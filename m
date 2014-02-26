Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 67B4060DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:11:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,547,1389740400"; d="scan'208,217";a="41794871"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 26 Feb 2014 12:11:31 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Wed, 26 Feb 2014 12:11:29 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: image.bbclass: USE_DEVFS is now useless
Thread-Index: Ac8y4SVYYOAm1CkVQOWnvL0TlEKEvw==
Date: Wed, 26 Feb 2014 11:11:28 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: image.bbclass: USE_DEVFS is now useless
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
X-List-Received-Date: Wed, 26 Feb 2014 11:11:32 -0000
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_8672BB614B4CCA40A6B3BDD6FD82050B575445A7COSNADEXC13usri_"

--_000_8672BB614B4CCA40A6B3BDD6FD82050B575445A7COSNADEXC13usri_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Since :
http://cgit.openembedded.org/openembedded-core/commit/meta/classes/image.bb=
class?id=3Da83144bac8d67704ff66f5dc0fc56f5b63979694

USE_DEVFS is not considered anymore.

Setting IMAGE_DEVICE_TABLE or IMAGE_DEVICE_TABLES to empty string in an ima=
ge recipe works (makedevs is not called)

Should be we drop USE_DEVFS variable (meta/classes/image.bbclass) or (re)ad=
d check in meta/lib/oe/rootfs.py?
I can propose a patch.

Regards,
Matthieu

--_000_8672BB614B4CCA40A6B3BDD6FD82050B575445A7COSNADEXC13usri_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
<body lang=3D"FR" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since&nbsp;:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://cgit.openembedded.org/openembedded=
-core/commit/meta/classes/image.bbclass?id=3Da83144bac8d67704ff66f5dc0fc56f=
5b63979694">http://cgit.openembedded.org/openembedded-core/commit/meta/clas=
ses/image.bbclass?id=3Da83144bac8d67704ff66f5dc0fc56f5b63979694</a><o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">USE_DEVFS is not considered any=
more.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Setting IMAGE_DEVICE_TABLE or I=
MAGE_DEVICE_TABLES to empty string in an image recipe works (makedevs is no=
t called)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Should be we drop USE_DEVFS var=
iable (meta/classes/image.bbclass) or (re)add check in meta/lib/oe/rootfs.p=
y?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I can propose a patch.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Matthieu<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_8672BB614B4CCA40A6B3BDD6FD82050B575445A7COSNADEXC13usri_--
