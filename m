Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0071.outbound.protection.outlook.com [157.55.234.71])
	by mail.openembedded.org (Postfix) with ESMTP id A07D06010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2uIaDwHzPyJ1YpLYQGkHnG1D33q8UceWNum4kCm2wbE=;
	b=GYROrHltsAIB5k6s2UroHqEsE5oawmRMH/Cobx9b1wHnHG9eYhlM7YONbE9uoYF0E1lRBuvL9MWyNqdYvik0aU4H5a0K4U9Xq2fWwTRwql0Hqqo0GZBhEtgO38LJc3Na4691/lKylJ3Zt3lfKE3SQNQoJNCOsvHloV8D3eOtmRM=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) with Microsoft SMTP Server (TLS) id
	15.1.443.12; Fri, 25 Mar 2016 06:07:44 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a%15]) with mapi id 15.01.0443.015;
	Fri, 25 Mar 2016 06:07:44 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: LE and BE build for the same machine in Yocto
Thread-Index: AdGGWziqA75Rm8VjSfaQ4JWTZrOnbg==
Date: Fri, 25 Mar 2016 06:07:44 +0000
Message-ID: <DB3PR04MB0684386FD5BEA86D54DDA26EEE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
x-originating-ip: [123.151.195.53]
x-ms-office365-filtering-correlation-id: 34421fea-4043-40a0-fec7-08d35473c812
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0684;
	5:bf/glBrjw/X2Bq9RuflIU174Q9ep0JXZX6St5h13MVSfw+MRm+TX6pFyv/FlNaFb+UKc0vXElEBz7+j3HyEOaBpbkpIQPwx0DNb6aGf5yzzc8uh2ee2CT6rL3aiQe6RwEmw2Ro6p0UFbLtMVgeO0rA==;
	24:/Uw8vYT3a7nwYV3PSyZ9+4EJtGEEeuFAPwcnOoGZ01PSKPaj1Pm0OohW2CRbZrFtwLpL3lMznu0ZsuMPllvhhLk9CJE+hkuH1Oyx8M/xot0=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0684;
x-microsoft-antispam-prvs: <DB3PR04MB06844A47E17ADB0D39554E66EE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DB3PR04MB0684; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0684; 
x-forefront-prvs: 0892FA9A88
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(53754006)(3846002)(92566002)(6116002)(74316001)(66066001)(54356999)(50986999)(19300405004)(76576001)(19625215002)(86362001)(586003)(102836003)(16236675004)(81166005)(87936001)(1096002)(790700001)(1220700001)(33656002)(189998001)(3660700001)(107886002)(229853001)(2906002)(2351001)(5008740100001)(11100500001)(3280700002)(110136002)(5003600100002)(5250100002)(15975445007)(2900100001)(450100001)(5002640100001)(5004730100002)(2501003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0684;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2016 06:07:44.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0684
Subject: LE and BE build for the same machine in Yocto
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
X-List-Received-Date: Fri, 25 Mar 2016 07:40:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB3PR04MB0684386FD5BEA86D54DDA26EEE830DB3PR04MB0684eurp_"

--_000_DB3PR04MB0684386FD5BEA86D54DDA26EEE830DB3PR04MB0684eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

If the multilib feature is enabled in Yocto, two cross-compile gcc binaries=
 will be generated to do both 32b and 64b build for the same machine.  Curr=
ently we have requirement to build LE u-boot and BE kernel/rootfs for the s=
ame machine, may I know if there is similar multilib mechanism in Yocto to =
support BE and LE build for the same machine?


Best Regards,

Zhenhua

--_000_DB3PR04MB0684386FD5BEA86D54DDA26EEE830DB3PR04MB0684eurp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hi all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If the multilib feature is enabled in Yocto, two cro=
ss-compile gcc binaries will be generated to do both 32b and 64b build for =
the same machine. &nbsp;Currently we have requirement to build LE u-boot an=
d BE kernel/rootfs for the same machine,
 may I know if there is similar multilib mechanism in Yocto to support BE a=
nd LE build for the same machine?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhenhua <o:p></o:p></p>
</div>
</body>
</html>

--_000_DB3PR04MB0684386FD5BEA86D54DDA26EEE830DB3PR04MB0684eurp_--
