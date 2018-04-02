Return-Path: <robin.l.jordan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D1260744DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 15:27:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 08:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,395,1517904000"; d="scan'208,217";a="30907992"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga006.jf.intel.com with ESMTP; 02 Apr 2018 08:27:10 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 2 Apr 2018 08:27:10 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (216.32.181.22)
	by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 2 Apr 2018 08:27:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector1-intel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pmpa2T/NesoJY75gl8B4CmNwa8jAhd8XQevMER6A1OU=;
	b=b9ineLO7NJ7Oz/I+tnFv4AcRV3VX4VLhGQXK5UDEI+QRl7X0BnP2IoE6FO/xhKVNTFmu2qo3CDvm/0jQWDOTaWvZHmq3IWYIoiv2W9E+eU3Fi5Z4/bYNUxVlrBxKKLXz91CzCE221Jr1su+eLFTUuD/RVJcjkDi1i7C5E0fS8xI=
Received: from CY4PR11MB1766.namprd11.prod.outlook.com (10.175.81.12) by
	CY4PR11MB1352.namprd11.prod.outlook.com (10.173.16.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.631.10; Mon, 2 Apr 2018 15:26:41 +0000
Received: from CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651]) by
	CY4PR11MB1766.namprd11.prod.outlook.com
	([fe80::415e:d567:c492:6651%16]) with mapi id 15.20.0631.013;
	Mon, 2 Apr 2018 15:26:41 +0000
From: "Jordan, Robin L" <robin.l.jordan@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW14=9218?=
Thread-Index: AdPKltqmvWBlODxHSxK93RtQAZNmsw==
Importance: high
X-Priority: 1
Date: Mon, 2 Apr 2018 15:26:41 +0000
Message-ID: <CY4PR11MB1766F1FB934645135EF60E60C7A60@CY4PR11MB1766.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=robin.l.jordan@intel.com; 
x-originating-ip: [108.171.135.188]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1352;
	7:5q4nit5LjwU5t5fropTawn82pjfUTtamEdzsE6E/B3Rwigo+gx/+9vu2bXASP9BdaAAMKBDPuMXHTZ0kA/YB2r6XQyRSDx2knF/jfLyUWZWpN7DMKTJFF5d6AsA6OPDwBBQSgqRVLuk42XjtOegBDxpLX985awb0sF5TUul5AS1/PDt/bjHMJ0YfPRyb8a1WYhQFKE6w1XhVQUhs0ZgVxWn9imJ+l2LeYPSbb5hB3K65/YWLGUf+0bRBo/57Z7SF
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bc0cffd9-b610-4676-5a28-08d598ae2280
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR11MB1352; 
x-ms-traffictypediagnostic: CY4PR11MB1352:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB13527A0E4250E589168ED097C7A60@CY4PR11MB1352.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(20558992708506)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(944501327)(52105095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR11MB1352; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1352; 
x-forefront-prvs: 0630013541
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(346002)(396003)(376002)(39840400004)(366004)(199004)(189003)(54164003)(3660700001)(966005)(81686011)(105586002)(102836004)(68736007)(14454004)(316002)(5660300001)(5250100002)(106356001)(33656002)(74316002)(3280700002)(2501003)(7696005)(97736004)(7736002)(110136005)(81156014)(81166006)(99286004)(606006)(9686003)(8936002)(2906002)(6116002)(3846002)(476003)(6306002)(54896002)(486005)(53936002)(790700001)(59450400001)(478600001)(26005)(66066001)(186003)(86362001)(486005)(6436002)(6506007)(2900100001)(236005)(25786009)(55016002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1352;
	H:CY4PR11MB1766.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: DbqCL315oas1HHQWreYrmnRwZm8i94pIfKrxPa/EiS4MO31nXThPcw53Bfj4tn0KZr7Z7hM/vkIaH6Y/fx7yL75qywrFCnGjMInl3oxnZxwIoe7KHS+X3FHN0m74LfJZJKrMlbvMxrsVrJXE0XxQxj1+Oaamlanb2WRXpSyizaGxDOriCIZEOYEHbm405LsgfHj/r168NrdCMI69gOTn6OZtIVoNxuW77XPUs/Cgk6wd8k3w7atDdzPCd8qrxm2dUJhAQdFzmgU7je896tax6MMGn/NSB+QdbT8c1YK5zIHvtOHY6EE2G7vEspzVLAUfse9s/9BMlQqNqgXKEeEQ1SMyEREOlBwzffvfWZOSHJ3BZ0ZV7BBF9Rb3u5DLCLC1kOcVeKUVPgmoew7A0WBRxhSthcJ+PvNDZ1CfWhwGZj0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0cffd9-b610-4676-5a28-08d598ae2280
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2018 15:26:41.1799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1352
X-OriginatorOrg: intel.com
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxNOKAmTE4?=
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
X-List-Received-Date: Mon, 02 Apr 2018 15:27:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB1766F1FB934645135EF60E60C7A60CY4PR11MB1766namp_"

--_000_CY4PR11MB1766F1FB934645135EF60E60C7A60CY4PR11MB1766namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M3 final close out.

Next Deadline: YP 2.5 M4 stabilization is 4/2/18

SWAT Team Rotation:

SWAT lead is currently Juro.

SWAT team rotation: Juro -> Paul on April 6, 2018

SWAT team rotation: Paul -> Tracy on April 13, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   Two issues have so far been identified in the M3 rc1 build. One is du=
e to differences in build-appliance srcrev between the new and old buildbot=
 autobuilder codebases. The second is an issue with the particular stable k=
ernel version causing problems on 32bit IA which we believe is fixed in cur=
rent master due to kernel version changes there.
  *   We continue to be blocked with morty on the glibc 2.27 and the sdk lo=
cale issues.  Armin has been looking into it.
  *   The pseudo issue with newer versions of coreutils as used in fedora27=
 continues to cause problems, but thanks to some work by several people we =
do look close to a solution.  The help from everyone is much appreciated.
  *   We are now well into the stabilization period and are seeing a number=
 of good patches both to fix current issues and future proof the release, f=
oreseeing potential problems with versions and heading those issues off.  T=
hanks to everyone helping with these.
  *   The codename for 2.6 (after sumo) will be =91thud=92.
  *   As a reminder, general recipe upgrades will not be merged during this=
 period unless there is a pressing reason.  Those will be held for 2.6.


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

WDD 2594 (last week 2673)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]


--_000_CY4PR11MB1766F1FB934645135EF60E60C7A60CY4PR11MB1766namp_
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
	{mso-list-id:1818373418;
	mso-list-template-ids:-1099770610;}
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
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 M3 fin=
al close out.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M4 stabilizat=
ion is 4/2/18</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">SWAT Team Rotation:</span><span style=3D"font-family:&quot=
;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT lead is currently Juro.</span>=
<o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Juro -&gt; Paul=
 on April 6, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Paul -&gt; Trac=
y on April 13, 2018</span><o:p></o:p></p>
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
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">Two issues have so=
 far been identified in the M3 rc1 build. One is due to differences in buil=
d-appliance srcrev between the new and old buildbot autobuilder codebases. =
The second is an issue with the particular stable
 kernel version causing problems on 32bit IA which we believe is fixed in c=
urrent master due to kernel version changes there.<o:p></o:p></span></li><l=
i style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We continue to be =
blocked with morty on the glibc 2.27 and the sdk locale issues. &nbsp;Armin=
 has been looking into it.<o:p></o:p></span></li><li style=3D"color:black;m=
argin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 level1 lf=
o1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The pseudo issue w=
ith newer versions of coreutils as used in fedora27 continues to cause prob=
lems, but thanks to some work by several people we do look close to a solut=
ion. &nbsp;The help from everyone is much appreciated.<o:p></o:p></span></l=
i><li style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.=
0001pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">We are now well in=
to the stabilization period and are seeing a number of good patches both to=
 fix current issues and future proof the release, foreseeing potential prob=
lems with versions and heading those issues
 off. &nbsp;Thanks to everyone helping with these.<o:p></o:p></span></li><l=
i style=3D"color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l0 level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">The codename for 2=
.6 (after sumo) will be =91thud=92.<o:p></o:p></span></li><li style=3D"colo=
r:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0 =
level1 lfo1;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">As a reminder, gen=
eral recipe upgrades will not be merged during this period unless there is =
a pressing reason. &nbsp;Those will be held for 2.6.<o:p></o:p></span></li>=
</ul>
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
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">WDD 2594 (last week 2673)</span><o:=
p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:Co=
nsolas;color:black">(</span><a href=3D"https://wiki.yoctoproject.org/charts=
/combo.html"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:=
#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><span st=
yle=3D"font-family:Consolas;color:black">)</span><o:p></o:p></p>
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

--_000_CY4PR11MB1766F1FB934645135EF60E60C7A60CY4PR11MB1766namp_--
