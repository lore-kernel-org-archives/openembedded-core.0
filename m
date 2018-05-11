Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 9106 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 May 2018 20:54:49 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0073.outbound.protection.outlook.com [104.47.42.73])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3107851A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=KsbJ6V5pFWsLqgXLlyEJl0OlU1XIEm0j3bfQdN8qqr0=;
	b=Zjiq6E+99JMqaHWcJJJDvkzxbRbooz3yFYZiUl0Q2zEAjJmlqyobCGxqdOlzDmUTblxnnoSdSzS6QEQgyUqpmPAOCZ8nImiH4NF2stqaLEt69y++CQ/RkgeXnX3BKRY+rx1tXr8WrmqcPNIHWgJfvZbodZwj5CsJ5vJYEkubDBo=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB0050.namprd12.prod.outlook.com (10.174.114.12) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.755.16; Fri, 11 May 2018 18:23:03 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0%4]) with mapi id 15.20.0755.012;
	Fri, 11 May 2018 18:23:03 +0000
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Running BitBake multiple times without rechecking upstream
	AUTOREV versions
Thread-Index: AdPpVGUCuqEJeD5cQVOT+z6gc+ZaNg==
Date: Fri, 11 May 2018 18:23:03 +0000
Message-ID: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [104.129.194.175]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB0050;
	7:HCbvMTQtmaVp2U2y9D1MfAVx7NODvzHnbIVXuhkYG6xibBz2cb5xy0aL7nmjPQJt6rK2K8kzO0BYPAeT0ndHIp7qS8EvoB/ys474veA6zue4MYSQfLgJ0LMlYkB0hSlJmBcnAIKvDh0F9/a+iBu+xzjSMY1YtXogVb7GxmH8PS5Z5N6sYEtunq3yY8rIDi/F1oppz0B7jOFuka06ci8Boko5xA2aV8gt77m3dBCP1FbTSPOyTzemg6Wfw8AJE+tu
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB0050; 
x-ms-traffictypediagnostic: BN6PR1201MB0050:
x-microsoft-antispam-prvs: <BN6PR1201MB005076950656BAC2F7C7DE6F8B9F0@BN6PR1201MB0050.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(11241501184)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:BN6PR1201MB0050; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB0050; 
x-forefront-prvs: 06691A4183
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(366004)(376002)(39860400002)(346002)(53754006)(29502001)(199004)(189003)(59450400001)(74316002)(3280700002)(86362001)(790700001)(7736002)(102836004)(316002)(3660700001)(66066001)(2906002)(7696005)(6506007)(2351001)(3846002)(6116002)(5660300001)(55236004)(106356001)(99286004)(2900100001)(105586002)(8936002)(478600001)(6436002)(6306002)(5640700003)(81166006)(5250100002)(25786009)(33656002)(14454004)(68736007)(53936002)(97736004)(186003)(9686003)(2501003)(8676002)(6916009)(486006)(476003)(26005)(55016002)(54896002)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0050;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: IYoRYfx8MVgi4TuPb585Alp4qYbV4DPjvVVyX73UdJewwe9ZAFicN97scOQ27Zx1vgAKP1w2Fy07KnmXjIbg4QX6K4Niv5vfdHn4FGTe4pnvCTkDtOtDA+ugg4K1dxjGD3I6gyGOtaQ+6UwQKDFy2OGaZibn9u/K5qbRxz41wIObt6vsiEZXA99IlYfdENXHfGmpYuNywzGASJu85aD7GQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3a0e38ad-36b9-433e-c406-08d5b76c3c03
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0e38ad-36b9-433e-c406-08d5b76c3c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2018 18:23:03.2305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0050
Subject: Running BitBake multiple times without rechecking upstream AUTOREV versions
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
X-List-Received-Date: Fri, 11 May 2018 20:54:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB019576F9685E3FFFC5E183E08B9F0BN6PR1201MB0195_"

--_000_BN6PR1201MB019576F9685E3FFFC5E183E08B9F0BN6PR1201MB0195_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm working on using Jenkins to host our Yocto build. One of the things tha=
t would be nice is to be able to do a "bitbake our-user-image", upload the =
artifacts to our network file storage, and then do a "bitbake our-user-imag=
e -c populate_sdk_ext". I'd like to do these separately so that developers =
are not waiting around for the eSDK to be generated if all they care about =
is the kernel, for example. My concern is that the second bitbake invocatio=
n could end up building different stuff if someone were to check in code in=
 between when the two "bitbake"s are run. This is primarily a concern with =
recipes that use AUTOREV (as we do for development purposes).

Is there a way to essentially "freeze" the BitBake data store and re-use it=
 across multiple bitbake invocations?

I had a few ideas:

1. Use buildhistory-collect-srcrevs to generate the SRCREV_pn- overrides ne=
cessary to lock the SRCREVs of all the packages.
2. Use BB_SERVER_TIMEOUT =3D "-1" to force BitBake to remain resident - whe=
n BitBake is resident is seems to not reparse recipes. As I understand it, =
the recipe parse stage is when upstreams are checked for new revisions. Not=
 sure if this would work.
3. Somehow use the locked siggens.


Is anything like this possible?

Thanks,
Chris

--_000_BN6PR1201MB019576F9685E3FFFC5E183E08B9F0BN6PR1201MB0195_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:236088658;
	mso-list-type:hybrid;
	mso-list-template-ids:-1979137100 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m working on using Jenkins to host our Yocto=
 build. One of the things that would be nice is to be able to do a &#8220;b=
itbake our-user-image&#8221;, upload the artifacts to our network file stor=
age, and then do a &#8220;bitbake our-user-image -c populate_sdk_ext&#8221;=
.
 I&#8217;d like to do these separately so that developers are not waiting a=
round for the eSDK to be generated if all they care about is the kernel, fo=
r example. My concern is that the second bitbake invocation could end up bu=
ilding different stuff if someone were
 to check in code in between when the two &#8220;bitbake&#8221;s are run. T=
his is primarily a concern with recipes that use AUTOREV (as we do for deve=
lopment purposes).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a way to essentially &#8220;freeze&#8221; t=
he BitBake data store and re-use it across multiple bitbake invocations?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I had a few ideas:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. Use buildhistory-collect-srcrevs to generate the =
SRCREV_pn- overrides necessary to lock the SRCREVs of all the packages.<o:p=
></o:p></p>
<p class=3D"MsoNormal">2. Use BB_SERVER_TIMEOUT =3D &#8220;-1&#8221; to for=
ce BitBake to remain resident &#8211; when BitBake is resident is seems to =
not reparse recipes. As I understand it, the recipe parse stage is when ups=
treams are checked for new revisions. Not sure if this
 would work.<o:p></o:p></p>
<p class=3D"MsoNormal">3. Somehow use the locked siggens. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is anything like this possible?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN6PR1201MB019576F9685E3FFFC5E183E08B9F0BN6PR1201MB0195_--
