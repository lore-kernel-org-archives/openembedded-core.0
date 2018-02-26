Return-Path: <robin.l.jordan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3515078434
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 16:13:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 08:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208,217";a="32923064"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2018 08:13:09 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 26 Feb 2018 08:13:09 -0800
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
	FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 26 Feb 2018 08:13:08 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (207.46.163.83)
	by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 26 Feb 2018 08:13:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XjMfAUIf1w7aYA5+iysx41wlz9ty//pSsUkNqZus4ic=;
	b=auAI2OzSBL0IGDSqA3XWV5RU916YIyuOgcf7lndB2cU16QEjzVau955b1aSovHxzcCd1tAXaCgcZMK+XMq2R9Ouc6tqj19rUCiYODCTBaH4WqqI0JDEEeiqSCl6XDm6lQ+ZBqIBcVEmp8KRmQLIBI0KqwhIL0OZdc61qpN/Ux74=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1558.namprd11.prod.outlook.com (10.172.70.137) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.527.15; Mon, 26 Feb 2018 16:13:05 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::d5aa:f45c:2a01:3524]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::d5aa:f45c:2a01:3524%18]) with mapi id 15.20.0527.021;
	Mon, 26 Feb 2018 16:13:05 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW09=9218?=
Thread-Index: AdOvHIe9U1xdEPVfQLqa0mtv8Q/8sg==
Importance: high
X-Priority: 1
Date: Mon, 26 Feb 2018 16:13:05 +0000
Message-ID: <CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [134.134.136.219]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1558;
	7:z5Ig7zFbi2vG07mbR34HYcizTi5hOM4EkTabADvhjv5WEjauXQCHT/P3XgDHtUK9/cdIe/M0lVVxroigy1wJtckUO2kPHOSL2PJZvgpLxP4wJlFYq0PIL9QFY9pS0lg1nIbHNjRpScn4q7NFv8cDr8NfLRGviZ8g1k3tUZDoVaU5prIKg+Qz3B7VxUst5V3S7Gz6pm3x++5xoVoIkXxFHsh9dsIFMM0BMeBfanjjEwSiB3Dn1RCpkLnxrdpMAsO7
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 5666b5af-9686-4d8f-fe81-08d57d33d190
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR11MB1558; 
x-ms-traffictypediagnostic: CY4PR11MB1558:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB15589622317A006C94B187E7C7C10@CY4PR11MB1558.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501161)(52105095)(93006095)(93001095)(10201501046)(6041288)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR11MB1558; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1558; 
x-forefront-prvs: 05954A7C45
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39840400004)(366004)(376002)(346002)(39380400002)(189003)(199004)(966005)(81686011)(74316002)(86362001)(6506007)(81166006)(7736002)(81156014)(2501003)(25786009)(68736007)(97736004)(790700001)(3846002)(6116002)(606006)(478600001)(33656002)(3660700001)(3280700002)(2906002)(8936002)(2900100001)(105586002)(110136005)(7696005)(66066001)(55016002)(54896002)(6306002)(9686003)(236005)(316002)(106356001)(14454004)(5250100002)(186003)(26005)(102836004)(53936002)(59450400001)(5660300001)(99286004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1558;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-microsoft-antispam-message-info: cCbJA7oWT7R2p88ZSi0rFPKDM7a9vo0Inqe0uZZKLwmj0LtLUtLegwh+h2OdbPK7SVd+SmlyFWV87vJe14ep4QTf3n57FaZlrsWq94e5Vw0bR6NBLGpOgvarXHJ9PJV1XJkbUGyW9Cnsp62Ztn28+R00kwe4UHcG9U3t64yXxTA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5666b5af-9686-4d8f-fe81-08d57d33d190
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2018 16:13:05.2256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1558
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cwOeKAmTE4?=
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
X-List-Received-Date: Mon, 26 Feb 2018 16:13:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB1766EFA2B012B4750100AD09C7C10CY4PR11MB1766namp_"

--_000_CY4PR11MB1766EFA2B012B4750100AD09C7C10CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M3 development

Next Deadline: YP 2.5 M3 cut off was 2/19/18

*** FEATURE FREEZE for 2.5 has passed ***


SWAT team rotation: Stephano -> Maxin John on Feb. 23, 2018

SWAT team rotation: Maxin -> Rebecca on March 2, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   YP 2.5 M2 is through QA and likely to be released early this week.
  *   YP 2.2.3 is through QA and likely to be released early this week.
  *   YP 2.4.2 rc2 was successfully built and is undergoing QA.
  *   YP 2.5 M3 is feature freeze. After discussions with various people we=
 concluded that we need:
     *   the 2.27 glibc upgrade
     *   kernel-devsrc size changes
     *   to resolve some of the outstanding pseudo bugs
     *   to resolve the multilib SDK patch series
     *   the package feed filtering patch series (the multilib SDK series d=
epends on it)
     *   image EFI configuration rework
  *   We plan to defer:
     *   pkg-conf vs. pkgconfig issues/discussion
     *   profile guided optimisation for python (patch series)
     *   oe-selftest parallelization
  *   We=92re continuing to work on the autobuilder changes and for various=
 reasons (inc. changes in people).  We would be in much better shape to swi=
tch to the new codebase before release, rather than waiting until early 2.6=
 to pick this work up again by which time we=92d have lost people and conte=
xt. If we are to switch, we need to build M3 with the new infrastructure. W=
e=92ll have to make a decision on whether we do this during this week.


Planned upcoming dot releases:

YP 2.4.2 (Rocko) is currently in QA 82% complete.   See: https://wiki.yocto=
project.org/wiki/2.4_QA_Status

YP 2.3.4 (Pyro) will be built when we figure out gcc backports.

YP 2.2.3 (Morty) rc2 has passed QA and is being prepared for release

YP 2.2.4 (Morty) will be built when we figure out gcc backports.


Key YP 2.5 Dates are:

YP 2.5 M2 has passed QA and is being prepared for release.

YP 2.5 M3 is in feature freeze.  See status above.

YP 2.5 M3 release of 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2646 (last week   2648)

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

--_000_CY4PR11MB1766EFA2B012B4750100AD09C7C10CY4PR11MB1766namp_
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
	{mso-list-id:345790794;
	mso-list-template-ids:-1907583470;}
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
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 M3 dev=
elopment</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M3 cut off wa=
s 2/19/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">*** FEATURE FREEZE for 2.5 has pass=
ed ***</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Maxin John on Feb. 23, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Maxin -&gt; Reb=
ecca on March 2, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.5 M2 is throu=
gh QA and likely to be released early this week.<o:p></o:p></span></li><li =
style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt=
;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.2.3 is throug=
h QA and likely to be released early this week.<o:p></o:p></span></li><li s=
tyle=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;=
mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.4.2 rc2 was s=
uccessfully built and is undergoing QA.<o:p></o:p></span></li><li style=3D"=
color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list=
:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.5 M3 is featu=
re freeze. After discussions with various people we concluded that we need:=
<o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l0 level2 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">the 2.27 glibc upg=
rade<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-b=
ottom:0in;margin-bottom:.0001pt;mso-list:l0 level2 lfo1;vertical-align:base=
line">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">kernel-devsrc size=
 changes<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;marg=
in-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level2 lfo1;vertical-align:=
baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">to resolve some of=
 the outstanding pseudo bugs<o:p></o:p></span></li><li style=3D"color:black=
;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level2 =
lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">to resolve the mul=
tilib SDK patch series<o:p></o:p></span></li><li style=3D"color:black;margi=
n-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level2 lfo1;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">the package feed f=
iltering patch series (the multilib SDK series depends on it)<o:p></o:p></s=
pan></li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-b=
ottom:.0001pt;mso-list:l0 level2 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">image EFI configur=
ation rework<o:p></o:p></span></li></ul>
</li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-botto=
m:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We plan to defer:<=
o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l0 level2 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">pkg-conf vs. pkgco=
nfig issues/discussion<o:p></o:p></span></li><li style=3D"color:black;margi=
n-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level2 lfo1;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">profile guided opt=
imisation for python (patch series)<o:p></o:p></span></li><li style=3D"colo=
r:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 =
level2 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">oe-selftest parall=
elization<o:p></o:p></span></li></ul>
</li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-botto=
m:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We=92re continuing=
 to work on the autobuilder changes and for various reasons (inc. changes i=
n people). &nbsp;We would be in much better shape to switch to the new code=
base before release, rather than waiting until early
 2.6 to pick this work up again by which time we=92d have lost people and c=
ontext. If we are to switch, we need to build M3 with the new infrastructur=
e. We=92ll have to make a decision on whether we do this during this week.<=
o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Planned upcoming dot releases:</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.4.2 (Rocko) is currently in QA=
 82% complete. &nbsp;&nbsp;See:
</span><a href=3D"https://wiki.yoctoproject.org/wiki/2.4_QA_Status"><span s=
tyle=3D"font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wik=
i.yoctoproject.org/wiki/2.4_QA_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.3.4 (Pyro) will be built when =
we figure out gcc backports.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.3 (Morty) rc2 has passed QA =
and is being prepared for release</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.4 (Morty) will be built when=
 we figure out gcc backports.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates are:</span><o:p></=
o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M2 has passed QA and is bein=
g prepared for release.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 is in feature freeze. &nb=
sp;See status above.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 release of 3/2/18</span><=
o:p></o:p></p>
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
:black">WDD 2646 (last week &nbsp;&nbsp;2648)</span><o:p></o:p></p>
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
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Robin Jordan<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Yocto Project Progr=
am Manager<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_CY4PR11MB1766EFA2B012B4750100AD09C7C10CY4PR11MB1766namp_--
