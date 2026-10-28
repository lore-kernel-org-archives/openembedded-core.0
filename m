Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38270.1793176185989993005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IdqP4VMB;
 spf=pass (domain: est.tech, ip: 52.101.83.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6ZII5GMdFsU0hJDlcKT9mgq/POz7y7jOw46CjIQpihK38JI+kpZpxd/BU/70g0n9YqrjyJc15tAX0AVj5Bkju6UAAuPZT4pNy+xCWkggszCv6mGinKZ8XheYV1xpU2lUG+iFFdXRXha+ZKI+DCVmj81vdDOkyOC0isnzq1YdaiRI2pyb4z9dMbwBX0rEF/27xqq9DKP/t/gXSeBoqK2/xrqf2ifRWh9cJ2vg+h/N7YJyZsxHvfo3UGGGeSCWFsES2YIGofEAgXxPeudWuHzhlwtG0Ni6zdQYzQX+CofblwP9rRcvShV0PpJkoDbx/T3sMulo/+AtkN2ff44FBmARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ1e6WSsjpz3Qv6le2Q6TKZAQKbXY4KBGUBfTKaSma4=;
 b=cDxU1iBTpM4nsoBCspo+GD3YLs6FH76pn6mT6d61dcWd3t0MHqarutMiwXqHE6Umd0/QG3I9t+6lbRPHN7MB5Ywjy0tFrzAiF01jqS/NAM9mKSyqJlkdSEsBIhXlwKWJNHJYUWCgHOqiJbwPXh1KoUaSrLpODye5AGETsRSyxqM8hDQCmUwUiUZKPtsRhOu5nB28vM65qyERt9+blJZEqFDv+Zv5X2EO4DYaFwJKUuMJC4XGtYqckx2Rt5kXHExoOqPK/Fow8FQTffMCiw+4BY/tMWQwJIjWMRfRxWjefsLJrvo1/KfJO94WFKHWmusapFLRnBE3azloBRXAxUCdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ1e6WSsjpz3Qv6le2Q6TKZAQKbXY4KBGUBfTKaSma4=;
 b=IdqP4VMBXNbuAEEJlYaQm5AtNW0Ji0HfpcVN/0XSNfMd7XHuOQwDhma2/is7diMl/KXNNzxlc2TlsZShDG2TRsLGF5cWzpyUqX7UxTnpUbjttmQNZGFKdMde0RRFq0FDM/YiaFdi/8rpWVu8RgPGnAyE33cHyvUrTegE+9fQgWypX/03cr8WnKwdB5qydyXGwIYvkOnGEmZSMRl6tF7JugkYiTcxp/ZekHT4OVpIj+vavVHccm9xoQK87Mzc5mr+n7dBNqxDw+g484NMZ1h+lZQudW9M9gmeMyksi/EONVW66H7/SIBHxEPwfBJ5/walDKEd+8E4Y3xBxewauTY83w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB3178.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:29:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 08:29:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libjpeg-turbo: Upgrade 3.2.0 -> 3.2.1
Date: Wed, 28 Oct 2026 09:29:38 +0100
Message-ID: <20261028082938.3228-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB3178:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6630ac-9d84-4114-3f19-08df34cd9c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|261026140227099003|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261022075727099003|261009223027099003|261021121427099003|261022105027099003|261021123027099003|10067099003|17002099007|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: EifSnnROPF7ozWH83BEmIdaVGXjvm8L9sGcoRor+QTRHmWrHSZ3VrqJm7fU1l8FaB2VFsUkIkEBQb88/z4JWx6iDw/z8E9Otjidx6U/UC1IHbI4/e/Zmm4Z3Dsx5trDnjEqNw19fV+HotwNqZbdKrzNBFnmfvpHqqHn5KUbFPdL+R5qYueVyxX9rTMarZiEhqe+9XWB/ksT4AFBEKcD3kkCaigqEtT0Yt24uaPwBrwVKH3d3M6phMuMxl0JFoYqx3PhG1ZkqomUaI/dGuVW965JgIVEfKK1cKIyDt7AYQ6MkG88ThX8ddQEbQetpfqZq9MiwmKG+E5iq0QQKhsnwtljfuYg9XIsChE3njUfeh570BcXuOO6FI1EcDA4OTbHCb1QptKZFf//iCOyAbkPMEU/K5iohjzUwHSbyRHFxMUT8rExbuQoSRbppub4qzEdRjxiSsRoGUyb88ff2EPYFXtNwnqwfl0hRccNeDAXaAg2yddk1dYKTO1miLGlkQ+4iA30Sz/2G+9xZuM/wwaEhvvklVcHSHdmKp1LvzcwGiREXDCH8JQIfGxCZYq8giapnLtIjWibndbrhZ1CQ2S7pQoook+sPNyKTAdl6cORXuU4B0hqkQHSQnOkYoDxbLH5KHGkEAewD7b5A/TRyzzL2933sHCxg70bZt4HowENyeXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261026140227099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(17002099007)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A5cNnykspDGbBw6G5akbeZF9+d8QI10KRDj2xv7TN72m3enRn74b4uOZRV1p?=
 =?us-ascii?Q?CW2oWZeD+VLVuKGCPZplNnsJlfsYFW0EryXaYlEOB0LXcb6BtsPCZXG8gw5l?=
 =?us-ascii?Q?9mn+D2GhLpbUuo/973v3V/5F9CZixtyQiHTYE8OzYzxBrdDSF1v3vW+XIVrq?=
 =?us-ascii?Q?dkv2VK6nA3iccMEpGeyoEO49w5txjXkNnEiSjPg3RcjTCDjJQXsTBqeWyV4x?=
 =?us-ascii?Q?8vFvqe9ukowm9E7ETSDPeY5hi3vC9g/34lH0/COlzufQsf8m/wC8XMizEtl7?=
 =?us-ascii?Q?DY7S87iWMPiCfjggu/1OsTOeBUqp5M2boI0vL6nEbs9JQUnZAlfAQzQUlAgQ?=
 =?us-ascii?Q?/wpX9Lq1Oj0xrIgi6XEt/NHrJDIb4sGqorSKTVLYM3NDBWmxhqv1Li/stZHr?=
 =?us-ascii?Q?Oi59SbzWxL3MzR7gX6i8EEGWnBQO5v1xoRLcT9f902uq09UPp7g0MOLSOzp6?=
 =?us-ascii?Q?94lKVLe0lV3COPjxN94lEyCp/Y2gFMpx1PQm7qFQSZ+m7PCpxxX4XgdJcxFA?=
 =?us-ascii?Q?Sech+TU6FwKhNyNHb/6v3lcTZxZNuVTTpPJg5o6gxM72FCQcZW2fc6JNXk6r?=
 =?us-ascii?Q?gsWf0qz+z4zdDCwsg4zmhMEJhky8MyIglRA4U1ksFIvjIW3B87JN19T89kGQ?=
 =?us-ascii?Q?Fcci6o+lEo5439e40+Z8cIYotLdu7AiEqFkNaHjKP9NXEV7pDvScB+iyRDvF?=
 =?us-ascii?Q?+tJG1Xaf4TeVfw1ucKs4slpw9dz4Qhhz2FSMXrbuByD5Le/ZK9lOuQNMRhFv?=
 =?us-ascii?Q?8xZNY0aw8sFqUHCKfU+g4w/R35sVyMZ5+aXC8xwICzk/JnS9/q8Du599slDr?=
 =?us-ascii?Q?BLBaKkxmKTJ/WI0mDK2RdR07ypAS4mBz0gY6zs1SEHvGZ+29D5HSSTBlovA5?=
 =?us-ascii?Q?wUmpV+HAZBNSepJ8t179T8mC7FV+PL+BJXgnyJ2a2K6VGSxaN7Cq+R7ZqMrI?=
 =?us-ascii?Q?0vuyd8kweiNtJ+XHRAYNo9QeCgL3GDIntKzYGr4DoxDroDnNfkygd8OjhYmQ?=
 =?us-ascii?Q?wDqQYd9ylyRkBeoUEqE10SZKKZrMUaLwRABdxxWy6g7Y7Ci3ihp61vpBrMpN?=
 =?us-ascii?Q?Pl5OQJnHAsv9LIFOlY+SeF1Or2wC+Qimuhht+fuY5He7/ZOxw/YbGzDFvCx7?=
 =?us-ascii?Q?54KrBTZb16fdiO0x087RyFP29fbyXwcFL69ZAnQ2A9Nk5P6M3pehibpA5BQf?=
 =?us-ascii?Q?6wqecjvgQBEc3P+ZjTKJnEurukGxmuMe0fqOGsro1RwO6qHsezlsnzguvXOn?=
 =?us-ascii?Q?ef4qXvdlFtwdkBLmaXlkH8iVEYcsKgMpnAKDYJ6YIYII1nOPBTOQsQJfDMuV?=
 =?us-ascii?Q?OmKmycp6+XFcY3aET5+tADTZ2uyMG0y2G+nVnwZPjVed/Pc1QDfIj+qATXQ7?=
 =?us-ascii?Q?p6MhFnEcLs79G9nrmZ/5BBHFMi+TCixq/crmEmv7RuI0P55pgT9CThGNewlW?=
 =?us-ascii?Q?Y+e86S04HrAv0kcad30bfZK+DxBOcGhEQ+cKBjMXyyLEYStUCA08Bx9jDlqh?=
 =?us-ascii?Q?1syZFzZXtSrqi+dl4/FDpX+exY7sqXM9FMOQjlPFCTRZav3Kwxj+/Jdf12oN?=
 =?us-ascii?Q?t66PztrTBUUMaHm1xiN0FNvkCvGq8t8/Jii8cZM/qcIjRwejNdvjePwqQawE?=
 =?us-ascii?Q?KICAPJJauBmf70Cn/6lqGdyju/D4p2nAaCftEczu3LpvWICyDeBVnqC5LgGW?=
 =?us-ascii?Q?EL3Qj43C9xzF3e/T7tSOTFuR89sT9XpVJ6oD7il5YS2iufguh6go51rZ9uIf?=
 =?us-ascii?Q?SmzXEDom24klKtb4mVR9TYFaSmiNnO0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6630ac-9d84-4114-3f19-08df34cd9c20
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:29:40.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXJVwTw5HXEupnnSg7ESVnFpfwY9mJ5pNYjU8ygaNp9WsfalGD4fRremezXJHWD7BudFXObsTeoI1spejSN5YRopgsLtcvZwuZ4lClxiQ18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248798
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3=
.2.1

- Drop zlib.patch which is part of release

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../jpeg/libjpeg-turbo/zlib.patch             | 50 -------------------
 ...-turbo_3.2.0.bb =3D> libjpeg-turbo_3.2.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.2.0.bb =3D> libjpeg-tur=
bo_3.2.1.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo/zlib.patch
deleted file mode 100644
index 4a62eecb8a..0000000000
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 95156233739078e7d4de0aeeacc4b0595630f393 Mon Sep 17 00:00:00 2001
-From: DRC <information@libjpeg-turbo.org>
-Date: Wed, 15 Jul 2026 13:03:38 -0400
-Subject: [PATCH] Build: Fix CMake pkg config file if WITH_SYSTEM_*
-
-If WITH_SYSTEM_ZLIB or WITH_SYSTEM_SPNG is defined, then the generated
-CMake package config file will include (respectively)
-
-    INTERFACE_LINK_LIBRARIES "ZLIB::ZLIB"
-
-or
-
-    INTERFACE_LINK_LIBRARIES "PkgConfig::spng"
-
-in the libjpeg-turbo::turbojpeg and libjpeg-turbo::turbojpeg-static
-target properties.  Thus, our CMake package config file needs to find
-those dependencies.
-
-Fixes #901
-
-Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/=
commit/95156233739078e7d4de0aeeacc4b0595630f393]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- release/Config.cmake.in | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/release/Config.cmake.in b/release/Config.cmake.in
-index 0c1ba8aa6d..04c147ef0a 100644
---- a/release/Config.cmake.in
-+++ b/release/Config.cmake.in
-@@ -1,4 +1,19 @@
- @PACKAGE_INIT@
-=20
-+set(WITH_SYSTEM_SPNG @WITH_SYSTEM_SPNG@)
-+set(WITH_SYSTEM_ZLIB @WITH_SYSTEM_ZLIB@)
-+
-+if(WITH_SYSTEM_SPNG OR WITH_SYSTEM_ZLIB)
-+  include(CMakeFindDependencyMacro)
-+  if(WITH_SYSTEM_SPNG)
-+    find_dependency(PkgConfig)
-+    if(PkgConfig_FOUND)
-+      pkg_check_modules(spng REQUIRED spng IMPORTED_TARGET)
-+    endif()
-+  else()
-+    find_dependency(ZLIB)
-+  endif()
-+endif()
-+
- include("${CMAKE_CURRENT_LIST_DIR}/@CMAKE_PROJECT_NAME@Targets.cmake")
- check_required_components("@CMAKE_PROJECT_NAME@")
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/recip=
es-graphics/jpeg/libjpeg-turbo_3.2.1.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb
index 3364c0fb56..f8ba836569 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb
@@ -9,9 +9,8 @@ DEPENDS =3D "zlib"
 DEPENDS:append:x86-64:class-target =3D " nasm-native"
 DEPENDS:append:x86:class-target =3D " nasm-native"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://zlib.patch"
-SRC_URI[sha256sum] =3D "6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e8=
41b0841f09878e"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "c27ad72a68da151177929aa969ae773a2da5ac2af9ce946079=
314fdac8cece7f"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d=
+)*)"
=20
 PE =3D "1"
