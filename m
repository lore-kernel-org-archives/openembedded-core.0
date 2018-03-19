Return-Path: <robin.l.jordan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 09B01782A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:45:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 08:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208,217";a="36268382"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 08:45:32 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 19 Mar 2018 08:45:31 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
	ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 19 Mar 2018 08:45:31 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (207.46.163.47)
	by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 19 Mar 2018 08:45:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IbygqPA58+oPPsWvYOwTs6n+QaXq7fwPXtiP9BQPXL8=;
	b=YCmceMpYvoY7eBKG0/CSk3eHrfTxPxXUlnW7Yi8gr1gfuSQJWqXNk57VV3wncmDFVM7NAwU+CTd/NoetO5yOUFXgenOF06iK7PWLJlHVDBHZ431CHlW1SkSpLyCO8aUoBCyfpJaSYOv5sYVzK7oAUAR/lC6QnWFzFw0pQEHx7DI=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1287.namprd11.prod.outlook.com (10.173.16.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Mon, 19 Mar 2018 15:45:27 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::9cb9:2d8f:7d35:a2a6]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::9cb9:2d8f:7d35:a2a6%13]) with mapi id 15.20.0588.017;
	Mon, 19 Mar 2018 15:45:27 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW12=9218?=
Thread-Index: AdO/mS1UJWK2njsLQLGLS8kVix+4sA==
Importance: high
X-Priority: 1
Date: Mon, 19 Mar 2018 15:45:27 +0000
Message-ID: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
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
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1287;
	7:Z6X8yGxYv7S6FKBOeCpxaPIvaw7EGRXf21/SwtDRzezykcaYvcK+71qe8R6fnb+JeoK9g1d8cHkCbm9iBbMCcr13z4OmbN0P0KcoUG6HXj1Mjf4z3wHZBgztf5e5zBUAPSpNA2LnLHWK5tQApzTItUTzsiEXYxbmBA7QVtxbE1eZOc4NlaNmtUOzKxUAMDr+3Xm6wRK/DXOOe17PjDkgH+VR0YUW99x2s1KnTUNldwIb6yYk2TvwJm9Z2u41kJWo
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b3954d04-11bd-4126-6581-08d58db06ff8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1287; 
x-ms-traffictypediagnostic: CY4PR11MB1287:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB12874109008A13DB724E19AFC7D40@CY4PR11MB1287.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231221)(944501244)(52105095)(10201501046)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR11MB1287; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1287; 
x-forefront-prvs: 06167FAD59
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(39380400002)(366004)(396003)(39840400004)(189003)(199004)(25786009)(966005)(2900100001)(105586002)(26005)(186003)(478600001)(7736002)(33656002)(14454004)(606006)(66066001)(102836004)(2501003)(316002)(54896002)(9686003)(236005)(99286004)(6306002)(55016002)(86362001)(3660700001)(53936002)(81686011)(790700001)(5660300001)(68736007)(97736004)(81156014)(81166006)(7696005)(8936002)(106356001)(74316002)(110136005)(2906002)(6116002)(6506007)(59450400001)(6436002)(3280700002)(3846002)(5250100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1287;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-microsoft-antispam-message-info: iL0U3Ig+n15x+ydSUbY2j5MnjTdEzv6H/d57xiqk8TWCio9ozsJwZTj6zVveQ3pAh8wy53Yf4hXnaYAqJWSuXBJg/fBS2TQ9pS658e8X0FddATkh/ED1Og4kv72JE1VS6l3qgWsviWxiuvIEqRn2djl0cii3VE6NHVNC8gFRuGgDMvqO9TSVJn5AodzY+o9Lkp/vuNiiDoFVk+ip0fQh1N7VG6PzPflJKrWmRsduqv8OHJ0SzZ3zBgwUEAWo+5g2XsbjkJm4VqpVWyidXrCTsBJF4HJnldvEaK+UdbQdrDPneNK8aA5CfVohf4B2E18wg81yqMhnRJHt6Es3cory4g==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3954d04-11bd-4126-6581-08d58db06ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2018 15:45:27.4634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1287
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMuKAmTE4?=
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
X-List-Received-Date: Mon, 19 Mar 2018 15:45:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB17663B664B1ED6ADE96BC48AC7D40CY4PR11MB1766namp_"

--_000_CY4PR11MB17663B664B1ED6ADE96BC48AC7D40CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M3 final close out.

Next Deadline: YP 2.5 M3 cut off was 2/19/18

*** FEATURE FREEZE for 2.5 has passed ***


SWAT lead is currently Ross.

SWAT team rotation: Armin -> Ross on March 23, 2018

SWAT team rotation: Ross -> Juro on March 30, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   YP 2.4.2 was released: https://lists.yoctoproject.org/pipermail/yocto=
/2018-March/040282.html
  *   Meta-intel 8.1 was released: https://lists.yoctoproject.org/pipermail=
/meta-intel/2018-March/005261.html
  *   We=92ve realised we were going to run into problems with distros adop=
ting glibc 2.27, if not now, during the next release cycle. We therefore de=
cided to head off this problem and try and fix the issues now. Unfortunatel=
y, due to locale changes in 2.27, it also breaks our eSDK in the current an=
d all previous releases. We have fixes in master for this (thanks Ross!) an=
d backports ready for rocko and pyro in the -next branches. Morty is provin=
g harder to fix. We believe it is likely better to fix these issue even if =
the changes are invasive (they are at least mostly contained to the SDKs).

  *   The gcc 6.x changes were merged into rocko/pyro/morty which means poi=
nt releases are now unblocked by that issue.
  *   The performance issue reported last week was tracked down to a kernel=
 change which was reverted.
  *   The new buildbot autobuilder instance is working with basic functiona=
lity. We therefore plan to run the M3 release build on that infrastructure =
with a view to using it for the main 2.5 release. It was great to be able t=
o report an issue upstream and be using their latest code! The autobuilder =
functionality is improved in at least two significant ways already which be=
nefit the maintainers.
  *   We really do need to roll M3 now, our current plan is to test the fin=
al changes in mut and then run M3 with this. It is not a perfect set of fea=
tures, many things simply haven=92t made it in as the people doing review a=
re overloaded. We=92re too far past the freeze deadline to realistically ma=
ke any further progress with this though.
  *   ELC was productive and there was a lot of good discussion between the=
 people there about many different things. In particular we have some ideas=
 for improving the project=92s build infrastructure to allow more builds in=
cluding other layers. More info will follow as we build the plans to make t=
hat happen.


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built after 2.5 M3

YP 2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27 issue is fi=
xed

YP 2.4.3 (Rocko) is planned for post YP 2.5.


Key YP 2.5 Dates are:

YP 2.5 M3 is in feature freeze.  See status above.

YP 2.5 M3 was scheduled for release 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2673 (last week 2673)

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


--_000_CY4PR11MB17663B664B1ED6ADE96BC48AC7D40CY4PR11MB1766namp_
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
	{mso-list-id:17434137;
	mso-list-template-ids:402580926;}
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
	{mso-list-id:768934452;
	mso-list-template-ids:1928618722;}
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
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently Ross.</span>=
<o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Armin -&gt; Ros=
s on March 23, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Ross -&gt; Juro=
 on March 30, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.4.2 was relea=
sed: <a href=3D"https://lists.yoctoproject.org/pipermail/yocto/2018-March/0=
40282.html">
<span style=3D"color:#1155CC">https://lists.yoctoproject.org/pipermail/yoct=
o/2018-March/040282.html</span></a>
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-botto=
m:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline=
">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Meta-intel 8.1 was=
 released: <a href=3D"https://lists.yoctoproject.org/pipermail/meta-intel/2=
018-March/005261.html">
<span style=3D"color:#1155CC">https://lists.yoctoproject.org/pipermail/meta=
-intel/2018-March/005261.html</span></a>
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-botto=
m:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline=
">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We=92ve realised w=
e were going to run into problems with distros adopting glibc 2.27, if not =
now, during the next release cycle. We therefore decided to head off this p=
roblem and try and fix the issues now. Unfortunately,
 due to locale changes in 2.27, it also breaks our eSDK in the current and =
all previous releases. We have fixes in master for this (thanks Ross!) and =
backports ready for rocko and pyro in the -next branches. Morty is proving =
harder to fix. We believe it is
 likely better to fix these issue even if the changes are invasive (they ar=
e at least mostly contained to the SDKs).<o:p></o:p></span></li></ul>
<ul style=3D"margin-top:0in" type=3D"disc">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The gcc 6.x change=
s were merged into rocko/pyro/morty which means point releases are now unbl=
ocked by that issue.<o:p></o:p></span></li><li style=3D"color:black;margin-=
top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;ver=
tical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The performance is=
sue reported last week was tracked down to a kernel change which was revert=
ed.<o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bo=
ttom:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-align:basel=
ine">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The new buildbot a=
utobuilder instance is working with basic functionality. We therefore plan =
to run the M3 release build on that infrastructure with a view to using it =
for the main 2.5 release. It was great to be
 able to report an issue upstream and be using their latest code! The autob=
uilder functionality is improved in at least two significant ways already w=
hich benefit the maintainers.<o:p></o:p></span></li><li style=3D"color:blac=
k;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level1=
 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We really do need =
to roll M3 now, our current plan is to test the final changes in mut and th=
en run M3 with this. It is not a perfect set of features, many things simpl=
y haven=92t made it in as the people doing review
 are overloaded. We=92re too far past the freeze deadline to realistically =
make any further progress with this though.<o:p></o:p></span></li><li style=
=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-=
list:l1 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">ELC was productive=
 and there was a lot of good discussion between the people there about many=
 different things. In particular we have some ideas for improving the proje=
ct=92s build infrastructure to allow more builds
 including other layers. More info will follow as we build the plans to mak=
e that happen.<o:p></o:p></span></li></ul>
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
:black">WDD 2673 (last week 2673)</span><o:p></o:p></p>
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
!]<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Robin Jordan<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Yocto Project Program Manager</span=
><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_CY4PR11MB17663B664B1ED6ADE96BC48AC7D40CY4PR11MB1766namp_--
