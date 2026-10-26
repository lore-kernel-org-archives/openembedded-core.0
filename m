Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43501.1793022617708835509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 06:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kAPKVuNw;
 spf=pass (domain: est.tech, ip: 40.107.162.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJW7A0Hm680WYuXIzzsl4ka8w0DZrYgBWMWtVdIBv2cai1TBF4s0eSxdY48DiSTfesrXfBYIgzloIWGQDHbAzmWmH8e2Reei0hoDNEYwrtqQD6MsYCT0Z0vTROTaNie5Y69r3Db/CAfbN2+dxkdUTy4ziRIRtjdc+GVqIuhWLIBCkTN+458rOhje5yn/NRqaQkR75vdYkMv7ghVBIKwMFOPv20YW/4WyUWTopVTOpJMYrLpg2Xy1LC5pN6e2JmEe7XkvFBXhaH5Xqoho9vkPow3GKUce5S6OgJBLuJg2a+4EoLcHrUBKpz3OQPdT2VTMQNm+2NuoYO1yZa9Yb1wP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WSWZSwWbtDWXFL2DcY4ADPK0gfDSBfvuqO2tFVschQ=;
 b=J2DOC8TdzejJeC/vjuSEGGjg449SqRImywipMwgo9FvjYtpQdjwqEDPpJEHkwkrPz0ItEvMtrgqZmB8Fk5d6losk+JwpHhNb6kPCzvPYkX7RRLmQ7AY/T/aQmp8G4hTLP80N5fMLv9MAx0yvXN82h95MAiLiC0Mgo9gOBFy0gIQB/xa5SdZNNEeC2JGD5/TAStJfo6aPSJjsUg5Ut2Q8sc2bhNmFDT9taKrQCtSM/E4uQaQT94UL7FypblD6GMwLM8VYf59bZaeiOZvX2XRxbvNSzkzMYqV3GvGLIFPmM7CSK6Aw9koRq/Xr0tYeJxnt95a3EaEmQpGnTVvQI6sycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WSWZSwWbtDWXFL2DcY4ADPK0gfDSBfvuqO2tFVschQ=;
 b=kAPKVuNw/9fnj4sx+UogmUJE3fLnKb37M1pUWhiwR7dSi3FVzIHLWgbPbLEo8gS4R2AGIOlzxSqDFDvqPJ5WPQsI8LRwrvLjrI+Ju6nJ6RIBr4J154szzE9WPRuGyHQRCwNdK9NPTqW0kwyVRUlF1mdKf8RDnPxD/Ihp3SxDrCL3vqWgkqn+a4XoG8APNal/fu/D3c7OM+dd8xzxm+++7P+vwXOStE0IGTVCgqrciGFneiOJB7S9oVS4chmnQwwr2vmlC+enjhCHxSAGLxU3o3HWDjMNAf2tQK9O32dUsV0PZqApkPEW05TmWr59ZpusYFmY4K6OqvDtOfjVm3GSmQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB0953.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:47::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 13:50:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 13:50:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] icu: Upgrade 78.3 -> 79.1
Date: Mon, 26 Oct 2026 14:50:10 +0100
Message-ID: <20261026135010.4935-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-6-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-6-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB0953:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d99f1-a40e-4c1e-af94-08df33680eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|22082099003|18002099003|3023799007|11063799006|56012099006|261021123027099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261022105027099003|261021135927099003|261022115727099003|261022075727099003|261021121427099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: R3s0vo+Czy6rkZFJZTmUhNvwYBRGHJmYIF/cXEkz8QxlmawcKaQSWtl5v25abtahu2vYPk43KB4X5g9zOtFb87FTLdgCkmzr2+E/ComjQomcY4fwuhFeb9UcOixykZ+qz/D4Ig1K1KQpzxdSQTwgM5QQ5fH63WST4SOK6K0V8CboQ63s+Ol6NdLrVX7QZ9gLGP0po7E8rkkrZ6Lvw59n/XPhOh/qC0KvDEuA4/zl2yX+aAmV77jZdY+OC2R2F7o22WlNwo5yaEYipN6HZ2DW2H3o/xy1Ok2a+eZOC4UE8phO9IEcAPPUTe+b7ILDWL8/wpQm1fo1FTbMb1/TBYW77rO1OILQIeV6axlbyFbfdXYLofSUkXUZFpagOjB9ioB5hFq2Z9d69v0kb2hW5ebUu1Zex/iBi8TmTARw+qeEEPNg/pF0eF5F/Oq6ryhgR8Uk4ILZji3bFU+lpJuQBciJe7+Y+NOFbzhU5bqhyhMhdOPmEiT+8xxiOLZiIOqHlau09XmJ++X4vEwjaGULleRzjDkTmo87egyi3JsZ1m8u0Og4qJcQY+h1nCnnawuDLz4fHhiSvPX9EII6MpPmJq7ZSppFB6Z5CE+e3+N4QUX+aCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(261021123027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261022105027099003)(261021135927099003)(261022115727099003)(261022075727099003)(261021121427099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxrn9gHQ4uT/AJ3QP4hwubOT3RMIjHvkDHAhpkO/RG0oj4ilg09N48faKqg+?=
 =?us-ascii?Q?Mnme7sFc+IRKKCKKGVIkEkKwxP7SIQoha1aPvuiB3oghgvvYicU2btu4SLCo?=
 =?us-ascii?Q?ICMWDAlXByzZpRWqmcUhiYvr+NhydnzBAH6zQEfKH0djNpa1OtOBWkpNOlmr?=
 =?us-ascii?Q?3ehIlLG2lvKh6tGcoGqwaEzP+HQB1QAElBxKZdh1xelnJQp1E7E2E/A2olRu?=
 =?us-ascii?Q?EtWYZY2VrZnE0A4YYiqG+aT9Kd8wntO6lOTxeibWN+Gj+5eP8VrSasVX2OM3?=
 =?us-ascii?Q?2U18X5W6M/ZS4uIhsbE9bu8JVmhOykS23ImkXTGOU+GFPeuXW8QL5cgwDHfl?=
 =?us-ascii?Q?QlPW2QXxUYoWmE2ncRRFD5cZ6sf1oJV9eQ9wEp3cqtvNGNZ4SBRCwjKY02FN?=
 =?us-ascii?Q?YMJzumvf23ZQbFupk3o6KWOW1WjiQxHoC+ospszOs+eO0hC+tZD9sZklLv9n?=
 =?us-ascii?Q?MiFuZeYljeOu/WjRadq/jqmBdV98HvAeWPXw7NWWVPqLFemCCFpxFo/chtLf?=
 =?us-ascii?Q?OamMmDgGSYVObV1e6ke3+RS3hPtZQl4qA+8R5MExk2WHFMGsevdSw6vVLP/u?=
 =?us-ascii?Q?zrTFYFZtdT5UwIN3Mv20UXuI7RRMebibQ3sI0BTzIZle2YM2hjCRIEMXwG8B?=
 =?us-ascii?Q?kxv2BqF0zNUFp/XS5nhcNilj8ffqDM4URCG20hVQg9DxA/9SBxQDJy6lK5Dp?=
 =?us-ascii?Q?3ISmJeom3NOKRIhI3qywRVXktWD+0PksxfQcTVGGwEh7TT89eLajROkVdWs+?=
 =?us-ascii?Q?Rvo8QgOTEQydJR+9uz23l2i7s1MdPbBx5Vt8yScnTRxLYHrHlSO4WrdqJdL6?=
 =?us-ascii?Q?if3BcHq3b/h66IObkbS3SoYIQ2IhB4J2OYLIR6nYbR0tcHGvOzzTYPCyQufJ?=
 =?us-ascii?Q?E2zWLpw4wNOwlrwltD5SFcOgzQ50BT4p3q1KkDvFfRdrAwd/xH6dWVleNz9Q?=
 =?us-ascii?Q?1WTxaRAXmFYC23iuLHVQ45kAVd/XA2NF570YUeJYDadlfiRpEpzjimc4Ba9M?=
 =?us-ascii?Q?NLRvf09E9UozTiR1QVJpUvaxaVls0j5cyGd9gQda4p7P3HtQDGbDHEyDsnGh?=
 =?us-ascii?Q?CGejCyftwW3zFM3LX0JCy44kSGQT23x9Bm51BJkprA4VvLBY1Z7qI6nZd98r?=
 =?us-ascii?Q?etpxojvKMfIGPh2jopNYdCVCegUL027RlzZmScncoidgk2T0jQbl1KvDsBfx?=
 =?us-ascii?Q?E9V5+B1nzdj3G3PlcD1ucIQknPY72K5xiAgl62YIM/7sq746YpTl8ViXm1M/?=
 =?us-ascii?Q?U93Pz/IYU+2f5jgJ+Z8DEbmplwOeCt0IwistMC27nK620ECojVx3sSFjTLNc?=
 =?us-ascii?Q?8LcnFMX45LflOHKACC+Cz8B4mKsMz07cS8F2PoWuPGbfH9NJD64zowI3oWjr?=
 =?us-ascii?Q?3EJKaa+88IZ7yxURw+uW8fYsnqzJytY+Ce6x5mukVwNiN/evvMBaE0ayeoYo?=
 =?us-ascii?Q?BwduhL3G3J58Xd2c7tZ+evZw7BG/IPoJDzC9wLXmflpXJMM/RZQLabNo3e9E?=
 =?us-ascii?Q?+O36IMaE3vOPDV0fqaigvLFtt2i+jhlgDhkxDyXnonkeAzX+qDd3rdzM7DLr?=
 =?us-ascii?Q?IYtwoyGuumjNeFQTV3kw41Ka8itPDgrvGGOggNgu31hy6P/9QwsuZ+OnraDX?=
 =?us-ascii?Q?gVVGNl2HlyDfzgtSBKcbE/qY5m53pfEyJ7Gcxh6zaKa9hYSt2mSgw9tasAOB?=
 =?us-ascii?Q?8mUtBehi42qUJRSxnlh24dl6Jh5XY1GvRpNFS7Smqs/CpeRKR4zLftKApxB+?=
 =?us-ascii?Q?rWdLlIS7d1kHKbclks8RdjY4zZjkx+s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d99f1-a40e-4c1e-af94-08df33680eab
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 13:50:12.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sqm8h/xS29jCifyq098/XPLcNBHhmiJTaTH55opBXYezxHkwlg7KsApJpgyJVGGsBIB1srNti6jmDmuRLWx2h5AOiwKbuc72X7CCw5oYHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 13:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248683

Release: https://github.com/unicode-org/icu/releases/tag/release-79.1

- Refresh existing patches
- 0001-test-Add-support-ptest.patch updated for 79.1
- Drop copying of testdata as it is part of source now [1]
- Increase ptest QEMU memory to 4G: new 79.1 overflow test
  ICU-23537 allocates a ~2G buffer, which OOM-kills the test on
  the default 1G guest [2]

- ptest results:
  qemux86-64:   995 tests passed, 0 failed, 0 skipped
  qemuriscv64:  995 tests passed, 0 failed, 0 skipped (~1751s)

License-Update: Copyright years updated.

[1] https://github.com/unicode-org/icu/commit/a9fdce608194b080e1b1372e2ddb5=
3d98822a7ca
[2] https://github.com/unicode-org/icu/commit/d37a22cb9921a76268e325fdca7d3=
e70a6851191

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
 - Increase ptest timeout for icu

 meta/recipes-core/images/core-image-ptest.bb  |  2 ++
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch |  2 +-
 ...nicodeStringTest-TestLargeMemory-on-.patch |  7 ++--
 ...tput-compatible-with-Automake-format.patch | 11 +++---
 .../icu/0001-icu-Added-armeb-support.patch    |  2 +-
 .../icu/icu/0001-test-Add-support-ptest.patch | 35 ++++++-------------
 .../icu/icu/mangle-build-tmp.patch            |  7 ++--
 .../icu/{icu_78.3.bb =3D> icu_79.1.bb}          |  7 ++--
 8 files changed, 27 insertions(+), 46 deletions(-)
 rename meta/recipes-support/icu/{icu_78.3.bb =3D> icu_79.1.bb} (95%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 22bb23c0e73..9b8af9b93a7 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -11,6 +11,7 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
 PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-icu =3D "2400"
=20
 IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
=20
@@ -49,6 +50,7 @@ QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
 QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
 QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
+QB_MEM:virtclass-mcextend-icu =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Lin=
ux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux=
.patch
index c0e9e2806b4..a17e4a95631 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patc=
h
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patc=
h
@@ -1,4 +1,4 @@
-From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
+From 4438ec38c596c273095e114ab683c297c04ac00e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeString=
Test-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-2312=
0-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
index 0bf1910d187..602d3270302 100644
--- a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-Te=
stLargeMemory-on-.patch
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-Te=
stLargeMemory-on-.patch
@@ -1,4 +1,4 @@
-From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From 9d3534a96511fb760fd5c50ce53f37c53874029f Mon Sep 17 00:00:00 2001
 From: David Seifert <soap@gentoo.org>
 Date: Sat, 21 Jun 2025 12:28:15 +0200
 Subject: [PATCH] ICU-23120 Mask UnicodeStringTest::TestLargeMemory on 32-b=
it
@@ -11,7 +11,7 @@ Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
-index 56976b3e3d2..26225f5b5b5 100644
+index 3f382c5..6049332 100644
 --- a/test/intltest/ustrtest.cpp
 +++ b/test/intltest/ustrtest.cpp
 @@ -2375,7 +2375,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppen=
dToSelf() {
@@ -23,6 +23,3 @@ index 56976b3e3d2..26225f5b5b5 100644
      if(quick) { return; }
      IcuTestErrorCode status(*this, "TestLargeMemory");
      constexpr uint32_t len =3D 2147483643;
---=20
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compati=
ble-with-Automake-format.patch b/meta/recipes-support/icu/icu/0001-Make-ICU=
-test-output-compatible-with-Automake-format.patch
index ab88803b36a..af75261f7a7 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-wit=
h-Automake-format.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-wit=
h-Automake-format.patch
@@ -1,4 +1,4 @@
-From 4779f798463d673dd74623979ec93141eb60d07a Mon Sep 17 00:00:00 2001
+From b315f37fd8c588632bcf01c43a191ab56a08fbed Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 21 Nov 2025 10:47:59 +0800
 Subject: [PATCH] Make ICU test output compatible with Automake format
@@ -22,7 +22,7 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.co=
m>
  3 files changed, 34 insertions(+), 2 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index da4f170..514fa0c 100644
+index ec84aae..7e036e1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1103,6 +1103,21 @@ If set, it will REPLACE any automatic list of libra=
ries.],
@@ -54,10 +54,10 @@ index da4f170..514fa0c 100644
 +
 +
 diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 33829b0..bf3ef56 100644
+index f09da7b..9909266 100644
 --- a/test/intltest/intltest.cpp
 +++ b/test/intltest/intltest.cpp
-@@ -824,11 +824,19 @@ UBool IntlTest::runTestLoop( char* testname, char* p=
ar, char *baseName )
+@@ -828,11 +828,19 @@ UBool IntlTest::runTestLoop( char* testname, char* p=
ar, char *baseName )
              saveBaseLoc[0]=3D0; /* reset path */
             =20
              if (lastErrorCount =3D=3D errorCount) {
@@ -100,6 +100,3 @@ index 7634526..c2e11dd 100644
            if(!ON_LINE) { /* had some output */
              int spaces =3D FLAG_INDENT-(depth-1);
              log_testinfo_i("} %*s[OK] ", spaces, "---");
---=20
-2.34.1
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patc=
h b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index a25285fb541..f222045cf81 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
+From 0b3d2340ca2a88aeaa41dd2363584ee42930c42b Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch=
 b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
index d9fd8e3e43c..9947a74008f 100644
--- a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -1,18 +1,21 @@
-From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From c3ce4ce9b23ec8e6f0966bca8edef6cf937bdc7b Mon Sep 17 00:00:00 2001
 From: Daisuke Yamane <yamane07ynct@gmail.com>
 Date: Tue, 1 Jul 2025 18:35:25 +0900
 Subject: [PATCH] test: Add support ptest
=20
 Upstream-Status: Inappropriate [oe-core specific]
=20
+Note: Updated for 79.1 - dropped the intltest.cpp hunk since upstream
+removed that code, kept the four Makefile.in changes.
+
 Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- test/cintltst/Makefile.in  | 2 +-
- test/intltest/Makefile.in  | 2 +-
- test/intltest/intltest.cpp | 2 +-
- test/iotest/Makefile.in    | 2 +-
- test/letest/Makefile.in    | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
+ test/cintltst/Makefile.in | 2 +-
+ test/intltest/Makefile.in | 2 +-
+ test/iotest/Makefile.in   | 2 +-
+ test/letest/Makefile.in   | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/test/cintltst/Makefile.in b/test/cintltst/Makefile.in
 index 552a105..9cf3071 100644
@@ -28,7 +31,7 @@ index 552a105..9cf3071 100644
  LIBS =3D $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFA=
ULT_LIBS) $(LIB_M)
 =20
 diff --git a/test/intltest/Makefile.in b/test/intltest/Makefile.in
-index 5d4a03b..ca4e4cd 100644
+index 2e44831..d5bd240 100644
 --- a/test/intltest/Makefile.in
 +++ b/test/intltest/Makefile.in
 @@ -39,7 +39,7 @@ CPPFLAGS +=3D -DUNISTR_FROM_CHAR_EXPLICIT=3D -DUNISTR_FR=
OM_STRING_EXPLICIT=3D
@@ -40,19 +43,6 @@ index 5d4a03b..ca4e4cd 100644
  endif
  LIBS =3D $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUUC) $(LIBICUTOOLUTIL) $(DEFA=
ULT_LIBS) $(LIB_M) $(LIB_THREAD)
 =20
-diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 3806d0f..33829b0 100644
---- a/test/intltest/intltest.cpp
-+++ b/test/intltest/intltest.cpp
-@@ -1707,7 +1707,7 @@ static bool fileExists(const char* fileName) {
-  * Returns the path to icu/testdata/
-  */
- const char *IntlTest::getSharedTestData(UErrorCode& err) {
--#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING ".." U_FILE_SEP_=
STRING
-+#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING
- #define REPO_TOP SOURCE_TARBALL_TOP ".." U_FILE_SEP_STRING
- #define FILE_NAME U_FILE_SEP_STRING "message2" U_FILE_SEP_STRING "valid-t=
ests.json"
-     const char *srcDataDir =3D nullptr;
 diff --git a/test/iotest/Makefile.in b/test/iotest/Makefile.in
 index 16c510f..9eeff4b 100644
 --- a/test/iotest/Makefile.in
@@ -79,6 +69,3 @@ index 156c86f..555a820 100644
  LIBS =3D $(LIBICULX) $(LIBICUUC) $(LIBICUI18N) $(LIBCTESTFW) $(LIBICUTOOL=
UTIL) $(DEFAULT_LIBS) $(LIB_M) $(ICULEHB_LIBS)
 =20
  COMMONOBJECTS =3D SimpleFontInstance.o
---=20
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu/mangle-build-tmp.patch b/meta/rec=
ipes-support/icu/icu/mangle-build-tmp.patch
index cf24e53b886..a2bce61c72c 100644
--- a/meta/recipes-support/icu/icu/mangle-build-tmp.patch
+++ b/meta/recipes-support/icu/icu/mangle-build-tmp.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From a729216a3fbc4d9eda9cbacd8b8dc6670c797978 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
 Date: Sat, 28 Mar 2026 20:29:53 +0100
 Subject: [PATCH] test/udatatst: Mangle /build/tmp
@@ -8,12 +8,11 @@ Content-Transfer-Encoding: 8bit
 This string matches $TMPDIR (in a kas-container) which triggers the QA
 check buildpaths:
=20
-ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/t=
est/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bu=
ildpaths]=20
+ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/t=
est/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bu=
ildpaths]
=20
 Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
----
 Upstream-Status: Inappropriate [This QA check collision of Yocto specific]
-
+---
  test/cintltst/udatatst.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
diff --git a/meta/recipes-support/icu/icu_78.3.bb b/meta/recipes-support/ic=
u/icu_79.1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_78.3.bb
rename to meta/recipes-support/icu/icu_79.1.bb
index c057505e3cc..a920c7f2e12 100644
--- a/meta/recipes-support/icu/icu_78.3.bb
+++ b/meta/recipes-support/icu/icu_79.1.bb
@@ -92,7 +92,7 @@ FILES:libicuio =3D "${libdir}/libicuio.so.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3De531a388be7c1df9a0fb7b4010c9=
c1d7"
+LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3Db2329a1b467abf456a6eb531b500=
0855"
=20
 ICU_PV =3D "${PV}"
 ICU_FOLDER =3D "${PV}"
@@ -117,8 +117,8 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
 SRC_URI:append:class-target =3D "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] =3D "3a2e7a47604ba702f345878308e6fefeca612ee895cf4=
a5f222e7955fabfe0c0"
-SRC_URI[data.sha256sum] =3D "9d8b3899096aeb83e4e21ef8a40fec9e03b28db18c484=
52efac882ce25a91e27"
+SRC_URI[code.sha256sum] =3D "06fa63ecb521048f8082f12ad988f6b678d90cbd88aaf=
ce24cbc94902b191d99"
+SRC_URI[data.sha256sum] =3D "b3a430009bb5fab77b1a4b98fab85cc8f887e26d4e416=
6121724298ae14d7224"
=20
 UPSTREAM_CHECK_REGEX =3D "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI =3D "https://github.com/unicode-org/icu/releases"
@@ -167,7 +167,6 @@ do_install_ptest() {
     cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
     cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
     cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
-    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
     cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
=20
     install -d ${D}${PTEST_PATH}/test/tests
