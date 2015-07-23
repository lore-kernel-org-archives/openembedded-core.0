Return-Path: <Gamma.Dean@emerson.com>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jul 2015 18:00:20 UTC
Received: from esa6.emerson-outbound.iphmx.com
	(esa6.emerson-outbound.iphmx.com [68.232.143.92])
	by mail.openembedded.org (Postfix) with ESMTP id 1A60776228
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 18:00:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,532,1432598400"; d="scan'208,217";a="12646778"
Received: from usstlz-pinfez08.extemr.org ([144.191.128.192])
	by esa6.emerson-outbound.iphmx.com with ESMTP/TLS/AES128-SHA;
	23 Jul 2015 17:50:32 +0000
Received: from USSTLZ-PMSGDR01.emrsn.org (10.16.72.33) by
	USSTLZ-PINFEZ08.extemr.org (10.16.8.81) with Microsoft SMTP Server
	(TLS) id 14.3.158.1; Thu, 23 Jul 2015 17:50:20 +0000
Received: from USSTLZ-PMSG016.emrsn.org ([169.254.8.133]) by
	usstlz-pmsgdr01.emrsn.org ([169.254.2.158]) with mapi id 14.03.0224.002;
	Thu, 23 Jul 2015 17:50:20 +0000
From: <Gamma.Dean@Emerson.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Rebuilding STAGING_KERNEL_DIR from sstate cache
Thread-Index: AdDFbg75dpD0L6zWR3KBKh/Yqa1SoA==
Date: Thu, 23 Jul 2015 17:50:19 +0000
Message-ID: <5B6A9B05AFA9AC4FB94345D083806F144B2BFEB2@USSTLZ-PMSG016.emrsn.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.249.11]
MIME-Version: 1.0
Subject: Rebuilding STAGING_KERNEL_DIR from sstate cache
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
X-List-Received-Date: Thu, 23 Jul 2015 18:00:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5B6A9B05AFA9AC4FB94345D083806F144B2BFEB2USSTLZPMSG016em_"

--_000_5B6A9B05AFA9AC4FB94345D083806F144B2BFEB2USSTLZPMSG016em_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a user space application that needs to reference a header file from =
STAGING_KERNEL_DIR.  If I do a fresh build using an already populated sstat=
e cache STAGING_KERNEL_DIR doesn't get populated so if I then try to rebuil=
d my application the build fails.  Looking through module-base.bbclass I fo=
und the following line which fixes the problem:

  do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"

This forces STAGING_KERNEL_DIR to get built but it requires the kernel to c=
ompletely rebuild which can take a while.  I mostly just wanted to write th=
is down for anyone that finds themselves in the same situation but I was al=
so wondering if there is another way to get STAGING_KERNEL_DIR assembled fr=
om sstate cache that wouldn't require a kernel rebuild.

--_000_5B6A9B05AFA9AC4FB94345D083806F144B2BFEB2USSTLZPMSG016em_
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
<p class=3D"MsoNormal">I have a user space application that needs to refere=
nce a header file from STAGING_KERNEL_DIR.&nbsp; If I do a fresh build usin=
g an already populated sstate cache STAGING_KERNEL_DIR doesn&#8217;t get po=
pulated so if I then try to rebuild my application
 the build fails.&nbsp; Looking through module-base.bbclass I found the fol=
lowing line which fixes the problem:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; do_configure[depends] &#43;=3D &quot;virtual/=
kernel:do_shared_workdir&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This forces STAGING_KERNEL_DIR to get built but it r=
equires the kernel to completely rebuild which can take a while.&nbsp; I mo=
stly just wanted to write this down for anyone that finds themselves in the=
 same situation but I was also wondering
 if there is another way to get STAGING_KERNEL_DIR assembled from sstate ca=
che that wouldn&#8217;t require a kernel rebuild.<o:p></o:p></p>
</div>
</body>
</html>

--_000_5B6A9B05AFA9AC4FB94345D083806F144B2BFEB2USSTLZPMSG016em_--
