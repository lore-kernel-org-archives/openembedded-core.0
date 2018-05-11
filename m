Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0048.outbound.protection.outlook.com [104.47.41.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8D260782E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=8uoxw4TpAB5PGC4JY3vjmZ9XcFMc4+PY7mS6xBIEcW8=;
	b=DY3wTjJiIakcp2rFbUE18tX4AKrCQynIKAsYxi/rDrUyxOzPY/282xtGSRPDX1FnOVtXkYCzJpr3G9TWQBwNMRv6ajoIQsln0SBPsRzRm544tmcOZCcVLTTvaBz9zoPlccmaQK6eHcyNmhBWl52GliHUUBuZvGrez3kLufWS0Jg=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB0051.namprd12.prod.outlook.com (10.174.114.13) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.755.16; Fri, 11 May 2018 18:51:16 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0%4]) with mapi id 15.20.0755.012;
	Fri, 11 May 2018 18:51:15 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: do_kernel_configme and defconfig
Thread-Index: AdPpWGk/TpeRD7IPTl22gQujYHEcvQ==
Date: Fri, 11 May 2018 18:51:15 +0000
Message-ID: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [104.129.194.175]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB0051;
	7:V1OLLB6wl0jXNCKJY7wXnul4qmEU0v+E0qxTOOp5fzOU/UQns3He+ZaI71tfTSuOcQqipVT9YgxRLqdVxnFCgoIw97ruYxG+KYxt0Oms1k/WVMRcgl/nOgqZ9TbNa1O4zgCvVD9sn+D6QemjWxXqHV8qROl9Id5WHaek9falAMvjUH64CJr5O0kOJdTRbpAWy80MbwnefUIHHKFHzGlgmD4p/UIuVScHcKIIyEXMUyyOJywgifdt7GyAQfUp6hhF
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(376002)(366004)(346002)(396003)(39380400002)(39860400002)(53754006)(199004)(189003)(29502001)(478600001)(790700001)(2900100001)(3846002)(25786009)(105586002)(6116002)(5250100002)(476003)(99286004)(33656002)(6916009)(2351001)(66066001)(106356001)(2501003)(74316002)(486006)(102836004)(3280700002)(9686003)(6506007)(55016002)(5640700003)(6436002)(55236004)(7736002)(97736004)(53936002)(186003)(54896002)(26005)(4326008)(2906002)(7696005)(107886003)(3660700001)(8676002)(7116003)(8936002)(316002)(86362001)(6306002)(81166006)(5660300001)(81156014)(68736007)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0051;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB0051; 
x-ms-traffictypediagnostic: BN6PR1201MB0051:
x-microsoft-antispam-prvs: <BN6PR1201MB0051B20512AAF235C4DED3BB8B9F0@BN6PR1201MB0051.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231254)(11241501184)(944501410)(52105095)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR1201MB0051; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB0051; 
x-forefront-prvs: 06691A4183
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 0kFT0DS9L+rt559Qq+ML3XP1Q/xgIwtk4pyRV3gjrngF60jKaLUXn7gKbwEPF9DojKGg1H8svex+K7dxoW82qUTdxPkKxjpQ5oiDgScDeZDqY1FjQj7dyWvl3GP8eUu5ChXXxbTaYCmW2Bf0tP4nbrv0Fw2SZLhU8X6e5lR4dqRR4gXS0IsaUGieloUL1e1Q/znTNPjQPapinJoCpo1EXw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f8399401-eca5-465e-cf9e-08d5b7702c9f
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8399401-eca5-465e-cf9e-08d5b7702c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2018 18:51:15.4434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
Cc: jared.smith@agilent.com
Subject: do_kernel_configme and defconfig
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
X-List-Received-Date: Fri, 11 May 2018 19:07:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0BN6PR1201MB0195_"

--_000_BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Is it expected for do_kernel_configme to apply the defconfig last (after co=
nfiguration fragments introduced by sccs)?

For some reason, in the call to merge_config, ".kernel-meta/configs//./defc=
onfig" is passed last whereas I'd expect it would be first (since that shou=
ld be the base config). This is causing problems, because config options th=
at my config fragments are setting are getting overridden by the defconfig =
- it should be the other way around.

For reference, I'm using Rocko and have just updated to the latest commit. =
We have an in-tree defconfig, and we set KBUILD_DEFCONFIG_machinename appro=
priately. We are using the separate kernel-meta repository to store kernel =
metadata. I have KMACHINE_machinename set up so that it finds the correct B=
SP definition .scc file. Still seem to be missing something, though.

Thanks,
Chris

--_000_BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0BN6PR1201MB0195_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it expected for do_kernel_configme to apply the d=
efconfig last (after configuration fragments introduced by sccs)?<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For some reason, in the call to merge_config, &#8220=
;.kernel-meta/configs//./defconfig&#8221; is passed last whereas I&#8217;d =
expect it would be first (since that should be the base config). This is ca=
using problems, because config options that my config
 fragments are setting are getting overridden by the defconfig &#8211; it s=
hould be the other way around.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For reference, I&#8217;m using Rocko and have just u=
pdated to the latest commit. We have an in-tree defconfig, and we set KBUIL=
D_DEFCONFIG_machinename appropriately. We are using the separate kernel-met=
a repository to store kernel metadata. I
 have KMACHINE_machinename set up so that it finds the correct BSP definiti=
on .scc file. Still seem to be missing something, though.<span style=3D"fon=
t-variant:small-caps"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0BN6PR1201MB0195_--
