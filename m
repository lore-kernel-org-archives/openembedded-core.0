Return-Path: <robin.l.jordan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00109749A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:13:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 08:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208,217";a="35710964"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2018 08:13:49 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 9 Apr 2018 08:13:49 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 9 Apr 2018 08:13:48 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (216.32.181.184)
	by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 9 Apr 2018 08:13:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dpov9rMXhedcyEmpijdmVsoiAYtw76gZ0DgFnGckyEA=;
	b=dJXNWUgLsWBA92VIKJrhgJHTvBy9fjQcn/43dsQ4dXOeYoJ/JEq7OhUVmCINOV4FxCIRTH8vo0CYMC4O7WlwlGz7Cz0GZK97Rz6IUC/Kb+bsgNv12zqUenmSeU4Du3CUe6Wx3OlrfAzA6d3SPJJqVAxRDqj14JU/h/rgmwtAnZA=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1382.namprd11.prod.outlook.com (10.173.17.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.653.12; Mon, 9 Apr 2018 15:13:46 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651%16]) with mapi id 15.20.0653.015;
	Mon, 9 Apr 2018 15:13:46 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW15=9218?=
Thread-Index: AdPQFUZr/VNj0TvDSHafjZ+UgBuWVQ==
Importance: high
X-Priority: 1
Date: Mon, 9 Apr 2018 15:13:45 +0000
Message-ID: <CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [108.171.135.184]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1382;
	7:Ct9v4GItzKt38oGqqieys3ZMdvdkf7TfFrd7TUnf1vvX94Dcx8nVcRUM5IuGgMmx4JT8qUmA6PxbEH4BZw+vo1CHCXdX/UWjFLFdYn/gOeh3cxPi9BS2vQt9mVbavwGPPAcs2qj7k15JrzRCTX5HBT00vM1kLuJmcrqUUsMh3sVoncFuLK5JOZOnbVnBU3BDQuoAvAgSXlWAH9+4jydRinidod1ZbE2JffbsoiJ7Tirt9v6BzPUTjxOFaoCZJJyS
x-ms-exchange-antispam-srfa-diagnostics: SOS;
X-MS-Office365-Filtering-Correlation-Id: cff9467e-1483-445f-426a-08d59e2c7d63
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1382; 
x-ms-traffictypediagnostic: CY4PR11MB1382:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB138201C32B46C36E4ED038BFC7BF0@CY4PR11MB1382.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231221)(944501327)(52105095)(10201501046)(3002001)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR11MB1382; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1382; 
x-forefront-prvs: 0637FCE711
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(376002)(366004)(346002)(39850400004)(199004)(189003)(54164003)(478600001)(2906002)(966005)(102836004)(106356001)(3660700001)(3280700002)(3846002)(68736007)(6116002)(790700001)(25786009)(486006)(99286004)(26005)(316002)(86362001)(81166006)(8936002)(81156014)(74316002)(7736002)(5660300001)(186003)(105586002)(7696005)(33656002)(97736004)(59450400001)(606006)(5250100002)(14454004)(2501003)(2900100001)(6436002)(53936002)(9686003)(110136005)(6306002)(6506007)(81686011)(55016002)(476003)(236005)(54896002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1382;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: +4Asiw/tAP45a6Yp5W9NETc5S5rvbpoXDshvJ7b1C29I3RCXSJhHhkEeXa+U0ZJkW5yrwZFo2ObqHSY5C9QedL4RO9SS70K98v7PaBBVNeH+NEWPEw6QSB7Tv5VJgE3zMUTowLwk/KnF98iJWNkcc+zg0nycSl3QrB9M0VfkAVsmDpEcZmP8LQeaF1vsg9+OYx37R9MOOVbOq1JfTbnQ8D84qv4aNEzOPioj+l+7VW9C8OA/ozwVr4ArUCfTnBPeMNrHqeBNenyMV9l3jn90zi5QWFDUWvb1vVk781saUoe6GcRWx6+Yg+Ixk0kPHoGhd2tS5spyvUsOsvdvQOLGT/XPE3V5noza6yaD346R1h6pR70M6sHrNDMyuEffi0zaGQE/jvG/o1WRIBeH2yRphgp74UgitHFM+CPYoyYP7zg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cff9467e-1483-445f-426a-08d59e2c7d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2018 15:13:45.9387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1382
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxNeKAmTE4?=
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
X-List-Received-Date: Mon, 09 Apr 2018 15:13:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB1766CC383F4489AF64684EEFC7BF0CY4PR11MB1766namp_"

--_000_CY4PR11MB1766CC383F4489AF64684EEFC7BF0CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M4 final close out.

Next Deadline: YP 2.5 M4 release is 4/27/18


SWAT Team Rotation:

SWAT lead is currently: Paul.

SWAT team rotation: Paul -> Tracy on April 13, 2018

SWAT team rotation: Tracy -> Stephano on April 20, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   The M3 rc1 QA report has been completed: https://wiki.yoctoproject.or=
g/wiki/WW15_-_2018-04-09-_Full_Test_Cycle_-_2.5_M3_rc1   There are a number=
 of selftest failures and a known SRCREV related issue with the build-appli=
ance. We will look into these, but at this point we don=92t foresee these b=
locking M3 and will aim to start testing release candidates for the final 2=
.5 release this week.
  *   A problem was spotted with fedora28 which has worryingly decided to m=
erge extra patches ahead of glibc and =93break=94 ABI over the split of lib=
crypt out of glibc into libxcrypt. Since we will have to handle this, we ha=
ve decided to change nativesdk-glibc for the 2.5 release but keep on target=
 as is until the situation with upstream glibc becomes clearer.
  *   We realised late in the cycle that we needed to change the LAYERSERIE=
S_COMPAT variable in the core layers. We have also added warnings to make t=
his variable more obvious and required it for Yocto Project Compatible v2 s=
tatus. It seemed best to make these changes for 2.5 rather than wait until =
2.6.
  *   We are considering a final late change to 2.5 to allow poky to use th=
e Yocto Project sstate mirrors by default. Feedback welcome on whether we s=
hould do this. It is late in the cycle but would make a good speedup for us=
ers potentially.
  *   Armin fixed the SDK locale issues with morty, thanks! We are aware of=
 a related locale  build regression on morty sadly.
  *   We were able to upgrade pseudo and have hopefully resolved our fedora=
27/coreutils issues. Thanks to all who helped!
  *   Master-next has a number of recipe upgrades queued. We still want to =
discourage people from sending recipe upgrades until we start 2.6; however,=
 there were simply too many patches to ignore. This has meant various peopl=
e and build resources have ended up distracted from 2.5 work.


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built after 2.5 M3

YP 2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27 issue is fi=
xed

YP 2.4.3 (Rocko) is planned for post YP 2.5.


Key YP 2.5 Dates are:

YP 2.5 M3 is in QA.  See status above.

YP 2.5 M3 was scheduled for release 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2570 (last week 2594)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


--_000_CY4PR11MB1766CC383F4489AF64684EEFC7BF0CY4PR11MB1766namp_
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
	{mso-list-id:2132243880;
	mso-list-template-ids:-485213662;}
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
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 M4 fin=
al close out.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M4 release is=
 4/27/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT Team Rotation:</span><o:p></o:=
p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently: Paul.</span=
><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Paul -&gt; Trac=
y on April 13, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Tracy -&gt; Ste=
phano on April 20, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The M3 rc1 QA repo=
rt has been completed:
<a href=3D"https://wiki.yoctoproject.org/wiki/WW15_-_2018-04-09-_Full_Test_=
Cycle_-_2.5_M3_rc1">
<span style=3D"color:#1155CC">https://wiki.yoctoproject.org/wiki/WW15_-_201=
8-04-09-_Full_Test_Cycle_-_2.5_M3_rc1</span></a> &nbsp;&nbsp;There are a nu=
mber of selftest failures and a known SRCREV related issue with the build-a=
ppliance. We will look into these, but at this
 point we don=92t foresee these blocking M3 and will aim to start testing r=
elease candidates for the final 2.5 release this week. &nbsp;<o:p></o:p></s=
pan></li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-b=
ottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">A problem was spot=
ted with fedora28 which has worryingly decided to merge extra patches ahead=
 of glibc and =93break=94 ABI over the split of libcrypt out of glibc into =
libxcrypt. Since we will have to handle this, we
 have decided to change nativesdk-glibc for the 2.5 release but keep on tar=
get as is until the situation with upstream glibc becomes clearer.<o:p></o:=
p></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;mar=
gin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We realised late i=
n the cycle that we needed to change the LAYERSERIES_COMPAT variable in the=
 core layers. We have also added warnings to make this variable more obviou=
s and required it for Yocto Project Compatible
 v2 status. It seemed best to make these changes for 2.5 rather than wait u=
ntil 2.6.<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;mar=
gin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align=
:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We are considering=
 a final late change to 2.5 to allow poky to use the Yocto Project sstate m=
irrors by default. Feedback welcome on whether we should do this. It is lat=
e in the cycle but would make a good speedup
 for users potentially.<o:p></o:p></span></li><li style=3D"color:black;marg=
in-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;=
vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Armin fixed the SD=
K locale issues with morty, thanks! We are aware of a related locale &nbsp;=
build regression on morty sadly.<o:p></o:p></span></li><li style=3D"color:b=
lack;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 lev=
el1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We were able to up=
grade pseudo and have hopefully resolved our fedora27/coreutils issues. Tha=
nks to all who helped!<o:p></o:p></span></li><li style=3D"color:black;margi=
n-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;v=
ertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Master-next has a =
number of recipe upgrades queued. We still want to discourage people from s=
ending recipe upgrades until we start 2.6; however, there were simply too m=
any patches to ignore. This has meant various
 people and build resources have ended up distracted from 2.5 work.<o:p></o=
:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Planned upcoming dot releases:</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.3.4 (Pyro) will be built after=
 2.5 M3</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.4 (Morty) will be built afte=
r 2.5 M3 once the glibc 2.27 issue is fixed</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.4.3 (Rocko) is planned for pos=
t YP 2.5.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates are:</span><o:p></=
o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 is in QA. &nbsp;See statu=
s above.</span><o:p></o:p></p>
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
:black">WDD 2570 (last week 2594)</span><o:p></o:p></p>
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
</div>
</body>
</html>

--_000_CY4PR11MB1766CC383F4489AF64684EEFC7BF0CY4PR11MB1766namp_--
