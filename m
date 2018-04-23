Return-Path: <robin.l.jordan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C8E8D7469B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 16:00:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Apr 2018 09:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,318,1520924400"; 
	d="scan'208,217";a="222647550"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2018 09:00:48 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 23 Apr 2018 09:00:47 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
	fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 23 Apr 2018 09:00:47 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (207.46.163.18)
	by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 23 Apr 2018 09:00:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zeZJ3NN0R04Sdcjhzf/w+mInqBex68DL7lAEkTsUWrY=;
	b=ipd40n6Xu4e9STi0WwLNbozPu2z7dS8Hv07+Zhi+tAfCUEZgKRGE5JtYJUzuKtGpkwB7OcXOnbBOXOq+NCsMr8jUPV3cYV/eWk4aAZRPdb52TPYPzOhm3AVex4IgrkM71aGXFEb84frM7rIk5NrQ65qVySRFHnrcf9SPRTtzAtA=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1448.namprd11.prod.outlook.com (10.172.69.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.696.18; Mon, 23 Apr 2018 16:00:43 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651%16]) with mapi id 15.20.0696.017;
	Mon, 23 Apr 2018 16:00:43 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW17=9218?=
Thread-Index: AdPbHCL5NeJCSqupQgecLaEQtOXH7g==
Importance: high
X-Priority: 1
Date: Mon, 23 Apr 2018 16:00:43 +0000
Message-ID: <CY4PR11MB1766F5DF0F0C81891BEC0A3AC7890@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=intel.com; 
x-originating-ip: [134.134.136.204]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1448;
	7:NtCsJYWZeca3drEpiVlSe99FTLbgDppNVXyOJ55o7KFQZC1rClW447EfnVkdMnJRaMWfXgxhMWGX1DIMyM10KZNEQbOAGFmGI8BxGi6wDvsyRF51WEW5f3shHX8AvAsG2h6EQLYZmQtpVJtNM18smw/NF8mxAxfbKXJRlsqnqh0cd6taqbyxHrg6BSWVUHW3LaLxfiqyqxdWqICdg1KpFqaCpyFx5noagaEpHH5TvMAAnsn4AWopd3rkBoptMbI9
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1448; 
x-ms-traffictypediagnostic: CY4PR11MB1448:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB14485C8298B3B0636D5A8701C7890@CY4PR11MB1448.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(264703809997249)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231232)(944501410)(52105095)(10201501046)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR11MB1448; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1448; 
x-forefront-prvs: 06515DA04B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(366004)(346002)(376002)(39380400002)(81686011)(86362001)(6116002)(3846002)(790700001)(33656002)(478600001)(53936002)(606006)(55016002)(25786009)(186003)(74316002)(6306002)(54896002)(9686003)(236005)(7696005)(476003)(6436002)(21615005)(81166006)(8936002)(2900100001)(5250100002)(2501003)(66066001)(3660700001)(3280700002)(2906002)(6506007)(59450400001)(110136005)(26005)(5660300001)(966005)(316002)(7736002)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1448;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; MLV:sfv; 
x-microsoft-antispam-message-info: R92kaJBmQTBo95M/zkb7hM7boSjdl2iksUJgtSa0dHM2cm22QyWJndshoox86dmJuDpKJP/twbtw+rt3HlLPJNIF8HH+FK+rlst8jQEu7E91v9QpDaNHWm0T2NZ6cDjJFxGSb1rHV220KBHUT65ZauT2Lzop41QRppyzcZvCaF3HX12m5mV72hIRJJA4Jnzp
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8600988b-2e13-4c6b-05b7-08d5a9335e9b
X-MS-Exchange-CrossTenant-Network-Message-Id: 8600988b-2e13-4c6b-05b7-08d5a9335e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2018 16:00:43.7187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1448
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxN+KAmTE4?=
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
X-List-Received-Date: Mon, 23 Apr 2018 16:00:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB1766F5DF0F0C81891BEC0A3AC7890CY4PR11MB1766namp_"

--_000_CY4PR11MB1766F5DF0F0C81891BEC0A3AC7890CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M4 final close out.

Next Deadline: YP 2.5 M4 release is 4/27/18


SWAT Team Rotation:

SWAT lead is currently: Tracy.

SWAT team rotation: Stephano -> Maxin on April 27, 2018

SWAT team rotation: Maxin -> Rebecca on March 4, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   Several key uninative issues were identified and fixed which should m=
ean uninative is much more reliable than previously as there were some rare=
 but problematic corner cases which are now fixed.
  *   Other potentially 2.5 blocking changes such as timezone issues were f=
ixed.
  *   We have documented sstate mirror setup for poky as opt-in, not by def=
ault and will monitor the usage of this to see how sustainable it is.
  *   Assuming the current test build succeeds, 2.5 rc1 will be built today=
.
  *   An email about 2.6 planning was sent out and people are invited to th=
e next monthly technical call (https://www.yoctoproject.org/monthly-technic=
al-call/). The email details the planning process we will be following alon=
g with some of the possible ideas for 2.6. The email is: http://lists.opene=
mbedded.org/pipermail/openembedded-core/2018-April/150040.html
  *   We are now tracking patch status in the tracking metrics below. The p=
ercentage of patches with Upstream-Status should stay at 100% now with our =
monitoring. Over time we want to reduce the percentage in the =93Pending=94=
 state and the overall number of patches.


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built after 2.5

YP 2.2.4 (Morty) will be built after 2.5

YP 2.4.3 (Rocko) is planned for post YP 2.5


Key YP 2.5 Dates are:

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

  *   WDD 2486 (last week 2573) (https://wiki.yoctoproject.org/charts/combo=
.html)
  *   Patches
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


--_000_CY4PR11MB1766F5DF0F0C81891BEC0A3AC7890CY4PR11MB1766namp_
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
	{mso-list-id:184248981;
	mso-list-template-ids:1745930436;}
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
	{mso-list-id:1341352215;
	mso-list-template-ids:-373136798;}
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
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently: Tracy.</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Maxin on April 27, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Maxin -&gt; Reb=
ecca on March 4, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Several key uninat=
ive issues were identified and fixed which should mean uninative is much mo=
re reliable than previously as there were some rare but problematic corner =
cases which are now fixed.<o:p></o:p></span></li><li style=3D"color:black;m=
argin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lf=
o1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Other potentially =
2.5 blocking changes such as timezone issues were fixed.<o:p></o:p></span><=
/li><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom=
:.0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We have documented=
 sstate mirror setup for poky as opt-in, not by default and will monitor th=
e usage of this to see how sustainable it is.<o:p></o:p></span></li><li sty=
le=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;ms=
o-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Assuming the curre=
nt test build succeeds, 2.5 rc1 will be built today.<o:p></o:p></span></li>=
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">An email about 2.6=
 planning was sent out and people are invited to the next monthly technical=
 call (<a href=3D"https://www.yoctoproject.org/monthly-technical-call/"><sp=
an style=3D"color:#1155CC">https://www.yoctoproject.org/monthly-technical-c=
all/</span></a>).
 The email details the planning process we will be following along with som=
e of the possible ideas for 2.6. The email is:
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-A=
pril/150040.html">
<span style=3D"color:#1155CC">http://lists.openembedded.org/pipermail/opene=
mbedded-core/2018-April/150040.html</span></a><o:p></o:p></span></li><li st=
yle=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;m=
so-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We are now trackin=
g patch status in the tracking metrics below. The percentage of patches wit=
h Upstream-Status should stay at 100% now with our monitoring. Over time we=
 want to reduce the percentage in the =93Pending=94
 state and the overall number of patches.<o:p></o:p></span></li></ul>
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
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 cut off of 4/2/18</span><=
o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">WDD 2486 (last wee=
k 2573)</span><span style=3D"font-family:Consolas"> (</span><span style=3D"=
font-family:&quot;Arial&quot;,sans-serif"><a href=3D"https://wiki.yoctoproj=
ect.org/charts/combo.html"><span style=3D"color:#1155CC">https://wiki.yocto=
project.org/charts/combo.html</span></a></span><span style=3D"font-family:C=
onsolas">)</span><span style=3D"font-family:&quot;Arial&quot;,sans-serif"><=
o:p></o:p></span></li><li style=3D"color:black;margin-top:0in;margin-bottom=
:0in;margin-bottom:.0001pt;mso-list:l1 level1 lfo2;vertical-align:baseline"=
>
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Patches</span><spa=
n style=3D"font-family:Consolas"><o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.00=
01pt;mso-list:l1 level2 lfo2;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Total patches foun=
d: 1635</span><span style=3D"font-family:Consolas"><o:p></o:p></span></li><=
li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.000=
1pt;mso-list:l1 level2 lfo2;vertical-align:baseline">
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

--_000_CY4PR11MB1766F5DF0F0C81891BEC0A3AC7890CY4PR11MB1766namp_--
