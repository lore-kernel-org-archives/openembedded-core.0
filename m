Return-Path: <robin.l.jordan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 41C73784F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 15:02:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 08:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,461,1515484800"; d="scan'208,217";a="38062929"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2018 08:02:41 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 12 Mar 2018 08:02:31 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
	FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 12 Mar 2018 08:02:30 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (216.32.181.22)
	by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 12 Mar 2018 08:02:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EmXzq6MkJx4zn0hKdgY0aSE77umUiY+Mt79+j+p5mVM=;
	b=NQ7JQousavnKtuB3cjhfhyPybjbvHjuncOhP99iVoeXQiW/IIsx82TyqQ9mJ9PG61iUyWtXO8G5/UXstVl2kqBarAzHeOOby/XrC4okvii1A5hNGu48SB7biSJkLOU6IeQc0Ow/4KTtv4JcUYt/WRwy4Ybw91lvx0BQKAc56ec0=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1335.namprd11.prod.outlook.com (10.173.16.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Mon, 12 Mar 2018 15:02:20 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::9cb9:2d8f:7d35:a2a6]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::9cb9:2d8f:7d35:a2a6%13]) with mapi id 15.20.0567.018;
	Mon, 12 Mar 2018 15:02:20 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW11=9218?=
Thread-Index: AdO6Ev9qIJ8AwiqASO6w7U8ZWDA/+A==
Importance: high
X-Priority: 1
Date: Mon, 12 Mar 2018 15:02:20 +0000
Message-ID: <CY4PR11MB17661ABB8C5DB31815FA8987C7D30@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [50.39.96.151]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1335;
	7:5nOTaK42DH3W8r29V9nV+AhkX0+S5l8j3EJsjEEjlchrKSLBiuBViFSPYX9gmepDLW3ReCI/ky1BRzh2O8SaM2fAwhbTyfIOZAjIOzVsUTw631XEn+t13aeN4fLIKBJbpQzNBd1o1T+1eQSM+2F075UKEt5QxyisiRXv3f4a8UhNyqwZxs982Mf3jlxmKh5s+KGOdasoxT7qHSezG1HqeDpWC6UlJ8qxuldkxvHL9sTYRWRROFCVp2ox/LiqneZ+
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 565cf812-f117-4b26-c298-08d5882a413f
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1335; 
x-ms-traffictypediagnostic: CY4PR11MB1335:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB13350CC1B3BF6FB77E123AEDC7D30@CY4PR11MB1335.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(192374486261705)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231220)(944501244)(52105095)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR11MB1335; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1335; 
x-forefront-prvs: 06098A2863
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(39380400002)(396003)(366004)(199004)(189003)(2501003)(81156014)(74316002)(6116002)(8936002)(66066001)(25786009)(6436002)(3846002)(5660300001)(81166006)(790700001)(3280700002)(2906002)(5250100002)(316002)(110136005)(33656002)(53936002)(7736002)(55016002)(236005)(54896002)(9686003)(6306002)(3660700001)(106356001)(186003)(2900100001)(606006)(966005)(14454004)(105586002)(86362001)(97736004)(68736007)(478600001)(7696005)(26005)(6506007)(81686011)(102836004)(99286004)(59450400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1335;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-microsoft-antispam-message-info: qkPe/B0R8omoGqlQj37COMasXVNkMLtA806JLFD4BNuEJ6RfYxnbS54X5KyOZtCJDTvknsbUBhT2+OG+rXQF7+NADz1XZ8dRiJ2UZLB+Oz+/OnCYnhr46ig4KwI3xZ3XMPlXju4SU5X8wDnhdo9igI7GHqRo/dnbGqBjWxL7uzqaRQFPzGz4pWAe0173mjXqRP173prRVeFL4kIpQ7JuXgT8ejzlRKyr6bAnbU3w1aW6eivqM/MnhRK4UOiw6kZGfCX9GdSfAZIaxVhy2HJUQKHq3h9Bmv413e/z4smhwY1BNXZdI4M1m4f4/nQS20M1OgnABJrCuTWCvCkwvP9luw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 565cf812-f117-4b26-c298-08d5882a413f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2018 15:02:20.6713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1335
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMeKAmTE4?=
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
X-List-Received-Date: Mon, 12 Mar 2018 15:02:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB17661ABB8C5DB31815FA8987C7D30CY4PR11MB1766namp_"

--_000_CY4PR11MB17661ABB8C5DB31815FA8987C7D30CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M3 final close out.

Next Deadline: YP 2.5 M3 cut off was 2/19/18

*** FEATURE FREEZE for 2.5 has passed ***


SWAT lead is currently Cal.

SWAT team rotation: Cal -> Armin on March 16, 2018

SWAT team rotation: Armin -> Ross on March 23, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   The Embedded Linux Conference is in Portland this week!
  *   YP 2.4.2 RC2 QA report is being discussed and is expected to be relea=
sed this week. (https://wiki.yoctoproject.org/wiki/WW10_-_2018-03-05-_Full_=
Test_Cycle_-_2.4.2_rc2).
  *   We are changing the planning process and Milestone tracking in Bugzil=
la.  More details can be found here:  https://lists.yoctoproject.org/piperm=
ail/yocto/2018-March/040226.html
  *   A new uninative release was made (1.8) because distributions are movi=
ng to glibc 2.27 and this broke the old uninative. People using uninative s=
hould upgrade to this.
  *   GCC 6.x with the latest security fixes is currently in rocko/pyro/mor=
ty -next thanks to Martin and Juro. They are undergoing autobuilder testing=
 now but we hope they=92ll be merged soon.

  *   Performance metrics indicate that a recent merge has caused a slowdow=
n in build times.  It is suspected that the glibc upgrade is the cause of t=
his although help would be appreciated to verify and possibly mitigate this=
.
  *   Flood of last-minute upgrades continuing to be reviewed and merged if=
 high reward or low impact.
  *   Go upgrade/improvements were merged.  For 2.5 we will be shipping bot=
h 1.9.4 and 1.10, but plan to drop 1.9.x from master once 1.10 doesn=92t pr=
esent compatibility problems.
  *   EFI image refactoring patches were merged. The gist of these are that=
 /boot is now under package manager control instead of injected at image cr=
eation.
  *   A number of patch refresh patches were merged. These are to solve pro=
blems with patches applied with =93fuzz=94, where patch will note that the =
context isn=92t correct anymore but the differences are hopefully small eno=
ugh to apply anyway.  Sometimes this is useful (other changes causing the t=
arget lines to move), sometimes it=92s actively harmful (patch applied inco=
rrectly, silently breaking behaviour). We hope to warn when fuzz is detecte=
d during the 2.6 cycle so these patches are removing fuzz from oe-core.  Ex=
pect a mail to the lists soon explaining how to find and remove fuzz.
  *   We are continuing to work on the autobuilder changes and for various =
reasons (inc. changes in people).  We would be in much better shape to swit=
ch to the new codebase before release, rather than waiting until early 2.6 =
to pick this work up again by which time we would have lost people and cont=
ext. If we are to switch, we need to build M3 with the new infrastructure. =
We plan to make this switch for M3.


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built when GCC backports are merged.

YP 2.2.4 (Morty) will be built when GCC backports are merged.

YP 2.4.3 (Roko) is planned for post YP 2.5.


Key YP 2.5 Dates are:

YP 2.5 M3 is in feature freeze.  See status above.

YP 2.5 M3 was scheduled for release 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2673 (last week 2663)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


Robin Jordan
Yocto Project Program Manager

--_000_CY4PR11MB17661ABB8C5DB31815FA8987C7D30CY4PR11MB1766namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:7291224;
	mso-list-template-ids:669394764;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:127017404;
	mso-list-template-ids:-1220741634;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 M3 fin=
al close out.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M3 cut off wa=
s 2/19/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">*** FEATURE FREEZE for 2.5 has pass=
ed ***</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently Cal.</span><=
o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Cal -&gt; Armin=
 on March 16, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Armin -&gt; Ros=
s on March 23, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-family:=
Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Fail=
ure_Swat_Team</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key Status/Updates:</span><o:p></o:=
p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The Embedded Linux=
 Conference is in Portland this week!<o:p></o:p></span></li><li style=3D"co=
lor:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l=
0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.4.2 RC2 QA re=
port is being discussed and is expected to be released this week. (<a href=
=3D"https://wiki.yoctoproject.org/wiki/WW10_-_2018-03-05-_Full_Test_Cycle_-=
_2.4.2_rc2"><span style=3D"color:#1155CC">https://wiki.yoctoproject.org/wik=
i/WW10_-_2018-03-05-_Full_Test_Cycle_-_2.4.2_rc2</span></a>).
 &nbsp;<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margi=
n-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:b=
aseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We are changing th=
e planning process and Milestone tracking in Bugzilla. &nbsp;More details c=
an be found here: &nbsp;<a href=3D"https://lists.yoctoproject.org/pipermail=
/yocto/2018-March/040226.html"><span style=3D"color:#1155CC">https://lists.=
yoctoproject.org/pipermail/yocto/2018-March/040226.html</span></a>
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-botto=
m:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline=
">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">A new uninative re=
lease was made (1.8) because distributions are moving to glibc 2.27 and thi=
s broke the old uninative. People using uninative should upgrade to this.<o=
:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:=
0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">GCC 6.x with the l=
atest security fixes is currently in rocko/pyro/morty -next thanks to Marti=
n and Juro. They are undergoing autobuilder testing now but we hope they=92=
ll be merged soon.<o:p></o:p></span></li></ul>
<ul style=3D"margin-top:0in" type=3D"disc">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Performance metric=
s indicate that a recent merge has caused a slowdown in build times. &nbsp;=
It is suspected that the glibc upgrade is the cause of this although help w=
ould be appreciated to verify and possibly mitigate
 this.<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin=
-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-align:ba=
seline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Flood of last-minu=
te upgrades continuing to be reviewed and merged if high reward or low impa=
ct.<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bo=
ttom:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-align:basel=
ine">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Go upgrade/improve=
ments were merged. &nbsp;For 2.5 we will be shipping both 1.9.4 and 1.10, b=
ut plan to drop 1.9.x from master once 1.10 doesn=92t present compatibility=
 problems.<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;ma=
rgin-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-alig=
n:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">EFI image refactor=
ing patches were merged. The gist of these are that /boot is now under pack=
age manager control instead of injected at image creation.<o:p></o:p></span=
></li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bott=
om:.0001pt;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">A number of patch =
refresh patches were merged. These are to solve problems with patches appli=
ed with =93fuzz=94, where patch will note that the context isn=92t correct =
anymore but the differences are hopefully small enough
 to apply anyway. &nbsp;Sometimes this is useful (other changes causing the=
 target lines to move), sometimes it=92s actively harmful (patch applied in=
correctly, silently breaking behaviour). We hope to warn when fuzz is detec=
ted during the 2.6 cycle so these patches
 are removing fuzz from oe-core. &nbsp;Expect a mail to the lists soon expl=
aining how to find and remove fuzz.<o:p></o:p></span></li><li style=3D"colo=
r:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1 =
level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We are continuing =
to work on the autobuilder changes and for various reasons (inc. changes in=
 people). &nbsp;We would be in much better shape to switch to the new codeb=
ase before release, rather than waiting until early
 2.6 to pick this work up again by which time we would have lost people and=
 context. If we are to switch, we need to build M3 with the new infrastruct=
ure. We plan to make this switch for M3.<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Planned upcoming dot releases:</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.3.4 (Pyro) will be built when =
GCC backports are merged.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.4 (Morty) will be built when=
 GCC backports are merged.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.4.3 (Roko) is planned for post=
 YP 2.5.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates are:</span><o:p></=
o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 is in feature freeze. &nb=
sp;See status above.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 was scheduled for release=
 3/2/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 cut off of 4/2/18</span><=
o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 release of 4/27/18</span>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Tracking Metrics:</span><o:p></o:p>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color=
:black">WDD 2673 (last week 2663)</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span style=
=3D"font-family:Consolas;color:black">(</span><a href=3D"https://wiki.yocto=
project.org/charts/combo.html"><span style=3D"font-family:&quot;Arial&quot;=
,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html<=
/span></a><span style=3D"font-family:Consolas;color:black">)</span><o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key Status Links for YP:</span><o:p=
></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.5_Status"><span style=3D"font-family:Cons=
olas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_S=
tatus</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Schedule"><span style=3D"font-family:Consolas;co=
lor:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></=
a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Features"><span style=3D"font-family:Consolas;co=
lor:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features</span></=
a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">The Status reports are now stored o=
n the wiki at:
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span s=
tyle=3D"font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wik=
i.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">[If anyone has suggestions for othe=
r information you=92d like to see on this weekly status update, let us know=
!]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Robin Jordan<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Yocto Project Progr=
am Manager<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_CY4PR11MB17661ABB8C5DB31815FA8987C7D30CY4PR11MB1766namp_--
