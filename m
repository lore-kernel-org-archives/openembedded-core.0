Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1792488579382617804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zDw11RwW;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5OzeCfzmQF3B5HRXMy+jK+3u8t4S32XkteiYIH91h+x9hHCjuXHMEkVU4ALGLje5azEqpvV2iCTgZ72zZZVUSeKIvk8zCGBqkFgWqdkCSbEq7g0Jv9Tihy7lOFEiifQYj/z8fK9clKrd3iIQWsIUdimDpZ2c6ROhp4q5J3ADDJXN8vxRxCQK5TBLVmH2MTNQ4+FxdCe66Btyiq9JziiEDAUhpO/gArX9NQE4Rnr5LrWw09G6Wxqix6dnrAzngm89e1VQwyO6/WEbN80pDSV2djIYwtrRM3yDfQCdXGUUwhKFUMZAR8X6ub6emloNRA7QECacU3U0DxbGMtcNB6b4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGMaQOF3u4XO486vav6JpoVwi0IoY4lb2eoECqBXzko=;
 b=Smyp/0FgTUPrmJp7FZKReB7s674ZBl7iAERGabrn5aWZmIU1zDFBN0V/4uaokbsM0dqgHwWK0Zd13fXFo0iPAZk4ZJSAqA7n3ND1BFwR4o71K81SeRwWWhkX+QQKdt8VvGfLWvB5cQsZefHrEj6JiXGjal6c2q4Jkf1Cc33mBcHtujTVi296WR+s91lma7cekjjFW45e6F8hnseDv4UFLR0ybiFLTr9woC4reG83yqqwe9OYQp6mrr7QeFwXtiDPeyhYdxeW8joV38MAQZ3Dfs9QcYTFqpG0b9Eufp5VoazM/IaUlnkR8rnl9BmtZbptPvnVsuVNRfvXgkKhbUEARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGMaQOF3u4XO486vav6JpoVwi0IoY4lb2eoECqBXzko=;
 b=zDw11RwW2QCsawcXoiMb2/BJySPbuTJTyZp1TFlXsHm2b1zvj6FA6HeNJxgWvyx8k3r8Ffcy+eL2RcRe/FKuWehUQ7e1I+hNoNqU+aXHQlKLs9nXWLjvwdDmCdGfYmhSyfK3rlbL9ZbJpmTusoUiz9kPpT0hAJoY7OKfQnsvtSvODSJ+vloDgmjAxS+HU46ip2prlM09YJUwCR2pvXvTgzh9lkJSLUwgnt4QycqDlucMJbkmuOT45VPQEzLralZExjl0/QjoINHfLPm/QU1zrItucTaGSm8Yj7d1PIeKIb1frNTx3Eg9I+0wNN13sLK4zCSgZNE/B4YiRaB/xRlu2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] libzip: upgrade 1.12 -> 1.12.1
Date: Tue, 20 Oct 2026 11:29:28 +0200
Message-ID: <20261020092931.4330-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OL1P279CA0040.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:14::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dbbcbd-30e5-4ee6-fe3a-08df2e8caab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|260925022911599003|10067099003|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: kuLoMN7aFZpnlS1YJQTrZQIcIoHLFn31L+CeKCn8F18J91X+RjY+Ukr3NK9yOcCZjO+UOg8aAx7WJesSky8u+bWdf81V28Uy5BL1v0uxRVdGPFAt+SWz/KqeJkL64eamL6UbvaOMi3tgDKsIjtGnVWtzhR8XcBNImNDi/6PDN4KOiqA0DLsqxKmE2FQzjOTPHOpCvbUNDZzu/EjfPSZf0fR0CZOOOa4yCk0SxDEw3dopxFyafjcBhS3diPacKTqMWwVbv3a+1GZvBlNcmZrU9sxoLjRiArbYkgCpAsEzD9i5oWA24aroNHD4R5Wak4nCBj53GP4gDOA6BOt8k3ZcSnYKZ0vYA4KOZaWogNSxtrbFcRkXS3+zPUulncV4CzETO+i1J250lUwr1MqAt29Wat3/AwWqbSq4P+hic+nHblJqD7Yc1h5zo/mrlXj6ekJlQtX8mLLAoOFZrzgECxOEMrbfEEAoncvGv/pZqNcl9fpIn8HcwEvYP2qYHRoknU689GxxDNgjywyIfqHAX+tiVw24zFpGiCqDEDsn3czARie/O8wun87LSug7eHjiAXv4niGYfR3NlmOivTydwXP9SdNOehIgQGTDLPuvhwc9ZM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(260925022911599003)(10067099003)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZisXrvqBsPQAsh5hq3tgOT7SRuY7/ZFTl7W1cZRs7PSXkEWV3S9NJhuKGF37?=
 =?us-ascii?Q?SV3BvDkkjXcwPv05/l1axoClxklIko3Gby9/j4N8lkpLrcYLSJ5V7CBES314?=
 =?us-ascii?Q?bYk+W5lXintyOuRG8W9kG0eQCOM0qoxDGXq28ARUqnOOjIfrnpvXX5wfS4/j?=
 =?us-ascii?Q?t9fHy+nRPO9/p2BBI+AVtQU3AjRaw+m373RFzVFxQIs6TYtmFFxIgt7n0Mc7?=
 =?us-ascii?Q?zIBqWH67GQoa950hfm0fkRO9IkNj1UWj0kvnpeHG1d5uz1zy0kxTo2PjGM4C?=
 =?us-ascii?Q?h/9u+c4KQe60it7M5MA31yqVafzPNBU8UNQfLY1tz8xPW4N//iYf+d4/hp8B?=
 =?us-ascii?Q?fwz0DttBYmWexMdaln0Nq4DHClkSZ7ahHzsJ7/q+eKJHwJJfHrWd6+Jd/1Fp?=
 =?us-ascii?Q?fFvzM2Nyx7NfGZf6uYpYwaqLva4Pg+ar523Ljm2qAVzKxDGIb5Obv/kWDyqQ?=
 =?us-ascii?Q?I+GJZqKfFKjVGtjJUA3VcI8rQZI3nyTODNprej3z2ZWgMncSV76jonwkymd3?=
 =?us-ascii?Q?Ls/rzwvYIbXYcnKTXFHGQIjOZu/yG4JAW48ccu6RKDs0KpyFnXXSwgefQoJk?=
 =?us-ascii?Q?clnSExpMJ4O2tzSu9/LeNlRdwECWj+5Vzy//0XtmF6m97gXN2vo5JajBhgsX?=
 =?us-ascii?Q?Wvjz8N1PkQGu00PnVdvVBGoj/lzZInAaDoeO0H03s1oFU1l35+420yyYZLh3?=
 =?us-ascii?Q?e93n+juegzhhXqP4CYWWma7D5Bgdu+pgSs7BrVY5LZZyH9pSF979yrx+A2ey?=
 =?us-ascii?Q?vAe/mN43xniNm4RU5Ri3cNcGZv0W5KXF30WPb2hRyaS6RHPabF99zp6X/rZq?=
 =?us-ascii?Q?GKqBSp4EbD6/91DUFdAfIYxgczQrEqjxYT8xL+bqV5+LOUpzAh52JoCNPjxR?=
 =?us-ascii?Q?0wdNVIIiTrGJr1hzynyXq7Y0lxE6F1YVy0OUsRzHSAa0Z4oYaKwlO3oi+utr?=
 =?us-ascii?Q?YR0+puY5p/Y2/Op7+Fw67d3zHQbqG62WduVQwCoXUi+FM9PVODRoB8S8B2Ol?=
 =?us-ascii?Q?KH7ATGSxHyl93tIK2zwWE6uqwegCw8XVC6sI8cYkwp9dEiV6cE7waGGawq58?=
 =?us-ascii?Q?5R9rSEuPeqZDfiV6LVhwg6QYoGZAATXvHaJiR+XRDPTMHkNTrECzuwZRJ62a?=
 =?us-ascii?Q?+Bct4RAr0bEwv5WwcucdJtrid14g9Fes3xH9QrLDLvvBqHPQwhC46Hq0cTnU?=
 =?us-ascii?Q?yJJWyaIelPpZdfqYDEZUNkqyxNsKd8LqL8nWdsTB/qOdYCUx2qs5qeNuaUHp?=
 =?us-ascii?Q?YklytVAjXOIVXv9Fm8209yGGuPy/nY9tMAowYkCKsgt8/k+i15eS9/Xwjb+A?=
 =?us-ascii?Q?IPv/YSYxDYdyte0T6ud7FOvbOgKA602BdAE/UEJHqn8p89NHKAJ5NZA16ini?=
 =?us-ascii?Q?mUUEccUzmAGBD1b+cSMntoVg699hqtf+YfDzqNF3Q+ExXwjtE8Xk+1yTsJJC?=
 =?us-ascii?Q?GENFVx1Qmwf4BKjYP0Ecvyvitjz6bLX9wepdXjMcaQRbMG64a5hX6sO8jQwH?=
 =?us-ascii?Q?aEAVQGQ9s9X3BQ1URrw2brGkNIpAXPG8rLiNfgPnMMrcXLdX0NIhEuapJ1mS?=
 =?us-ascii?Q?rKb2rcja2iVTVAP26KtPtjoopBoEUpbs9E+aSPgPDllBnVoCdKJOB1aBRjKu?=
 =?us-ascii?Q?S9/BPrEVMMd+Bnhj1ANMuS3J7Ck1SRTpX+2wGvc/05dB/4IHUHVol5FM8Dnp?=
 =?us-ascii?Q?SvxQ4mBLL+mnYQGNFUz7urEa0W6LeNRpiPB8r28avUzcpZ2fuN/SA5SpqMnp?=
 =?us-ascii?Q?L2LdWyOZrA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dbbcbd-30e5-4ee6-fe3a-08df2e8caab4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:40.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5Y7aS3Hc3ZSV8gNHodnHiYcnG3YmZKZOTj+znG3Ye16fx03UAhlGPNoYRSQ8xbLHw2vjOwZW/OKJ6IfcI41/J3ToR7C3VUb3mP+Gct0jiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248261
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/nih-at/libzip/blob/v1.12.1/NEWS.md

* Protect against denial of service attack (advisory GHSA-m3wq-j48p-jxwh, a=
ctually fixed in 1.12).
* Fix compile issues.
* Fix adding and replacing files in torrentzip archives.
* Fix error handling in `zip_source_filep_create()`.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libzip/{libzip_1.12.bb =3D> libzip_1.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libzip/{libzip_1.12.bb =3D> libzip_1.12.1.bb}=
 (93%)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.bb b/meta/recipes-ext=
ended/libzip/libzip_1.12.1.bb
similarity index 93%
rename from meta/recipes-extended/libzip/libzip_1.12.bb
rename to meta/recipes-extended/libzip/libzip_1.12.1.bb
index 37071592b7f..95bac993f90 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6fcea978dc627=
f41e0bada0de889ec4"
 DEPENDS =3D "zlib bzip2"
=20
 SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "376908d0f0fda13180a19fdc4f7062a1abfb59e09ca07a392d=
361253b8e60c2b"
+SRC_URI[sha256sum] =3D "c40062022a1963c80573d48f6070792297cecd7c6bffe3aefc=
ac0d8b9bee8913"
=20
 inherit cmake
=20
