Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B934C0015E
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 22:51:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web11.677.1689202309969301271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 15:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.8.41, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvSlNuok/IXIJquJ2fCWJ3UPvAl+JcZcX8UrsUlmGhGoV8W+hRAa4ErAvJaWiDgUecyw9f0bmlX4+kl4SkDZkK4gC1IR3E8uxoZPPx3nXW+MtUVLCMvcyBT+2q4DXlrnXLgq52Vr4fOXrKl26UUIF+PGE6mwytFaF6QGCGDFP4bwg2P9MvFDNDRwRgWcbYNbqBhXZmH9eQBpWzHWYcwxHcism2GURpnOmu2s7ednx4go3eFsrqyakIfkjH5IkDT4ie05eAsgmV69qnc+CM1ZPRo6xOFLucdg6muHC4qxfOuG5OdMbM2x4DYpiRDspOSvxOCV70ZOhPoX7t9FpNKfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w260iwHiT0kWyiJrsSA/ieadh4Te5V6wjF2FzRAJLO0=;
 b=Wl2RaH/O611tvliETRteWpktmRqMEblM+xmaWwMPSMadBssfIUYy8tcpM8T+kGQiZg4WTlcBHEmhEdcaQH6vZjZ4+C+/63m+HSxHzLU84M5Ylzurg1UCVinAHopPC0cG9LNXHDUaQeAeLtbwhUgzZhh4KcAm3FdeQadSHSdefOfYFNGBeWHs+uj/n+UASG1d0xS8c05K8vizhwf+acFD1sFH5Q8Wfmr9Btat0XbX3KKNqFZTr1ZKZS42rC0AmQ9G2poaSQMIdl507kIKNSuvmr4TqflorRtFo0YsVuzw09qb1QOl3ELaPwuHB9dqWGkPXA6lMGSFh+hnifJkKl+oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w260iwHiT0kWyiJrsSA/ieadh4Te5V6wjF2FzRAJLO0=;
 b=0di/w1BQnFq/7eTgPfJd+3oY8HhbI7hEux9ATswsZvohyLMO6qQpI98fBlhlzsIeFeOaBgZnF5rLwVEMgvHeFWsQBttaqko9Idy+MLETIrU5c+0hS1wW84b8sUy7wapEyjjavVLygiEYXsdESLJaJStkPvP1u2sTJD/EC7h4NuM=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 22:51:45 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 22:51:45 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtQHzgf1cCG01pEmjH5DVhSvfAq+2mhf/gAAM7YCAABWS7Q==
Date: Wed, 12 Jul 2023 22:51:44 +0000
Message-ID: 
 <VI1PR04MB5373AB2EB526F803105F52729136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
	 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
	 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
	 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
	 <177139B6ABA154C9.19802@lists.openembedded.org>
	 <VI1PR04MB5373BCEB0EC347625C9A15E09136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <5649fdf59ba0e5aaeb93552af7f3d8e0e86787a6.camel@linuxfoundation.org>
In-Reply-To: 
 <5649fdf59ba0e5aaeb93552af7f3d8e0e86787a6.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB8409:EE_
x-ms-office365-filtering-correlation-id: a5e2a7a2-2649-459c-334e-08db832a9122
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fW94pSja9SiRHqOGxI7ePxo/8PaGtvPgG5/X6r8AjdNUEoiYqn0d4q8ze1HcyAarhWi9BqHO8sxUqno4pfRYJiBtrkdUK0GPwY28mboZQbdrmGxCLJlxeK2od/OECdelA+Cem0/DDBleqnb9dbEcfntDOEgWmnzmX9JaRPHns4uyDVIZxWp17m8bi7PCFTDLTPTik2W4d4ti5j1n9QrxRYohMRt7R77CH1ZDxu3Wxwd1mKwiV4YAKEMtHpHzxiU5dbsXAA3zS2UNHKA6gozmOxL8lPYham4ZXg8LdggIJ11i1haEFreVIVEmSUsr5/OLacffld9IFDSbYKciBLo0PGDqBn+XMWktzQsV+MzVFYtiq6jDxBMWTZeBSglrh5s+BwSbTldRmNKegChNHfE1wUpoPigUHDqk+HtABrsALty124E09I4U4L59juHitktNoyUcJgB0VQPz1C9hlwE42dMGDygjG6TdoPF+pjKkwP4Ed+0UvNFvy5U8uJxua+yv66faEigsV0dp0A+aa7XwOpwnO8adRPAtrOOtS20q4SelQSGg0gsDJLR0VRWrVDG7ln1t9khyFlTrFFPBkoEP0FhdGEDrVId6vDlM+ucTWC8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(451199021)(2906002)(55016003)(166002)(38100700002)(122000001)(186003)(26005)(6506007)(86362001)(52536014)(33656002)(5660300002)(9686003)(38070700005)(8676002)(8936002)(41300700001)(110136005)(4744005)(71200400001)(7696005)(45080400002)(478600001)(66556008)(66946007)(66446008)(66476007)(76116006)(91956017)(64756008)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?rhacLUcAh5wOD5QhetR61/SdH/+EBnDk92X0saj59K31i7Ed5CK3N6HF?=
 =?windows-1250?Q?Mw0lj0bpfyMObjIQme8YxjYZ9HOItl/Sq6/N3Q6SjfNYYfiQ1SrvMwSV?=
 =?windows-1250?Q?ctTE84HUEhBdBAyXR0V3oHO7mjyq9oEYSAfO42lly+/SKrmvhpvHn22y?=
 =?windows-1250?Q?/OpB4EYO6yleKGWJEwsTYvpaXeeWrxNAnmvZPIp54Ba8CRWX/HxXTq5n?=
 =?windows-1250?Q?tzzqSkZTIzTL7XUdqyWCnbFtsfls9vtD7SuG+3TUYr0SV1eEF7SYNQHn?=
 =?windows-1250?Q?DNOJ1jpjCxK5Pd2q1lzYZrVfb2kbXqSV5i1N2rGrWCPex69BPKg8Of+z?=
 =?windows-1250?Q?MBrCJfPNl1sPzd22RZP77OrDHbZYtzcio0qSTTxN4mXonqWrhrIuMfIE?=
 =?windows-1250?Q?gIKzme11zphh/2TDQrUkZm4W2iC4AAh/GIDX/l67uuUTSEvbPzFQKS9B?=
 =?windows-1250?Q?bx7zyTqZdGTqd3TvxkbWKz5rNfhMlgph1WKiCUb7G3/WWXB/ui3VyAyj?=
 =?windows-1250?Q?HVn5XOzEifrGuH4dOs3TZDICVDAMmaX0i0AQTKvMX9FYKC274XkPab+c?=
 =?windows-1250?Q?A3ZKOtabYQUm/tsq1qLkK2E/DAliOLsKf/4Ncr8PtgiWG6usep4wt0/o?=
 =?windows-1250?Q?GNVtYF3+d6LGy+a2Q/PCxgh/ikugJydFM8WwQxZuJFJOx44dUnW+wsC0?=
 =?windows-1250?Q?UYf2b3Hic7s63H5ClQnC44e0nSzP/EsVLssQVOyleNyrR44SGMQ0enXq?=
 =?windows-1250?Q?hTlrQG9OOWP+AdMZf8y2/hVqHR8CWq/CbhHwORm6cSHl2GKpwwQLfDaR?=
 =?windows-1250?Q?E1TT3oM1fS0KgzRjGYIZzO9S8sBmR3xxUcqi8QHDR+cHhrXnSXZQY56F?=
 =?windows-1250?Q?Gv1RhOCyEqpblZwad5mjW3nqTjPQw9TJlAB7et12rnEOcrEMnjxPATS+?=
 =?windows-1250?Q?h0+2JxAueT5NaPv64J6yWEoXLpC4KYElqBsdJm+Cd15lfTu72iZZAvYW?=
 =?windows-1250?Q?u8x86/5Or+1nYhV9nXRlGmtF902I1b3MO4+t4srLwWKeBFsKdwp5ymAx?=
 =?windows-1250?Q?0lAJd0afeprw1W02g5s+exWENT3EVR1B30tVqdqXD6ioUSiZPtFxkfd3?=
 =?windows-1250?Q?7TTnz7UkxaYq9smkypGZE9IaigO+kUSLpT82YRtT0WAEGlGdSYlPz5Pc?=
 =?windows-1250?Q?TvFUcCaqgCJKvX7S5rbuhe3/+6dIrhbIZN+xcDKM6XjVVMzvgg/zNpqG?=
 =?windows-1250?Q?owuKXsrjKgyOYqHStNyEZD47yPo/WUniHxO9b1vR4ElXXQzWDFwty1u5?=
 =?windows-1250?Q?g47w5+LnvEBU63q2HA/hufFsh75wJfA3/wliZnp7VmOHKuJ26LOAcdnN?=
 =?windows-1250?Q?dSmGziuFVgCPg+rMs9EWy5YeSYYuUBlTctIqAYO4H1mM7K4E6WX4Mr2g?=
 =?windows-1250?Q?zQkWf+qyFuDWpnJNOBcvCaxcMIlgoIO+t54VOYG3urs5yfb3c23hwMi3?=
 =?windows-1250?Q?SBicngukTKsbilKB7B/8LznWhvq+naQy3yR9S7GtBIcGEnXYzE23zcDr?=
 =?windows-1250?Q?uVam+vS10M1OnRGu9pvNSkDvZDVcCNLaxNzQ249CIvLuFZKEws2ZKUo4?=
 =?windows-1250?Q?6iF7EN+tUsDc1EfGuGRTQ2s0TIoSoS4dHzfYVVHvbbYztB45CbnBrBzm?=
 =?windows-1250?Q?/i39541aOOqWXcWnNqBOES0VfKjI7COqlsRXAsLlCijcGkmFutIJfA?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373AB2EB526F803105F52729136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e2a7a2-2649-459c-334e-08db832a9122
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 22:51:44.9589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMYwO9CUjBLCkEJwxDUBE9sI25OpdaCATS1ddxij215D2UAWk2+Q4Kkwqu7rHG7ltoMjeu1Uh7ErUPddh7079w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 22:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184229

--_000_VI1PR04MB5373AB2EB526F803105F52729136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

But I have sent already v5 with this change=85

BR
Piotr

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: Wednesday, July 12, 2023 11:33:37 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Alexander Kanavin <alex.kanavin@=
gmail.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

On Wed, 2023-07-12 at 20:48 +0000, Piotr =A3obacz wrote:
> Richard, but that is exactly, what I have written=85 wirhout any
> checks.

No, I mean that the right patch should be:

-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr acl"

i.e. add acl to DISTRO_FEATURES_NATIVE and leave xattr there.

Cheers,

Richard


--_000_VI1PR04MB5373AB2EB526F803105F52729136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">But I have sent already v5 with this change=85</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 11:33:37 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2023-07-12 at 20:48 +0000, Piotr =A3obacz =
wrote:<br>
&gt; Richard, but that is exactly, what I have written=85 wirhout any<br>
&gt; checks.<br>
<br>
No, I mean that the right patch should be:<br>
<br>
-DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
+DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr acl&quot;<br>
<br>
i.e. add acl to DISTRO_FEATURES_NATIVE and leave xattr there.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373AB2EB526F803105F52729136AVI1PR04MB5373eurp_--

