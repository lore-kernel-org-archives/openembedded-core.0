Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.992.1793947999266975368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GzYdWc7r;
 spf=pass (domain: siemens.com, ip: 40.107.130.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQ/QtfbueisL86pME7OwuFfffnasofHnGdx9smJT0P0luM1rUn5GD1tkTapQLSWMy4x8yU4pv3RWP9Kvng+4pxa6BS6AwIymHCEc3pSgRx6v0edPzC/PmI6XpMjabfed9IywJwiWgH0IHAKGvDVkg4zR5gn+wQvUByDbe0WmoJ3TitikVBUmqbTbslOIdXv/d7qJdPkmoVl7DjY1Yq7RvaXovrVDZv59RDt6JS08s7x+EYB+q/CrAJkiPz9qwuidixbBt3YqikwzWThdvrp8Onx5et4nirjjhf8ltFld3jPcHFbEhn1qegwGG9S7uvTIyYXUfwbykyLVF2GN0qh5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMQfCfzYzIMwDrkVZ/lSBrJod+mCoMtPD+Hn8V9biVM=;
 b=cQ1JPuUxaLYdGEps5Wh4hywKV8e3nm+JBy1/t72uiObpMBRQG4VVzBA3dzHnALdLaQNLt71zs0S86TpY2GmLnD5JAjsLkVCD4ib/sS7vuhfFP23EoQA0gg/qQYKZkKcAm67vpArBs9E840xoEaLP1Gp3v8cM+8f7RHA8qVNCel8Fa39npxLISpEF0YSXGdQPhro8tC2LF1ZrJHnkE7aJFPmhqIRmK5UUQq8RqKH2eu2qOajNT5d7y6GldwbMr5bt05HfhPut1sEbhwu7ZSUfMI9AXDNKFdqUY4BY3lPVY/pqayVKmMxbJsHclEFy4KfSRY8fvs1PhT5dF4erIMe3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMQfCfzYzIMwDrkVZ/lSBrJod+mCoMtPD+Hn8V9biVM=;
 b=GzYdWc7rvbbZtqmSJULL2LBVe1yMj8KBmJYkJTX+So83oxCTgz6OrmnoZsCgtWDYdQcggyj4RqkpPxkzdEfF8XI+uumoYXuPPtZPfroUbZHCFf2KPU3+La3vHElimJVx395sgYJKLrBkMNMewVeT+KXmnj5ii4xRdCOpujG03uaasijEP2KHamlbIaRUByEaS49tYzHUF7djfqfzKd9DBRtmeOg/mzIEdYfx3ajWcR9dUr2VdFx4+vpvhNooyS/fK4H309xIm4X3phZ0Y1gC/c9gY1oceV9YkvnbhLWJLBAv1aU9Z1JQHlbKlC2+jbdm6AM9ADc3ELKYAljMT5PP7g==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PRAPR10MB5447.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:298::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 06:53:10 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Fri, 6 Nov 2026
 06:53:10 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Prasanth R <ragaprasanth@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "paul@pbarker.dev" <paul@pbarker.dev>
Subject: RE: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
Thread-Topic: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
Thread-Index: AQHdbYwb4n7OkBmdCEStgplyVDP7srcgmzSQ
Date: Fri, 6 Nov 2026 06:53:10 +0000
Message-ID: <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
 <20261106011324.626292-2-ragaprasanth@gmail.com>
In-Reply-To: <20261106011324.626292-2-ragaprasanth@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0b14c7e7-1650-4850-beca-ede90e2e1b58;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-06T06:50:46Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PRAPR10MB5447:EE_
x-ms-office365-filtering-correlation-id: ad74b759-525e-41bf-c01e-08df3bd29efa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|4143699003|261009223027099003|261021121427099003|261026140227099003|56012099006|261022075727099003|261102123227099003|261026121527099003|261028144727099003|261022105027099003|10067099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info: MdqTVMmdmh0yWoy51L3vgKl4LgE2T0WGnwMbGQUSQcOO3isgn9P4DW8Uxy8KZDx17EUVY8WEIHNhZfSPb2pfu1HrYkD4QsLoJFdQUEwdGRlfc0V+Z7mniixNUgmW1ed7ChxbwHyciXben+j259WuQXbV2XK3CLCAenROBZKGhunOQY9nroG9yUx8qn072nQM5628ZCIkPVkN2h+6PNcANXyhry0XQ/yXsmqGtozXDPn5TUjc7okZwqveWwI0bu455i0q1+UxmSx64RmohTwJci0cYBYjAaSIqZoppAm0muopelgPSMkqWVUUq4E9nZRoc59sYqvBxnUya50AJUY+Ng2STm/CNe6D0+ExcwRoWaoNmA/KE9cYH5ehsqUBtO08KRhi/tYQnFen1inm7djWw811n5u8wJLgU6epJ5cE4CnGdCDnHxU0msxS3TRBhJi14JYNIpZA9qZmT4guvuPjHzN8MdWs9Ux1l6MeubqKAhMhOchUQnK1wuxhImyf8cM28KlZp1LJsV3SCE7lEbL6C3J/hiZ5FajCwtYL/9/ug9eI5tBycTh6H2nY2jzzcznsH7H36Ih8TIfVHsEU8I5asxX2fJx50puZQlbRfVQpKC5FbeCUWa58YJb7D3UTxN26BS8ymQqTxV+8vLACmEKZdA/2uJMkuqQMOcpbgDzHvcUwiAeMVSGaO7/KQKXWGBM4peA7bhmSELEg1Fpn0n8Afi6Ai1Hr8wabpeP75NhsdXk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(261009223027099003)(261021121427099003)(261026140227099003)(56012099006)(261022075727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(10067099003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AXS2VhUmDWSdmPW5GjoZTjuRbg7gQva8J06S5AofEBaa3oMyhkYCS85dASLs?=
 =?us-ascii?Q?JBAf7xT/PhCwchEssDa0leh+D2oQ2PfK/skE52VHLj+73xTNRGpV9w8lvZub?=
 =?us-ascii?Q?FD+tp/Or+KM+5+Xt2YTsRVgqA+up9x5EnLsvpxkHNugin0ej0apbMO/aDW4N?=
 =?us-ascii?Q?qZJO3jYeq4OGMGaCcDkpPmeKrM8NPZtr/P/LicYbrN/JC4UzDVD1C2/4QQcJ?=
 =?us-ascii?Q?vHoTBMbnfpt85PujIaA8D/YNWJ+1e2CXFTDG3sa1/Yip6oXec7Y1ytHtmfYl?=
 =?us-ascii?Q?ukOcCl/7lL9VlwSBUjcgf4rJS00Nx6zFYO1OoMQhyaAHWvwOfEi1LIQNfn48?=
 =?us-ascii?Q?vlQFtFWgPoBxzp77gpVkHPB784PLGsIpUAeClL3CxDz+qiz+NWLzjaZykQFo?=
 =?us-ascii?Q?bYqSJXY5X6aN/AbVHwYiEDa2GT8umMaZsXCm6/ZPWpo/cAZhTjApT8+4jsf2?=
 =?us-ascii?Q?eWhA8SWv1pvr6foGHFeXuQmSGSngwDlXVso6o1xhklv2zSBc7ukJpXsTALlP?=
 =?us-ascii?Q?gdyXJEJS770PzVC8imN9tWjjnO5LAjyyqoV2bCx2O7fZukLkimIjV1W5o6Yf?=
 =?us-ascii?Q?zgEXlsefowkHKYeDBGuqT4K5grWls3YzdKliUst+vqgk75SgrokiZra5R7Kk?=
 =?us-ascii?Q?oDwmEjlv0ZJwT1Opn2HOPGE7FtyoxZs0Kau7jfiMGus+q20nL9jWYQtGVEM6?=
 =?us-ascii?Q?SiuvKdy9DAZj+LYot57g4+qi0NA8X7gOQwjrnV6ydFRcPQSMxSmHQfL3dgFv?=
 =?us-ascii?Q?weyHHGiU6XWDUUnKGtgqt2ug3NPQRt2a/309Y8hCsq7R4Cm1cR8GuMHjx/wN?=
 =?us-ascii?Q?giOqpSuJtjAX07cQKnB8z3WCJA9Yb2PSXmfsAMIKbp8RhrAM9wzrtGmbtqCr?=
 =?us-ascii?Q?ql0WhmCD+3cM1Ydjriui42IsUNXQAZVoUBgL3k6E6vq2uQWM04u9bYlKV1po?=
 =?us-ascii?Q?U4i9CxsU/jRlpdOlLbF9kiSihhyU178M9NqptSqvUh0feiMUOjFTj7atRQ86?=
 =?us-ascii?Q?VO81nhQqJYXKRqd+F6T9zDgwKQmODd6AjDrX9yCio8qIDACxn+szMC2FiJH+?=
 =?us-ascii?Q?rJd4P118PpPE0pZ0ujj0RQUXsGqoM11XIHaE2j6J31rV9Ucgl0lDPTFKwvid?=
 =?us-ascii?Q?6jhYDCbX/qwcdIjEA90MZxx5q4sJUkv8uLmtzjSvJLIFo+aBpyrZNO+10qNz?=
 =?us-ascii?Q?9h8uQng80qu6aqUsc5Rc9OTjZShaXTHgUWDfZq7lqPI8Szr0gjbDfT1jA/Ck?=
 =?us-ascii?Q?nNSRsjOGtsgsbO+tnpdoN5SIjEvp25k/hLUrtirF5pMHFb7ONl63/IlYjrY1?=
 =?us-ascii?Q?E0mX7Zcnc+avFHH8NMA3Ixtq2mI9ksh0uEGA1rTG7VZ9J4Eek48bpYiSto4s?=
 =?us-ascii?Q?Sh+WXEEzaJhv/tNwu5sxwnU97nXf4nhBs4OnIbPqJfuEPN96oAplatryMOwT?=
 =?us-ascii?Q?PAn5iy5t1h8zXTcb4KROv3BdCBAw/GMo3ypPbNeycwj62PfnCZZOPBcnw6CA?=
 =?us-ascii?Q?x0EmqR0zvHX5Bu6a9YnKFCBGoxIVr79NYiPIxM+er7YPtMUz5TDPV1tQ1sII?=
 =?us-ascii?Q?mRZ1UNeyuM9vM0zpMV/0OqD39v5DQR3JNumpduc/ybstnlHH9bVPVHeCzW1X?=
 =?us-ascii?Q?c3ScgNYmu7Yo3EDRgoRQ+GtfWcnvVVih0Q2Ib7Pk5M/8GBPsP9FozkTdSGLK?=
 =?us-ascii?Q?VobsXGygy9MYq4nTkzgjxL25JLBTxDEMLyIQZtwAeSJB7yZuJBNVbXnMjOeO?=
 =?us-ascii?Q?KhMT2ZZS2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad74b759-525e-41bf-c01e-08df3bd29efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 06:53:10.5815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV1uzbFOUr8Eud+JL5zH89jWsSnVLxgXliNC0myRWiknBmLMQuyW40C8+yB7f0h1vVJivlISQMmdSQFgdFt0zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249597

zlib recipe version 1.4 does not assert this CVE as unpatched.
I think it's not worth to carry patches which just switch patched:fixed-ver=
sion to patched:cpe-incorrect.

Peter

> -----Original Message-----
> From: Prasanth R <ragaprasanth@gmail.com>
> Sent: Friday, November 6, 2026 2:13 AM
> To: openembedded-core@lists.openembedded.org
> Cc: paul@pbarker.dev; Marko, Peter (FT D EU SK BFS1)
> <Peter.Marko@siemens.com>; Prasanth R <ragaprasanth@gmail.com>
> Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
>=20
> CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zlib
> gz_vacate details by mistake; the zlib CVE for that bug is
> CVE-2026-85091 [1].
>=20
> [1] https://github.com/madler/zlib/issues/1330
>=20
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
>  meta/recipes-core/zlib/zlib_1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.4.bb b/meta/recipes-core/zlib/=
zlib_1.4.bb
> index 18b27df878..2bc1967c0e 100644
> --- a/meta/recipes-core/zlib/zlib_1.4.bb
> +++ b/meta/recipes-core/zlib/zlib_1.4.bb
> @@ -47,3 +47,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>=20
>  # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
>  CVE_PRODUCT =3D "zlib:zlib gnu:zlib"
> +
> +CVE_STATUS[CVE-2026-76844] =3D "cpe-incorrect: this CVE is for webpack-d=
ev-
> middleware, the zlib details were added in error"
> --
> 2.34.1

