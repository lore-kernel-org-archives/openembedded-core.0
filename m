Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7035.1794262140192824880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 14:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=o5TdjYKV;
 spf=pass (domain: siemens.com, ip: 52.101.72.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFV3T7sLpJdkbODFivpWIxviwEQF5H6IFsiV4TB+w/Nuwv1ubBHwhVWKSACBRVdX7EerZAQAxA9NAMaMwoTCYRfDQaUlMmvyP1Mu7nPxhd65OtVRBgrhGS0/o0MhP4TM/VJHyccJ+/1xqlb5IirZRHjl2k69M7BjQ2ZjWe044WLyzgjkNnsvYUihHCNfkzxb1Hv0OuSmh3RGcILn8rdDkyBrqtMcH3bQwy5uPVPJK1lqi3ys/ZiIlChkK/e3MRRhI5sXNHi71EcghJ6a0C5phSiQaEgazNgSWSnFBHesmT4fGQ+X7d7ejAwGtnuLWlGr0pDgX74GWsjFygMKET75Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxdZLSZ6wZz62ZaNz3m7FaSG/yzpNEtxNim8l3kCP5Y=;
 b=mo07+U/mW55UXAijz5bFapQwo1F11hW0bPmK1xCRO0sjvaZcjHlwC9P88CngSHnqmQHJSpFhQTEj1JhhoiZfOEiMzFIrqYM/TA3At2ixC/3ZZbBDRkevws5JfBI2RuDcER2Q3f4K1gwsZFtMDiCdSyAT919X+szMXOOQEq9hJuIctZbm9OEhw+T9A9ufIx4uNAra2wBP7OpUVfphNJrVK0VALfhjMTK9+V1S51Nh0F8O9SJ0UeoEGOxiyjHQ2mRzFGGUi4hnPBdGywlt0SmOH3X0K2UkRQaVEQ4S/xzIV3nOU20ByngM640quC30vBKQqaiZFUqab9RdFs1RRlg5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxdZLSZ6wZz62ZaNz3m7FaSG/yzpNEtxNim8l3kCP5Y=;
 b=o5TdjYKV7YCC28YD3lzVy+u4/uaPNXsKBkjFLZ1fqFsEcTHv3MblpWcO5WvMx4tFcuF+sg7pIJuo0sZVhrP60vJNmcQ/p6k+y5IwUD4oje5GC90x425cg71xwnHWSPr/r3WWCA0jJ9ewaIzC0tUkdced9IdKeQAAVoyR+Do1JEyNp8TlNBkRQ8IlpAOSi9CzXkNidrD/8UtAAavxW/TQ+Tckmk+eYR3xObaur1Vlw36OzzjZmY5EEdSNv3/MuP5Zao5U3w5TYWNZwk9Vmolabx01zYuMYUn3PEhoxsDSIWPCv9+n7lNkPNtCkOOOY0P8dqc+a1G101gMFiVwcm8mVg==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU4PR10MB8712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:568::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Mon, 9 Nov 2026
 22:08:56 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Mon, 9 Nov 2026
 22:08:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] popt: patch CVE-2026-18839
Thread-Topic: [OE-core] [PATCH 1/2] popt: patch CVE-2026-18839
Thread-Index: AQHdb7/iv7fILYtpXEyjBkbxjMfFz7cmCq6AgABC4wA=
Date: Mon, 9 Nov 2026 22:08:55 +0000
Message-ID: <AS8PR10MB5073E9375622BEF30E8D2057FD732@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261108202855.2743590-1-peter.marko@siemens.com>
 <70F205DF-CF63-4B50-9D06-38651703F4CD@arm.com>
In-Reply-To: <70F205DF-CF63-4B50-9D06-38651703F4CD@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a50928be-d11c-4be4-914d-b3a4e454d29e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-09T22:06:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU4PR10MB8712:EE_
x-ms-office365-filtering-correlation-id: fda1db4e-089c-4df0-12f5-08df3eae0bf2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|10067099003|55112099003|38070700021|4143699003|11063799006|261009223027099003|261102123227099003|56012099006|261021121427099003;
x-microsoft-antispam-message-info: dJLU73RCm2WZaobBFL/gsOTeRJ6I5gfCo+29QKSoKT8WqCz8/Uq1UpFaKM/zEBoZIbbEUKyyabhGpxf02wjvXnJahsDKR93v8P/C15sLZL8mlyfGAn4GdYWPKModQ97b7kHd56EQFJfoeWOH/RZJnit0dEeG3OB3hboQMLHI8dyf2hSklGI5IewJfpk2bn81i/+yKEWjoKh/0HR+GY54SpLV2S6aQNLrVc0PlMKKK4ziajBVB6jjjtu9h94pYFNVBQcHGLmDfqWiRfY4KjXSl/SPanv+uxKo7Q1IYx03WgDoL687ERET9lqHJziMBNVQUb3tfoT3ZsoVhUL5dZrvcscr+L6heyYpJuqOMXxK550HYo+UbzloBcSTidXJGsXTL50GprErN7Gg2mD5OgZjV5Z1CCG+uZ7xzo7JtxVhects0hzaSmyBHpR4K2HrIpHDxZyG7KPqVSa1NEE1as4u+phXgutRJABu1p6zjbJ+huvMaqKAXZnieTLlXvfLUeihGNHOVHxkgoP2GFa5kC0c/BbhjICxY3bmYEI/zUNUo0ruWYkeEsgkzRoRBscUoW2mmhqXC1zEhpZ9nxPeZ3EN5w13kIz9o/OyhppOltLTL1jLVkEy1xg9uHrnTBN4L0b+pPb2jZVNrQaaGInB3fpjvcdQkBLrEFJGCQp5dycaTAQrXYthMUtuXpWQqLUGNVfBM1a9D7C6B1MTkubIRF+mJnSvm8Uhus37EwYwEA4P3W4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(55112099003)(38070700021)(4143699003)(11063799006)(261009223027099003)(261102123227099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zErtk99n9wE1YZgvlSNgUiGhIi3A8yv8Pipr04Ads0WkrWwyRba0yl3I0a0h?=
 =?us-ascii?Q?BbQpqWa3N0RRnIdFsgpX+7vJMhbNcdPUJpD/QGfrVC+AxHHobNmHJK+GQ3VR?=
 =?us-ascii?Q?LjCT223B6Vd1Tcfhnc6R6YywhbEVU0iXopV7Pe3ghOqXbOn/FIDG7xCPWh6o?=
 =?us-ascii?Q?EhMlfTYaUOXUQOG+XmaNNQazjMs7OuUH7FnD1q0hOpxD6MNIcS/Er9nG3Fnw?=
 =?us-ascii?Q?cPBNb00j98YNjOdBG3okogZ6Yul8uivfokFzXRhZGM4sw4YxWMG7Qqkwrbf5?=
 =?us-ascii?Q?PSqYoWnoIaoDS1ruwbc3vAf8iryBNf26AIgB09ZIKhMWBXSM66ZPIV5/PvJz?=
 =?us-ascii?Q?fg0oRUMMRyWdwMkenl1IdPThIa2vTeW3RcGKjx/AKNEUQLGaL2xR7c2hJoGg?=
 =?us-ascii?Q?zJFieV/2qNvQwhEs4tLBuIrPI60Ky91TYOj6qYr59iOQJrFQDc9TwDuK5GMk?=
 =?us-ascii?Q?F8GZ4ltWZ5tPZ93C8rQCk564gWNz3W+Gd6wKSawNb0inVj4aqvzN4rV6yivy?=
 =?us-ascii?Q?3O2/+aVHM4/XRxfUQq8NP//2XRGHFabmxU+e/JZa4EX8y7UippU38m0eJ5it?=
 =?us-ascii?Q?s9sdBknxh6ioxqHTQ0X0RTs/RIagF4Jb/Syjr6r8QYofbkwcUzGT9RTuxMqx?=
 =?us-ascii?Q?MeRWeOBikwd8DMb9sjmJ/KX1f2gM/5HBeBC6gW4xfQuWuTpIFvMes+jfD9Wc?=
 =?us-ascii?Q?AJnswmD1+jDjsuEOtgtYL5haSDkqFuBVI2aI1IgpYhoTN6MEwSdFKl8CzkPk?=
 =?us-ascii?Q?l/8sjBEzSyKV3n063xnNP6bcg7W9qCyIO3NMckKigfSHgiiNp5Q2A5tGkn7f?=
 =?us-ascii?Q?iDW5goPjYOXUr56E+DaMDDeRv3qSDjwsZ9oaHO+T5QCgr7vAMn+5W+gxNYhu?=
 =?us-ascii?Q?o/WFrmuwBRlQMqnumshfmb/+imB3/ST3UApjZwT8+aoMxlMgjj/NR5lR4jA7?=
 =?us-ascii?Q?RnX9+9e+Y9qS69Wm6IneKHfDCj5L9DDCuRFqohL8SSrdVgk7o/o+chLoXXUT?=
 =?us-ascii?Q?lUvFnMIVo315slAYdURRpWV4QatTl/+Fp1J67/HyA2ZClnvC79sRGfVPKSH2?=
 =?us-ascii?Q?wP82iNeAAUrWZmpFWr+lItmqpyFoGJ2Bytf85bmvjRgff1XRdMfst3dzQFyy?=
 =?us-ascii?Q?7VXVj/tJzCp7DU2MF637Yv5NMIftHOI3/2BeKZsz+I5lPTc2cMpjJU3hM5ak?=
 =?us-ascii?Q?e6CVW/vreKhUKoKdhkuDEC8PQREv+KIusUvY3cBNgLq11+BuZgKOJ9XQz9JW?=
 =?us-ascii?Q?4YUhBRk7xTmmeBSJK4WHEY5y++JgAQgPRbF6LDAWJ/orbDdgqkOM8epkZqma?=
 =?us-ascii?Q?h0cEwR5o3lpZKvMJq5Td2NLKADzGIlEH6G4NzrhGFFmbaqXJl5yvbbiPLYPr?=
 =?us-ascii?Q?fUyU4bo5JaEYEHaeVpIC4gmcpfozmL/QkaZudYy98sD5z+ncWB4IZm//PwyQ?=
 =?us-ascii?Q?pQ6R6p8AOke9hXwtzAQlYWtecUuNM3wtsQ7JwmFxM/E/HzmQGDDl3uGtMiNV?=
 =?us-ascii?Q?AsRiwVrAOLLTcDz39TZ0d+50odZ/sn2AmBR3CPFAA0B3J/6OTsuf42EILR6E?=
 =?us-ascii?Q?QLjcL3r8u8wG/3XR3/acAQssl0bTcs69Awi3qbQsI8Xjlu/IeyFti087wff0?=
 =?us-ascii?Q?EPIoXXKTZQquJQoJKzN1Bnx6NjDQVEw3d56vUYgHtG3IPUAZBu67A/JqYYrV?=
 =?us-ascii?Q?OgpINbIntGSaowmUAGYre5JLN83Rq9qJarvQFysV4B6JR77M1J6mwfaFqplV?=
 =?us-ascii?Q?htgu1kevTQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fda1db4e-089c-4df0-12f5-08df3eae0bf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 22:08:55.5404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qv930GmHEkXmqJQ9OhwCcXMvQahnO4BI/4NfzsCKIIzzUw8J89cijZV2ej4WZKBlzGdCqIiKP9FR2slHmzfiqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249876



> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Monday, November 9, 2026 7:07 PM
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/2] popt: patch CVE-2026-18839
>=20
> On 8 Nov 2026, at 20:28, Peter Marko via openembedded-core
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick commits from PR [1] referencing this CVE.
> > Modify the patch by converting cmake change to autotools.
>=20
> Note that the patches have been backported to a -1.19.x branch:
>=20
> https://github.com/rpm-software-
> management/popt/commit/f9771bcd15073c2835cbe06a5d65bcbf612675d8

To me my patches look better than the official backport.
All code is identical, however they didn't convert cmake changes to Makefil=
e.
So, in case upstream releases 1.9.1, we'll have to patch it or switch to cm=
ake.

Peter

>=20
> Ross
