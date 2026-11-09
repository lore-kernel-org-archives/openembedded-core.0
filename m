Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5991.1794231665316227038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DOPTDcyk;
 spf=pass (domain: est.tech, ip: 52.101.69.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DChVUFG87k18brLcPIBRqciW6yihzBERlJYUsBuxojMiPm3puSjICiTpSi7lnZsxOEg07DmEs2WuOK1Aqdw6fRddPeNPCN0U+ej110p8xTmXar9W916XlBtXBShD78bZyTMn171s4MUrilgFgd8+/nNVnWSDcOVcPvt5ipUsQPTL4zi9WJbyAJMz5hSc5/4/OIgyD05yVhpmt5B+S1/uC4BqaTHPH8mYf2YvOr5HeJt0V9GR1Abub/xVbgJ5DQCXjoIyIdp1XWeLLSvlisq79RyApXAg30bYBsrxqfFdPPbOYURJVsk+jyxk0m6hEwlFE9zMSH+fl3/9QSvcPfWicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+zyr3qmfuGVMIz4TTjQd5b3pOjZEyfXgpovo5miTgQ=;
 b=sFj/qDGXNm2r6pjo5I97kFIUwB8Zf9aLUZUPApTIvbt8uHQlBBH9T0DJL30ACcPvUqgpRCSHgbDOZ+lKV/YKL52KtXv16tXSCSpS74HajzNvVNIAb4HNBVtZkm+KBEM9F2r9hIAFjbiPw2prjNtSXC06jZ1MQEfCMyL/+M1Bao/6JzYEO3oNEsp83ahshgJusSHpwFgk+e5EWbz1FPDGgNYhZ8Ld+qUvp5cvrxsvZWqwL2BM65hpdrOTX0SHS958iIvy3p8ldNWaKFPveDJhxGo2Arqy/UbCDXVpiI3x1P5/MEoz+qgG0ClTxEVReMt9jJGWZdgdISQjW2FXoNBuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+zyr3qmfuGVMIz4TTjQd5b3pOjZEyfXgpovo5miTgQ=;
 b=DOPTDcyk7WZClu3TUI4/yyFAF3ujtdZbPvf+PLIgRG87Cf6BUDksig8ercxwqDjnPoud65l2N3F6572weV14ad6Zx9U38QoYypk+vzUqOuiCetzMNJpnUsOxNhVIaPiZWjGFLUNejAd/28BSQn1Tgt/ty5pHHgV9Pc6nd737c/ijY5KoBdVkRmeXNcA4sM4zxJy3tjpZWkMTwVV5vR/fj0gaftUPgTSopR6Mqp9omt97MxJyTpoa6G+PGNdDfvCylA2IOCWeVaUDrxLLQ4xbIcX6LpCg21qg3v5E2QvtBye2CIc5Yms+96jvjVb3AOKptEqylz3XK+1+UWmpsDhjxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2200.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 13:41:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/21] fmt: upgrade 12.2.0 -> 12.2.1
Date: Mon,  9 Nov 2026 14:40:28 +0100
Message-ID: <20261109134034.74458-16-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0212.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2200:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6b0bd9-6b56-43e5-5441-08df3e6717e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|6133799003|3023799007|11063799006|56012099006|10067099003|261026121527099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: yUVdX+XvDCCiY7MaZjmmEuZv7y1VrSnHE3dRS42B1mPmloK0mo8ku9gr+XzxWK3jzYjg/NrB4PRRaTR7eVihu+8byZhQSMEQy2laSh8sl83YBGJKgxiDM3WxXy/IfjzwJOSV3dp81RQvAhnf+tdLwlxQSk6ePo9x3zbR/x9iV8O5Q3DI431PRcFBOvykrIKRPy8nzxa4CSGpdzDxZAob7mYLt5+fTUBK4Vry6FnsrNCblA+fJPXinWWhua97h1eDBpn2o3G8JEi+4D2yGSht7Ec+xFG5lLqakhEjduw+cz+BINHBh/wwxM5ZaIY7k62YuEKg1UNXS/epYnSbfCwNK00wkW7qk4DeyNJq+etwddNeqipjWzdKYDMYGZFWemXbnJfYAQeyjTo5/vt99iqaapMWERcMXhxCWtm75tDCGdaAUxKKmJ9jVKztWVqDbzfJlaNjy06DYf7WP16Hi8SxBuSRcCP0ysRxCbndafS7LeWQuwauH4UTEg2feHW6ApRCjB1TASoPEmohWAtN3zmNvG0X0zz0Y/rO/ZOVFyZK4ZAXmU4QAoLmEUNvyVu3lkXHJFw0tqktC+FSGo5v/J879afwFvjAiBLGCPQ9Cj22gCQMuSNd7yNdY9J5ATTsaSMUvH92j5XT9X3Ishp5PXOPDX6dtRmTM7e9KX+9/+opK78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006)(10067099003)(261026121527099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fcHy+5CKmmSlGlXTyX8qPCdAPK6BMSTf+qUFqXAYbZr05y185SI8r+6SL4L?=
 =?us-ascii?Q?WgrAy3AC/3bY1uVFb72bRv6y/FJYQs3oIXLlPrJ0iEIN/ck8GpwiDV7g+Oub?=
 =?us-ascii?Q?2euYdFrucDe/mCmy6WlDT37yvwhhiSLP/VpBaRInSow7vh0z/cgIjJdsgYgI?=
 =?us-ascii?Q?WcMcLOR05TfvpYLPsCNfhw5QDagtXNkxD0E9z4b3bqW9X+8kzU/bJmDFRoyH?=
 =?us-ascii?Q?rW07V2ft/iLqn3GsBfD5cbymFWIGkAVwp3AR9kzfGEuoigqSEP9r/NSRRI/O?=
 =?us-ascii?Q?AvNntqVPQ0Tnu5GlSUa6mDlpR77Jv3uzbbU5gFfUfzZdQx46hDYMPygCr94z?=
 =?us-ascii?Q?9qZ8ODBmd/Cp1Xkeodpc0sefaGOx4041Z6QuBqMwJvFehNpkmVX+HlJ6aam/?=
 =?us-ascii?Q?HJzfjdoLWtdXZdu9OwL+442swjpa3EndGu3cdC3V2SuBE5Ns9WTv4X3LkYxG?=
 =?us-ascii?Q?Lj8CS4u7NSc99c4uAesOndzgKwA0XKchzSwYuUe9TaeeyPZU6s1XQhYS5qII?=
 =?us-ascii?Q?r0SENtfXsQN7k81/PCVuqOVhMiwf8LAez8j+yO0hlROv0yoezvLxNWOkLUCU?=
 =?us-ascii?Q?KuKkbmpMn1LcV4JXxFsV4Ys05fivoHHvJL5m9+tMy8JhqgF6z5zVLgyBGf7q?=
 =?us-ascii?Q?Nrq74P3JD1wuR8CODg3Qmgh9yCabynA9n3ds4FGk/d4jdi3jdgBC53tz7az/?=
 =?us-ascii?Q?s7f9LCDqC6fsyy9MegDzXFhqQZciWI8X3mHyDU9spUdlOIsq7zOGTA3d6OgJ?=
 =?us-ascii?Q?qFLNd2EIaD/XaHiEFbZrW6WXTS1vqyNihphVL3vE8z/LAifo8IXuogfmWZla?=
 =?us-ascii?Q?Ps4UV92J31kiNqd+Mr6Ek4lc9HOdDun0AVJ14Lt7+jsjlq9gfw4NVyhwWvAy?=
 =?us-ascii?Q?pxjtTsK4A3RwEsn41TX8unpJxQcYOk3d2gABfI4YiFX8TanjkaEnMRnO77cu?=
 =?us-ascii?Q?59PHdeZCYA3luumMF1INctnxc+COMMlprF4X4GcrsqsT7NvKIjk3XC9nXy1Z?=
 =?us-ascii?Q?Ix/2K+6PiVz1xvVOZjZzqVlvKOpKbsvDH++ONDZPnsxA0fQkISKOksGX2Cr6?=
 =?us-ascii?Q?NYUBwobh0gqNu0FgmvNENa2ppRzCVItkU37zwlU+u1w94FqILNVUhhGlmQB6?=
 =?us-ascii?Q?e5VWAiw5FY47JTh5texF7+I/I+PbdGRpmN/ANOUBqVqFT7GMyHYv3sIa6h4P?=
 =?us-ascii?Q?C52pfVIZlyVUWMxt3B1fxdKZGVZXEPlUdhDkNV06CETpvGP9xodj7wHBJtZc?=
 =?us-ascii?Q?T4mLWEw0P7uzGwXno7mIGpsdVXOGKjQYWJB4OgCvMs+30EGzII+GXBVuqHUY?=
 =?us-ascii?Q?sMlOegTtIkWdGyG4rsj40jtnDr4NtLPs3T/QrMFRn4deVhe9/dscR419ZRWe?=
 =?us-ascii?Q?prew8p7uakQv3+amiHGsez0RSqSRwPTw6hSVUow3VOxiOopTVl+g+5zbQGlF?=
 =?us-ascii?Q?SwrPB4G8iPe3SpvaIQgBf66acNsGWlJ0SyxyyGjvTBMXZ3gHmSq4861OV3Mu?=
 =?us-ascii?Q?TLXsLxxENwMb5AbscT8mUouDIDA3/0VM29kx2oQYFMFdUw2UUMHzMy5z7Xvb?=
 =?us-ascii?Q?g6xqYU9S6V56yWfsAFNSLZYAo+1IaedCkdpsYU/K7+zpSMoAviJoHBivsdjO?=
 =?us-ascii?Q?mlq3/YG+/WRDpV3I++9CEKm3E97Cbn2PKRCuymwZD9O/rj77xO5MZ3lvMJTY?=
 =?us-ascii?Q?dOtHFWagfmADYYYq/tCwnD+pcLGKNXEMvRn8A9Agggaopsaks5UMan7et4I1?=
 =?us-ascii?Q?qwnqCj+Kfw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6b0bd9-6b56-43e5-5441-08df3e6717e2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:01.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXT/4WAOJ/qMw8M0NZ5RYI/R1NgRCojrrgXNUXvDNYz9s57PfgfbwauYF/JHpJ1ntJ/vEwx2/34PToTmCZ+b2WzRSlHyQiasgXOdcR5BhtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249820
Content-Type: text/plain; charset="utf-8"

12.2.1 - 2026-11-07

- Fixed a heap buffer overflow on 32-bit targets when the size of a formatt=
ing
  buffer overflows, e.g. `fmt::format(L"{:>{}}", s, 1100000000)`. Such
  allocations now throw `std::bad_alloc`.

- Fixed an out-of-bounds read when parsing format specifiers of
  `std::error_code` ( ).
  Thanks @IfkumRfnl.

- Fixed a crash when formatting `nullptr` with `FMT_COMPILE` and an excepti=
on
  in `fmt::to_string(nullptr)`; both now format it as `0x0`
  ( ). Thanks @INo-xious.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-fallback-uint128-bitwise-not-4813.patch   | 10 +++++-----
 .../fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch   |  8 ++++----
 .../fmt/{fmt_12.2.0.bb =3D> fmt_12.2.1.bb}               |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/fmt/{fmt_12.2.0.bb =3D> fmt_12.2.1.bb} (88%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwis=
e-not-4813.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-=
bitwise-not-4813.patch
index ef5c6e9f82f..e07e89b39b1 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4=
813.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4=
813.patch
@@ -1,4 +1,4 @@
-From d838c8c7923730afb751350ecac2b169256f1445 Mon Sep 17 00:00:00 2001
+From ae7e9eb7f0c17735d577d1a7dea4f2ce78b46700 Mon Sep 17 00:00:00 2001
 From: Vinay Kumar <vkslog69@gmail.com>
 Date: Thu, 18 Jun 2026 12:22:12 +0530
 Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 8 insertions(+)
=20
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index f33c8b87..ca95f6df 100644
+index 36f483a4..07b99ca9 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -326,6 +326,9 @@ class uint128 {
+@@ -327,6 +327,9 @@ class uint128 {
        -> uint128 {
      return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
    }
@@ -25,10 +25,10 @@ index f33c8b87..ca95f6df 100644
        -> uint128 {
      auto result =3D uint128(lhs);
 diff --git a/test/format-test.cc b/test/format-test.cc
-index 61a53c72..7e48b751 100644
+index 3de178a0..d2ef0144 100644
 --- a/test/format-test.cc
 +++ b/test/format-test.cc
-@@ -81,6 +81,11 @@ TEST(uint128_test, minus) {
+@@ -82,6 +82,11 @@ TEST(uint128_test, minus) {
    EXPECT_EQ(n - 2, 40);
  }
 =20
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-=
spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-i=
n-spdlog.patch
index afae644d490..f2df082a48f 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.=
patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.=
patch
@@ -1,4 +1,4 @@
-From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001
+From 96adf3e174ad93daa2833e9a924e195a70392b6a Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 5044befd..f33c8b87 100644
+index 672a8ddf..36f483a4 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -774,7 +774,9 @@ enum { inline_buffer_size =3D 500 };
+@@ -775,7 +775,9 @@ enum { inline_buffer_size =3D 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE =3D inline_buffer_size,
@@ -24,7 +24,7 @@ index 5044befd..f33c8b87 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2769,7 +2771,7 @@ class bigint {
+@@ -2770,7 +2772,7 @@ class bigint {
    }
 =20
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_12.2.0.bb b/meta/recipes-devtool=
s/fmt/fmt_12.2.1.bb
similarity index 88%
rename from meta/recipes-devtools/fmt/fmt_12.2.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.2.1.bb
index d68684e4f69..0f3eeec20ea 100644
--- a/meta/recipes-devtools/fmt/fmt_12.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.2.1.bb
@@ -5,12 +5,12 @@ LICENSE =3D "MIT WITH fmt-exception"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ec080902ed8f82f5a97ed13e804263=
4 \
                     file://doc/LICENSE-exception;md5=3Db9257785fc4f3803a4b=
71b76c1412729"
=20
-SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmain;protocol=3Dhttps;ta=
g=3D${PV} \
+SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3D12.x;protocol=3Dhttps;ta=
g=3D${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
            file://0001-Fix-fallback-uint128-bitwise-not-4813.patch \
            "
-SRCREV =3D "1be298e1bd68957e4cd352e1f676f00e07dcfb57"
+SRCREV =3D "208219daff58f2a7438f6931cc2ddc358acf33ef"
=20
 inherit cmake ptest
=20
