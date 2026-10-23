Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4916.1792754996519089873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=m0GvZxZX;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyGL0iLoXRdURNymaxhV+n98PhfenCLzhGzgaJddpy04GYxQffXJy1GRqe26Xtojl2KVrroz4k4d2E2ry6IIjge5WC9u0LJT4mZqnvKuKOg8dqS0Hclk2dghizXi1azF5/3XXiAy3gg5p1k9MEWpELYcwT2OFYx12MYltyDR2IE11KC5kV0DBoMxJHH0IWR7WPIAcD5+G/Y/39NEqSweBFrXChReK/qfB+Q0z8+yyBGU+ozxkWtY9frsjctRGybqjdtHY3S/D41XUI3NTDHnBhLho1V7teKxpL4ucOtjRueQP3bN91HnvL2H9LHfY3A1ISfXQeo7DwIL0Yap4q/lYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJkAhsA8FClI9+djNGLU0M8dxRp14Dlc+5Lpx9Fqi4c=;
 b=dGHiGqR613r3a0iJDu5hxojq+cJ7NVSl8EGUXkm8AynxiHv/vStTVMOH8ZoCNjRIlgLmRi8WP0cIKtuEyILdJ2KwkX8pmUDbr8S0ccFKO8jjpeRo3Mexl37of2uz9jX7OO4Dez/r2NcztCB0456H+y4NdZ+4orqhsdLwEunsdKuP4I63ton5vtqVO8+rjxs8dr1bScmTmbQ2uWRKy/Ua13Dd32U/PG6jDbBFZRgrbs1oG46OWKL2nS085nIvlqjhFdwlKzAI0yD3R/Vi87v1T1Kv+FVpqcSLpPrjfBk0ouhQO9OKoXOhA7bvull+Cg5+yYikDW8E3qh1qJOvOfYjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJkAhsA8FClI9+djNGLU0M8dxRp14Dlc+5Lpx9Fqi4c=;
 b=m0GvZxZXq9/M382dW/4yV59RjHsOUcClZNbTsKYR6IOKfw4qLzc8bVV5PK1Rv1UEHZNW0eFYXvjueMrUBVtAJ3jbxdkgS/JPC1SytRRVSQb0K8+BkaQMfNEBHh3FO7LLGcCHzqizOPx0ENrthM0sHFSrTeQozPhhTHHHZ7N1SQGhUtYLR12YgBeVxTMPv4C9WcDrzNkkwykH6kTH36eDQR0xDbYtI55zUkrc077J11IFGkWSggLK1MH5u6r/vDcRTdaAd0EQhzOqb0Zq4H7mNoQ4xU/dlhc0lj5rejW0Mlus56Rr4KDptjcRWnB2o+8gzXzyzdFx/YHkMF7WPwS6rA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:29:55 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:29:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] python3-pycparser: upgrade 3.11 -> 3.12
Date: Fri, 23 Oct 2026 13:29:46 +0200
Message-ID: <20261023112949.77631-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a30938-fad4-46f4-6bbe-08df30f8f63d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|6133799003|10067099003|22082099003|18002099003|261021123027099003|261009223027099003|11063799006|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: yfRBZ0wRkd67QfNJms28Lp/3HEBDXcrNudjQffIJ/G70lFQH/wMKmAtaVf5lV93HlQGPDbz9VM/jK0Vu9P+56a0ldXWU0EU1dMCnoI6OKgYXFptHW2OdSaA1wWuIYjSdEFeZNrcW66vwjvzvfQ2DN/it+gl4gzmWpQskVlHI6mEHRMGHFBFEIEzfDitowqF5wKrPbzX16axzLK1sGyZysasdPcdF1/Hjed4+E89S4Ft6USkSm2oyt34phoYA451JXOUo432KCZIm+POZqog+XKD9XfmU0FBcWEB0gUxF2yuwPbQ8txyDgE8VTn57W5QFu8sBDPFRSr2WMl1XU/LeC2e3y0zw126cB0IKgZYBw+H59qf9+n/7oxQ8rsNSqAr4zcKY4RnU1VVFAIPFhLp0+VGhC72ijEdi1oY0WQ8ez8krz1l0XsHYVUMzTpVtSgzP4xHIPODiwCcYYcshKNr9gokxs45cHiZFDW/LnvgsBIAzVRpFy8ba1M9QDaclup6zf+5VezP+UMu63nNpBOF81UwMKt3LZNURRj9Mp8erbf8U9sTilPW3CeR3SFhdiDlwTO09BC9dTDzv8QXJjdndIGQjFBlHyfmzUl/0yWCtwPZIdTBqNNwnvSB1pycOXnZiRddb9gcBQj+krsnUQiDQoJewmh+E9ebBB7k8Perd1gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(6133799003)(10067099003)(22082099003)(18002099003)(261021123027099003)(261009223027099003)(11063799006)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WazaEDCiDLY3Q9OX5Pbk/kPzgPeVvhVgpIReGdejpen+4kvOnH/4URKbMiEs?=
 =?us-ascii?Q?2hLl1VbKuuFVMuomfn9BKGXdFfJ2hI2BMexw+WeGM8/9e7dOnPEITrdbXhFI?=
 =?us-ascii?Q?5uwHxE0UERqvG/DhUps6QmUzA3eZ5OkiGqcZYLMuxrAZ28dSQLClJqeG0YIT?=
 =?us-ascii?Q?1zEXECjwsE1CCNS0jxua971MiFCeaqa00Mkk+Mrkx0n+bfBMyXxL7k5twdcU?=
 =?us-ascii?Q?Vi5MzfWbN418Fxe4AqHaFIfkDtfEGj25CTBq6hXZz+MYIrreofHIQ0BBu4WU?=
 =?us-ascii?Q?8eHinZeahsE4ikCmToL2rsI59HYRScplh3QMfYEdaWrWS1so/kQd1xB6k8zy?=
 =?us-ascii?Q?mpyl0nYkay7h4UfEGvLRy/OOiRPXcQ6G0mtrDiDL236SQXL033xpusOmmW2u?=
 =?us-ascii?Q?22+93ei3TC3DD6PjdPnGqF235U4eSKR9527BOriP4/omTXtm85Oxv77JFUXk?=
 =?us-ascii?Q?+l47gfpTU2q22LCdp9/1B+3+EF9XHhcs2OIh+2YDvaVJHgn4YmqRpR8LnaBJ?=
 =?us-ascii?Q?ePeDWlJaj9k3JYX8xPYHFQS0EEt/uXmvJkL0Im//MJXAQlQN0sYtQiBQsXbm?=
 =?us-ascii?Q?f33tJ2pZLP1v+gI2Xm9kuRJ0eyXPu3ahunymPe2+wv5X0vrQJHMp90p0Z4zV?=
 =?us-ascii?Q?HLe5du4Y3W4VwRFgLxgJ4j8Wb/VVnJ0q2VSIxOJEPsvp5lWtSaSmElyy2wR3?=
 =?us-ascii?Q?FmObtlI18SNPhKuDgNcfupWvnBX9hsIvTx+uUATL/kNaCAjDw322ZMHVsmff?=
 =?us-ascii?Q?FOq0bGYdfHOItKdMWFotg3bAruC8HXOYr4IyY8Ck6/osK2o9+9GFx6ciJ4QC?=
 =?us-ascii?Q?NLpJGVej/ltW8ipfRPHweKh6f/y+R2oeO5PQTATRqKMS/BWQz7CHQDMKHFqF?=
 =?us-ascii?Q?kS2q68R505lNk4r31fVRLWyJVoBHj0Y4pdlecQ+vEY6G+tpxTWsRIwztAid9?=
 =?us-ascii?Q?iFh+S73lh47Y7tSXBilLzjYk5FT4/5JbmXsyMRUuZSix0gt8ADdcdQ4/nMbN?=
 =?us-ascii?Q?N+UUf7FKGCmFw8TnvFrCpJt1Viqbxrp5rBGx0hoSnv2kWxXTuZyxSh5tfRXU?=
 =?us-ascii?Q?GkrwkE87X12m9cps7PFX549+I+6Vbb8g2Kso8Bb6ed35d75gliZ08rbPmA4p?=
 =?us-ascii?Q?W7JoMgiInkcLTnzBcTDCzNfNXvswNnWYHETNjD+mK4Dg4FpLYUtLCu1ZxB7b?=
 =?us-ascii?Q?kvmxzX6RQnJ0kDf12bvGjcPe/11KI28XnH8GHi95fiPLoZ0+zgGlVwnVe846?=
 =?us-ascii?Q?EKKNdlU4nvlGfqW0Z4+AtvaLubaC7QdSgsilv0sq/hGmUW1ahWgAvLeIidd9?=
 =?us-ascii?Q?NBy8zGGAekH57Gbk8AQaj6KrWf//sRCvoK5pDaL/KJJo5+o/L3wWufJQcFVG?=
 =?us-ascii?Q?Bqygola/UUbWKARu2ZCGMCWJljeUzdfG4YbtAPKy8gh/IJ4UF8f4iX3asQoU?=
 =?us-ascii?Q?xMn43qAemajcZW3CxedHtdVQDtIBepXbZXgGwJUV52PZCIgiEKKVAbMM0QPY?=
 =?us-ascii?Q?fGI5NeDUf+wE8Jd3pN8f7IqWOPuqfCM9j+2YM0ETGtF03/OdKX68TAnD4RIt?=
 =?us-ascii?Q?F4vcIGrI3nK7y79h0BKpC1rPiOqdUEnSqHjH5TNTu/furmHxGi/P2dy2WT1P?=
 =?us-ascii?Q?BvlrNIg2A0d9dDn+hQQycTei43DMrcet6Z0VKywndciBXdzTuPqcadFx5rgY?=
 =?us-ascii?Q?gYFw4TWeSrlr+fkxchVod4UQ/+qUU1nee7rorV72wUw3IZT1MTcuF9ZUkXJz?=
 =?us-ascii?Q?nurcmhrRwA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a30938-fad4-46f4-6bbe-08df30f8f63d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:29:55.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kZ8TR2QGzViYUnx2D71AWCfCH3Z77TnZYk72J5zlbP8UkbSbnQzmFFI8j+08bCB1tpwB/ScX64E4vNxrqlj7/eRw55hRfaD87v1RL/BfH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248544
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/eliben/pycparser/releases/tag/release_v3.1=
2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-pycparser_3.11.bb =3D> python3-pycparser_3.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_3.11.bb =3D> python=
3-pycparser_3.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_3.11.bb b/meta/=
recipes-devtools/python/python3-pycparser_3.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pycparser_3.11.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.12.bb
index adeb882a3e9..a08d34ba56a 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.11.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/eliben/pycparser"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc453675224ee9a35b46135214d26c05=
5"
=20
-SRC_URI[sha256sum] =3D "d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2=
f1c2935e97c2bc"
+SRC_URI[sha256sum] =3D "f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2=
ce915475cf1db6"
=20
 inherit pypi python_setuptools_build_meta
=20
