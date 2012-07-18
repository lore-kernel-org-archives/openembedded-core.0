Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SrULq-00048e-5U
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:31:38 +0200
Received: from mail207-co1-R.bigfish.com (10.243.78.233) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Wed, 18 Jul 2012 13:05:08 +0000
Received: from mail207-co1 (localhost [127.0.0.1])	by
	mail207-co1-R.bigfish.com (Postfix) with ESMTP id 9E3018C022B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:05:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzc85fhzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ahbe9i)
Received: from mail207-co1 (localhost.localdomain [127.0.0.1]) by mail207-co1
	(MessageSwitch) id 1342616704205402_30844;
	Wed, 18 Jul 2012 13:05:04 +0000 (UTC)
Received: from CO1EHSMHS007.bigfish.com (unknown [10.243.78.234])	by
	mail207-co1.bigfish.com (Postfix) with ESMTP id 1F274C40044	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:05:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS007.bigfish.com
	(10.243.66.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 18 Jul 2012 13:05:03 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Wed, 18 Jul 2012 08:05:02 -0500
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Different behavior of same IMAGE_FSTYPES definition in edison
	branch and denzil branch
Thread-Index: Ac1k5fCvQdWxMVVfS5acWQQbmR33Dg==
Date: Wed, 18 Jul 2012 13:05:02 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0121D266@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.129]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Different behavior of same IMAGE_FSTYPES definition in edison branch and denzil branch
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
X-List-Received-Date: Wed, 18 Jul 2012 13:31:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CA452391058F6D4E9715FB2C29D9312A0121D266039SN2MPN102103_"

--_000_CA452391058F6D4E9715FB2C29D9312A0121D266039SN2MPN102103_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I meet a different behavior of IMAGE_FSTYPES in edison branch and denzil br=
anch.

In edison branch:
IMAGE_FSTYPES is defined as following in poky/meta/conf/bitbake.conf.
IMAGE_FSTYPES ?=3D "tar.gz"
I defined IMAGE_FSTYPES as following in my customized image bb file(in my l=
ayer)
IMAGE_FSTYPES ?=3D "tar.gz ext2.gz.u-boot jffs2"
The actual value of IMAGE_FSTYPES is "tar.gz ext2.gz.u-boot jffs2" which is=
 the expectation.

In denzil branch:
IMAGE_FSTYPES is defined as following in poky/meta/conf/bitbake.conf.
IMAGE_FSTYPES ?=3D "tar.gz"
I defined IMAGE_FSTYPES as following in my customized image bb file(in my l=
ayer)
IMAGE_FSTYPES ?=3D "tar.gz ext2.gz.u-boot jffs2"
The actual value of IMAGE_FSTYPES is "tar.gz"

Is this the expected behavior in denzil branch? Should I use 'IMAGE_FSTYPES=
 =3D "tar.gz ext2.gz.u-boot jffs2"' to override previous definition?


Best Regards,

Zhenhua

--_000_CA452391058F6D4E9715FB2C29D9312A0121D266039SN2MPN102103_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">I meet a different behavior of IMAGE_FSTYPES in edis=
on branch and denzil branch.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In edison branch: <o:p></o:p></p>
<p class=3D"MsoNormal">IMAGE_FSTYPES is defined as following in poky/meta/c=
onf/bitbake.conf.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">IMAGE_FSTYPES ?=3D &quot;=
tar.gz&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">I defined IMAGE_FSTYPES as following in my customize=
d image bb file(in my layer)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">IMAGE_FSTYPES ?=3D &quot;=
tar.gz ext2.gz.u-boot jffs2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">The actual value of IMAGE_FSTYPES is &quot;tar.gz ex=
t2.gz.u-boot jffs2&quot; which is the expectation.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In denzil branch: <o:p></o:p></p>
<p class=3D"MsoNormal">IMAGE_FSTYPES is defined as following in poky/meta/c=
onf/bitbake.conf.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">IMAGE_FSTYPES ?=3D &quot;=
tar.gz&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">I defined IMAGE_FSTYPES as following in my customize=
d image bb file(in my layer)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">IMAGE_FSTYPES ?=3D &quot;=
tar.gz ext2.gz.u-boot jffs2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">The actual value of IMAGE_FSTYPES is &quot;tar.gz&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this the expected behavior in denzil branch? Shou=
ld I use &#8216;IMAGE_FSTYPES =3D &quot;tar.gz ext2.gz.u-boot jffs2&quot;&#=
8217; to override previous definition?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhenhua<o:p></o:p></p>
</div>
</body>
</html>

--_000_CA452391058F6D4E9715FB2C29D9312A0121D266039SN2MPN102103_--
