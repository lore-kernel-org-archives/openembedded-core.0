Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB58EC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 05:07:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15831.1788362815144593773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AkKivfxt;
 spf=pass (domain: axis.com, ip: 40.107.159.70, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTiK7q2briG3vdf5I/CYxRFMpeKrDhJVxAyxeFclwwJjEsrre5A+Ph6mh6tk3Yq1svb0eO6WRvMbuijjAEvMgFtmAklnlB5fRyRWlmsQF71aa/XrVyo093O6s366zUrLeTLG3xFmSNAa3fQKjs9WhSJngvjcGezdF2mhJegTdbn4qQbA+f6/9MfVfzTa9gBzchPiEDy1l4Pq7rFoo42ZVW0UTMcGLWKtAGB+Si75X7m3oreaPpUIir1D52N1kpcjMaEHDoKIpRu7tZ4f8KcrKsK9RoxnNx2Q4NLsgvt14itJXY6dZtFlSbTsJBLEIRQwoCcTazXgX8RS/l36eMRKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rW7kVnLw0pNIgD4Jd233bd7BER256sFXv3H677JCUKk=;
 b=QCiL3U9JzO7GVmQtn2ccITCJ+bG5rwdiScs34Dw4xOQ5OO8ZQCzfiMuqC5ssslX3auumtQic+rGJWH2pRFuNT5xxaCc02K7OFjydlPqqjx98+CNivun5j/Mn0RFu4sVj3i/BPowztDjDjOOiJZTJLiuKbyG57J0+mKHXY0fqFyf3/Rh2hXgfN3o3xM66kCV8auEBS78Q4Ruc7q2aSj5dNnFsaF9dmFqrHlRXv9Xu8POo9H+VTEREyUDKVCogZH9iM+K4sfwD6No8KRvupF9MLnOIrQUGXST5inD3Ov1kXw85HVrEwabgOBF3E1uh4EDuEv6OLT01zygteHVtLR57XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rW7kVnLw0pNIgD4Jd233bd7BER256sFXv3H677JCUKk=;
 b=AkKivfxtyBpMtbHK3G2sGUTyChcq3AkrbV6S1iXOfw/xN9VZ7OvlE4jQsai4gzRTzwDxaGumGkFfJaiLKwKeFg4w1SlhmUzS7oNljCo+9jmIfRIlocBBC4SZNDgzal5Mgu5eatj6EfiiBf4RrJ05zI4SVLdAKf8dl2y5Tl079zQ=
Received: from DBBPR02MB10462.eurprd02.prod.outlook.com (2603:10a6:10:52e::9)
 by AS8PR02MB6709.eurprd02.prod.outlook.com (2603:10a6:20b:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:11:03 +0000
Received: from DBBPR02MB10462.eurprd02.prod.outlook.com
 ([fe80::5e78:c08c:a67:2b03]) by DBBPR02MB10462.eurprd02.prod.outlook.com
 ([fe80::5e78:c08c:a67:2b03%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:11:03 +0000
From: Gustav Lindberg <Gustav.Lindberg@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv6] boost-asio: Add recipe
Thread-Topic: [OE-core] [PATCHv6] boost-asio: Add recipe
Thread-Index: AQHdOrZpeahsXs2+4Ee0Z/xZLuMpw7a7L6qAgAAwVh0=
Date: Wed, 2 Sep 2026 15:11:03 +0000
Message-ID: 
 <DBBPR02MB10462218FD1B6135FB85DC4B087B72@DBBPR02MB10462.eurprd02.prod.outlook.com>
References: <20260902083814.3966089-1-gustali@axis.com>
 <CANNYZj-U2CMMmb51x2phvgMwT5O+dPh+OrOu4hy=GjAjezbO2Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-U2CMMmb51x2phvgMwT5O+dPh+OrOu4hy=GjAjezbO2Q@mail.gmail.com>
Accept-Language: sv-SE, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR02MB10462:EE_|AS8PR02MB6709:EE_
x-ms-office365-filtering-correlation-id: 8daa1099-51f1-4013-df2d-08df090467bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|13003099007|38070700021|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 FaoYSnqon3GLproFfTfcy8wpbeCNUN1hxpDpWWGgwDG6RfnxXeDBxDqypMePvoNyv37/GQdSl+6lfO6QmYTY5QX7YKVdiYafvp1zGBk8BnR0HDbCtu2R+kCjNaECs3RR7aIA+fy63WgVcApOpcv6Jc+NPTlcStKbLKeVJ6NaY3D5L/GGC3+ZZuhONJeJv0wvolPWij8B0ShRlNaTRUB+WLEO+x6tE2CCV98ftcdCZFFEPE0latrr2+Sq47FSXIFDeOc89T+CLC56hrIj2zFE/kaPHgYGvsD8IwtX0OcmcL6FzwJuiGy8mI3s2doUvl8a/o+9UZ01jDls6Lfvy/rG/ZJUz0R4m+NLU9Z/sM4XCsZCFf86TcvGnwXQWD2jLJ7wC1/ZpuT7DfF55Bjg7eFv/XKo9zXR38CRCGFpcbFeI6B6meStvkda8vQq3ZN5vTR9HP8wOnEQrIVQ/dROO1d19+mcBe3YQBzzl1MQLX7R/mQsGz8N/DXEENuwh9Er6SuAlOpmPkTS9THCgwMts7p8G7bQ7mYC4GA9K12ZFIxk18QZYk6r8v2Zqi/4N6IHMnhfy0TvBshtGgapRb3UU9mcWZUlpRhyaKbvs8XEKx8flJ1oYoAqCDRTwIoSc6d7Uh1oXoeFFdT2J8kvpFf0wdsct8u3vSIfcIZDzjLVo3OSt5YQdBmpqluRUkqajpYSdGNuur4ZyBuuUjLydNEBe25J+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR02MB10462.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(38070700021)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?S5wNMkW8DyHHGiX25fI8HUSsE8yW4yAyptl3HucpUuOTcA7UdUtHBAt+0l?=
 =?iso-8859-1?Q?RQ3aLVBai6cjJG4BsbVKUrwr5QVHWyVqP0x2DxeprEB1HKH1TPNaeoB/Qv?=
 =?iso-8859-1?Q?W5BqYiwjPwgarzPITvpXPtlJLKJJWdI/Uc12Awyux2grn1M1wpxJ/BrBi/?=
 =?iso-8859-1?Q?c9lI0/AVVfwjaEuEDh2ICSdK5ImtfK850CN2NR4lSmBl8WMEPKGW40T4JJ?=
 =?iso-8859-1?Q?oysHiYbrc74VB3mi775n4qwTofze2oKah8mUXiwZ2dg5ajYZ5OfjMRrqiG?=
 =?iso-8859-1?Q?PVmgRScicA6APQNbEPUTw0ZsIhZACTN5U0w1w2vxcTnFCiKjeKG58ZaFfd?=
 =?iso-8859-1?Q?eDYYJZzB1u85rv9p+rsTDwHBWYh6rOaDK7StnU0V2CT4gzVVM+UHMJDdcn?=
 =?iso-8859-1?Q?VzFkauG6tRN4e2VGVqMO/gLnOhjB/kGtFD0qsyqyqBvLgrrVfFV0sD/3Us?=
 =?iso-8859-1?Q?gmSnOGjmC9p5YOgFOUP10jA2NDvUm5+xym4JCj5c1vh4ASE698p+8g0vkD?=
 =?iso-8859-1?Q?JAokUOKy8yzDUSQM9A0qRuYr18qU6CAqQnFfWj18jnJ1ofXtT35c27oiqD?=
 =?iso-8859-1?Q?moxYmaymxBiyrIXgCHBG6+SD7vbRWyqIJajyVsse67CF/xq6z8aTM7hbpu?=
 =?iso-8859-1?Q?TFsfHNDywafFnD6IZTqmr+J9hbkgSve0cxYE0VOTbOPdt+SYjAbA9QURlI?=
 =?iso-8859-1?Q?bMZKdKlnJHPIl7r9/Lo6qvK6uhbBfUA135iXzFgmYa2NU0YFpz29/9OzAs?=
 =?iso-8859-1?Q?Iu4lyD7whMvRYdBf6HYOm1cmIic4jKBUM3z7DLboW3BhSrfk9vMI5YoCSf?=
 =?iso-8859-1?Q?QgZIGPlxMbiIJdKXW9+/LxYlbqMOKf5Qpgas8jNyOivfYrRkHL3oc2mSUR?=
 =?iso-8859-1?Q?YtRlNYE+py43PvnUtNHajIeCZRwdECjKPIqzto6IjcaVF18nelLXOOLEzC?=
 =?iso-8859-1?Q?AT0KGeHLWsSWTYbIk65h6ciM9EkdSvowetn1cx1klhLvSd8OIKl+PqmljU?=
 =?iso-8859-1?Q?50DhVaxGKE3yCIZ8JoT1umCbo91fFicSuPVmMvYWEgY0MaOAvIoqG/87FP?=
 =?iso-8859-1?Q?vNyreNFJLsXcIV+IgJWiOkJpVlAR8HowtPRzc8qBL9EkqDmTuAwYpl4GGV?=
 =?iso-8859-1?Q?ylZXeKMPfRlzD9p8KN+zK42C7M1a5UjltKYsvbWWQJCe3Y1J190E3jywmn?=
 =?iso-8859-1?Q?B/6OAk72DPVd2AdgtXNi6hQRkHVhgTXheC/YfT61Q9vSaEQeA0EWm1rtR7?=
 =?iso-8859-1?Q?vek3g5KIm38yKK1NMf5g0+Y4t8TbXsMR75E2RCj/GqObsZbxrr6eLkItK6?=
 =?iso-8859-1?Q?CQ28rPMj++ZATtS7zXwYhcK+HscyZhpPFB1ebTl93gIDSmyHyV+k59debA?=
 =?iso-8859-1?Q?cYkiIAINVklQKR8g9zoIbUI8GqPjFPppoEwlPDr2KBCRVWH4l3Mca2ecL7?=
 =?iso-8859-1?Q?tQxQF2KOlzaU9fO8tMVppN0x9LpaygAgxG+t8shpQl6mkGfn/VE69zEvei?=
 =?iso-8859-1?Q?8SaD8TO9TK+z3MGSpEPq76RDCIEovc+t2n4RRQVj4r7BaMTz0eKYaN+8U4?=
 =?iso-8859-1?Q?/SbWzCCzhOGr0uElwWiu8Jh3r68SQa/EYRIex581OOCMG7u9PjWKoACvr0?=
 =?iso-8859-1?Q?WS1In2QM31MnR9vgo+OlcDq65RHxgpWXDv3TevNBDBlGqU0gHRY7V7161a?=
 =?iso-8859-1?Q?G8file+SbpSkgdi3SYaPKKAVIsjQMZxX/0WJJdP43Y2OZdtmvETBSN0MIH?=
 =?iso-8859-1?Q?bcS0WD9Q0Ccxnymvx9m4XduplKDyNK3EcHYhJo/6xhbTyF?=
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR02MB10462.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daa1099-51f1-4013-df2d-08df090467bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 15:11:03.4417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yTUGv5yBWzdFAGF4tzj3v7rjRDrgp5utw9ZDYBIGi8YUK1bNocNjGIu3PJaE685l1rYTkrHniA1iSeXSfmtLOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6709
Content-Language: sv-SE
Content-Type: multipart/alternative;
	boundary="_000_DBBPR02MB10462218FD1B6135FB85DC4B087B72DBBPR02MB10462eu_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 05:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244997

--_000_DBBPR02MB10462218FD1B6135FB85DC4B087B72DBBPR02MB10462eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Why specifically asio and nothing else?

Because it's the only one we need that's set up this way. Not all boost lib=
raries are set up this way, for example boost-json already has a pre-built =
shared library (and no header-only option). I don't know if there are any o=
ther libraries that are set up this way, but if there are, then people who =
need them can add them.

> If we want to build bits of boost as shared libraries where upstream only=
 supports them as header-only libs, then there should be a general solution=
, and ideally one that is accepted upstream.

This is the solution that's accepted upstream. Boost-asio is header-only by=
 default for people who don't need a shared library. But it officially supp=
orts the BOOST_ASIO_DYN_LINK flag for dynamically linking to a shared libra=
ry that we have to build ourselves, and they intentionally don't build that=
 shared library since it's not needed by default.

Making these changes upstream would require everyone who uses boost to buil=
d the boost-asio shared library whether they need it or not, which would be=
 wasteful. Note that my change doesn't require all openembedded users to bu=
ild the shared library, it's still possible to use the boost recipe without=
 the boost-asio recipe and get the header-only version of boost-asio withou=
t the shared library. The point in making these changes here is that users =
can decide whether they want to use the header-only version or the shared l=
ibrary by using the correct recipe.


________________________________
Fr=E5n: Alexander Kanavin <alex.kanavin@gmail.com>
Skickat: Onsdag, 02 september 2026 13:59
Till: Gustav Lindberg <Gustav.Lindberg@axis.com>
Kopia: openembedded-core@lists.openembedded.org <openembedded-core@lists.op=
enembedded.org>
=C4mne: Re: [OE-core] [PATCHv6] boost-asio: Add recipe

[You don't often get email from alex.kanavin@gmail.com. Learn why this is i=
mportant at https://aka.ms/LearnAboutSenderIdentification ]

On Wed, 2 Sept 2026 at 10:38, Gustav Lindberg via
lists.openembedded.org <gustali=3Daxis.com@lists.openembedded.org>
wrote:
>
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.

Why specifically asio and nothing else? If we want to build bits of
boost as shared libraries where upstream only supports them as
header-only libs, then there should be a general solution, and ideally
one that is accepted upstream.

I think you need to discuss with boost upstream first before proposing
something custom for core.

Alex

--_000_DBBPR02MB10462218FD1B6135FB85DC4B087B72DBBPR02MB10462eu_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt; Why specifically asio and nothing else?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Because it's the only one we need that's set up this way. Not all boost lib=
raries are set up this way, for example boost-json already has a pre-built =
shared library (and no header-only option). I don't know if there are any o=
ther libraries that are set up this
 way, but if there are, then people who need them can add them.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt; If we want to build bits of boost as shared libraries where upstream o=
nly supports them as&nbsp;header-only libs, then there should be a general =
solution, and ideally one that is accepted upstream.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This is the solution that's accepted upstream. Boost-asio is header-only by=
 default for people who don't need a shared library. But it officially supp=
orts the BOOST_ASIO_DYN_LINK flag for dynamically linking to a shared libra=
ry that we have to build ourselves,
 and they intentionally don't build that shared library since it's not need=
ed by default.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Making these changes upstream would require everyone who uses boost to buil=
d the boost-asio shared library whether they need it or not, which would be=
 wasteful. Note that my change doesn't require all openembedded users to bu=
ild the shared library, it's still
 possible to use the <code>boost</code>&nbsp;recipe without the <code>boost=
-asio</code>&nbsp;recipe and get the header-only version of boost-asio with=
out the shared library. The point in making these changes here is that user=
s can decide whether they want to use the
 header-only version or the shared library by using the correct recipe.</di=
v>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>Fr=E5n:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Skickat:</b> Onsdag, 02 september 2026 13:59<br>
<b>Till:</b> Gustav Lindberg &lt;Gustav.Lindberg@axis.com&gt;<br>
<b>Kopia:</b> openembedded-core@lists.openembedded.org &lt;openembedded-cor=
e@lists.openembedded.org&gt;<br>
<b>=C4mne:</b> Re: [OE-core] [PATCHv6] boost-asio: Add recipe </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">[You don't often get email from alex.kanavi=
n@gmail.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWA0ce14ee9=
-907b-b648-5843-f98f7803d010" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">
https://aka.ms/LearnAboutSenderIdentification</a> ]<br>
<br>
On Wed, 2 Sept 2026 at 10:38, Gustav Lindberg via<br>
lists.openembedded.org &lt;gustali=3Daxis.com@lists.openembedded.org&gt;<br=
>
wrote:<br>
&gt;<br>
&gt; This is needed to build boost asio as a shared library rather than a<b=
r>
&gt; header-only library, which is needed to save memory.<br>
<br>
Why specifically asio and nothing else? If we want to build bits of<br>
boost as shared libraries where upstream only supports them as<br>
header-only libs, then there should be a general solution, and ideally<br>
one that is accepted upstream.<br>
<br>
I think you need to discuss with boost upstream first before proposing<br>
something custom for core.<br>
<br>
Alex<br>
</div>
</body>
</html>

--_000_DBBPR02MB10462218FD1B6135FB85DC4B087B72DBBPR02MB10462eu_--

