Return-Path: <robin.l.jordan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id ED46F78A58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 16:03:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 08:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,427,1515484800"; d="scan'208,217";a="32523291"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga003.jf.intel.com with ESMTP; 05 Mar 2018 08:03:55 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 5 Mar 2018 08:03:54 -0800
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
	ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 5 Mar 2018 08:03:54 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (216.32.181.22)
	by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 5 Mar 2018 08:03:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0s+1xu9b00lEUstzJOTGE9jpkBbiARy7qZzqYi8WVMc=;
	b=hgwSszAp6zn1UGc8DLQpwNpXmZo8lwBIlte1LGOP+ILFHCurypiCzwQVE+ytj0qw9pOcNKRD1B5cpK++4Wdy6tJjbz7734bZ8CAdP7JpGSgvFCXeEmlgE/jf1351WBm8tbXqK3eNQXtiWRmQMCkTAFjWblH+f4Uacs4ekSFMW4A=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1272.namprd11.prod.outlook.com (10.173.16.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Mon, 5 Mar 2018 16:03:52 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::d5aa:f45c:2a01:3524]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::d5aa:f45c:2a01:3524%18]) with mapi id 15.20.0548.016;
	Mon, 5 Mar 2018 16:03:52 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Subject:_Yocto_Project_Status_WW10=9218?=
Thread-Index: AdO0m1TxCzeHIAAdTjK5a71/xBvDFg==
Importance: high
X-Priority: 1
Date: Mon, 5 Mar 2018 16:03:52 +0000
Message-ID: <CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com>
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
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1272;
	7:vdHq8D6GWS7WDCa2r74QYsqLat/sP2xIeprcO8EfsQgzvV8rlXyMuAMwTVap8QWZ0RghYc2ae/bB7KVBaCR5WTPyix48CLtq1d4i4NuM/aJPjpjYZwHmfCGW0D7VxWsT3UNjK7yY3qX6OBioDEhkzwRf6BwJ4v8tn/5pi/YRn3oYw24DQDYdd8mNLy1lNqcXT1wlDiHqq+0WZVE5xEF++A3eGza96M07GaVjJULmgmv6plZaKsIO1cwhCc1a4JHN
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 69a94184-7546-4682-503d-08d582b2b104
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR11MB1272; 
x-ms-traffictypediagnostic: CY4PR11MB1272:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB127215BFAC41062FEC86A6ABC7DA0@CY4PR11MB1272.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(192374486261705)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231220)(944501244)(52105095)(3002001)(6041288)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:CY4PR11MB1272; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1272; 
x-forefront-prvs: 06022AA85F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(39380400002)(199004)(189003)(105586002)(59450400001)(81156014)(6506007)(81166006)(236005)(9686003)(26005)(6306002)(55016002)(2906002)(54896002)(8936002)(66066001)(316002)(186003)(102836004)(53936002)(25786009)(6436002)(33656002)(606006)(74316002)(5250100002)(110136005)(2900100001)(68736007)(106356001)(2501003)(5660300001)(966005)(97736004)(3280700002)(81686011)(3660700001)(7696005)(99286004)(6116002)(790700001)(3846002)(478600001)(86362001)(14454004)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1272;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-microsoft-antispam-message-info: vzJtXw2QHEwCmWOoyi1qnuv1MUYxg37SQQhPADGxZxlDbkISfcvjFUTRVmwwwNROfAcwLBu38EdXdcHCKni/l78pru7zgM5svQNB46w+ULHXIMOb383DB9A+91W9ezhiw1y/0v8oX1MgYxsUc/4F3L2RoVMROTbeGLzNXNMzaZW4AOdQGew3ypGosBrQAszYJIflvGxIU7OhGjkVtyUXKD/zZd7COzu0qlabJaBV2uETlPXELWoorqdkOVRb844ROz77/Gta1t5b2es49Qi4D5OI0ZjlCU2XJPNLu+TEAwyKMBPtXvq3lvXKjHbv6tlvcKV5gcVu78xZ7s6k/65Low==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a94184-7546-4682-503d-08d582b2b104
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2018 16:03:52.7651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1272
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?U3ViamVjdDogWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMOKAmTE4?=
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
X-List-Received-Date: Mon, 05 Mar 2018 16:03:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0CY4PR11MB1766namp_"

--_000_CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Subject: Yocto Project Status WW10=9218

Current Dev Position: YP 2.5 M3 final close out.
Next Deadline: YP 2.5 M3 cut off was 2/19/18
*** FEATURE FREEZE for 2.5 has passed ***

SWAT team rotation: Rebecca -> Cal on March 9, 2018
SWAT team rotation: Cal -> Armin on March 16, 2018
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:

  *   YP 2.5 M2 was released February 27.
     *   This milestone release includes CVE fixes and 60 recipe upgrades. =
 It incorporates security fixes with upgrades to gcc and kernels to all cur=
rent stable versions.  Headline changes include reproducibility improvement=
s, gettext build performance, image generation, and cmake using Ninja by de=
fault.  This release added gobject-introspection tests to testimage, integr=
ated support for the Meson build system, Python build/packaging refactoring=
, and redesigned postinstall script handling.
  *   YP 2.2.3 was released February 27.
     *   A total of 97 CVE fixes and other fixes to work with GCC 7 on newe=
r host OSs.
     *   We have committed to a 2.2.4 release to integrate all remaining se=
curity fixes.
  *   YP 2.4.2 RC2 came out of QA today (report at https://wiki.yoctoprojec=
t.org/wiki/WW10_-_2018-03-05-_Full_Test_Cycle_-_2.4.2_rc2)

  *   YP 2.5 M3 is in final feature freeze. Reviewing last week=92s require=
d features:
     *   2.27 glibc upgrade has been merged. This meant making SDK changes =
so they=92re all ~50M larger now thanks to the need to ship locales. Howeve=
r the same underlying code could be reused to generate locale archives in i=
mages, which will make those smaller.
     *   kernel-devsrc size reduction: the blocking issue has been resolved=
 so waiting for an updated patch.
     *   pseudo upgrade has been merged which should solve many issues, and=
 Peter is investigating the long-standing host contamination issue.
     *   Still need to resolve the multilib SDK patch series.
     *   Package feed filtering has been merged.
     *   Image EFI configuration rework under review now.
  *   Performance metrics indicate that a recent merge has caused a slowdow=
n in build times.  It is suspected that the glibc upgrade is the cause of t=
his although help would be appreciated to verify this.
  *   Flood of last-minute upgrades continuing to be reviewed and merged if=
 low-impact.
  *   Go upgrade/improvements are under review, possibly we=92ll ship both =
Go 1.9.4 and 1.10 in 2.5 but do plan to drop 1.9.4 from master as soon as 1=
.10 doesn=92t present compatibility problems.
  *   We=92re continuing to work on the autobuilder changes and for various=
 reasons (inc. changes in people).  We would be in much better shape to swi=
tch to the new codebase before release, rather than waiting until early 2.6=
 to pick this work up again by which time we=92d have lost people and conte=
xt. If we are to switch, we need to build M3 with the new infrastructure. W=
e plan to make this switch for M3.

Planned upcoming dot releases:
YP 2.3.4 (Pyro) will be built when we figure out gcc backports.
YP 2.2.4 (Morty) will be built when we figure out gcc backports.
YP 2.4.3 (Roko) is planned for post YP 2.5.

Key YP 2.5 Dates are:
YP 2.5 M3 is in feature freeze.  See status above.
YP 2.5 M3 was scheduled for release 3/2/18
YP 2.5 M4 cut off of 4/2/18
YP 2.5 M4 release of 4/27/18

Tracking Metrics:
            WDD 2663 (last week 2646)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features

The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


--_000_CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0CY4PR11MB1766namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{mso-list-id:510873238;
	mso-list-template-ids:569155230;}
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
	{mso-list-id:1167525389;
	mso-list-template-ids:-1673385002;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Subject: Yocto Project Status WW10=9218</span><o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Current Dev Position: YP 2.5 M3 final close out.</span><o:=
p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Next Deadline: YP 2.5 M3 cut off was 2/19/18</span><o:p></=
o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">*** FEATURE FREEZE for 2.5 has passed ***</span><o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">SWAT team rotation: Rebecca -&gt; Cal on March 9, 2018</sp=
an><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">SWAT team rotation: Cal -&gt; Armin on March 16, 2018</spa=
n><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_=
Build_Failure_Swat_Team"><span style=3D"font-family:Consolas;color:#1155CC"=
>https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a=
><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key Status/Updates:</span><o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo1;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.5 M2 was rele=
ased February 27.<o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level2 lfo1;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">This milestone rel=
ease includes CVE fixes and 60 recipe upgrades<b>.
</b>&nbsp;It incorporates security fixes<b> </b>with upgrades to gcc and ke=
rnels to all current stable versions. &nbsp;Headline changes include reprod=
ucibility improvements, gettext build performance, image generation, and cm=
ake using Ninja by default. &nbsp;This release
 added gobject-introspection tests to testimage, integrated support for the=
 Meson build system, Python build/packaging refactoring, and redesigned pos=
tinstall script handling.<o:p></o:p></span></li></ul>
</li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo1;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2.3 was relea=
sed February 27.<o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level2 lfo1;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">A total of<b> </b>=
97 CVE fixes<b> </b>
and other fixes to work with GCC 7 on newer host OSs.<o:p></o:p></span></li=
><li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level2 lfo1;verti=
cal-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We have committed =
to a 2.2.4 release to integrate all remaining security fixes.<o:p></o:p></s=
pan></li></ul>
</li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l1 level1 lfo1;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.4.2 RC2 came =
out of QA today (report at https://wiki.yoctoproject.org/wiki/WW10_-_2018-0=
3-05-_Full_Test_Cycle_-_2.4.2_rc2)<o:p></o:p></span></li></ul>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo2;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.5 M3 is in fi=
nal feature freeze. Reviewing last week=92s required features:<o:p></o:p></=
span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level2 lfo2;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">2.27 glibc upgrade=
 has been merged. This meant making SDK changes so they=92re all ~50M large=
r now thanks to the need to ship locales. However the same underlying code =
could be reused to generate locale archives in
 images, which will make those smaller.<o:p></o:p></span></li><li class=3D"=
MsoNormal" style=3D"color:black;mso-list:l0 level2 lfo2;vertical-align:base=
line">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">kernel-devsrc size=
 reduction: the blocking issue has been resolved so waiting for an updated =
patch.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;m=
so-list:l0 level2 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">pseudo upgrade has=
 been merged which should solve many issues, and Peter is investigating the=
 long-standing host contamination issue.<o:p></o:p></span></li><li class=3D=
"MsoNormal" style=3D"color:black;mso-list:l0 level2 lfo2;vertical-align:bas=
eline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Still need to reso=
lve the multilib SDK patch series.<o:p></o:p></span></li><li class=3D"MsoNo=
rmal" style=3D"color:black;mso-list:l0 level2 lfo2;vertical-align:baseline"=
>
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Package feed filte=
ring has been merged.<o:p></o:p></span></li><li class=3D"MsoNormal" style=
=3D"color:black;mso-list:l0 level2 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Image EFI configur=
ation rework under review now.<o:p></o:p></span></li></ul>
</li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo2;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Performance metric=
s indicate that a recent merge has caused a slowdown in build times. &nbsp;=
It is suspected that the glibc upgrade is the cause of this although help w=
ould be appreciated to verify this.<o:p></o:p></span></li><li class=3D"MsoN=
ormal" style=3D"color:black;mso-list:l0 level1 lfo2;vertical-align:baseline=
">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Flood of last-minu=
te upgrades continuing to be reviewed and merged if low-impact.<o:p></o:p><=
/span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 =
lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Go upgrade/improve=
ments are under review, possibly we=92ll ship both Go 1.9.4 and 1.10 in 2.5=
 but do plan to drop 1.9.4 from master as soon as 1.10 doesn=92t present co=
mpatibility problems.<o:p></o:p></span></li><li class=3D"MsoNormal" style=
=3D"color:black;mso-list:l0 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We=92re continuing=
 to work on the autobuilder changes and for various reasons (inc. changes i=
n people). &nbsp;We would be in much better shape to switch to the new code=
base before release, rather than waiting until early
 2.6 to pick this work up again by which time we=92d have lost people and c=
ontext. If we are to switch, we need to build M3 with the new infrastructur=
e. We plan to make this switch for M3.<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Planned upcoming dot releases:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.3.4 (Pyro) will be built when we figure out gcc backp=
orts.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.2.4 (Morty) will be built when we figure out gcc back=
ports.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.4.3 (Roko) is planned for post YP 2.5.</span><o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key YP 2.5 Dates are:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.5 M3 is in feature freeze. &nbsp;See status above.</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.5 M3 was scheduled for release 3/2/18</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.5 M4 cut off of 4/2/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">YP 2.5 M4 release of 4/27/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Tracking Metrics:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; WDD 2663 (last week 2646)</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:Consolas;color:black">(</span><a href=3D"https://wiki.yoctoproject.org/ch=
arts/combo.html"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;co=
lor:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><spa=
n style=3D"font-family:Consolas;color:black">)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Key Status Links for YP:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_=
Project_v2.5_Status"><span style=3D"font-family:Consolas;color:#1155CC">htt=
ps://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status</span></a><o:p></=
o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_=
2.5_Schedule"><span style=3D"font-family:Consolas;color:#1155CC">https://wi=
ki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_=
2.5_Features"><span style=3D"font-family:Consolas;color:#1155CC">https://wi=
ki.yoctoproject.org/wiki/Yocto_2.5_Features</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">The Status reports are now stored on the wiki at:
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span s=
tyle=3D"font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wik=
i.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">[If anyone has suggestions for other information you=92d l=
ike to see on this weekly status update, let us know!]</span><o:p></o:p></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0CY4PR11MB1766namp_--
