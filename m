Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5985.1794231656738438745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZyVpID2w;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2KB8pBWGNGSb37Rssk/GC7tn/godpKoUxnEkBB+4bCAbSOPbFyXiQNtEasf9azbWT8HW3HX5Q6mugF8QzaAr0V66TK96kFbndBp678kPM7hbXLqrxs4tNGi8v2w6KB3lmXnciN+9pK4GunkLrSFbrrgXnf6LbadP7o9C6CxTnsYsUM/WiezpEOgYG0JEtASGCGHed/5nh3qr9YNU/hbZHqiOPPC82Mp6Hy4rQYWmdse0ZYT7vFy1a42Zhg/fSsnpzMBFhhHCPQqm8tMRC+GtGTwLTGKphuw9T6DC0V4TflzpXjGa9cquYZ2W+7LQh39vaBsR1H/goH+EC38t2Awyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrRY7n1l/YEl+62x/mSuKxqfnqmhsbcUS3SKfWr4RrY=;
 b=x1/YgePS2FH1R97FhPiW9mpnA2Qni2UCs2pHEmlWL0sSMgA/5xDDjhZALMUbQ/ccaDgwrkJpoAeH1pW0aCVSz4H2iNBBuQp4C8eCNqlqeDRdH9k8oqTRZvJ72NQiytRXmdNNLl70YzJ7ApKQLvNlXU36gFsTBSaEeU9i2AZokLY3GQEZOdYLkwa+7U7RCpYL4Rc94FBvYtJ5Iqv4BlQiZJOfXJhXYaGIiT99hVkGp7jtQHj8wVqZxiEAV5OlBm2a+pm69Jav7Jc0XHi3GJhBedmbXgs6QBb4RH5uy9mf4TejAG2UtkKFEutGs2/hM1rDfS+0031WO0uZicLiPBb2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrRY7n1l/YEl+62x/mSuKxqfnqmhsbcUS3SKfWr4RrY=;
 b=ZyVpID2wruoiF8m0GqRhmgyS15//Gt0/x+iIB0gogPoRB6j+jG7F8J9UqX1e630K8fIUXLXfZYFkRU0zUD0vMJjp+TwnZ8uVIHeWkT3iAp/6yGJmGpbl33C/DAv8LPsXX/XBF1hQlx0UeGKHEBYN8HGNMxnXRexkwVP6hf8ph4x2zuFi3Rv1WKz/oHlItpR9Mpv8Pgtcx5joR1dm5mEwNCWLs90o4TawTK+jldgbX7cf1fq+ymTSLZHbZVh36qQtyS8UsC00t7e4AU3iMTcd4QHVcGemRx4okH3C8inOTnpvaAdA0ARk4hcPGMaBvYKDeyCriL3rcYuONlO32rIBvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/21] gstreamer1.0-plugins-good: Upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:23 +0100
Message-ID: <20261109134034.74458-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:10:232::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a8590e-bb39-4e66-75ed-08df3e6712d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Oq8e8G0X+pInrtmbZi9IkZArilvZ2iGqYnWQ4oGGGUGROMmfteNY+TOf2UTFL/SZ3ptmGerHPXFVySD14fID0nujxrAEjxc1bzvPrJGhCK8A1emRNoE6buXDl2mWxKmEO65u3bIGlkmDMb9QAXkDfweURDcO6A65rfYIbeVGa71GofVpz8dQvzqwcLWq5P7zzJ31wsPg3N1VdQYNW+XgcOTRZWwtyG8pIIPc4RH829yb44dBUMwSYHoZIImDMvQFFCSSOInLxxAdjtwp1/mi1qUeBwtFZZ+jDjsIbqgaOBGUT+bYp30023ssEOKBdG58zsNKpbLT6GzaXaGM3SpkTuZoACyiOLE4o9rUKNxjJXRMSadYoHmRwbHnRvTCSxMVtu6iVwjTlXlpeEx0hichb95blHLq1tS/NQdnyWFgVRwoQPwQpN5iNrmBa0vQAroQvjji2lzR++iEKBKjbEo/kLeovPs2gQUgcx8FH9BCBHQdc/ek6SjrKD+supj/D6TNftB1cXykrDF+/6oeRLXJH1TcCIsQY7+oXtf+8tS5Ef/OoIdB5c/AhH8u6U8b5zSfWZIjtdeA34ovo+1QhGaPFxo0dhEgU8h7yyMgffkokPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8MVQkAS24hLUHEmikCN+Xxsrj4ZhFSlOdZIgZrPhBISucp79uLvZkpHt3t5e?=
 =?us-ascii?Q?FUz113e8iWJ5QGaHNhoQGP9rAAa3Y689JDwvd2TcK7cP+d0QK31Wg2fDr9x4?=
 =?us-ascii?Q?Flvxi4foEwb9f7ssBmgB1o3DPldqfUvRkZXzyfjpVaoqcIu6amcUXpOvZ1IX?=
 =?us-ascii?Q?7c0RFD8xQsIkvnK11SC1hyP6s+iU6Xv0qAYE7REhl2UUqf3coFbhqpKfIzDU?=
 =?us-ascii?Q?S0J7gymSe++hReJ2JLRYiQ6zsez+LH4dh6ehrMbFK/KPNJne3fiDifsL6RL9?=
 =?us-ascii?Q?gxsp38mrwzVXwVFZ/rR2rSkeccqjxyUI16qHNcraatz1mXkqnr1KHlXnIO39?=
 =?us-ascii?Q?7Oj+qFUxJQrFROjV8SOxOIRdglQjMzhnCIAwX3AbWxUsjfmg69QihAv3lBsQ?=
 =?us-ascii?Q?sutMs/HIvq10jWhImwoB1L51pgabB36N7Mvf31bO+lWQ8YnNBmWrSLBDeH3Z?=
 =?us-ascii?Q?BKOHE75ukoDq8T+c08tiiFDcTiP+//2KUxI16D1y+wBxUQXqKawoHw96pZ4E?=
 =?us-ascii?Q?rUCI/mGJrmvo7hm58Cf/zNBHEBUgH3zhEgKprdElFmY7CqXHc6WOEf4nkrOm?=
 =?us-ascii?Q?Lk5qkRAHdwT5xR9QobYNgIEQZKStSgdG9+cZlv5PDziRlN3S3+lLhIEgdgTX?=
 =?us-ascii?Q?oeAUxTcnMgS5SsG7/vIEw3UbSpWMOpSQDsj2Xhe2fKSHmPks8DXbp06MiXRG?=
 =?us-ascii?Q?7XJhiaGC8YRVFlyY3dfISQPlSUUjyeIIg8zNKdlzlfTX4II3T2nmYmGUEWwk?=
 =?us-ascii?Q?7L0RAbICcqhZE9BHn2LZXLnWqfov87q1iwUYuUFSKPooXgNoyp1esSsV1pty?=
 =?us-ascii?Q?apNirD8MImp5LEwrAABIj6tPNzwL1sA04Vo73dN3SufZwVoKZ/iMGUIb1ugO?=
 =?us-ascii?Q?JRXuKcXUnnilykXpCYeqL+WQF89vJow9B79/DIGFnMlpk0wuc3N+waVOKaLI?=
 =?us-ascii?Q?Ynv+aS+BkcxXi3ySHY50PSAGvwNqsaoI5iC5uw5UXXkkBG494XNMYg2goQAl?=
 =?us-ascii?Q?Ugfucjz/Q9zZM0p0aEIVStthmrEMfdS0P3QESlDM4pDe/HRWrm3cqClJPfz9?=
 =?us-ascii?Q?rsGJXRtMHsLBLTZTpsVCzuq08EYojBFoxD/pqAtcdDk/RJ1X1MVT4+Bt9yfY?=
 =?us-ascii?Q?/0Gtr63zaHyKGU/+WcSO0kcORXuqDcHUr/26CqP9HX/98oK2BiMOW5ckcMYf?=
 =?us-ascii?Q?boe4yCbgWihG7e0B91j18u7CyzKwfp12HY8uG3W2+CGaZFdZl1+nO0b91BXK?=
 =?us-ascii?Q?7wWragqE23LiOcCl0p77OOXSUu/TE3mP9cq9AHyto9InpIYiR/SMD/0Vx6k7?=
 =?us-ascii?Q?MulCTA8Zia+3BAdUPxNU8yHlYPqr2W8iQvSyEzH7CfIfnRh4kJ/n/bkU7zON?=
 =?us-ascii?Q?b2F7oNBgUAK6BzkWjg/Ut7dhYNq9I4rQSY/4yeUCsC57Ju1zWBvrUAhztcmX?=
 =?us-ascii?Q?7gr/VJIlgw8cv3qpdxStw4WJiGzOMN2SANJiybkcE0wG/P1qG87mP72iAQad?=
 =?us-ascii?Q?oviRoY2tVV8P62/4+vkq4RQ1SWibDBWTMcHSMqYYa7BEmKwop6TQNrvf9z4M?=
 =?us-ascii?Q?2/tRXALRsyGN6AYt0F7Jad/cFwGr79qt0T98jMh6GNxB+hoJ0bYbE74qyFOs?=
 =?us-ascii?Q?VP6CMC6oj9q3QhtJ6kgyPm2owgwFMZupQoH0FnDkCtJp3AXKDTZMDJ9fgt36?=
 =?us-ascii?Q?Idq+WriOKNt46OxGxn7EIMcN9huVTYyIWggYXjPr+iDA2LbPA+6vqoE8pWQL?=
 =?us-ascii?Q?4NDojYjY1Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a8590e-bb39-4e66-75ed-08df3e6712d0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:52.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUJZLi0v9bMHZyBw45U12cYjnPXDIUFEIrDnaBaTMP+4R8TISrSQoUEiOfcNi4HKML2CF2BqRGcYf0MFZULUJULpRYMQZ2KqUzHUJ6GLMK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249815
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ugins-good_1.28.8.bb =3D> gstreamer1.0-plugins-good_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.8=
.bb =3D> gstreamer1.0-plugins-good_1.28.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
28.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
8.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
9.bb
index 7cc675faf52..70d88b7c0d0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gs=
t-plugins-good/-/issues
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-pl=
ugins-good-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "a7670ed900d3d03be744d25c1873b239896e9a82ce6d17f8fe=
bc6fffbaee9521"
+SRC_URI[sha256sum] =3D "e518cd97483706a252e95e60312a22d23dec6f5e7673af6f5b=
de719c3a9ca7f4"
=20
 S =3D "${UNPACKDIR}/gst-plugins-good-${PV}"
=20
