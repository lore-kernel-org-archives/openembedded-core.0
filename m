Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0070.outbound.protection.outlook.com [104.47.40.70])
	by mail.openembedded.org (Postfix) with ESMTP id 8160974714
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=LOfTojSjSo0xJHklFnksSB8yjynj4tFbMm7MmAh0Diw=;
	b=A3mphel0j/QxwbrRVwH+r0zv4zU77010WR39o4Yy9L2cPsSjv1Kslh+L41P9Fx49Hudvt1SE6UxSDId7tNpOhQToTIapUzi/YttGgMJDSSaQbFzhIinbjRstT3pHCdTnRJX5ARQjvRxYyOx6JqK0Hlvg6I4SAXkoy1TvOEMyvzk=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB2529.namprd12.prod.outlook.com (10.172.110.150) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.631.10; Sun, 1 Apr 2018 15:52:31 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::31bb:ae63:3595:7ba8%4]) with mapi id 15.20.0631.013;
	Sun, 1 Apr 2018 15:52:31 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Question about native recipes 
Thread-Index: AdPJ0Vxweq1VdJktQiW8PWBAyYKOrw==
Date: Sun, 1 Apr 2018 15:52:31 +0000
Message-ID: <BN6PR1201MB0195CA6828AEB411745386138BA70@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [2601:42:c300:8513:dc56:c640:b103:8bbb]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB2529;
	7:yMRRBs9onsr06PAUqLuQ41iEx4pWUxSpix6c/UNK74k8YKLIhIEaXmTufYV3NWlwA+6Jk8ysiGHFsvhS1AFK3HiFd9d6Z2K9iHjMwl/AbRD1IK7BbYm/u/9y1JN9BNO51Pch4icmxOuCSc8/trYAeKH+/Cb7Ajf1nw3i8zt84rIPiyMpwNKs/ltzKZnt7DU1HLRu3ynV9qbkQhiozvfMKkMy2N2akW1eR5FSmIMVlSfhc8r2vMXZ0TOdc7RkXUjT
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8f94d8a1-b4bc-49d1-a9b7-08d597e893e1
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB2529; 
x-ms-traffictypediagnostic: BN6PR1201MB2529:
x-microsoft-antispam-prvs: <BN6PR1201MB25299791F8CB4D4689D2CA1A8BA70@BN6PR1201MB2529.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(11241501184)(944501327)(52105095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:BN6PR1201MB2529; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB2529; 
x-forefront-prvs: 06290ECA9D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(366004)(39380400002)(346002)(376002)(39860400002)(396003)(199004)(189003)(29502001)(316002)(6916009)(2906002)(486005)(25786009)(5660300001)(486005)(476003)(3480700004)(8936002)(7696005)(68736007)(3280700002)(74316002)(790700001)(9326002)(6116002)(6506007)(102836004)(5250100002)(186003)(2501003)(7736002)(99286004)(3660700001)(97736004)(55016002)(9686003)(478600001)(6306002)(54896002)(5640700003)(105586002)(86362001)(46003)(33656002)(2351001)(106356001)(2900100001)(14454004)(8676002)(81166006)(81156014)(4743002)(6436002)(53936002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2529;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 36NXXKbSLq/rknH5/R0MauXSFI+Vt7gpXrH/T7XMYHPMbNoUORALhiQy1KozaRm1L9yMpNDquJ7eqhOoO5+7zMMLzb1tu1oB25Yfar0NPzDDj2fmEJx/uGclK/Xw94YUXBSVhyU41u1+8ogME4lpWTzima4f058r5wb6n9FzaRk/xDdSG7VviDBTA17DBRGzrJOFkgiFciUVr90JOrw5JEnlxS5W4lg5ki0NrnaTDSiOTSE+sbRZ58HQ0Kxtn8Q2S1npe6n0GF9CoCd+jU9vzuIINylyDgGMX5h7cBcRnncTvjEVZ9kBFpg5dQK8n+gkQtkH7Y5R+IYVabTsC9ZkUivcBXkXTHvC2KbLVSaVQygL2dGxqt4pQe/4Q+6456kN3J/VFw2ufqj4i9KAZgqBw7YLU/1iEacCCMxlFsjWTKk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f94d8a1-b4bc-49d1-a9b7-08d597e893e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2018 15:52:31.0778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2529
Subject: Question about native recipes
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
X-List-Received-Date: Sun, 01 Apr 2018 15:52:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB0195CA6828AEB411745386138BA70BN6PR1201MB0195_"

--_000_BN6PR1201MB0195CA6828AEB411745386138BA70BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Suppose I have a native recipe that installs a large (~1 - 2 GB) amount of =
stuff. It's needed by about 20 or 30 recipes. I'd rather not install that 1=
-2 GB into every recipe's recipe-sysroot-native, because that will consume =
a ton of disk space. Is there any way I can change my native recipe to inst=
all to a common location?

Thanks,
Chris

--_000_BN6PR1201MB0195CA6828AEB411745386138BA70BN6PR1201MB0195_
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Suppose I have a native recipe that installs a large=
 (~1 &#8211; 2 GB) amount of stuff. It&#8217;s needed by about 20 or 30 rec=
ipes. I&#8217;d rather not install that 1-2 GB into every recipe&#8217;s re=
cipe-sysroot-native, because that will consume a ton of disk
 space. Is there any way I can change my native recipe to install to a comm=
on location? &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB0195CA6828AEB411745386138BA70BN6PR1201MB0195_--
