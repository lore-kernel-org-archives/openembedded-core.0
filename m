Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2093.1793955090167798295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=t/L+ek/Z;
 spf=pass (domain: est.tech, ip: 40.107.162.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sr0USMjP0l8zPhCvTHADEXkp34eADr1r/QnXVTPnVSGymWjUQdH9MGWRjYENQqip/wh4W8WeVuQy3FJzlfNE2XjOZSzpwIbMgs3M1axf0L+PnOpqu1U+jrLpG6Q1szxUj4/Kd5hFYu5SImUroT9ChSlT8G/z1Jv1xP9uDQhW0YCrs7K3tFCwFR2VFLp86+2JlfS5KUoU6Kyy9FEokdfgP8ESP0eBjUtBDkpHK3rW2veE0AG6mAalin4EjeIrvLo7KCHe/7zHGjZDj9y3eX0EohcJk79mQ63xG+4Dwr5IuzClllGlBCID0rQ+65T9oAp0a86CmdTNnfvY/wQEgk9sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZgyX4iHnLNxr14Y6uygok/YtM4e1+hLvrt6XQlO4dE=;
 b=AGLLNNLvjgEtsK1+qd1791clNChv97+FrUfkPaugCSvTPzfelo3S/x08JpnX0/7a2DCfKVPjvnOZpCaurWA31xlCUfIES1F32hsRM048DcTOk58EaLWU+z7VQFOgWKrPjMudqh53Z/cbLuuVEIRRNx/gxSLCoPSqluo3Ca9otQwoYngj+5hp8QXgD5N9VszDfipIxlLp3uJw7FOJragN+56uCG1nm0Kg1e/MIMvVKMvphHgx9snxnTf6QMWZ5sWCQmw2Nuu9cv1WsaBE6lTvV15s0XlBvkOCa/kScWKH3mbriEDu6k230BxLgQv9LXyUPs5ZAWO/XHrUU/UGqPcdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZgyX4iHnLNxr14Y6uygok/YtM4e1+hLvrt6XQlO4dE=;
 b=t/L+ek/ZmreC+hsOw29irGV0a4no3tNUtbSL6ZlzTeSIba29J714eO2zZPoa/pgtZESCoyhLdgPjqa8qAKfirgPX7AjXZoKPjmo61SLpbH0wXk+5kv9LNcBwmLrHPk1MtMWIXLS8i+3pjuT0SbOVZKv00MJhKQ9El1lEFHfByo8Jx0pERPE9HkrcK8ipHP4tpJDpZ3388Gw3j4oI1r0iyTI7YcY21v3r2D+4IhjAReY6PKRxobPSiaEbpKjpSOg4BLSNN2gVWe2Ul1mdir++JhTqOXDSegCC1Wp715JbQlY0pV9a8lJN5RhGEptMXsnKvkbZLcC8YcUsfxfRlaToZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by WA4P189MB004753.EURP189.PROD.OUTLOOK.COM (2603:10a6:1d0:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 08:51:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:51:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] zlib: upgrade 1.3.2 -> 1.4
Date: Fri,  6 Nov 2026 09:51:18 +0100
Message-ID: <20261106085118.63845-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261106085118.63845-1-jaipaul.cheernam@est.tech>
References: <20261106085118.63845-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::30) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|WA4P189MB004753:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab8bea6-fe1d-4fbb-6547-08df3be3221d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MHoppVDktCX2g3n2ewYnMXbnWvRUD5bwkePHwYnZEaKLn1lfcUxLm6n4SFm4d0AaZdViiyMXKRBEQge1YO26ICmUn4MNJPbmfYkaDOGJsCGtNZFx3uKkPbFo1Uwl9HDurimXWOWVu8dQIqmA77QbebI7pnBv9kzZ9qjrZpdOsHEl+ZT6NW093SevAcNcDVtVmmYfkdGfF5IjlE0BNNGZsIaWzo12QGPVinj9mcNwkiXAPD1Xgvrf3jT/uH3I+i+kwpooiffzRMhX0WZQqtsKxrmqy6O8wngkPD66fEnwEjvASbTMrhzhDH/ZkIb7a8Yze31RPDZfAVzJ0Q3TBh7BbR6XdMcUwSG4rGrq8FwrY4cz6X6jC5/xw6OpGMMnjTkmCW8JCQnh7Qt1ox69TGXCmvCafq+6qDc+Ptd6n+PK/fpsbkcupmXsjmxhLi5rC1A4BMQoPDlTwhbReIFtKVMK5bWPPDhgsrv64+4HBmC/8fiZYMpvAJH73Ulj0zDQpA4YhVOidbPPFOQV8VXUFTAwj/dmSQ2YVnbYyumRmj79yFGaWdzpkXifzk6I43bwqYXaELpFhfTJo6aULDRFc4+FH4rPPeFX18ykea0qogGEcic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CObNgtBXgK+5KFou2RQ8eToAx3+mjmtbcxVn9jrnfHE0ztTSHWU9JpvF/Tol?=
 =?us-ascii?Q?nZUDUbbRm/mLXrxMBQ0MPAN2jbpvCzEVSxN3KLeCl48sIi55eBrb4dF/QQOB?=
 =?us-ascii?Q?CyYApepiWUBJwiPkZeIriBVgTjnbcV8nzwgjnwb16eDJGEJPOysqisX5AcW/?=
 =?us-ascii?Q?rGK5+y7M9ucGDpp1s/ThiRVYXtoryVUAIYSOH4OxOTyQJMTjpe8eXL/jCsI9?=
 =?us-ascii?Q?44NpF60zEPvjoQaD1jXkM/paWfYi4AymgijsUTv6XswBcKPjabMxIWRi2Qct?=
 =?us-ascii?Q?bNiqF37XBS9TZLjYNtyQKd3clNDo9Q3V4cV53tKhtC4caEqjdkVVLPJALuOw?=
 =?us-ascii?Q?1Jn8SPn42mk8Lv4u1s/fFE4b9IZMpzdY59UwvX8TKHgOHOmQPhDigbhcHWbR?=
 =?us-ascii?Q?Wgm4E6JGXp8xC08n5oIaK3Kz3Y//YsdD3c2YlFMEtGpUrY1v83YSzDNTO18Y?=
 =?us-ascii?Q?r99xdpwcK1wZ6cgxQczCYRfYMzo5ON8j2CMggVZxV3bkXXIHSVnZ1lFqbh9F?=
 =?us-ascii?Q?fHy3kxymbDE2afPR2k7xChGoD3ZxGfOZ2eoBH4vL6RLFfOFGopZmecL7+Ije?=
 =?us-ascii?Q?WRfiOsaW8E7r3gBC+6F5jlGJ+JgEnqIJnJvt7aR0Sy930rRHoBqa/4KRZt/F?=
 =?us-ascii?Q?U52kUVXAENPCNzojExe5dQyr7frtYemplinSjG161ViXHLUxiMLPafii378W?=
 =?us-ascii?Q?79gxqnDxbfkApDbgxXXOPuVU2W1O3obeS4Y9RC7H0YY0Nfr8IiL9TMarV6gI?=
 =?us-ascii?Q?mzcstWux6wxhqHBTOnnmXq2eLQMyvRChHyxb86H0lfryESsc0+YQ9MPO2cnO?=
 =?us-ascii?Q?dpMQw2j9Vf3kD5xF3P32BNb/adPdMeilvkql33ElrRuACuVzZz8q5a7+fEpy?=
 =?us-ascii?Q?QQKZVyZOEUM7Gj0Q9u6X1d3AvgxncfaigZ3T+PwWhIfAp6LXocbplCwBrNUQ?=
 =?us-ascii?Q?Zul9edPieMP4Ozh61W+8EGJr7p2noUa9xhAbHUmCXH0EbXG9E6LSu/XRVzFv?=
 =?us-ascii?Q?U80yh2bzMH1FZnvYh/lBR0FWn6pCV8026RJ0ZNnyxJ9//pYehVuMQNsYVoAf?=
 =?us-ascii?Q?B0YJZIUDdCWRBItF8kbEQwN+LwLJ6vo/uikCb7JTx64pmdB+5YN84vwEZZ8J?=
 =?us-ascii?Q?vxSin58cKFb5NzVKUYeTDQT8KZNB4wGxS3wVFnSyl/6Exo6xv3vWMfjUMMmY?=
 =?us-ascii?Q?xzMBoQeKEmXiiB8hAVDIelbluZIB055zWTXWGAJ5wY/6V2qqGcDZEBMlLonk?=
 =?us-ascii?Q?+o5jlzu7sl+898qkWW/bjOmd3aeV7WFhWThwo6QzANqOyQezoihe+BgcU6FW?=
 =?us-ascii?Q?wg5pXGWbBldNNdjjBASe7yIar9DQFfmwKvlJZIt84lMKblWS/itxrE4xsqb6?=
 =?us-ascii?Q?wdYJ9Ajz4GN9XvVqHjiYfe9uJPqyWV0im07mCCkcyLwEILAUmAAd5Vr3yP1h?=
 =?us-ascii?Q?jPWDIM+S+DsVllZkX9By/3rRslaOTDfLuD1/tWv8MAynZKYKaJoDB9bKjOhk?=
 =?us-ascii?Q?j37fafkyYgB/TRG3KjMwYLpUiTEO9pfr5SiXK7cbiVFKyN+98de+QIs+GLQB?=
 =?us-ascii?Q?fQd3100fssCWlnd+FONt6YskoLWbF/MN3Akss3WPFYtWJqO1vyxDThY1cq70?=
 =?us-ascii?Q?ptEP4VsSC4SCI78jO2uQ1Gp0kN7n9o6sl0mFw0+G+xhWxo9q5JYKOFDry9e6?=
 =?us-ascii?Q?fUCCrLg/dzCSv7Va/VLWy8B9fUoFUBJRkCrLRf07X/zPcp86MJNwvWZ/neO+?=
 =?us-ascii?Q?BWM1BCWHEA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab8bea6-fe1d-4fbb-6547-08df3be3221d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:51:22.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHcySvh9+lctnFwJkx6F2JoHUSuoKYOOdtl2ghNfFYQhH79rZ4LeCPTnYgRzFOLfWFV6LHCHuaAcIS7eT02T+cOzSfvqwNYKkZ4ZJ61GTB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4P189MB004753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249611
Content-Type: text/plain; charset="utf-8"

Changes in 1.4 (4 Nov 2026)
- Change CMake library names on MSVC
- Return z_off_t default to long for portability
- Fail gzopen() with "x" if O_EXCL not available
- Deliver all gzip data before reporting error
- Fix gzwrite() buffer overflow (CVE-2026-85091)
- Fix inflateGetDictionary() write past buffer on invalid window size
- Fix window write overrun after inflateSync()
- Fix read before provided data after repeated inflatePrime()'s
- Fix write past pending buffer after repeated deflatePrime()'s
- Fix copy of uninitialized memory by inflateBack() on invalid data
- Fix copy of uninitialized memory after gzseek() as first write action
- Fix read outside window after a deflateResetKeep() mid-stream
- Avoid out-of-bounds pointer arithmetic in infback9() (CVE-2026-4738)
- Fix several vulnerabilities in contrib/minizip
- Fix truncated stream detection in gzread()
- Fix pending skip handling in gzread()
- Fix loss of zero fill on repeated gzseek()'s when writing
- Fix inaccurate total_in after Z_NEED_DICT returned
- Detect and report bad deflateSetDictionary() calls
- Avoid undefined behaviors in C language usage
- Fix minizip extra field overflows when almost full and need Zip64
- Don't assume NULL is defined in compress.c and uncompr.c
- Use the generated zconf.h when building test programs out of tree
- Improve portability and functionality of CMake builds
- Provide 64-bit file offsets on Windows with #defines as on Linux
- Improve portability to Android, AIX, PowerPC, s390x, and Windows
- Use a PCG random number generator instead of rand() in minizip
- Clarify documentation
- (See https://github.com/madler/zlib for all 195 commits)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/zlib/{zlib_1.3.2.bb =3D> zlib_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/zlib/{zlib_1.3.2.bb =3D> zlib_1.4.bb} (94%)

diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/=
zlib_1.4.bb
similarity index 94%
rename from meta/recipes-core/zlib/zlib_1.3.2.bb
rename to meta/recipes-core/zlib/zlib_1.4.bb
index 8a23d98cd3e..89f952ce7f1 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.4.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
-SRC_URI[sha256sum] =3D "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2df=
a8de64f0119d16"
+SRC_URI[sha256sum] =3D "02dd159783677a749c04adbdd02b55b8a2bcc7e054f51b76b5=
49199a916ad584"
=20
 # When a new release is made the previous release is moved to fossils/, so=
 add this
 # to PREMIRRORS so it is also searched automatically.
