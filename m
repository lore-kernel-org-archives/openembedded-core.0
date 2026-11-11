Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5402.1794386943489971302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 00:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HVbzlwUc;
 spf=pass (domain: axis.com, ip: 52.101.69.33, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4SkPDD8gPuA0YrKGRC26d2qckeyno5TUaV2q7xmRqPWrtR1bigbGsFF/S6gm+N3wBxuALiCUMNgBv1vTEyfUaejZBJ8sRZpkYTUwVZZwoLhkMhmgpDYLBqgTYQaI0q1bXpXUzCMQZRD2DqNhxyYBiY/YNHw4RiZdyydNZ5IFRRDDdTzwFueXTg+x1lf6ZvvD++QYYd/3bTefkyh8gWBkdnja+J1BK581l21ezSdpDE1D2zhZQv2z75Tfm+k1NhRmqIBv6jbHtQitaAdeOZKrfs7YgpkLSZZhyR8z4im1C67phjm6dSQMIV7/mIdGNmiem7f4ErLv6aWd3NZas6jiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XksrVCaCjQwK8nZCz5ySBHdJGuep+UC2o16cCBW3so=;
 b=MGpyqo6XkN1IP2Oh3iCAPWopZTHznsdad1tC9OzNtahhCyahuyEECxRw4mU3eWZDmGumVbhRX2otWITQibNy7DdEWUcUKng5Yqw3tHSSrAEmv4cC6yoNLBaBxbD6r/RLyQop4sAWPaJF+WsS6zPPEB11W5AKufsQ9JWlMbTvuHdDNDQugCwvFH5OnJXW5W/CVaolhNQGJNjloKwfgjKJCZybHv2HkKdKH2ttWbwsHIu+JfDFup9JuwbK4LrOFUxB87DoduX1CKg4h1DjM2799TZ7e5bcHjIE8kyBSFOisX2rYdRQyWvy81RmTVXAAlU3pfYsVw7QKQlh0aY7RI5NEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XksrVCaCjQwK8nZCz5ySBHdJGuep+UC2o16cCBW3so=;
 b=HVbzlwUcfeC2Asdk+7b18tO4DB0XRJjJbPB2eyXkK85FkrCVbPzKPs/jgm39a/gIXyJYaLPNvt6bXgfoqCwIHA5wjMdayp1ZFItTPWhFAFEriwaEl5VXi2aaVxB1+VRRih0w6PcJFXonq5SFLrB8igGSlDtIoe1WdtxWmjchTmc=
Received: from AS8PR02MB7352.eurprd02.prod.outlook.com (2603:10a6:20b:3f8::9)
 by DU4PR02MB11651.eurprd02.prod.outlook.com (2603:10a6:10:640::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:48:57 +0000
Received: from AS8PR02MB7352.eurprd02.prod.outlook.com
 ([fe80::3de7:e9ce:5b9c:1c5f]) by AS8PR02MB7352.eurprd02.prod.outlook.com
 ([fe80::3de7:e9ce:5b9c:1c5f%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:48:57 +0000
From: Anton Skorup <Anton.Skorup@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Anton Skorup <anton@skorup.se>
Subject: Re: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Topic: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Index: AQHdbDY3/rZoEXIhL0aVxy9CcRW9kbcfi5kAgAkONDQ=
Date: Wed, 11 Nov 2026 08:48:56 +0000
Message-ID: <AS8PR02MB7352F4644A226D66144319B8E2712@AS8PR02MB7352.eurprd02.prod.outlook.com>
References: <20261104082635.2183419-1-antonsk@axis.com>
 <9BFE2C7F-923B-40ED-8C86-7E181E528B4A@arm.com>
In-Reply-To: <9BFE2C7F-923B-40ED-8C86-7E181E528B4A@arm.com>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB7352:EE_|DU4PR02MB11651:EE_
x-ms-office365-filtering-correlation-id: f87da8b6-382e-49b8-a058-08df3fd09f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|8096899003|13003099007|4143699003|11063799006|261102123227099003|261028144727099003|261021133027099003|261021135927099003|261021121427099003|261022115727099003|261026130827099003|261026140227099003|56012099006|261022075727099003|261022105027099003|261021123027099003|261026135527099003|261021130227099003|261026121527099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info: eIGRTktt/sblfOCooXF6ZPTAjih1hAcVu2NTweOAEAwB6rPbu3xlEWKFEMKi3df00kwYkp607yOklmMrfA+7ZgTHH+DDKr0p3QG1U6jmKY618mciH5W0bL2lkyFYaAvzEaV0u0CNQ68JDjcUs0fcoAykTnOLZTuN1Y4owHx2Kihf6FtzK84M6nGZp+KY2gCSuhdYQySzdSePPE1pOszVyLKXxM7Tpt+pWtqVFP16+pf8PACQ2PRjxaYggEOHmLsp41TosSM7raG37gD25y3oVQH39w/HyGXtfElypNCnZx2vjF5TcOism1NAG9UN4Gy/E+Gdq/Vi5Dq3ALgJMbqz8qgqAeF92tLwJSBdssoDdtMMNX80yFF+Dmg0fju4OX17kpYjSDj1Aq5fG57JIvgcOi7CZ/wMgU/rMYb/RKcBGJSUGuSVmF/PvmTeS/3nOHk2zYL/jFP5jRcinwvmCPSOsMBPvJEyM8S6hWaVQhDJS0gqAYxWecianF6tLmGNqQ4b5/9PjLhcHpWroxyNy/tyUEPIF8xk0ihlyKtfVxGxjxu/+wz6qetLfULZwwExRn8gC0V5lFZYAYxp3WO1br5fdEznUNgdV69FTl5VyBpeP3QDdZZu18XLni9zfM4Juuxshq0FrbMEiP7Fu/ZlQk3hBFKAZAfZYkU3V9IH92Ug99OerE7Ae64k7rieheQSiNppdQVR9eq/1yVBOB+Ar+xpndYhizq8q+qbRvukJg8Li1Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB7352.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(8096899003)(13003099007)(4143699003)(11063799006)(261102123227099003)(261028144727099003)(261021133027099003)(261021135927099003)(261021121427099003)(261022115727099003)(261026130827099003)(261026140227099003)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261026135527099003)(261021130227099003)(261026121527099003)(261022113327099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?PTJGPb0G9GCJ+l2KGaj247wkuByNDlOQhI60IipVnP53CBKexFEFRGJ0?=
 =?Windows-1252?Q?Q+Wp14PWAVbAW3eljeCey+Y1nz/BTW42Kde9RqQ+f0GqDQY/7vhBCpKf?=
 =?Windows-1252?Q?Xw0T24Du+tP91QLxoko8I3AYMNAFu0XzQ2l4VhxvEcgBHwje50nQ6pEH?=
 =?Windows-1252?Q?tzAvH24Dn2+E3NGoNXjCKCKMpeUVTup5oUavVLVgPNTg/6Fogc5rClNE?=
 =?Windows-1252?Q?d9/JMcvPKIA3gIMZBTP6ZAeBm7NsI1w6HTFBI9nu1dGpkTTLQcJoZWXC?=
 =?Windows-1252?Q?DEr6+3NQW3uflvOJK4vVdXEQSmmp6UUlcam7aeGnjx03QY4VeOCixbwl?=
 =?Windows-1252?Q?e/wW4WrWzuVBqdL/f7UG5IIa30Rx1hg6mpzaqlmkMIZKrNvFYe+zK820?=
 =?Windows-1252?Q?oKMLHu8MvnbhiM5dMRgVFsaadeDbGxOrTH6d1zyBCynFC8vaMPS/wFFJ?=
 =?Windows-1252?Q?OHDAsTuLB1DCkuAR1ZY+oXLrSQND5UgLY20wX7J/IoAkiYwYzfAHfMh2?=
 =?Windows-1252?Q?Tz5GH7U0mL95U8ayGw2t1iksTx05cvmZX2Ik3DS0YCVrqYw35auRz7hg?=
 =?Windows-1252?Q?JREFpce2DHumniUsNIEa5mXcJf7JJn730L0KRlYBLHeVwKATN0rxmhUs?=
 =?Windows-1252?Q?Qmf0ovtLvvSC8dTzaGbVckxRCV+noBPJ5A2lAJD8xwT+27tibP/M8ri9?=
 =?Windows-1252?Q?PTd1LNXo0sm8jhrliTiKgkkjy/NY5UCN8PUioGB/BXW/OdZs2Zvzeq3I?=
 =?Windows-1252?Q?+6YZNf3DWwwziMd6eIkKsbrDaNwBl6+LYAZdYp2oZY9VU/vkWCQcWDtE?=
 =?Windows-1252?Q?rFaI3dagWkkWGN+1fMr7yWQgIzxfwJ8Fc8gx1HMXQbEtasTPjhgKq4ro?=
 =?Windows-1252?Q?GnZEusTRIobfO4Z3USxoGaCekbJMfTpf/lxafi8TbmXpCsDoQVFHyOb2?=
 =?Windows-1252?Q?ItVp0fvffyxrPwlU/4v2o9VkQUBvA0WWdr+/bbt85kF20SrQfnaN0JD6?=
 =?Windows-1252?Q?dfXDLdUpaRgQQaQTh06VCesfmmJBG3BdUrd7KI0l0fgSGDOxvXE7KrM7?=
 =?Windows-1252?Q?UMf4C/e278DKXZ/lN5uFwU/Cb7+STmMe/mxgeaPUMr8g7sNAtJuTTB9d?=
 =?Windows-1252?Q?Ic58pmQo6qepvnCH5ee3wTxCBonXcWw2tQf+50WB2lFpYTqEZqPnSAIG?=
 =?Windows-1252?Q?sOVDWiM9nWPgxWb+DRgJufvR9RYI9OGJ9NP3B2GTpuNaR0CeS3LeHs1c?=
 =?Windows-1252?Q?67Jc3FIbOH5ImHcJVmsEjAoLOmnqP8Gmxg1Xw3wvyLzi1AONij+zIWmQ?=
 =?Windows-1252?Q?6uUkIxLXr8OIu6a+SAGOBcCoYUOEmX9cBDn/J0NBFtQZCEk3gDfMORcn?=
 =?Windows-1252?Q?XXCDoCiGocLg3TNljdxLu0fAIdVJxy70ITTXhO0XmB/U81ovFbWeIKoD?=
 =?Windows-1252?Q?EAXHI44yB45PVpRUleAVPdnfElSJy1zBYdQXbbdjHtZEwLyFemqEzN4y?=
 =?Windows-1252?Q?Y3TIwktD2gg4duibPSgLs0brBPpQPk41RRPTGfwFeb09KK0El7Co2li3?=
 =?Windows-1252?Q?pRi3mZ7U2gDwTHvp0bs3F8y5alagLhw1/M5U1klQYCnw0QJCA/atzIE8?=
 =?Windows-1252?Q?Tcw1wPJ3ZtoI5qBnvUHG6L1GE3V0zTUIZIDu0y53V/PTGIAFk6lSFTql?=
 =?Windows-1252?Q?CRf5Xd667z1bTkhR3lZvtk16TK89vfvGZ7wD4nZpI1OwCZfkF+tD20Xn?=
 =?Windows-1252?Q?AgallZOo/I/D5YlgRKH/kcJ4Jzms4mEY5U+GbofoTXRtsvAMucMKNP1N?=
 =?Windows-1252?Q?se7QtRy03JBjnH9XEYS00/B92sAagnJ6ktfZTEozDKOlivcE?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR02MB7352F4644A226D66144319B8E2712AS8PR02MB7352eurp_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7352.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87da8b6-382e-49b8-a058-08df3fd09f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 08:48:56.9320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kasGFOxCzKrGUM3DxeoyZH5NL2V5M/GTsIap+GVVL9Rlr1l3UNY3FKYkZWduAVnsk4ZVMLtTENkyolSWxo4rDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 08:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249971

--_000_AS8PR02MB7352F4644A226D66144319B8E2712AS8PR02MB7352eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello!

Sorry for the delayed response.

This is what I get when I look at the SBOM entry generated by this.

{
"name": "zip",
"version": "3.0",
"cpe": null,
"pedigree": {
"variants": [
{
"type": "library",
"name": "zip",
"cpe": "cpe:2.3::info-zip_project:zip:3.0:::::::"
},
{
"type": "library",
"name": "zip",
"cpe": "cpe:2.3::zip_project:zip:3.0:::::::"
}
]
},
"purl": null
}

Searching NVD only the Info-Zip project is listed: https://nvd.nist.gov/pro=
ducts/cpe/search/results?keyword=3Dcpe:2.3::info-zip_project:zip:3.0:::::::

So, I think it works well.

Please reach out if you need more info.

All the best,
Anton


________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Thursday, 5 November 2026 15:29
To: Anton Skorup <Anton.Skorup@axis.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Anton Skorup <anton@skorup.se>
Subject: Re: [OE-core][PATCHv1] zip: set CVE product identifiers

[You don't often get email from ross.burton@arm.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]

On 4 Nov 2026, at 08:26, Anton Skorup via openembedded-core <Anton.Skorup=
=3Daxis.com@lists.openembedded.org> wrote:
> +CVE_PRODUCT =3D "info-zip_project:zip zip_project:zip=94

Can you provide some proof that this doesn=92t impact the CVE reports in an=
y negative ways? Some evidence that these are the only relevant CPEs is all=
 we need.

Ross

--_000_AS8PR02MB7352F4644A226D66144319B8E2712AS8PR02MB7352eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry for the delayed response.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This is what I get when I look at the SBOM entry generated by this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;name&quot;: &quot;zip&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;version&quot;: &quot;3.0&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;cpe&quot;: null,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;pedigree&quot;: {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;variants&quot;: [</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;type&quot;: &quot;library&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;name&quot;: &quot;zip&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;cpe&quot;: &quot;cpe:2.3::info-zip_project:zip:3.0:::::::&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
},</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;type&quot;: &quot;library&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;name&quot;: &quot;zip&quot;,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;cpe&quot;: &quot;cpe:2.3::zip_project:zip:3.0:::::::&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
]</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
},</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;purl&quot;: null</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Searching NVD only the Info-Zip project is listed: <a href=3D"https://nvd.n=
ist.gov/products/cpe/search/results?keyword=3Dcpe:2.3::info-zip_project:zip=
:3.0:::::::">
https://nvd.nist.gov/products/cpe/search/results?keyword=3Dcpe:2.3::info-zi=
p_project:zip:3.0:::::::</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So, I think it works well.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please reach out if you need more info.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
All the best,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Anton</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Thursday, 5 November 2026 15:29<br>
<b>To:</b> Anton Skorup &lt;Anton.Skorup@axis.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Anton Skorup &lt;anton@skorup.se&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCHv1] zip: set CVE product identifiers</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from ross.burton@arm.co=
m. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
On 4 Nov 2026, at 08:26, Anton Skorup via openembedded-core &lt;Anton.Skoru=
p=3Daxis.com@lists.openembedded.org&gt; wrote:<br>
&gt; +CVE_PRODUCT =3D &quot;info-zip_project:zip zip_project:zip=94<br>
<br>
Can you provide some proof that this doesn=92t impact the CVE reports in an=
y negative ways? Some evidence that these are the only relevant CPEs is all=
 we need.<br>
<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR02MB7352F4644A226D66144319B8E2712AS8PR02MB7352eurp_--
