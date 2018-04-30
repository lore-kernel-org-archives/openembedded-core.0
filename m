Return-Path: <robin.l.jordan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4990E60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:57:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2018 07:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,346,1520924400"; 
	d="scan'208,217";a="220487829"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga005.jf.intel.com with ESMTP; 30 Apr 2018 07:57:12 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 30 Apr 2018 07:57:12 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (207.46.163.118)
	by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 30 Apr 2018 07:57:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=F1AhU61l2Ptf9vLnOWX6Ouxbw/OpxNSZQen1QmE0wIk=;
	b=DplHkN7cTu6BFp62MNFRIMg2k/V6P1lnUNIvjYln7ar0MXvPbehnxEWHYXDiLMHajoDyNW9l2YFDsIcq/WQJthRcVYvMHCSY+qvVV5JfulJM7TghNB3LinIkdeLBTv0LXJeyPYsHnmYb1gk9ht/wGO6leqXIIuaQjTVC088TSPQ=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1719.namprd11.prod.outlook.com (10.173.16.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.696.15; Mon, 30 Apr 2018 14:57:08 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651%16]) with mapi id 15.20.0696.023;
	Mon, 30 Apr 2018 14:57:08 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW18=9218?=
Thread-Index: AdPgk3Utk6swKFmqQreT4g88bTjsPw==
Importance: high
X-Priority: 1
Date: Mon, 30 Apr 2018 14:57:07 +0000
Message-ID: <CY4PR11MB17663072FF2A272554D43D62C7820@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [192.55.52.196]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1719;
	7:aD8MVis3ClVADN38EGiTAEnv+PAgEp+LSgMSRToHXtL5yDJNYi25Q0Zicu2x9HT2zZd4YlVS1B2MgpmNqM9gimM3LyKJxfDPG05F3mnGrY7BzJNp+ZHFYyR7E7twQt7D+QNWC+lH7SnKYD6Tx249k73zmhNcnNRPDG8lzsEqXOOWiNkdEDrIUxXGo9aqFW9e+PbfKIpGAgAdoZLY/mfYMF79vRq6CQak5ykrIFW4apsq864ESwlKmkcw/BjKprRs
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1719; 
x-ms-traffictypediagnostic: CY4PR11MB1719:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB17192AFC7328D77F6E7B1F92C7820@CY4PR11MB1719.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(264703809997249)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR11MB1719; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1719; 
x-forefront-prvs: 0658BAF71F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(39840400004)(366004)(376002)(346002)(199004)(189003)(5250100002)(8936002)(66066001)(316002)(476003)(105586002)(2501003)(21615005)(33656002)(3280700002)(2906002)(97736004)(110136005)(68736007)(106356001)(186003)(2900100001)(606006)(486006)(81166006)(86362001)(53936002)(3846002)(26005)(790700001)(5660300001)(3660700001)(54896002)(55016002)(102836004)(81686011)(6116002)(99286004)(6506007)(14454004)(7736002)(81156014)(25786009)(966005)(59450400001)(236005)(478600001)(6306002)(74316002)(9686003)(6436002)(7696005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1719;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 6ltKHNoYiBsi4V84L1njBgthxpEmWFChPrKKJWwG8hHls+TmVuyY84xkcQmYVUCglDoOBhk0x9ctG6ttqZSKBKX3um6jQAfHV6fiQxujOGEv4nWnCh4d5yGCa1VqwypFgZrcS4UqBJBm/cwfnHHRf1r3tlYRJ8tGZpyii5bL39rxkrW3+qWySlVXe1e+/OG2
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: dd30fa3e-911e-4ba5-6732-08d5aeaaa527
X-MS-Exchange-CrossTenant-Network-Message-Id: dd30fa3e-911e-4ba5-6732-08d5aeaaa527
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2018 14:57:07.9883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1719
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxOOKAmTE4?=
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
X-List-Received-Date: Mon, 30 Apr 2018 14:57:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB17663072FF2A272554D43D62C7820CY4PR11MB1766namp_"

--_000_CY4PR11MB17663072FF2A272554D43D62C7820CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 is in QA.

Next Deadline: YP 2.5 M4 release is 4/27/18


SWAT Team Rotation:

SWAT lead is currently: Stephano

SWAT team rotation: Stephano -> Stephano on May 4, 2018

SWAT team rotation: Stephano -> Maxin on May 11, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   2.5 rc1 is in QA
  *   As things stand we are aware of some minor issues in rc1 such as the =
bitbake version not having been updated and a fix for the eclipse plugin be=
ing missing. A workaround is available for the latter. We will let QA run i=
ts course before deciding on whether an rc2 makes sense.
  *   The monthly technical call is tomorrow (1st May) and will focus on 2.=
6 planning discussion (https://www.yoctoproject.org/monthly-technical-call/=
). The email linked to below details the planning process we will be follow=
ing along with some of the possible ideas for 2.6: http://lists.openembedde=
d.org/pipermail/openembedded-core/2018-April/150040.html


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built after 2.5

YP 2.2.4 (Morty) will be built after 2.5

YP 2.4.3 (Rocko) is planned for post YP 2.5


Key YP 2.5 Dates are:

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

  *   WDD 2508 (last week 2486) (https://wiki.yoctoproject.org/charts/combo=
.html)
  *   Patches
     *   Same as last week as nothing has merged.
     *   Total patches found: 1635
     *   Percentage of patches in the Pending State: 46%


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


--_000_CY4PR11MB17663072FF2A272554D43D62C7820CY4PR11MB1766namp_
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
	{mso-list-id:537935244;
	mso-list-template-ids:-1544659874;}
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
	{mso-list-id:2131119498;
	mso-list-template-ids:-1157737520;}
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
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 is in =
QA.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M4 release is=
 4/27/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT Team Rotation:</span><o:p></o:=
p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently: Stephano</s=
pan><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Stephano on May 4, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Maxin&nbsp;on May 11, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">2.5 rc1 is in QA<o=
:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:=
0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">As things stand we=
 are aware of some minor issues in rc1 such as the bitbake version not havi=
ng been updated and a fix for the eclipse plugin being missing. A workaroun=
d is available for the latter. We will let QA
 run its course before deciding on whether an rc2 makes sense.<o:p></o:p></=
span></li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-=
bottom:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The monthly techni=
cal call is tomorrow (1st May) and will focus on 2.6 planning discussion (<=
a href=3D"https://www.yoctoproject.org/monthly-technical-call/"><span style=
=3D"color:#1155CC">https://www.yoctoproject.org/monthly-technical-call/</sp=
an></a>).
 The email linked to below details the planning process we will be followin=
g along with some of the possible ideas for 2.6:
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-A=
pril/150040.html">
<span style=3D"color:#1155CC">http://lists.openembedded.org/pipermail/opene=
mbedded-core/2018-April/150040.html</span></a><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Planned upcoming dot releases:</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.3.4 (Pyro) will be built after=
 2.5</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.4 (Morty) will be built afte=
r 2.5</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.4.3 (Rocko) is planned for pos=
t YP 2.5</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates are:</span><o:p></=
o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 release of 4/27/18</span>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Tracking Metrics:</span><o:p></o:p>=
</p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l1 level1 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">WDD 2508 (last wee=
k 2486)</span><span style=3D"font-family:Consolas"> (</span><span style=3D"=
font-family:&quot;Arial&quot;,sans-serif"><a href=3D"https://wiki.yoctoproj=
ect.org/charts/combo.html"><span style=3D"color:#1155CC">https://wiki.yocto=
project.org/charts/combo.html</span></a></span><span style=3D"font-family:C=
onsolas">)</span><span style=3D"font-family:&quot;Arial&quot;,sans-serif"><=
o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bottom=
:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-align:baseline"=
>
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Patches </span><sp=
an style=3D"font-family:Consolas"><o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l1 level2 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Same as last week =
as nothing has merged. &nbsp;<o:p></o:p></span></li><li style=3D"color:blac=
k;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level2=
 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Total patches foun=
d: 1635 <o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;marg=
in-bottom:0in;margin-bottom:.0001pt;mso-list:l1 level2 lfo2;vertical-align:=
baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Percentage of patc=
hes in the Pending State: 46%</span><span style=3D"font-family:Consolas"><o=
:p></o:p></span></li></ul>
</li></ul>
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

--_000_CY4PR11MB17663072FF2A272554D43D62C7820CY4PR11MB1766namp_--
