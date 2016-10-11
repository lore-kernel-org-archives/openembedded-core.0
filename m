Return-Path: <vesa.jaaskelainen@vaisala.com>
X-Greylist: delayed 613 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 13:05:35 UTC
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4764360111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 13:05:34 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CiBACF4PxX/1UBGKxcHQEFAQsBgwc1AQEBAQF0gQO4Y4ILiF8SAQIBAQEBAQEBgQWEaC1eAYEAJgEEG8tLAQsBJZAlhRMFjniFMIVagTqOPI98kHglCUCFE4gUgQABAQE
X-IPAS-Result: A2CiBACF4PxX/1UBGKxcHQEFAQsBgwc1AQEBAQF0gQO4Y4ILiF8SAQIBAQEBAQEBgQWEaC1eAYEAJgEEG8tLAQsBJZAlhRMFjniFMIVagTqOPI98kHglCUCFE4gUgQABAQE
X-IronPort-AV: E=Sophos;i="5.31,329,1473109200"; d="scan'208,217";a="31942429"
Received: from hel-exch-02.corp.vaisala.com ([172.24.1.85])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	11 Oct 2016 15:55:24 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-02.corp.vaisala.com (172.24.1.85) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 11 Oct 2016 15:55:22 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1130.005; Tue, 11 Oct 2016 15:55:22 +0300
From: <vesa.jaaskelainen@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Two kmeta's not allowed for master?
Thread-Index: AdIjvdB5snKmw3NtQNyS01y4oaThoA==
Date: Tue, 11 Oct 2016 12:55:22 +0000
Message-ID: <7e365e2e0e9d4c2baa00bd7b03673e2b@HEL-EXCH-02.corp.vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.65.135]
MIME-Version: 1.0
Subject: Two kmeta's not allowed for master?
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
X-List-Received-Date: Tue, 11 Oct 2016 13:05:37 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7e365e2e0e9d4c2baa00bd7b03673e2bHELEXCH02corpvaisalacom_"

--_000_7e365e2e0e9d4c2baa00bd7b03673e2bHELEXCH02corpvaisalacom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I was trying out how well 'master' branch compiles in our environment.

We are using meta-xilinx and then we have custom BSP layer which bbappends =
linux-xlnx.

When using meta-xilinx as standalone (w/o our BSP layer) I can get it to co=
mpile.

However when using it with combo meta-xilinx and our BSP we get failure on =
do_kernel_metadata due to missing scc files.

It seems that there can no longer be two kmeta entries in SRC_URI.

meta-xilinx's linux-xlnx.inc has:
file://xilinx-base;type=3Dkmeta;destsuffix=3Dxilinx-base
our bbappend has:
file://meta;type=3Dkmeta;destsuffix=3Dmeta

In krogoth this works fine.

Is this expected change?

Thanks,
Vesa J=E4=E4skel=E4inen

--_000_7e365e2e0e9d4c2baa00bd7b03673e2bHELEXCH02corpvaisalacom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was trying out how well &#8216;master&#8217; branc=
h compiles in our environment.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are using meta-xilinx and then we have custom BSP=
 layer which bbappends linux-xlnx.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When using meta-xilinx as standalone (w/o our BSP la=
yer) I can get it to compile.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However when using it with combo meta-xilinx and our=
 BSP we get failure on do_kernel_metadata due to missing scc files.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It seems that there can no longer be two kmeta entri=
es in SRC_URI.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">meta-xilinx&#8217;s linux-xlnx.inc has:<o:p></o:p></=
p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">file://xilinx-base;type=
=3Dkmeta;destsuffix=3Dxilinx-base<o:p></o:p></p>
<p class=3D"MsoNormal">our bbappend has:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">file://meta;type=3Dkmet=
a;destsuffix=3Dmeta<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In krogoth this works fine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this expected change?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Vesa J=E4=E4skel=E4inen<o:p></o:p></p>
</div>
</body>
</html>

--_000_7e365e2e0e9d4c2baa00bd7b03673e2bHELEXCH02corpvaisalacom_--
