Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15436.1795097621061115589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=t1okjKIO;
 spf=pass (domain: est.tech, ip: 52.101.65.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hASponVNPaY99SbcmVu/Lag8w8evBh+/vnCT7hbHdpMPt2ZZLhxIPcoYpij3SGW4mcM6SjPejadve5JsRaj+m5hLkM6hWameF7L2SL6P7WAy+W/l9KQ2YpdkzUTsbdmpca3loGL++N/txPL4wsJ/PmNyMjosPJZJerzbzHweLrYd8/EgIFN0atBPgHw3pLm2xkU5lY7nojsxJxp2y79DPx0c7zOLx1KtfGDUzKDjJESf8cuwJ3VR8FQ+5gGPsODhhn8T7FnaX5mSXVChuVIDSkXX4XD1TOcA9J1MlIXOazajxsQyMjXbbHqisYig6p70x0ZP01HY93LNdOGarXrWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06CAa7b0BCej+1NsNf0Sq0HpcLbcjBaktCDkeybiraI=;
 b=hiNU0Fvnko+nGAGk7aT2NIX7SwcII+LY8NgpDftUGCq5MxDbR2PQ24cTmbUoqqLk6U7t3zf28Q8u8FXypQPc98C/I7z2RPgW34zBrQcSkLYWGoOcj1O/ZJGpy9jFK3Oh5aw8U4k/XHoYxWB3eiPth78Ni+6vybxLNy1uicg46jOYWN+683avSdwaiMOooUOqOx0/37xQmd0yt0A+t/Ut/kKRH3zCF7xSCRv8RoOWCjJH7aKrHa3jWo4umhAJC6cDZe8az13tbVz1zIezFOCZLTgICrukTDvbRoC+Sv+aoF4oReQrDC2WAzxaRwUaUz9L6w/NbNjmrSx+Lw9QIFK0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06CAa7b0BCej+1NsNf0Sq0HpcLbcjBaktCDkeybiraI=;
 b=t1okjKIOsfp9Bfk4D9N/8Fs8jKwklbVcgALZSQBHMjIIJuj8tjyASqUH4YEHcsPzLSamOXGaOeJxrKxtaCC8BqqiKekKbmFm/OdLIo+H5ae18DhqwEUfOf1nDE4FFmHeTGebWTbYVcJJ53t67+X2sX44Wi1YfC7QPXpvM445Ncv40LPmpsrs5VO+k0ukmCNTpR+hNL1sjg25JoqL8dzyHUoK7CyMlt+FJbF/3JKIXVLtcioJn1Ym9d46CUHLWz8sNqTuFuJck/FLLsWtdXGbvDaU0YpDX04xi0MySSaeMDMqaDWKpPCuh9MAcw3Q8ctZkKicWeQKMKhjcX5yMIE4cg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:37 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] libfontenc: upgrade 1.1.9 -> 1.1.10
Date: Thu, 19 Nov 2026 15:13:27 +0100
Message-ID: <20261119141333.34492-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: f56322a1-6c45-41df-8dec-08df46474dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: okyBpLt1nU9UP6pT5zUEHe4CIPc/FImvwREjdMhq19YvAkbWBb+is+JXF1XSPZPyr7MEelVsNh54zW+B8EH9GItndNDJbwwL+ctHwiEzHixuLonbrDaeBoVKnNynNOqVTKwUMVspdgYt4s6k0gmej4WjnLKlnphgHSOgNxSs730XKZOaDOkmalfIjZMuRCMgl/Ol7o/S465vjiXJ/2FXX8GIn9KBdd4WFwC7l/hP/k+T6Jls/+Yjojv4IhT9r/wZP6yOE+DlqHyd7QhVjmIE+Lfz6C/pmmfbbdJinUuJX2Zw0Vc+v0QZz0FX9r1dotKM/vLp0YVJ/lm5d0eNZ2IJ9E3HTxIW/vgDBaMdUJWZldCdlKfbq1+eH8eWKDSmhblnVPYAyp5bNDrncMCuYVLuaO6xZejoCA5M0Tp90vUW8S3I0JxrqVVWwnxNetTwtLdI8cdw8QXKBaliRMTuEUAZp+GY5nM/lMcwD8PuSOIdXXJi4zWWpzWaDOTjW07u0nENN+e0Is4rEnHlxcqwoiKShI8k6YRgMcZFQIfRxMEwXnjez3QBIphzoS+w70NAaIMegT+3ggh9tcKuMLT8mRbPRd0bhDcmIfPPXdIR5YORMuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JzpGROcSb3Z1+nsxf7ex8iEm6VrkPeMZ9ePK4GhDL+Z7e7ih6hLtBuBOie4D?=
 =?us-ascii?Q?Ruxde5oKeFkQ4B5OV5z4hpuBY60cnOnXKOFPSGj3Y5kqJ6Dq0iB/TkeoqFKd?=
 =?us-ascii?Q?CdUQZw63Uev6oe2Zaw0mK6AxA8DFgEOEvlc+7Ry9tMXwdLO1nwWUv6odI3AB?=
 =?us-ascii?Q?JvssLqBDY5/q7uQMNlGLpYsasmH+KWJCwao0GjVAAqGe3Z9LJ9+OcdTLB626?=
 =?us-ascii?Q?ZUAuL9/M27FbL0eA+FXiFPU+L8dguzdnnksz4bKyxn5sg4xmK0l+ldxFPrpM?=
 =?us-ascii?Q?63BWSLcDSdb+W1mm9P33YSsLokKdzLQbmK6WVIzFsjauOnZfurrQoz86StQe?=
 =?us-ascii?Q?lD4igXomyL54HPhlnWOv9y8Oj5ZQYEcjVX7jP711Le4kQpmyRWXfouEQ+uts?=
 =?us-ascii?Q?3XFUyHSndX5W6R6E74k89ds39OUNEEudau/KTGXJ4ymTXPzqK+AL7GrSPzfg?=
 =?us-ascii?Q?pOc890PG5YVbN89I71UOjxeDQ4rtdjZZ/e0OaedEd0vfUuqRqL4kVfWbfm2b?=
 =?us-ascii?Q?j1IGubYcAvtxOLK/slB07nA6g/BuWIl6Oylv4H9grAgXfSD6UTAU3RTICbvJ?=
 =?us-ascii?Q?sQNIo+UvpBnxpncv2e3PN5AxIGpfsQuxbpaMpUd/hG6aP6nGAGvw7Puv2R/V?=
 =?us-ascii?Q?raAohjDuV1f7ILzTYACttdBXIPdxj788EP5QwhmuN9aNvVePVCUwBO0nh0/f?=
 =?us-ascii?Q?JZo8O6x/eL0myJzoTQW3cxQoblFOoP6NeQLvCD41Tg4DaS/F6McHhe/eCF/K?=
 =?us-ascii?Q?Q4yRn4Szr02S7mwLDCLwudLPU8rEscwbSIOCKVMOn/Th3Ip0JsQFsy1roV+l?=
 =?us-ascii?Q?F+nG1oaspAqbwOXo+xWRfVMvRV16HZc1VCV3RaH5Fcur2JUpW1EcpJT0OrtS?=
 =?us-ascii?Q?DdljMfyu2vA9xgtOV+KtOr/9cvrwZPnQMVzeSfU1ga1Y/vjWC2Wt31vXZf42?=
 =?us-ascii?Q?+UCaq+qJZrl2MWvJuQMEX7PmRdjQ2KJk1IezOLs47xhtKLmisvqsi7oD+DNx?=
 =?us-ascii?Q?9IA5o/1KCnMxhaDyFz/iHdE6HDVDbDgHJv95jx0Ky+cZSQnQTOhaM6r3Q8MO?=
 =?us-ascii?Q?Ms3ZRXqv9Ajkho5rb6Q4wMXR5Fs20vf4y0J1k/nISqJTpZVP4/pjxen/hpi7?=
 =?us-ascii?Q?a2h43UGQ+MEqZKUxkujePPknlJCNhppAseeFZORtnEBw6iMSFCMkAy1sli1B?=
 =?us-ascii?Q?Jl+6AJRn/TNkcOnKmAxrFyZIPj7JQhkTkAKTTRAqxt2TWPEtwuHX10MbQ6BO?=
 =?us-ascii?Q?+p78k1UJEGXtG13tuZYG2ql7LaLzoz+Wev7u617ijmpZU31hiLUfOQWzY4J1?=
 =?us-ascii?Q?nVXR4SoU3whdwrM8vNI5q8TWYXDlz0Cq5939+Vw/pbo0+iedqbrVaDWex8es?=
 =?us-ascii?Q?+bG20ijlj+oZUqar0062dnLZX+EmK3jRCT50T59xBTuuMzDVlzCocysZB2y0?=
 =?us-ascii?Q?QvXVPW1746/5H2EFuhwbRtGiAzDIPGpK3kfc52e29+Ceq6p/GqU4nFWHB0w6?=
 =?us-ascii?Q?CC4mM4XN55Su2BXwsKx/6j4d85x+f8QkcJy3tjLPn5lktbbUmZzI49g7O082?=
 =?us-ascii?Q?BTAdtwxLg8rzRjq+N8btGYb3dNt9C6mnOyltmvm99wqwEBX6onLAb4GMSJSk?=
 =?us-ascii?Q?kIH2gMnes4prrq8zW8NIeuOZQQ3nR8EL5TxAawbGOkR/L4QcIdgAjJOPr//M?=
 =?us-ascii?Q?pxx8Rg5EYxezQUcAGDPfShr9AtIzAvUg3q+3zhlHQASzxR9vpixITW5amqcS?=
 =?us-ascii?Q?UevcN0LFFQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f56322a1-6c45-41df-8dec-08df46474dce
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:37.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us7e2s868di9Um+HQH7Mwq4EfPjyeLhIdY6JXEjj8TDkT6qWClKIH/wXs041/zaOwqz5A+aLj9mWyP8NTglGVzRwpzxB2DElhGWgVX4FpGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250673
Content-Type: text/plain; charset="utf-8"

libfontenc 1.1.10
test: add pytest suite for setCode() heap OOB write (CVE-2026-109908)
encparse: fix heap out-of-bounds write in setCode()
encparse: fix undersized realloc in NAME_LINE handler
gitlab CI: explicitly add container-prep to the needs
gitlab CI: bump to latest ci-templates
Plug leak in FontMapReverse() error path

CVE fixes: CVE-2026-109908 as per [1]

[1] https://seclists.org/oss-sec/2026/q4/763

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xorg-lib/{libfontenc_1.1.9.bb =3D> libfontenc_1.1.10.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.9.bb =3D> libfontenc=
_1.1.10.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb b/meta/reci=
pes-graphics/xorg-lib/libfontenc_1.1.10.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.10.bb
index d5c1ed54eb9..1b9c0369765 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.10.bb
@@ -14,6 +14,6 @@ XORGBUILDCLASS =3D "meson"
=20
 PE =3D "1"
=20
-SRC_URI[sha256sum] =3D "9d8392705cb10803d5fe1d27d236cbab3f664e26841ce01916=
bbbe430cf273e2"
+SRC_URI[sha256sum] =3D "daa186a49e3cc2b6fc585ca09971351e6f010f618abc6a164e=
da82e42e4aa4d6"
=20
 BBCLASSEXTEND =3D "native"
