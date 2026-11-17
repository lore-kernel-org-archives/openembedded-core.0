Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19775.1794927274395655079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 06:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sHlXXQYO;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBgerM8WbxT+WJXAYKjouUmlapcwS4FY4gzRj2lcXKNLhWvo6drZYpq9jcR7eqAovfUdlWvZpCXKQNN1Jz7FImcvZu/k/axSDoQkilPJFILcey/P0UERcq/0mr8Ha9MM8paW7/L+5DJ7ZhXZ5qkXc10Dr/qTxDoqbQTPZsCuQbjk/+VqgrEOCG8lJk8+rzszEBv/cPELGnS1NEi5i962zGYPBVbxqpKuQtxIyfKkKXOeBRyOpu6adfhxDz5YRI/W+BTrMZz9Z+v6ZmZN3UQaV7KYqyf5xhdhxIv/tdxzszzoSkj9Hz9ukpxmyJ3d2DjGyM97L10naneo957wFFaogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imVEJnxzwznmVIZs3d5AmVyCRBvk7NTs9uHDBFA6xt8=;
 b=AcTr2WomM2tZ/IfIHJKA3QlRBqPPrv4V6dFg++EQ6FPnkTQHydW/Qp/jaFk3hG1Jx4U+Zo0lIv7xATnBe35Elz9dafbxAt+oD3yaQ/xAaDQ0rFXtK1vaLgdHxvsjLqZzwaPmwNUY6L2dPwJqv22D1NDpsJ+RLQFTtyI0nyAJFE6xXCG4UTE4rL8hQXRSefj0YwJQ3KO9Kn9aGSdP7qSRs3D8GwLxU7z9HiDyvFsRiEHI3D3fuO4/WJ5mA96QKrJsdyw3d/F0BTED7wuLDLZIbZMQ3ebG3CAWfcpycYZk7or9w+banlgp5Gr9pJ5iTHTjlT68TBGL8yKN0XkugXeI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imVEJnxzwznmVIZs3d5AmVyCRBvk7NTs9uHDBFA6xt8=;
 b=sHlXXQYO+6x2snNTlSNRvuyWj6HUgDHvcxClEb5Dy7a5z5mihL1U9HatdRghnaqf5TsaPA63W1BfS4X5pAiFhkfJ9DXxbnIK++6m4K+Ff+gMVxS9DfpaJivd4mx2soRrGsRTIg+3XbJ53vLJVrg7JUDF9DX0NmwKb90OjRjApNa/GPjKfB3pksCHE1rW/l7+c1OzLZuST7Pckkx8ldLiYhI9SxOqWxW2CN8tadhpCFpKqd20XjPUSUjRPLHbNWS6tr77uT+pNQztYZvF91egO+wuPehYfMHwLS1OS+wjKWoE4sIgdYuW9LaIJ6DzbeEH+WTnpb7v2zHl5vabtPfMKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3234.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:54:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 14:54:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] webkitgtk: Upgrade 2.52.6 -> 2.54.2
Date: Tue, 17 Nov 2026 15:54:26 +0100
Message-ID: <20261117145426.15711-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117145426.15711-1-jaipaul.cheernam@est.tech>
References: <20261117145426.15711-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0668.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3234:EE_
X-MS-Office365-Filtering-Correlation-Id: 376b8f81-fe2c-46f0-4046-08df44baaf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|12006099003|11063799006|56012099006|261022113327099003|261026140227099003|261028144727099003|261022115727099003|261022075727099003|261026130827099003|261009223027099003|261021130227099003|10067099003|261021121427099003|261021133027099003|261021123027099003|261102123227099003|261026135527099003|261009221227099003|261021135927099003|261026121527099003|261022105027099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: IBhS6EBqgzN281cQ6EKt9JnvL64jzVIOE46dbwoFvFiR0pqmbfsSTTgoaZiFw1/7MiG3g4IjN4e/R/KwQ8ZquirFZdFDA0erq/C5+KUyA3MSSPxc5WwFEqC4YjWw3wB4nym9rpe69EfmvAIrsHITwVfSamsd6fx1c1iJGCUyzRSl4e01bYSSkm9TAzxBzWyQnjHZ1BCIcuBT0uApJhDRHj5//XpZuRrmR6YP1yb2zJ1V++beAY+qcx0Gg5NO07iY6ukIkbvFNj3LphW61XGUF83WUacJUg/eMZUxF6nCjcy1pK9yT2tZCttm+9HJuFcjuWRkORmFfouiogGQlEm2pCxinBbpdz9Vvo1efjdLsZmYb225i149LUghGNacSZVjgh8h0IH+7qY3PqTQvlec8E1IZJXL/DCRWq+12KgHkVx6ph/As9L5o0ej9sQQFOrBS5FVhCJfjwwbaY0RiyYgaJH12cWjjC9AQb747vBFNMXmOOYss7m39kx+0HJSf38T2wSZ3Hb1hkf4MOk917AcC0yEOL3KsGKV5NivxGABs7OxONQcILCG+Xe5CFlMvyCdjLT4kOICvIqurC7OeuHLYZb31C9KEfHwYGVViPLr7vOWqQpn6lWrFEd5s/MDYCfw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(12006099003)(11063799006)(56012099006)(261022113327099003)(261026140227099003)(261028144727099003)(261022115727099003)(261022075727099003)(261026130827099003)(261009223027099003)(261021130227099003)(10067099003)(261021121427099003)(261021133027099003)(261021123027099003)(261102123227099003)(261026135527099003)(261009221227099003)(261021135927099003)(261026121527099003)(261022105027099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9XpBvwW1oiznVFVpw6li5JB8AKt8VdaEf0Vi9T1CdWztA3/7EEr/WIXaKUrt?=
 =?us-ascii?Q?MJI1hCS9hEkjvWlQTo88BvzHkbr4Dzd1g3L+EtzHFZVwdkf/aYrgEvBjLevM?=
 =?us-ascii?Q?M1HWq2fVY7SJjxpjILz8iwct+kWybYtxwASIPiCexr2AhZPOzndzciRqMH68?=
 =?us-ascii?Q?TaWJynXe/Rs2FyTpoWmrQ+7T7wqd9VywZsHhbd0CpUfqng0K5SlhC1FbsDJ1?=
 =?us-ascii?Q?aIbFfqbvG8vBoknx+nWUJ2IeTl/iohJ8k63F6ToNdMmvk+pOW7UomlDCjFQv?=
 =?us-ascii?Q?qzZxflzZ844b5Sjx1e5465DCX0JDvXHGENprlvg5OJ3JMS+tQBMHWPkFMw0r?=
 =?us-ascii?Q?Ylu2mNVtuUQdPRb4G+3RqmA6EawpzNCs8CEdVUECeZbYMCRYbvL22oNMYiBo?=
 =?us-ascii?Q?rioH1J38s2WS41uLJK4nzmC+8j1z/ehVERBTDobyEKJ3NvWzRPxswpgdnLD4?=
 =?us-ascii?Q?r83Y6vLSS806RI/i9xLeJ6ulDDpevpC8zxAiTabLp+tiLLz0HaNED54+jYdc?=
 =?us-ascii?Q?wEMOiIyhCVQQ232hNGrwdK9Snn/joIKDCSla9j2Es91zN0X2PWbs9QkopMww?=
 =?us-ascii?Q?YyvAKMDzq5wfwqzw+2/R9iepU+411SO/bhwH8X48z7bxagJiR3SmZBYsU4zT?=
 =?us-ascii?Q?hvVgVtyu3KQ3q+DIAUaqe8KQZ7Fh4J5Z76Il6uaK7IF/dce5em2VYR8vtDyP?=
 =?us-ascii?Q?/tRcHw4ud5QdR/F5zMAn+1lp35Nq1kz3FOFZuFZzkZZ7+DolUMVpqmmzYl7e?=
 =?us-ascii?Q?1KKL2/GWbSTWjrtcctxG+Cz+j3zNRTdknieM96KX4k6XahRGo/YSAqhjrx7+?=
 =?us-ascii?Q?4hpTpDZ0ldqQl1rL4aIvr+bk6F7SVd516jiIn5s61bEn/4cbEXUKXlX+akJs?=
 =?us-ascii?Q?vkZfHJFnObLIL3Dq+9DCNBVYyoEUEwwemq7GMhevkd67Ctqwn11MHRdgFpWk?=
 =?us-ascii?Q?W6/lUQh7mDgmXqsiYIFW0DASPZBsbIWI5fMtmgOlxhyuH35iDQwdOlfdBrJ7?=
 =?us-ascii?Q?uUD/AktemuqyriZfNYANdS6rNN7a879+0M6KHhPAgVQfznlzcncWAAyd9ML0?=
 =?us-ascii?Q?nbFTKVU1JXQTe8JLjhxsSo5oCY0MlMH3jxm3QXDJYqzYyMLNdd9hyD8zXTVT?=
 =?us-ascii?Q?IV2FE14VajxUi/Hx+R21PbnJ01rZGkst6+gvj26ZK7sf6k5Ul33QbXIJNuWd?=
 =?us-ascii?Q?vpw62HDBNwqKPvz2IspOQkdt6dG5I/ZPl4JvW2EhrVZgiJSSGy2xmSx3Hvwt?=
 =?us-ascii?Q?m+PBsvFlVA3pGyPjG3qWLk0VVHkCBF3+PIF1f0rz50UzhwboNKzerAj4vzrC?=
 =?us-ascii?Q?l+jqJdHu/H6DVkkFvlM6Gl6fi5Hx5h6C0LItX+u96M33XUGOKWQDp1NJ3HIc?=
 =?us-ascii?Q?69mArgiPRoTzNLr5oaal3wWNzlqCDZclgnlctP2eNA3Z1lVR29ClNyL3HWXU?=
 =?us-ascii?Q?xne1nbfW0UAXfdg4MA5jjpPHk5cYR2zzHSgTjzxdFJZSQG8WMoMETqQQl/qk?=
 =?us-ascii?Q?ZT49ZC7OkeOIl5fQXU7pAEHlvIdflQoE0ffsIqOJdq4EmF6HMEoh5uV44d2+?=
 =?us-ascii?Q?oxcqa8AOp/0czj/xEf9V7nymWSh2x64c55W1wTWd1QOzr7OyxbWalKTfXnUG?=
 =?us-ascii?Q?WrD5ita2YbAUzRq7lG3WxV0C+nnYTAqklHKNV8TJw7ZFytSfr2w1uvv0A83/?=
 =?us-ascii?Q?Hs+DIXWSwhmB/YGp1eqslhLSvwlmbTop+3YHRg8Althx5xihA15YE4pBq78F?=
 =?us-ascii?Q?WNqhlTFM+A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 376b8f81-fe2c-46f0-4046-08df44baaf3a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:54:30.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yleC2tEu2pilzg5J1poJqc6eLrUPw8HOcUwuTmRLJcnHKwMx6rkY/cqJqBO2P84jOx30O2Nwf3Kwn06WS5dS8JeszNaOK7sJIX+V8e/Alg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 14:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250458
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://www.webkitgtk.org/2026/10/23/webkitgtk2.54.2-released=
.html

CompareLog: https://github.com/WebKit/WebKit/compare/webkitgtk-2.52.6...web=
kitgtk-2.54.2
(CompareLogs shows 5000+ commits)

- Refresh existing patches
- Add patch 0001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
  to fix a build failure with GCC.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 23 ++++----
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...dGLib.cmake-do-not-set-include-dirs-.patch |  6 +-
 ...clude-stdatomic.h-from-C-translation.patch | 57 +++++++++++++++++++
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |  8 +--
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/sys_futex.patch          |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |  6 +-
 ...ebkitgtk_2.52.6.bb =3D> webkitgtk_2.54.2.bb} |  3 +-
 9 files changed, 85 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-i=
nclude-stdatomic.h-from-C-translation.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.52.6.bb =3D> webkitgtk_2.54.2=
.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-t=
o-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 3d8ef579a0..243f5870bf 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-contr=
ol-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-contr=
ol-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 891c2de3ea6a3399d0144824c35b2dae0b7a246d Mon Sep 17 00:00:00 2001
+From bf74a02e45b3e147d912833a4ec6ba489a28344d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -35,19 +35,21 @@ gcc option `-Og` is used.
 * Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
 * Source/cmake/WebKitCompilerFlags.cmake:
=20
+Rebased on 2.54.2.
+
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
- Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
+ Source/cmake/WebKitCompilerFlags.cmake              | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
=20
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/=
bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index a845ed01..4bde7544 100644
+index c42ee5f1..353c58f3 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-@@ -46,7 +46,7 @@ __PAS_BEGIN_EXTERN_C;
+@@ -45,7 +45,7 @@ __PAS_BEGIN_EXTERN_C;
  #define __SUSPICIOUS__
  #define __BROKEN__
 =20
@@ -57,14 +59,15 @@ index a845ed01..4bde7544 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitC=
ompilerFlags.cmake
-index efdf8d4d..8c57ad5b 100644
+index 0793c789..9a139f2f 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -570,3 +570,10 @@ endif ()
-=20
- # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/=
139438>
- set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
+@@ -635,3 +635,11 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "GNU" AND WTF_CPU_M=
IPS)
+     # (see comment #28 in the link above).
+     WEBKIT_PREPEND_GLOBAL_COMPILER_FLAGS(-mno-lxc1-sxc1)
+ endif ()
 +
++# rebased on 2.54.2
 +# It fails to compile with `gcc -Og`
 +set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute alwa=
ys_inline for WebKit")
 +
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospecti=
on.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index f6449c29b0..37ad5ecb80 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 3cec4a230abbe5c2f78f8966c06b009be7504354 Mon Sep 17 00:00:00 2001
+From 1eb26767f3ce493e8fd4ecd7a0d3d8bb645a225b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.=
cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
index 334bf33fc1..d9d664bca4 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-d=
o-not-set-include-dirs-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-d=
o-not-set-include-dirs-.patch
@@ -1,4 +1,4 @@
-From a6e91e04651dbd2d003dbaef0919284a8944184e Mon Sep 17 00:00:00 2001
+From 1899b9f2eadbe4f2cd5b4a68d0788e8a9f02cabb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 21 Jun 2026 22:57:24 +0200
 Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
@@ -17,10 +17,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 deletion(-)
=20
 diff --git a/Source/cmake/FindGLib.cmake b/Source/cmake/FindGLib.cmake
-index 00de647d..68581c25 100644
+index b6ff9283..e9697ba8 100644
 --- a/Source/cmake/FindGLib.cmake
 +++ b/Source/cmake/FindGLib.cmake
-@@ -191,7 +191,6 @@ function(GLib_HandleComponent name)
+@@ -195,7 +195,6 @@ function(GLib_HandleComponent name)
      list(TRANSFORM dependencies PREPEND GLib::)
      add_library(GLib::${name} UNKNOWN IMPORTED GLOBAL)
      set_target_properties(GLib::${name} PROPERTIES IMPORTED_LOCATION "${G=
Lib_${name}_LIBRARY}")
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-include-=
stdatomic.h-from-C-translation.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
new file mode 100644
index 0000000000..f16900c378
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-include-stdatom=
ic.h-from-C-translation.patch
@@ -0,0 +1,57 @@
+From c018bf3bca4a42f9540e50e0f5080c38223c2ddf Mon Sep 17 00:00:00 2001
+From: Pablo Saavedra <psaavedra@igalia.com>
+Date: Thu, 17 Sep 2026 12:05:38 +0200
+Subject: [PATCH] [libpas] Do not include <stdatomic.h> from C++ translatio=
n
+ units https://bugs.webkit.org/show_bug.cgi?id=3D324345
+
+Reviewed by NOBODY (OOPS!).
+
+310886@main added an unconditional <stdatomic.h> include to pas_utils.h.
+GCC 13 cross builds in Yocto fail to compile C++ translation units that
+pull in pas_utils.h because of it. 312138@main fixed the equivalent
+breakage for xcodebuild by moving libpas to gnu++23, but a CMake build
+using an older C++ standard is not covered by that.
+
+The include cannot simply be dropped for C++. clang requires
+<stdatomic.h> to be included wherever the _Atomic qualifier is used
+(-Wqualifier-requires-header), and PAS_ATOMIC_TYPE() expands to _Atomic
+under PAS_COMPILER(CLANG). pas_utils.h suppresses that diagnostic around
+its own body, but PAS_DEFINE_COMPACT_ATOMIC_PTR() expands in other
+headers -- pas_segregated_heap.h and friends -- which are outside that
+region. Satisfying those expansions is what 310886@main needed the
+include for.
+
+No other compiler sees _Atomic here: PAS_ATOMIC_TYPE() expands to a plain
+type and the atomic operations go through the __atomic builtins, and the
+__c11_atomic_* uses in this file are all inside PAS_COMPILER(CLANG)
+blocks. So keep the include for clang, where it is load-bearing and where
+this is a no-op, and skip it only for the C++ compilers that never need
+it.
+
+No new tests. Build fix. Verified by preprocessing pas_utils.h from C++
+with both compilers: g++ no longer reaches <stdatomic.h> while clang++
+still does, and Source/bmalloc/bmalloc/bmalloc.cpp still compiles with
+both.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils.h:
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/74158]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils.h b/Source/bmalloc=
/libpas/src/libpas/pas_utils.h
+index 9626340809303..e781d8fb12c8d 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils.h
+@@ -42,7 +42,9 @@
+ #endif
+=20
+ #include <limits.h>
++#if !defined(__cplusplus) || defined(__clang__)
+ #include <stdatomic.h>
++#endif
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <string.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/m=
eta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index 9d10603e0c..a77db5668d 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,4 +1,4 @@
-From a7e4c23c7f6faf76307ecad5f879e47b96ca66c9 Mon Sep 17 00:00:00 2001
+From ae017d7bd4d98a28a4f89a4ca75493333172bd35 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
 Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 deletions(-)
=20
 diff --git a/Source/WTF/wtf/PlatformCPU.h b/Source/WTF/wtf/PlatformCPU.h
-index 8aac1024..d9d69a40 100644
+index fabd6cba..c8639827 100644
 --- a/Source/WTF/wtf/PlatformCPU.h
 +++ b/Source/WTF/wtf/PlatformCPU.h
 @@ -286,14 +286,6 @@
@@ -36,10 +36,10 @@ index 8aac1024..d9d69a40 100644
  #define WTF_CPU_UNKNOWN 1
  #endif
 diff --git a/Source/cmake/WebKitCommon.cmake b/Source/cmake/WebKitCommon.c=
make
-index 639b7e5d..c7e60287 100644
+index d96e1850..3daa0eaf 100644
 --- a/Source/cmake/WebKitCommon.cmake
 +++ b/Source/cmake/WebKitCommon.cmake
-@@ -129,8 +129,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+@@ -186,8 +186,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
          set(WTF_CPU_PPC64 1)
      elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
          set(WTF_CPU_PPC64LE 1)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/met=
a/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 4a04b1393d..c2e7961db3 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 07ff0c87a0f584c7c6cc1cf723641707a16255f3 Mon Sep 17 00:00:00 2001
+From 5cbe3e7db8982078157de0d2bcc8e8bedf7d3c77 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/reci=
pes-sato/webkit/webkitgtk/sys_futex.patch
index e9161ef037..1797d83303 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From 4ca8868a69eaf046db523a0fde869bfd46d9878c Mon Sep 17 00:00:00 2001
+From addce4888885a925f7711efda729d94cea312fe0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit ti=
me_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/met=
a/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 46431d78f8..84fc64ca1b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From c480a5dc8491d1422994007b149ee08f8d2cc9c5 Mon Sep 17 00:00:00 2001
+From 8b7bb89d335163162fdc374f5a231273ae5b2f75 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =3D?UTF-8?q?LowLevelInterpreter.cpp:339:21:=3D20error:=3D=
20?=3D
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 2 deletions(-)
=20
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/=
JavaScriptCore/llint/LowLevelInterpreter.cpp
-index fcec367d..851f68d9 100644
+index dd0b44de..c0a68a22 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -341,8 +341,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* e=
xecutableAddress, VM* vm,
+@@ -345,8 +345,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* e=
xecutableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.54.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.54.2.bb
index e7296d0ad4..fe6713d641 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb
@@ -17,8 +17,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${=
PV}.tar.xz \
            file://sys_futex.patch \
            file://fix-ftbfs-riscv64.patch \
            file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs=
-.patch \
+           file://0001-libpas-Do-not-include-stdatomic.h-from-C-translatio=
n.patch \
            "
-SRC_URI[sha256sum] =3D "179a2ea3f8f6edd4be7f31fdc55afc57bd0729f1fba648c61d=
4181539ac116fc"
+SRC_URI[sha256sum] =3D "a76345b391bef6211fb5ab6cfab2e86b285d18cda17cbb9ade=
595f1252b86065"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check up=
stream-version-is-even gi-docgen
=20
