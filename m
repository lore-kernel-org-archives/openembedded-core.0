Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web10.363.1619802041795557378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 10:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=VOVBS775;
 spf=pass (domain: spinetix.com, ip: 40.107.8.77, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG4YqFdzUgPYzIrAEwdTpyGLBAKsaCNTxWk+gemCzOtyei5EqZJSq+rdyh2p9BiE5JeKzDr549FNV9d3UpRMB0kL7T0M4K0lr1iyrOG93tDX9pnTAubzCzFG3EBG68bxpgch/4cp4b/y+3/dYq4JV6VdiYNaSWIoahoSJGEHdZ6IopZmOO2jcWxeSzerxvfAcIoRSz6hmlDx+mTO0JNv2p29g2Hz8uPpqaMKnb4IbuaacUpkOHsyrhxm21V9udvKDa07Kb24zFKUdBZnggwupsUJT9tWBuiOcJv8Q0ZxL3BHcD79itn0UMDV83+jIhHo7CGDvAtDbu2ZBq2vqjosLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fPkK7qe7gEVqvjW84rRAqgMGKsb5gbpUOuv0exAZ90=;
 b=V1ikPj7lf/oumaYSRjPXAxrFWx5iIKC5CrJlt4oZk1AqxMRWFv65w6kICtU2789XYwrlsivPifJo1pQTlUUd9XTlikOUBCbXCIwJiVTJS97RPFbwAh3VUNPFzJCVFrAtmuu0j6Dy+efCuxWpbOdmx+xFizzGTAY/ehDee0PVPusf2YdVv9tu3xSLdkah09u4iug6du+JFEbOFw8p5ulP0GoLhJtd4GnlKZa+XkmX+KNkA2njnU+z5gbdRF8cnsS2XXtI0EzYS67fpV9buGia/wkBhrU8HG636j8jEnh/d3BOPf28PiwGukeQx/S/R0GbX0RQlA+HfT4s4V++T17dTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fPkK7qe7gEVqvjW84rRAqgMGKsb5gbpUOuv0exAZ90=;
 b=VOVBS775hQg9mW9I5itZxi1xk4pDRCohP6deRpYCrF1xMGRL9NjEZ+fo5PUb+gAlO9GM85vaCJZmux0eJnWgD9yOfWOIWixBEsaDW03bN4OIT98IGq1RJF136VMD4/wY/oSGQtqqy2qxYlNaCNPeq5ohHlQxG9rkiAtgViP/ZVc=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4666.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:6e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Fri, 30 Apr
 2021 17:00:38 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::4ca6:4c0e:d299:9764]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::4ca6:4c0e:d299:9764%3]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 17:00:37 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Unihash warning building kernels in Yocto 3.1.7
Thread-Topic: Unihash warning building kernels in Yocto 3.1.7
Thread-Index: Adc94keMh2EjTyR0Qb2I9MEwyjYHOw==
Date: Fri, 30 Apr 2021 17:00:37 +0000
Message-ID: 
 <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
x-originating-ip: [178.197.220.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6923ee6f-940f-4631-9a2a-08d90bf97a78
x-ms-traffictypediagnostic: DB7PR01MB4666:
x-microsoft-antispam-prvs: 
 <DB7PR01MB4666888C6F776CD0E609A5F7885E9@DB7PR01MB4666.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:162;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X728FPDYjkWNx/7ym67DthYkZZpVwh5wWIHvTbhK9eqhG0gw5bzfXP5tXiq5SjEmwIquIYL2nsr1JgxqBNg7g8iJuOvhq+eQXSYBBPxPGOLq2AOUHp2INN/omw0h84vwJIXIRSpNqzcwAeJP3hU+eir3FjdaXpMKkwlX05Un+J12SjJcVCRBCHUqW2i3/EnqaRsGqSZaP5I82p5gmopqxqy/N9sDyAJm+tczWtIOYOImBN2uo2XXrJYsoW3pKMQN1etPOTXGTt7F8D6XZyyCJPinWFsppOI/lFx1Q2hmyZ8mLNH1eQdyXFE6ZziSKCYUHc+/evMjCuAfGGweISUiceSfAjkfW0M3oJGWURQ7N7hRX/XsDR0y+zyoeFAJFBDDDysHy2c+/d866eM3cmJvki/ZuUnzSUjk0CE40G6UdY75hNvPdoI5+8BaA3Z1n1nTfMnz07WxRrO3ojoS0RmmEeIw5aqmaYGNUyuW3xpQN6HJw7IHFwsKNkWU7ZRUoq6272GWIbrDuvRS56VNUBWRZKUGE5dPw5NtrkIrODVw5ZblWkm8d264tk9qt4tapmFBADG/2j18JTG9i28NppJugS8LWehWt83uyrpcliNi0bg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(39830400003)(396003)(38100700002)(66476007)(55016002)(66556008)(86362001)(478600001)(66946007)(6916009)(7696005)(5660300002)(66446008)(71200400001)(122000001)(52536014)(64756008)(83380400001)(4744005)(8936002)(6506007)(76116006)(8676002)(9686003)(316002)(33656002)(2906002)(186003)(9326002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?ygLt6TYr+zf0r9x1LRS1HtSoCzwsch84+OLhPZboOiPrS4k9CXdsMwNfs76+?=
 =?us-ascii?Q?UimXwKi77TcjXZAF70a9fdwqbKZbuRqYurg9RlXJLQzcOe1s4AVftCvmab3I?=
 =?us-ascii?Q?o/x0fK+6aWsIKAnA8bZI8AImYl2j45S4GhibsaXD7Aez0oXWJjSmrfFiDZ3p?=
 =?us-ascii?Q?S/MMLS6aLLSSzKptE7f5Qrpn19WfQXrq4xzJq1HTXiPmMHFjx9WMDBp99zMp?=
 =?us-ascii?Q?QPaWBDwsu8eZD5fnsVixfa5X5bqknuHbp6AXDeMbuU9aylWFGpVoxzsXyrAN?=
 =?us-ascii?Q?BocypAwxgL2tPWSprhH6omliG45+bz0rJJQ99zNECwyeRjr+kTPz84ZGVB89?=
 =?us-ascii?Q?aEmBJI61oqwFG63PO/pjZtQ1VSBYnMgKXBewJgaFWETJzm/jHJ8Qj8YtXIS5?=
 =?us-ascii?Q?IPrvxuoZe8ds09IBKTADbXmFpNch8RV38qWYfyllZzpCONl0od1QDTtc5Pd8?=
 =?us-ascii?Q?1yh6Y/kDhm0WgQhmtYx71ltS+nCbpz5M7vNIx9aXc8IkWGl34uwHsBm+DhlC?=
 =?us-ascii?Q?5YyJCMy+wBt/131KRul8t/WQ+i5eX4o3JfWtFivy0LLvrbzR/1ilfIyt1pro?=
 =?us-ascii?Q?yho5KCGgcKfKnDlSFrct2GcdrxPYF6FQDLnly7DtpieNG8cj9e4MMHIztRzr?=
 =?us-ascii?Q?DIrCw9yjgmTFGN6l+ZgqcDezjdOzugiWviDL6rdN7Kk0VtvfCW3qhBtifiSZ?=
 =?us-ascii?Q?xu57dfwVJoz116rI5HBOUFOvLINm8xZA/Q4SrRzBP10QHZyifw2VbOdoXV3o?=
 =?us-ascii?Q?ocpTFiLSuH1H44Vd2qGxEsmRCMUEPWkJxE7maWrA+hEUBT6aw2ahmfb7j+xm?=
 =?us-ascii?Q?I+nmJ36CKi3UePGdW7/dh03UxWb0w1oU1Do0e7u9OuAR2g1ZVJ8M6A1AOBev?=
 =?us-ascii?Q?/ntmjdNWiw3UieQ6c652+Wb7Vf7HJznC2Cdn8ZHrNjCMXIkLP+2tGx/1SvGj?=
 =?us-ascii?Q?YgURtxY6IYwT+gzCG2R1e+O0HBBfKnEsBuIUj4jysB37e0RDw87OUm1YfgYv?=
 =?us-ascii?Q?JCw6YyWk+6kZH9xuSGBzuadDEE6qcvXvN76vTcCDs4ojRj5jjlYhFZ7lcwZp?=
 =?us-ascii?Q?zGScKnp61ugsdlpzYOxan7R82DUv7akmwO1uEJjWmEuQvgCINYL0qBMHNwgy?=
 =?us-ascii?Q?mgR1q+AhDVw4SO+QYxmxVutHlca3FI2ksDk9InHOJ4lw3fUecpeBBJ2K4xZW?=
 =?us-ascii?Q?ie3Qcy7tWwKCPPmcCS8/XGZnjohyCJGMitRgs1Knp87bXmh4posw47DmFv/9?=
 =?us-ascii?Q?3W6m3a8yYJB68rjg9ACecO6KtXME+49lzWNH1Ed2xgin2wtdY0t9AdhwEeTk?=
 =?us-ascii?Q?68WYwpiiuQLUG5lkzY2P+3w8?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6923ee6f-940f-4631-9a2a-08d90bf97a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 17:00:37.7353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nmdi8FxH1NwU6JklYnbUnppvlFj+ZmqWb3za0E8ZJNUlePxfaX3yAxG1Y5YzOvy/iIvgGr3OnRmHnxG8LqbipuqjvLM4HWr8dv6rmXLOoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4666
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0102MB26302BA4C54F13FC351F8C0A885E9DB6PR0102MB2630_"

--_000_DB6PR0102MB26302BA4C54F13FC351F8C0A885E9DB6PR0102MB2630_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I just updated to Yocto 3.1.7 (from 3.1.5) and I got the following warning =
while building a kernel recipe.

  do_install: Task do_install requested do_package unihash, but it was not =
available

I tracked this down to OE-Core commit 0c28edf4bf0d2f92bf3a47406041c63acd90b=
acf ("package.bbclass: hash equivalency and pr service") and it makes sense=
 since do_package runs after do_install and in dunfell we can find the foll=
owing in kernel.bbclass

  do_install[prefuncs] +=3D "package_get_auto_pr"

Merging OE-Core commit 36fe4db8ae827a93abe9fce6740459d215411965 ("kernel.bb=
class: Remove do_install[prefunc] no longer needed") should normally solve =
this warning by removing the above line, but I do not know if that change i=
s safe in dunfell.

Could that be merged in? Or is there something else that could be done to a=
void the warning?

Our build system flags a production build as bad if there is a warning, so =
this is kind of annoying.

Best,

Diego
--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


--_000_DB6PR0102MB26302BA4C54F13FC351F8C0A885E9DB6PR0102MB2630_
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I just updated to Yocto 3.1.7 (from 3.1.5) and I got=
 the following warning while building a kernel recipe.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; do_install: Task do_install requested do_pack=
age unihash, but it was not available<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tracked this down to OE-Core commit 0c28edf4bf0d2f=
92bf3a47406041c63acd90bacf (&#8220;package.bbclass: hash equivalency and pr=
 service&#8221;) and it makes sense since do_package runs after do_install =
and in dunfell we can find the following in kernel.bbclass<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; do_install[prefuncs] +=3D &quot;package_get_a=
uto_pr&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Merging OE-Core commit 36fe4db8ae827a93abe9fce674045=
9d215411965 (&#8220;kernel.bbclass: Remove do_install[prefunc] no longer ne=
eded&#8221;) should normally solve this warning by removing the above line,=
 but I do not know if that change is safe in dunfell.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could that be merged in? Or is there something else =
that could be done to avoid the warning?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our build system flags a production build as bad if =
there is a warning, so this is kind of annoying.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Diego<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif">--
<br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
spinetix.com</span></span><span style=3D"font-size:12.0pt;font-family:&quot=
;Times New Roman&quot;,serif;color:gray"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB6PR0102MB26302BA4C54F13FC351F8C0A885E9DB6PR0102MB2630_--
