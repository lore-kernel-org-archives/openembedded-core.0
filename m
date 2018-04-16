Return-Path: <robin.l.jordan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5F5674502
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 15:43:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2018 08:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,459,1517904000"; 
	d="scan'208,217";a="191900528"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by orsmga004.jf.intel.com with ESMTP; 16 Apr 2018 08:43:09 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 16 Apr 2018 08:43:08 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
	fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 16 Apr 2018 08:43:08 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (216.32.181.183)
	by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 16 Apr 2018 08:43:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BI8xtx75I44XMMXfItllOedUdWkYCzfl/46dhh7nBBs=;
	b=RQfhfdMY3S/wlIxRAGeQvEZeqIQiy/aeMK7Olz7ps4u2OasNaJt7qhi301XF1TDz2362v46D3usSJwd4IqYqlsXcxeF65NmrA9xB6YJaNvKma7tLsH5OvVn9SPAil1Efo4kJi4zAOYHd4nXWL3r4beIcexSFu1hcOKueJ1i+egg=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB2053.namprd11.prod.outlook.com (10.173.17.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.675.14; Mon, 16 Apr 2018 15:43:05 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651%16]) with mapi id 15.20.0675.015;
	Mon, 16 Apr 2018 15:43:05 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto Project Status April 16, 2018
Thread-Index: AdPVmYk4lnRGMS2hSXCOcH/2Yrq58w==
Importance: high
X-Priority: 1
Date: Mon, 16 Apr 2018 15:43:04 +0000
Message-ID: <CY4PR11MB17661D28726CCEC8761DECB7C7B00@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [134.134.136.206]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB2053;
	7:A7mWIn83SSCmMiftmAM2bWKC9BOEwYg4rHl0deGCh5t8TiMSl+LgH6pjK6ohOeDPT0Tcx/jc0ZeNe5HuxBSa9oZbXeqBc1q9AbPv7H/PqnWopk36wovT21MIwuPnSdypbNjPsUhpu82UjRSBrPqJGk7BhLB4XvEfrF8yVr8o7S2Fd/d981goVqs6gwhOAx5wXDFuidTt6ozW/sYiAq6tog53Q0jejqXmjiDZqiwCvBnF5MoxNSVbz3xMBuMeOVtZ
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB2053; 
x-ms-traffictypediagnostic: CY4PR11MB2053:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB20531030E9D8765F1E9B8C62C7B00@CY4PR11MB2053.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231232)(944501327)(52105095)(10201501046)(3002001)(93006095)(93001095)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR11MB2053; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB2053; 
x-forefront-prvs: 0644578634
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39380400002)(346002)(396003)(39840400004)(376002)(189003)(199004)(3280700002)(478600001)(102836004)(3660700001)(25786009)(2906002)(33656002)(106356001)(3846002)(26005)(790700001)(6116002)(97736004)(186003)(5250100002)(2501003)(316002)(5660300001)(66066001)(59450400001)(7696005)(6506007)(81156014)(81166006)(74316002)(2900100001)(8676002)(8936002)(476003)(86362001)(68736007)(110136005)(3480700004)(53936002)(99286004)(81686011)(105586002)(486006)(966005)(606006)(7736002)(55016002)(6306002)(6436002)(236005)(54896002)(9686003)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB2053;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: YaMpam4Zl/gC0jjZgHxnAI9fIx0r9nR3W1mM1N9v8Gt0BFdKoLE184YWEvEimGEZK7QABUpvCU9n2B29jAWR0OHopbW7/F58LWSt0A1sdXpChmqoE1jgsyzVYM53fot0GJnnCFTImyoqiAoOcF7LTzPcvZ8Q/ryyGhLueCEmWNXqURafUXTyj2q5SFPZVQJZ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 15975761-3813-4081-a097-08d5a3b0beaf
X-MS-Exchange-CrossTenant-Network-Message-Id: 15975761-3813-4081-a097-08d5a3b0beaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2018 15:43:04.9514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2053
X-OriginatorOrg: intel.com
Subject: Yocto Project Status April 16, 2018
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
X-List-Received-Date: Mon, 16 Apr 2018 15:43:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB17661D28726CCEC8761DECB7C7B00CY4PR11MB1766namp_"

--_000_CY4PR11MB17661D28726CCEC8761DECB7C7B00CY4PR11MB1766namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M4 final close out.

Next Deadline: YP 2.5 M4 release is 4/27/18


SWAT Team Rotation:

SWAT lead is currently: Tracy.

SWAT team rotation: Tracy -> Stephano on April 20, 2018

SWAT team rotation: Stephano -> Maxin on April 27, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   2.5 M3 was released. There were some issues but we have decided to ta=
rget these for the final release rather than respinning M3.
  *   Our automated testing shows problems but only on machines in Asia. Th=
is was root caused to the timezone settings of the builds. We have therefor=
e moved some of the reproducibility code to be the default (TZ setting) in =
order to have consistent builds.
  *   Fedora28 has necessitated a late uninative upgrade which is due to me=
rge for 2.5 but may have an issue still to resolve (rpm-native popt issue).
  *   The final 2.5 build is blocked on the fedora28 issue above and the tw=
o remaining build issues we are seeing on debian9 machine the QA team has. =
Our main autobuilder debian9 builds are ok.
  *   Master-next still has a number of recipe upgrades queued which are be=
ing rebased continually. We still want to discourage people from sending re=
cipe upgrades until we start 2.6; however, there were simply too many patch=
es to ignore. This has meant various people and build resources have ended =
up distracted from 2.5 work.
  *   For 2.6 we are looking at a slightly different planning process. In t=
he next monthly team call we will discuss the plans for 2.6. The agenda wil=
l be seeded with some high level ideas/goals about what we may be able to d=
o in 2.6. It will then be up to the Yocto Project members and community to =
decide if they can contribute the time and resources to make them happen (o=
r add to the list). If you are able to work on something in 2.6 please let =
us know or come to the meeting and discuss it with us so that we can ensure=
 we have an accurate plan! A separate announcement email will be sent out a=
bout this in the next few days.


Planned upcoming dot releases:

YP 2.3.4 (Pyro) will be built after 2.5

YP 2.2.4 (Morty) will be built after 2.5

YP 2.4.3 (Rocko) is planned for post YP 2.5.


Key YP 2.5 Dates are:

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2573 (last week 2570)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]


--_000_CY4PR11MB17661D28726CCEC8761DECB7C7B00CY4PR11MB1766namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	{mso-list-id:72893424;
	mso-list-template-ids:497165358;}
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
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently: Tracy.</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Tracy -&gt; Ste=
phano on April 20, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Maxin on April 27, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">2.5 M3 was release=
d. There were some issues but we have decided to target these for the final=
 release rather than respinning M3.<o:p></o:p></span></li><li style=3D"colo=
r:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 =
level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Our automated test=
ing shows problems but only on machines in Asia. This was root caused to th=
e timezone settings of the builds. We have therefore moved some of the repr=
oducibility code to be the default (TZ setting)
 in order to have consistent builds.<o:p></o:p></span></li><li style=3D"col=
or:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0=
 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Fedora28 has neces=
sitated a late uninative upgrade which is due to merge for 2.5 but may have=
 an issue still to resolve (rpm-native popt issue).<o:p></o:p></span></li><=
li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.000=
1pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The final 2.5 buil=
d is blocked on the fedora28 issue above and the two remaining build issues=
 we are seeing on debian9 machine the QA team has. Our main autobuilder deb=
ian9 builds are ok.<o:p></o:p></span></li><li style=3D"color:black;margin-t=
op:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lfo1;vert=
ical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Master-next still =
has a number of recipe upgrades queued which are being rebased continually.=
 We still want to discourage people from sending recipe upgrades until we s=
tart 2.6; however, there were simply too many
 patches to ignore. This has meant various people and build resources have =
ended up distracted from 2.5 work.<o:p></o:p></span></li><li style=3D"color=
:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 l=
evel1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">For 2.6 we are loo=
king at a slightly different planning process. In the next monthly team cal=
l we will discuss the plans for 2.6. The agenda will be seeded with some hi=
gh level ideas/goals about what we may be able
 to do in 2.6. It will then be up to the Yocto Project members and communit=
y to decide if they can contribute the time and resources to make them happ=
en (or add to the list). If you are able to work on something in 2.6 please=
 let us know or come to the meeting
 and discuss it with us so that we can ensure we have an accurate plan! A s=
eparate announcement email will be sent out about this in the next few days=
.<o:p></o:p></span></li></ul>
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
t YP 2.5.</span><o:p></o:p></p>
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
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color=
:black">WDD 2573 (last week 2570)</span><o:p></o:p></p>
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
r information you&#8217;d like to see on this weekly status update, let us =
know!]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_CY4PR11MB17661D28726CCEC8761DECB7C7B00CY4PR11MB1766namp_--
