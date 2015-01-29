Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F226601FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 18:13:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0TIDqQH004187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:13:53 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.56]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 29 Jan 2015 10:13:52 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] SECURITY_CFLAGS & _FORTIFY_SOURCE
Thread-Index: AdA77N3uKZPizJ+ZSiKhiU4FnoeNQw==
Date: Thu, 29 Jan 2015 18:13:52 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84721D3F35@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: SECURITY_CFLAGS & _FORTIFY_SOURCE
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
X-List-Received-Date: Thu, 29 Jan 2015 18:13:57 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84721D3F35ALAMBBcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84721D3F35ALAMBBcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-D_FORTIFY_SOURCE=3D2 is usually set in SECURITY_CFLAGS which will cause lo=
ts of warnings, and possibly failures, if DEBUG_BUILD=3D1.

Since there are already lots of package overrides for SECURITY_CFLAGS, we c=
ould just add more for packages that won't build under
these conditions, or

we could not insert -D_FORTIFY_SOURCE=3D2 if DEBUG_BUILD=3D1, or

we could not modify TARGET_CFLAGS with any SECURITY_CFLAGS for debug builds=
.

Before submitting a patch, I'd like to know what people think the general a=
pproach (if any) should be in changing security_flags.inc.

Joe


--_000_007BD92917A2324FA403BCF9A464CF84721D3F35ALAMBBcorpadwrs_
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
<p class=3D"MsoNormal">-D_FORTIFY_SOURCE=3D2 is usually set in SECURITY_CFL=
AGS which will cause lots of warnings, and possibly failures, if DEBUG_BUIL=
D=3D1.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since there are already lots of package overrides fo=
r SECURITY_CFLAGS, we could just add more for packages that won't build und=
er<o:p></o:p></p>
<p class=3D"MsoNormal">these conditions, or<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">we could not insert -D_FORTIFY_SOURCE=3D2 if DEBUG_B=
UILD=3D1, or<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">we could not modify TARGET_CFLAGS with any SECURITY_=
CFLAGS for debug builds.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Before submitting a patch, I'd like to know what peo=
ple think the general approach (if any) should be in changing security_flag=
s.inc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84721D3F35ALAMBBcorpadwrs_--
