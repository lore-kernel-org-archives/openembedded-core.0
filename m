Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.76])
 by mx.groups.io with SMTP id smtpd.web11.9992.1608633654632932195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 02:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=emyp1Nbr;
 spf=pass (domain: spinetix.com, ip: 40.107.3.76, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmAbGakSwXQW8SjkbTzkWOr21sZPy/uo+5rppH9Vej7L9a28cdAKprJr5gt5qzRNoMcfGuIqdc7FBzURyhbZgqeb5Qblrcph3xUfLoTMHAvgjLXzOTEt4Fq9UMsuQH3vX8zO7ADhLc6IbX+p6gjdBgkjcVAtRHfD3bX5RB1HBzoMns0J68KwA0m061f/1rqlpIOGWCpl9W1lLKt4fMxCSESMa9uzwnrXfzVUKhKcO5TxXkaQGudeyKi86JZQBeZY59M+1fJ8nkpZ5QF2owNI7GpuWHJchLkrRDEsjUYQP7X8zqtvc726+6TA7hOh+cCR/1HJZo6L5PiU+1XePwdQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HnZZk+PAFuYx1pBY4OF3oSL0jWPUds11FqdyGBRq0E=;
 b=oAYRylOTV0cvzQGxZ1WePWy0HuqSiybNuIYgdBAgGpi9lnGDChXZFD6QQHmdb3PjvsZ2RX9IeidLFaI5b7sG/CPiAvkQurymsI6IEUeg8Yf6P+RZ2aAygcBaDxRTa/B0tAOMsstmzXiI6gZ5+CtK40WyaojOaw0lNUDxi/Fpgeel6a83B9C6kKXpe34Fk3SBjnij6P/0rk03MfMmH/cYtYIU2x89WOzuKyOGqHMSzRC5VZBkjyW3ppFx0pQ26DuyqwbycjtXbFWYBHYc4vBj4zoP6rur/t4RIw9huEH3QOoKEeqMmsSiShxo205oiyZFrXCWRIXLetk/ADepNeiznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HnZZk+PAFuYx1pBY4OF3oSL0jWPUds11FqdyGBRq0E=;
 b=emyp1Nbrc+33X1LamnbIlNSkQK+HMptyHe/A9Y0Ay3cRLp7wnLY0CY2ic8/3kfGQnui9uONf/Hntz/d9pmsz6V50eenHPsNCxLlhHtn/GJ+/pDtN29GbxMyV5S34yMMh2ml/p/3EhMOaOno/EG+rT8nEQRpFjfHK2HrsF/TwxKs=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6838.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:190::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 10:40:48 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:40:47 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Changed kernel dependencies cause on target kernel update woes
Thread-Topic: Changed kernel dependencies cause on target kernel update woes
Thread-Index: AdbYTtiRUEMarzUxSByEURhpNB++Vw==
Date: Tue, 22 Dec 2020 10:40:47 +0000
Message-ID: 
 <DB6PR0102MB26307368C18F3EF58DB5A0F088DF0@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d61cbef0-dcd7-47a8-6e9a-08d8a6660b52
x-ms-traffictypediagnostic: DBAPR01MB6838:
x-microsoft-antispam-prvs: 
 <DBAPR01MB6838A436E757279E03C0DD1188DF0@DBAPR01MB6838.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rZ73RHS4MhR84Y0toBCuLF4G+E1+4tFOI73SLCiwzGAIHf+KrKBUkyGju4vGr+EAdb2yKb8pVHF9NqTsFPALRHzi7NB9HbuX3tk9t3HP+NOXQkxg7jbk6outCumXEy3leAKEpMnoYWqd/0z55rpyFCDbIQezF/iB8bnPo72iNWtXewuWrh3iVKaMOfYQu2Jw2Nn/uXrzInuJFDvRLYhPmaiWivjBhuyAqhVGQkl++VaiYaMxbbG/PTuF4xNYlHX+zguUr71yn6SBehnuyYQ1euv5C3ysdbmYGjYdEx79ZQNe55OzV9MTiYKZ9eJzTSUX6A8cHmyX011yrxgzYMPrrZQf4PBR5Bd2oIljQiWLR/YmOeKFZB11+EVYbhLPjb0p1o7YDWNAHpbwO9xYLAb4Gw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39830400003)(366004)(396003)(6916009)(33656002)(83380400001)(66556008)(26005)(316002)(15650500001)(5660300002)(64756008)(66946007)(66446008)(66476007)(7696005)(2906002)(8936002)(186003)(6506007)(9686003)(52536014)(71200400001)(8676002)(76116006)(86362001)(478600001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?sFyPHPXqzXS4bIYXl7iILQZJrbEr57jMXe1k4UmN0BbN97OimOU+qVEGNdjE?=
 =?us-ascii?Q?RMl+CuSVqAPfb8TceclIj8Bgz6osX0DVEneAF7N2yoW0aWm5pqpzuC3l3oxn?=
 =?us-ascii?Q?0oQGW8NCio5QEu3QXWGXCq7V/zFzh1nVp+/XqHGI03P1VYy3qxAPcHZRM+MN?=
 =?us-ascii?Q?0KCUOCGXbXtnrdli56xjsKdkLXROTwrCUEpAm9ganj9T7pZzgHBFPvbbkzpv?=
 =?us-ascii?Q?+bQqpnwgFggNKR9XZdb9vLmGewcnShE4PgfIvLLBBVV6H4iMz5Lm4JeL3YZ9?=
 =?us-ascii?Q?aP8dr8919RGul2ASjbIIQ3tnNLG448XvU9jVdZp4PizDcdll5XOvj1re1auS?=
 =?us-ascii?Q?EvQc7YY25jTI9Fbr0ndSlSbflKFSYuPRHh5N0+vAAPf2hXcV5HyEPrGkRwjT?=
 =?us-ascii?Q?1Re+Rl0IPwZyfoFEbQHktL2GRHg6lWkcAZZDUgFmI4ATxpsQA/N+H3GtL5k4?=
 =?us-ascii?Q?OJl0iR5y7m6y3WGOR6uVit+mdxB/Dqf7/RUo+dFNg7/c1Jq9Szh08WiqRogd?=
 =?us-ascii?Q?FZoQMZoyY7r0FPE4TTsieFEME9bTMeN4KUUssZm4VbS0yY3wnkVWhIFIMj1z?=
 =?us-ascii?Q?xojFKEzHWLgB0wG7aVeBJrkmg00pt0CTD81Ncv94WDqJZFSXNs2lXw6BniNb?=
 =?us-ascii?Q?9Q349N9bAlf2zjKH1fW7Pom3suJHY52J/pJfT/Dxaim7rfacDT8PPtl8iYTw?=
 =?us-ascii?Q?eTelP2Db4ccZjHGIJeRA3TVApqyBu+fOZBZzei9K3Gove2dDy0OY74H1MAt5?=
 =?us-ascii?Q?xlKu98CHGOLrphC6fSe9UTcPw7HW+VaYAIsIEUFAzTVT8DeKVwi7Naom7IE8?=
 =?us-ascii?Q?xOYS88tLMAXf8qEcqSsIVr9IiVL3tYW/CFdqVmsD0Bgpm0RMaBzkMeI/MPEV?=
 =?us-ascii?Q?hspM7RkzXkZ6+9saZxlbZjCWuLGoVaHSwnMuX5QsHWeXZu2WTU84Z0mz9L08?=
 =?us-ascii?Q?Knb0+IiG7CYvSzacKg808GH6n30YpPG6iBIFu5+ODHI=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61cbef0-dcd7-47a8-6e9a-08d8a6660b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 10:40:47.7033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpOLhy/DeoOjLeSuT5aO1IrNSq9hEA0jTuazqGD0jZaYY27H18tdgBzK6ABnshT6mLTG1zYLSc6V5/rYadsK9rInmEgGS71kdUWA1vogkM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6838
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0102MB26307368C18F3EF58DB5A0F088DF0DB6PR0102MB2630_"

--_000_DB6PR0102MB26307368C18F3EF58DB5A0F088DF0DB6PR0102MB2630_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am experiencing problems with on target updates of the kernel in dunfell =
because the way runtime dependencies are generated have changed.

I was on thud before and the resulting runtime dependencies on the packages=
 (rpm and bzImage in my case) where the following

  *   Package "kernel" requires "kernel-${KERNEL_VERSION_PKG_NAME}"
  *   Package "kernel-${KERNEL_VERSION_PKG_NAME}" requires "kernel-image-${=
KERNEL_VERSION_PKG_NAME}"
  *   Package "kernel-image-${KERNEL_VERSION_PKG_NAME}" requires "kernel-im=
age-bzimage-${KERNEL_VERSION_PKG_NAME}"

In dunfell the resulting runtime dependencies are instead simply

  *   Package "kernel" requires "kernel-base"
  *   Package "kernel-${KERNEL_VERSION_PKG_NAME}" requires "kernel-image"
  *   Package "kernel-image-${KERNEL_VERSION_PKG_NAME}" requires "kernel-im=
age-bzimage"

But as both the old and new kernel packages provide "kernel-image" and "ker=
nel-image-bzimage", only the "kernel" package is updated, as it is the only=
 package which increases its version / release (the other packages change n=
ames since ${KERNEL_VERSION_PKG_NAME} differs) and the "kernel-image" and "=
kernel-image-bzimage" dependencies are already satisfied by the old kernel.

I traced this change of behavior to OE-Core commit 920beaaeef62b558e046f32c=
8ef0332250969ef1 (package: get_package_mapping: avoid dependency mapping if=
 renamed package provides original name), included in gatesgarth but also b=
ackported to dunfell. Before this commit the package mapping took care of r=
eplacing the dependency on "kernel-image" added by kernel.bbclass to the ac=
tual package name, which is no longer the case.

What would be the correct way to address this?

One solution could be to have kernel.bbclass add versioned dependencies, li=
ke the following (the ones for RDEPENDS_${KERNEL_PACKAGE_NAME}-image would =
also need to be versioned in the same way).

RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D ${EXT=
ENDPKGV})"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image (=
=3D ${EXTENDPKGV})"

Instead of the current

RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image"

That solves the issue for me and it kind of makes sense that the "kernel", =
"kernel-${KERNEL_VERSION_PKG_NAME}" and "kernel-image-${KERNEL_VERSION_PKG_=
NAME}" packages always be at the same exact version, but I do not know if t=
hat would break some existing scenarios.

Best,

Diego
--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


--_000_DB6PR0102MB26307368C18F3EF58DB5A0F088DF0DB6PR0102MB2630_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
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
/* List Definitions */
@list l0
	{mso-list-id:1349679743;
	mso-list-type:hybrid;
	mso-list-template-ids:1887079224 67698689 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am experiencing problems with on target updates of=
 the kernel in dunfell because the way runtime dependencies are generated h=
ave changed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was on thud before and the resulting runtime depen=
dencies on the packages (rpm and bzImage in my case) where the following<o:=
p></o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">Package &#8220;kernel&#8221; requires &#8220;kernel-${KERNEL_VERSION_=
PKG_NAME}&#8221;<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"mar=
gin-left:0cm;mso-list:l0 level1 lfo1">Package &#8220;kernel-${KERNEL_VERSIO=
N_PKG_NAME}&#8221; requires &#8220;kernel-image-${KERNEL_VERSION_PKG_NAME}&=
#8221;<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0=
cm;mso-list:l0 level1 lfo1">Package &#8220;kernel-image-${KERNEL_VERSION_PK=
G_NAME}&#8221; requires &#8220;kernel-image-bzimage-${KERNEL_VERSION_PKG_NA=
ME}&#8221;<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In dunfell the resulting runtime dependencies are in=
stead simply<o:p></o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">Package &#8220;kernel&#8221; requires &#8220;kernel-base&#8221;<o:p><=
/o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:=
l0 level1 lfo1">Package &#8220;kernel-${KERNEL_VERSION_PKG_NAME}&#8221; req=
uires &#8220;kernel-image&#8221;<o:p></o:p></li><li class=3D"MsoListParagra=
ph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1">Package &#8220;kernel=
-image-${KERNEL_VERSION_PKG_NAME}&#8221; requires &#8220;kernel-image-bzima=
ge&#8221;<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But as both the old and new kernel packages provide =
&#8220;kernel-image&#8221; and &#8220;kernel-image-bzimage&#8221;, only the=
 &#8220;kernel&#8221; package is updated, as it is the only package which i=
ncreases its version / release (the other packages change names since
 ${KERNEL_VERSION_PKG_NAME} differs) and the &#8220;kernel-image&#8221; and=
 &#8220;kernel-image-bzimage&#8221; dependencies are already satisfied by t=
he old kernel.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I traced this change of behavior to OE-Core commit 9=
20beaaeef62b558e046f32c8ef0332250969ef1 (package: get_package_mapping: avoi=
d dependency mapping if renamed package provides original name), included i=
n gatesgarth but also backported to
 dunfell. Before this commit the package mapping took care of replacing the=
 dependency on &#8220;kernel-image&#8221; added by kernel.bbclass to the ac=
tual package name, which is no longer the case.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What would be the correct way to address this?<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">One solution could be to have kernel.bbclass add ver=
sioned dependencies, like the following (the ones for RDEPENDS_${KERNEL_PAC=
KAGE_NAME}-image would also need to be versioned in the same way).<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">RDEPENDS_${KERNEL_PACKAGE_NAME} =3D &quot;${KERNEL_P=
ACKAGE_NAME}-base (=3D ${EXTENDPKGV})&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D &quot;${KE=
RNEL_PACKAGE_NAME}-image (=3D ${EXTENDPKGV})&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Instead of the current<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">RDEPENDS_${KERNEL_PACKAGE_NAME} =3D &quot;${KERNEL_P=
ACKAGE_NAME}-base&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D &quot;${KE=
RNEL_PACKAGE_NAME}-image&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">That solves the issue for me and it kind of makes se=
nse that the &#8220;kernel&#8221;, &#8220;kernel-${KERNEL_VERSION_PKG_NAME}=
&#8221; and &#8220;kernel-image-${KERNEL_VERSION_PKG_NAME}&#8221; packages =
always be at the same exact version, but I do not know if that would break
 some existing scenarios.<o:p></o:p></p>
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

--_000_DB6PR0102MB26307368C18F3EF58DB5A0F088DF0DB6PR0102MB2630_--
