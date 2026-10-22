Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19009.1792661699595530044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gVfvtXOq;
 spf=pass (domain: est.tech, ip: 52.101.84.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfW6n12C2NN/dhHM5fZ2FV1/xhd/AyoWZWlilZDTMM2yHxnJYweBZl+Du+KKRDPknHSUTUPD5upRY6dWGAN67IFkrqMA6NLZzFwaxEX6zoAJCze6K1Wd6/vWJYlcd41j7BJJD67jSNjyFqd15bkYdoHcuUfMpS0aH55TMjTV2JEarbrJnw0rlfJ4lD9FvxHscWqBRQBizLtLgDg81phxy00mhsjB4lFzk/46YJSt8vFq/bqWRn/gtGorzjbQsL8Mz7TidklJxD5rD3XN9Hqr35WlFtjWlIMyqWjPoY28OcLJeIt1udkhj2o4ZdFcdDnie+v4RVDAt40ZEZ3HIVIkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVPbORrQoKd/G1bZD4T+H4qgS9nSnOhz0qUhFbFHL1w=;
 b=ckAMTL+aKWwvomAsu1I0JoFle+B/yy7DGGtPfhC1gkZUZnsjbRhP8xIjCONIYqjlqeFP25QyZvWjmh6SQZxa0Ql/LUcZSOCjiTK39rHzejrN42sRIwB3y4EKCtDkDnlNCqhytjm9xeJerz5vm62zeO2u8/fwH4vDaYsK09aqNpFniUVKUbR7Wcu0nuo19XwwsEB7fSyASxjGcwwzkjqJHr8lI8PXf1FDALaRtxSVrHm4o+Nm1E96eVh6smqnT8teNaPdHGXuCZQwEIgTNyNQ1bM9AeZl5XehionBtXLJ7ASFDByA2luWrHZdOrq5c256RwQI6GG9t26DLVpbEFsTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVPbORrQoKd/G1bZD4T+H4qgS9nSnOhz0qUhFbFHL1w=;
 b=gVfvtXOq6zMo+PI3mgcGZwWcR7mY1bBrAkkTtvgLwWA3A2JJWNX+LhPhlFTBDZ2bEolAU0eaj5du1Wzkn5c6nL1CPIWIuU4xnMb7suR6geTvzqk2FiVueedhh9PY3Ho6G90+/FFY/4JuYM0dPSnECNe07gjExH1aQ1KJ2VdqMEmHyH7d6enhL/8ZplO1HYSKI14iyqRq4RnqKRThtGRdciLWe4KfYJeyKC5LcFlUzt+RIP3mbAqA3w24eudN5T1EtE75QhRcukIt6Sw25nybaWJJvEmoBC6z+ifwOH6I0mtocWn2rXz+R/L+uopuJW+CRJ+q0+cIk5pbX0rFcJPImQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV4P189MB3632.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 09:34:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-uv-build: upgrade 0.13.0 -> 0.13.5
Date: Thu, 22 Oct 2026 11:34:44 +0200
Message-ID: <20261022093445.66335-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
References: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0339.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV4P189MB3632:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b58066f-7ced-4cf1-2b65-08df301fba18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|10067099003|261021130227099003|261021121427099003|261021135927099003|22082099003|261021123027099003|260925021911599003|260925021311599003|261009223327099003|261009221727099003|261009221227099003|260925022911599003|11063799006|261021133027099003|261009223027099003|56012099006|261009220027099003;
X-Microsoft-Antispam-Message-Info: eqmVPjMk+CrvR7Vz8QnUaDK8UrlzzDbLnaxpsfywFXX+3sZ5kzif1FqsRcLsayZz59dHFWybElyxTifTiYGqM7MrWHTFdK3WjECT2H8KyP729BvnavcvS1FybsFaJ6z4ro8yCBJ5Iyr+kDYIvdLDUMVoeSVMfXRauxy7y0M9dJNsz77UKdq9vdjwSvkZS5RM1EnqbZtsT76peFV/JEXTzWahTR6rK4XkMwJDdIIN2jWGIrvnyUfhdTRljFEbFpcTlK5zUXVy/Z6BMXcifeayK7OdebzE1EqXyWIafGjraPlKOLf85Z0xX1B77p4Sg3VHp/UIXPVWNQ28u0AsLM3/gr62TOfzWb2gTJNaIDj/i04ZNBCcou5WuBVjYfUt0WSG+5vpwbcYPemlmuZBmDgeUIY5wbY48efX8KxPjXcMZY2x2fci/0hazHKcBXdrdtGYyRXCIXiCxtcmLbGLz72/cVadlhWKWZksN4fiZ8X3PQtOZtixCdDvFE5AqlI/KQQuVVNkpyK7wbscD5BZzpq+8znHpt/MQ1RY6LiWJSJQJLfoNKgW4HTL0ktsZetaaShX/PlFm/Z0ipsFIFhPc58qT54ArzT1cg14VtjDyMlZCgkeDPFObQcfKVY4JFJgUbNnvBNIpKzBQL9eiFxWfupxaUnJ/EO0iRcRp2PBUML/Sfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(261021130227099003)(261021121427099003)(261021135927099003)(22082099003)(261021123027099003)(260925021911599003)(260925021311599003)(261009223327099003)(261009221727099003)(261009221227099003)(260925022911599003)(11063799006)(261021133027099003)(261009223027099003)(56012099006)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTSqw7J8cQDblIwDQcxegrR1sHU0ImnN6ghLS2XMImUh4UK34nIJJ/J/CjQn?=
 =?us-ascii?Q?1M9R8b7CfK5benE+v52q9JFFj2fOOJ0tepRUyo3fG/lqzL8fO/TTUV7ZqlBS?=
 =?us-ascii?Q?8zpXEXrBIv7w+oN1JwEgfkrkPxUj3JF+ZtzYt4uNrEHoRGO3WqoQRCmIAnXx?=
 =?us-ascii?Q?0mlUErrBEt0Nqj4mY/L1skzcHjkRTIrcAbyY/JKtMsNRSybMja8mwtF9vx6c?=
 =?us-ascii?Q?JjUSkn8DKOnQULyTWECQRqg+itOqlNCppQsuHcLYLB4jZXRztUDiGimajLtb?=
 =?us-ascii?Q?OywazWfg5GQAbKjgVyTjGpnVlkXpKlZcQZMaJGXerGPUHLUYcFqKp4bcts2A?=
 =?us-ascii?Q?5A4tvtbb/XGiSPh0mBgw8t59JXXCdDUpvi5qbFlotcwjv7EJehRVJ2icLqnB?=
 =?us-ascii?Q?VcImR+7uSehxMBOfwhnJSdzMZ1ZYmgbzLyQICAq6qd+fKyqD7xgT90NQPScH?=
 =?us-ascii?Q?Nql0uQQckfh43ZOhM+ZEIKT7vCOl49d7oO4QSF5EBx8X9oX+kWDrM5XKw57r?=
 =?us-ascii?Q?/0738aXZtAesh+Q8FjjE+pgUBHqV7CdovE6q9oTroWVvKFbNlB6ZVPKLPNUi?=
 =?us-ascii?Q?PujgdQeIlfTj8wlWdRYqar2KF5pS5KVmMHG52+cVCJ1FiDdSSmf5popqkMg1?=
 =?us-ascii?Q?86HrXAQ5F9tcaEb/8QoZUtUtOuTjAhisafGWivYD2Px/MwZqzUqhjkUrOADq?=
 =?us-ascii?Q?r8cTlvrK5/KbWajnTU0q/hGztcwcnPxYIIW/WdahYk31OhrToUoM4Qxi3JTO?=
 =?us-ascii?Q?omGlZpPKKf3nRbMHWTa+ME9wdYGVZWX6KFiQUgUJgEcR6PazCrrOCVIVaRET?=
 =?us-ascii?Q?WUV9rmPp5dTT5mCqIJKIpdaEDC3UOdZfxvsq0i/roaY/rvv3tiatUeEjxxsj?=
 =?us-ascii?Q?QJi515z5af88Yqs2HThB23g7U1BAXu6pF6wkMGLhqlDiRg3L2GRbM/3cIPzj?=
 =?us-ascii?Q?Gzhep2/fijeTmqoVPcjbTKWjG7arDUtRxkhn66e3iXcqELkl147MlBh+KptE?=
 =?us-ascii?Q?53Qpmw8zQQ7wOQsSp1D00vWGIJIwDoYSAObWKk3+2JmHycawtc6e6RaK2eqM?=
 =?us-ascii?Q?KWw/Qh9hO1esaqAUM987JJcOFaIOtiOXZVhCEUH2XqBXJHcNKj7Sbx0cA9zr?=
 =?us-ascii?Q?MapqEdtBxX4JLGVfkIdAzdiu2kjYPqbPRdyCiwkNZ9qd7LAfO8fgy+B+RGNA?=
 =?us-ascii?Q?f9Fepq40GnVZ6VF0ooDitVIflJb1vgP31luLhmMj8r07ZCg0VffcreBvG9Hm?=
 =?us-ascii?Q?sEGuHevW/fs6pp9jEW/7/vY+urcqDGQhyFvYMXcewU0SPRMNNwV9pYWTzvJU?=
 =?us-ascii?Q?ebK104DZ4+nJyaFdOSJOwzMTIiPd/FdPZoAE3E2PvFrRvcu/XmQ8K7iDd4uf?=
 =?us-ascii?Q?wiqv13wKDbTGWmV5evN7BLnGzpTjbV6fHgzOeiQgKYnltxnoAHyUQKHM/ZMg?=
 =?us-ascii?Q?ZznZ6sLntrUfbJyA9oYnF9bE6FguZxEFVw8mGWkP3pnnV+DJtlN9RxVljWE9?=
 =?us-ascii?Q?IMB7QFQrOflrPg3MKZ1thBzc661KeJHtzVksxvV7a967lfoFheEiMU8aqxea?=
 =?us-ascii?Q?Q6faQu51x8hQBE9qF8Ijp1LHZBukR8lVpofzy21M/UBB1oIdudHaDylUaC8V?=
 =?us-ascii?Q?m5JiEzem3y84i82fHptTSKtAq9gfnMJOYfWujGEVsY48y6bcEbGFUFqqYmvh?=
 =?us-ascii?Q?ixjX6oxruxAmNq6KnFrAWN1d9oakhjdhqFbDfzg/LzVrftBUkjzY0eoejSK0?=
 =?us-ascii?Q?UmzXcv6Brw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b58066f-7ced-4cf1-2b65-08df301fba18
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:53.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oXTyC3dAzNl/0ul/D4gynDsy6HD+UfQe4EZx6wgG8vhwe794B04kLFvjzztNFUAHsp1+gTacEDdEh/9ZXaefUVdTWCNTvWB307Mbn83pbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248429
Content-Type: text/plain; charset="utf-8"

From: Upgrade Helper <auh@yoctoproject.org>

ReleaseNotes: https://github.com/astral-sh/uv/releases/tag/0.13.5

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-uv-build-crates.inc        | 120 ++++++++----------
 ...d_0.13.0.bb =3D> python3-uv-build_0.13.5.bb} |   2 +-
 2 files changed, 53 insertions(+), 69 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.0.bb =3D> pytho=
n3-uv-build_0.13.5.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/met=
a/recipes-devtools/python/python3-uv-build-crates.inc
index 40087d0541..a5746f7693 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -11,18 +11,19 @@ SRC_URI +=3D " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.14 \
+    crate://crates.io/archive-trait/0.0.15 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
+    crate://crates.io/astral-mail-headers/0.0.1 \
     crate://crates.io/astral-tokio-tar/0.7.0 \
-    crate://crates.io/astral-version-ranges/0.2.2 \
-    crate://crates.io/astral_async_zip/0.0.21 \
-    crate://crates.io/async-compression/0.4.45 \
+    crate://crates.io/astral-version-ranges/0.2.3 \
+    crate://crates.io/astral_async_zip/0.0.22 \
+    crate://crates.io/async-compression/0.4.48 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/boxcar/0.2.14 \
@@ -34,23 +35,21 @@ SRC_URI +=3D " \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.6 \
-    crate://crates.io/clap_builder/4.6.6 \
-    crate://crates.io/clap_derive/4.6.4 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_derive/4.6.7 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/compression-codecs/0.4.45 \
     crate://crates.io/compression-core/0.4.33 \
-    crate://crates.io/console/0.16.4 \
+    crate://crates.io/console/0.16.6 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
-    crate://crates.io/crc32fast/1.5.0 \
+    crate://crates.io/crc32fast/1.5.2 \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.11.1 \
     crate://crates.io/defmt/1.1.0 \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
@@ -66,7 +65,6 @@ SRC_URI +=3D " \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
     crate://crates.io/equivalent/1.0.2 \
-    crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/fixedbitset/0.5.7 \
@@ -103,7 +101,7 @@ SRC_URI +=3D " \
     crate://crates.io/icu_provider/2.1.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.14.1 \
+    crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/insta/1.48.0 \
     crate://crates.io/io-extras/0.19.0 \
@@ -113,11 +111,9 @@ SRC_URI +=3D " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff/0.2.37 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.35 \
-    crate://crates.io/jiff-tzdb/0.1.8 \
-    crate://crates.io/jiff-tzdb-platform/0.1.3 \
+    crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
@@ -126,7 +122,6 @@ SRC_URI +=3D " \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/maybe-owned/0.3.4 \
     crate://crates.io/memchr/2.8.3 \
@@ -160,7 +155,6 @@ SRC_URI +=3D " \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
-    crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -174,7 +168,7 @@ SRC_URI +=3D " \
     crate://crates.io/rkyv/0.8.18 \
     crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/rustc-hash/2.1.3 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustix-linux-procfs/0.1.1 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -185,7 +179,6 @@ SRC_URI +=3D " \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
     crate://crates.io/serde/1.0.229 \
-    crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.30.0 \
@@ -199,7 +192,7 @@ SRC_URI +=3D " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.0 \
+    crate://crates.io/smallvec/1.16.1 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
@@ -207,14 +200,14 @@ SRC_URI +=3D " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.14 \
-    crate://crates.io/tar-framing/0.0.14 \
+    crate://crates.io/tar-codec/0.0.15 \
+    crate://crates.io/tar-framing/0.0.15 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
-    crate://crates.io/textwrap/0.16.2 \
+    crate://crates.io/textwrap/0.16.4 \
     crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
@@ -224,10 +217,10 @@ SRC_URI +=3D " \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/toml/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
@@ -236,7 +229,6 @@ SRC_URI +=3D " \
     crate://crates.io/tracing-subscriber/0.3.23 \
     crate://crates.io/tracing-test/0.2.6 \
     crate://crates.io/tracing-test-macro/0.2.6 \
-    crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
@@ -245,7 +237,7 @@ SRC_URI +=3D " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.24.0 \
+    crate://crates.io/uuid/1.26.1 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -294,8 +286,8 @@ SRC_URI +=3D " \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
-    crate://crates.io/zerocopy/0.8.56 \
-    crate://crates.io/zerocopy-derive/0.8.56 \
+    crate://crates.io/zerocopy/0.8.57 \
+    crate://crates.io/zerocopy-derive/0.8.57 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
     crate://crates.io/zerotrie/0.2.3 \
@@ -314,18 +306,19 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] =3D "52ce7f38b=
242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099abc=
a73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] =3D "330a5ed07fa54e4702c9d6c4174f74427fc=
0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.14.sha256sum] =3D "c6080ea14ccf9019d7ce572c319e5=
81c20a805c9bdc6dbfb9b988da003cbd1a3"
+SRC_URI[archive-trait-0.0.15.sha256sum] =3D "999bf88cc483664cab77700ca2fdf=
b0415a73412abe284ef5bc2319d00938e00"
 SRC_URI[arcstr-1.2.0.sha256sum] =3D "03918c3dbd7701a85c6b9887732e2921175f2=
6c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] =3D "d3fb67a6e08acf24fdeccbac2cb6ac43058=
25bd1f117462e0e6f2f193345ad56"
+SRC_URI[astral-mail-headers-0.0.1.sha256sum] =3D "dc019ecca82cfc91ffa31ab4=
ffe705aaa706399840a7152926b7eee736da410a"
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] =3D "6f2e989b33246fe9240d39accf4=
dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
-SRC_URI[astral-version-ranges-0.2.2.sha256sum] =3D "81129e143a7bcea263d5a2=
c50b8be47ac58365dde618bc1ac50f69f497c9cb63"
-SRC_URI[astral_async_zip-0.0.21.sha256sum] =3D "13f4a9bc6289d907c8e883d250=
26a54751d686da9926af271d0fc4cbe58a7f4d"
-SRC_URI[async-compression-0.4.45.sha256sum] =3D "24a8ec73eb862508b7041723c=
89386365894b4e7d9f6998bf1b8529e5b0ee254"
+SRC_URI[astral-version-ranges-0.2.3.sha256sum] =3D "b315acc4dc7f0d3ccdd557=
a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
+SRC_URI[astral_async_zip-0.0.22.sha256sum] =3D "0f8508d09c6bc6abd42767d1d4=
3c7702891691484875ce94f7997da1301d95e9"
+SRC_URI[async-compression-0.4.48.sha256sum] =3D "fb61aea1a7def73ee7c350a18=
4f0e70b32c182344e2e75bf70c9b621b83417fd"
 SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] =3D "cffb0e931875b666fc4fcb20fee52e9bbd1ef=
836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.13.1.sha256sum] =3D "b588b76d00fde79687d7646a9b5bdf3cc0=
f655e0bbd080335a95d7e96f3587da"
+SRC_URI[bitflags-2.13.2.sha256sum] =3D "3ded4057c258ba199e2d26386d3af37809=
57ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-buffer-0.12.1.sha256sum] =3D "d2f6c7dbe95a6ed67ad9f18e57daf9=
3a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[boxcar-0.2.14.sha256sum] =3D "36f64beae40a84da1b4b26ff2761a5b895c1=
2adc41dc25aaee1c4f2bbfe97a6e"
@@ -337,23 +330,21 @@ SRC_URI[bytes-1.12.1.sha256sum] =3D "fc652a48c352aef3=
ea3aed32080501cf3ef6ed5da7860
 SRC_URI[cap-primitives-4.0.3.sha256sum] =3D "8b5f74729fd2f44701d1a8eb47e90=
6cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] =3D "c1ec78e242cfa2cfe276807ac2ecc00315a6=
c97786977414bcd1c3963b6c91b8"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
-SRC_URI[charset-0.1.5.sha256sum] =3D "f1f927b07c74ba84c7e5fe4db2baeb3e996a=
b2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.6.sha256sum] =3D "473c7e07f409a8d772161724aa8db6a765a2532=
a70f9667eeb7b49d3d02fbdca"
-SRC_URI[clap_builder-4.6.6.sha256sum] =3D "7b48fea5a88e9ae728a2dcbedbfc0e7=
30f7d60da42e1cb049a83c9fb8b789889"
-SRC_URI[clap_derive-4.6.4.sha256sum] =3D "d012d2b9d65aca7f18f4d9878a045bc1=
7899bba951561ba5ec3c2ba1eed9a061"
+SRC_URI[clap-4.6.7.sha256sum] =3D "aa8876b300ab35ba921adea3dfd70157a46249b=
33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] =3D "ec0797fb7aeb1406c84efac526901f7=
ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_derive-4.6.7.sha256sum] =3D "f9c751b79415d4e559e3d1fcf128e09e=
720eb673a06d26cf6f392d37d75b66e0"
 SRC_URI[clap_lex-1.1.0.sha256sum] =3D "c8d4a3bb8b1e0c1050499d1815f5ab16d04=
f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] =3D "1d07550c9036bf2ae0c684c4297d503f=
838287c83c53686d05370d0e139ae570"
 SRC_URI[compression-codecs-0.4.45.sha256sum] =3D "98fc98460ba0ad5317075d36=
32b8dfc45d0be8c4a49347c2a38272019717614a"
 SRC_URI[compression-core-0.4.33.sha256sum] =3D "6e8ccc4ea9f6acc32d102c0f6d=
471d11d913ad15f20c04de743374861fa1d414"
-SRC_URI[console-0.16.4.sha256sum] =3D "4fe5f465a4f6fee88fad41b85d990f84c83=
5335e85b5d9e6e63e0d06d28cba7c"
+SRC_URI[console-0.16.6.sha256sum] =3D "e96a4956774c13c126a8b5af4daa79384f4=
d826534c95a02d76afb39e2ab64e3"
 SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b5316=
989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] =3D "8b2a41393f66f16b0823bb79094d54ac=
5fbd34ab292ddafb9a0456ac9f87d201"
-SRC_URI[crc32fast-1.5.0.sha256sum] =3D "9481c1c90cbf2ac953f07c8d4a58aa3945=
c425b7185c9154d67a65e4230da511"
+SRC_URI[crc32fast-1.5.2.sha256sum] =3D "01a7799fd6b852db0e61728dde9a204c42=
3b44d689dbd432522543614b490e78"
 SRC_URI[crypto-common-0.1.7.sha256sum] =3D "78c8292055d1c1df0cce5d180393dc=
8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.2.sha256sum] =3D "ce6e4c961d6cd6c9a86db418387425=
e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] =3D "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4=
b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] =3D "704a3c26996a80471189265814dbc2c257=
598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.11.1.sha256sum] =3D "4583a4551df46e2792f82ceeac45e=
850d2e2d5debba0b91f102385cda5b11f06"
 SRC_URI[defmt-1.1.0.sha256sum] =3D "a6e524506490a1953d237cb87b1cfc1e46f88c=
18f10a22dfe0f507dc6bfc7f7f"
 SRC_URI[defmt-macros-1.1.0.sha256sum] =3D "f0a27770e9c8f719a79d8b638281f4d=
828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] =3D "10d60334b3b2e7c9d91ef8150abfb6f=
a4c1c39ebbcf4a81c2e346aad939fee3e"
@@ -369,7 +360,6 @@ SRC_URI[encoding_rs_io-0.1.8.sha256sum] =3D "fba3fe8470=
45ecff794b9c138293a80db9146
 SRC_URI[enumflags2-0.7.12.sha256sum] =3D "1027f7680c853e056ebcec683615fb6f=
bbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D "67c78a4d8fdf9953a5c9d458f=
9efe940fd97a0cab0941c075a813ac594733827"
 SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
-SRC_URI[erased-serde-0.4.10.sha256sum] =3D "d2add8a07dd6a8d93ff627029c51de=
145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
 SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df0792=
7c6d4aa5b027d7da16ba32d1d21ecd99"
@@ -406,7 +396,7 @@ SRC_URI[icu_properties_data-2.1.2.sha256sum] =3D "616c2=
94cf8d725c6afcd8f55abc17c56
 SRC_URI[icu_provider-2.1.1.sha256sum] =3D "85962cf0ce02e1e0a629cc34e7ca3e3=
73ce20dda4c4d7294bbd0bf1fdb59e614"
 SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc588455225f=
b2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.14.1.sha256sum] =3D "07aa2048142242915a31d35844fb311e0e=
53fcca590c3a0a40dcf1b841fa09eb"
+SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
 SRC_URI[indoc-2.0.7.sha256sum] =3D "79cf5c93f93228cf8efb3ba362535fb11199ac=
548a09ce117c9b1adc3030d706"
 SRC_URI[insta-1.48.0.sha256sum] =3D "86f0f8fee8c926415c58d6ae43a08523a26fa=
ccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[io-extras-0.19.0.sha256sum] =3D "20fd6de4ccfcc187e38bc21cfa543cb5a=
302cb86a8b114eb7f0bf0dc9f8ac00f"
@@ -416,11 +406,9 @@ SRC_URI[ipnet-2.12.0.sha256sum] =3D "d98f6fed1fde3f8c2=
1bc40a1abb88dd75e67924f9cffc
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e065e=
016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.35.sha256sum] =3D "668b7183bd07af9a4885f5c35b0cc5c83c4607=
a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-0.2.37.sha256sum] =3D "0ab1baf72f08796de0260609515130699b890a=
c25f30e610ad894bc5856cafdb"
 SRC_URI[jiff-core-0.1.0.sha256sum] =3D "7feca88439efe53da3754500c1851dedf3=
cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.35.sha256sum] =3D "3a69dcb3a21cfb32ce1cd056169337c=
a284af0766dd766e7878819b251a49204"
-SRC_URI[jiff-tzdb-0.1.8.sha256sum] =3D "142bd39932ad231f10513df9ab62661fea=
d8719872150b7ad02a2df79f4e141e"
-SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711cf5=
eccbec1ce0341ea805560dcd90b7a2e925132e8"
+SRC_URI[jiff-static-0.2.37.sha256sum] =3D "378268a1116ad67ae6228701118ac9f=
491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[js-sys-0.3.91.sha256sum] =3D "b49715b7073f385ba4bc528e5747d02e66cb=
39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] =3D "160f2eade097f30263b548aae5deb12ad34=
9c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
@@ -429,7 +417,6 @@ SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e0=
30da00e8c7d4434b251670a9155
 SRC_URI[litemap-0.8.1.sha256sum] =3D "6373607a59f0be73a39b6fe456b8192fcc35=
85f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b1408=
9b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf3856=
3a65908389bf7978758920897"
-SRC_URI[mailparse-0.16.1.sha256sum] =3D "60819a97ddcb831a5614eb3b0174f3620=
e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] =3D "d1525a2a28c7f4fa0fc98bb91ae755d1e2d=
1505079e05539e35bc876b5d65ae9"
 SRC_URI[maybe-owned-0.3.4.sha256sum] =3D "4facc753ae494aeb6e3c22f839b158ae=
bd4f9270f55cd3c79906c45476c47ab4"
 SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4=
beb022d3b367256b91b87513d98"
@@ -463,7 +450,6 @@ SRC_URI[proc-macro2-1.0.107.sha256sum] =3D "985e7ec9bb7=
45e6ce6535b544d84d6cd6f7ad8
 SRC_URI[ptr_meta-0.3.1.sha256sum] =3D "0b9a0cf95a1196af61d4f1cbdab96717951=
6d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] =3D "7347867d0a7e1208d93b46767be8=
3e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458bf=
8d26c8219c331daecfdbd079001"
-SRC_URI[quoted_printable-0.5.1.sha256sum] =3D "640c9bd8497b02465aeef537514=
4c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f92=
b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] =3D "a063ea72381527c2a0561da9c80000ef822bd=
d7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] =3D "7e8af0dde094006011e6a740d4879=
319439489813bd0bcdc7d821beaeeff48ec"
@@ -477,7 +463,7 @@ SRC_URI[rend-0.5.3.sha256sum] =3D "cadadef317c2f20755a6=
4d7fdc48f9e7178ee6b0e1f7fce
 SRC_URI[rkyv-0.8.18.sha256sum] =3D "d9776093b7ca170454ab1406954f7b7d97a57c=
51dc6c0642957fb2ef25c2d399"
 SRC_URI[rkyv_derive-0.8.18.sha256sum] =3D "1c25ef604ac7dd839d44d64648952ea=
23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[rustc-hash-2.1.3.sha256sum] =3D "6b1e7f9a428571be2dc5bc0505c13fb6b=
f936822b894ec87abf8a08a4e51742d"
-SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] =3D "891efababe418670775f199f0d233d84843c2=
27a0949a883ce15b37c78d6629d"
 SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] =3D "2fc84bf7e9aa16c4f2c758f2=
7412dc9841341e16aa682d9c7ac308fe3ee12056"
 SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] =3D "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5=
cccb8cc655a4e50009e06477f"
@@ -488,7 +474,6 @@ SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109=
f92c262ed2cf5e59bce7498c01b
 SRC_URI[seahash-4.1.0.sha256sum] =3D "1c107b6f4780854c8b126e228ea8869f4d7b=
71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] =3D "03ec815b5eab420ab893f63393878d8=
9c90fdd94c0bcc44c07abb8ad95552fb7"
 SRC_URI[serde-1.0.229.sha256sum] =3D "4148590afebada386688f18773da617792bf=
2ef03ffc1e4cbd2b1d45b023e0ba"
-SRC_URI[serde-untagged-0.1.9.sha256sum] =3D "f9faf48a4a2d2693be24c6289dbe2=
6552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.229.sha256sum] =3D "67dca2c9c51e58a4791a4b1ed58308b=
39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] =3D "e7a5d71263a5a7d47b41f6b3f06ba=
276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.30.0.sha256sum] =3D "f852137cce035d6a4df6=
7ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
@@ -502,7 +487,7 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] =3D "e320a6c5ad31=
d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] =3D "e3a9fe34e3e7a50316060351f37187a3f54=
6bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] =3D "bbbb5d9659141646ae647b42fe094daf6c61=
92d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.0.sha256sum] =3D "b9be42f50aa861c555654aa3a37f52f4b1=
074bacf4e48fe0ef7fa584e80f1f0f"
+SRC_URI[smallvec-1.16.1.sha256sum] =3D "ba467056f1b547ed52077911161fc86985=
becbc60e8e1857c8a144dab0def891"
 SRC_URI[smawk-0.3.2.sha256sum] =3D "b7c388c1b5e93756d0c740965c41e8822f8666=
21d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] =3D "3a766e1110788c36f4fa1c2b71b387a7815a=
a65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] =3D "081670c233dfbed55690cc0cd38424e0e24ac1=
b2673d0b408b3f7b684738dfa9"
@@ -510,14 +495,14 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2=
be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] =3D "2a8f8038e7e7969abb3f1b7c2=
a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.5.sha256sum] =3D "12df2e0110f65b775f769bb17ef989067a1d931b=
2eb822bd4346631eeada89f9"
+SRC_URI[syn-3.0.6.sha256sum] =3D "8593e8e72159ed2257d083c7a454a85cbf854f37=
a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.14.sha256sum] =3D "7ea42eb144d30fcbf32c26dfea8959175=
bb8335bfb7b18d20c6ed32edecf0551"
-SRC_URI[tar-framing-0.0.14.sha256sum] =3D "783223a7a6590be4227cb821e7ce803=
72575511f67c824921aba0752d8ad5573"
+SRC_URI[tar-codec-0.0.15.sha256sum] =3D "b9dad615e50d181afea4bafea23dacb8e=
33ed52dde06503813570634b932d467"
+SRC_URI[tar-framing-0.0.15.sha256sum] =3D "563e8181b47c9cdcce569eae3ad431e=
ec71543d6269dd60c7bd2350f70bcd233"
 SRC_URI[temp-env-0.3.6.sha256sum] =3D "96374855068f47402c3121c6eed88d29cb1=
de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] =3D "230a1b821ccbd75b185820a1f1ff7b=
14d21da1e442e22c0863ea5f08771a8874"
-SRC_URI[textwrap-0.16.2.sha256sum] =3D "c13547615a44dc9c452a8a534638acdf07=
120d4b6847c8178705da06306a3057"
+SRC_URI[textwrap-0.16.4.sha256sum] =3D "6ecfad6c3abc80a577f2b91c1e412ee57e=
7a060d430b553c1b0c940974ebcd49"
 SRC_URI[thiserror-2.0.20.sha256sum] =3D "ec86235f5fcc2a73650310756d2ac5b13=
8a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-2.0.20.sha256sum] =3D "bc04cd3e1236dd4a98afca4569f2=
deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] =3D "f60246a4944f24f6e018aa17cdeffb7=
818b76356965d03b07d6a9886e8962185"
@@ -527,10 +512,10 @@ SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac=
311fea05f86f61904b462b55fb3df
 SRC_URI[tokio-1.53.1.sha256sum] =3D "202caea871b69668250d242070849eb495be1=
78ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] =3D "385a6cb71ab9ab790c5fe8d67f1645e=
6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] =3D "a3d06f0b082ba57c26b79407372e57=
cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] =3D "53c96ecdfa941c8fc4fcaed14f99=
ada8ebed502eef533015095a07e3301d4c3c"
+SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] =3D "920602543f0911ab71da12c50d59=
701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] =3D "3165f65f62e28e0115a=
00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] =3D "6975367e4d2ef766d86af=
01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
-SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] =3D "a2abe9b86193656635d24=
11dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] =3D "1340ea94a5856333492c9=
064b02c778b191dd2c853778d9609debdcdfea3a614"
+SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] =3D "baa693a8032d7e1cada7d=
0041e96126df243179ff061456783ac7f12bda4744c"
 SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41a4=
21187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[tracing-0.1.44.sha256sum] =3D "63e71662fa4b2a2c3a26f570f037eb95bb1=
f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D "7490cfa5ec96374656874065=
1ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
@@ -539,7 +524,6 @@ SRC_URI[tracing-log-0.2.0.sha256sum] =3D "ee855f1f400bd=
0e5c02d150ae5de3840039a3f54
 SRC_URI[tracing-subscriber-0.3.23.sha256sum] =3D "cb7f578e5945fb242538965c=
2d0b04418d38ec25c79d160cd279bf0731c8d319"
 SRC_URI[tracing-test-0.2.6.sha256sum] =3D "19a4c448db514d4f24c5ddb9f73f2ee=
71bfb24c526cf0c570ba142d1119e0051"
 SRC_URI[tracing-test-macro-0.2.6.sha256sum] =3D "ad06847b7afb65c7866a36664=
b75c40b895e318cea4f71299f013fb22965329d"
-SRC_URI[typeid-1.0.3.sha256sum] =3D "bc7d623258602320d5c55d1bc22793b57daff=
0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b371b77fe0ee0bafb859fa=
4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] =3D "2896d95c02a80c6d6a5d6e953d479f5ddf2=
dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
@@ -548,7 +532,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] =3D "e9df2af067a7953e=
9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] =3D "ff67a8a4397373c3ef660812acab326822203501=
0ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.24.0.sha256sum] =3D "bf3923a6f5c4c6382e0b653c4117f48d631ea1=
7f38ed86e2a828e6f7412f5239"
+SRC_URI[uuid-1.26.1.sha256sum] =3D "2ef6dac1e96601b4fb3acccccff2139741fcb7=
57cb9a36089bf5be91cfb285ce"
 SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25df0c8caa16c51acb937d5=
712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] =3D "231fdcd7ef3037e8330d8e17e61011a2c244126=
acc0a982f4040ac3f9f0bc077"
@@ -597,8 +581,8 @@ SRC_URI[winx-0.36.4.sha256sum] =3D "3f3fd376f71958b862e=
7afb20cfe5a22830e1963462f3a
 SRC_URI[writeable-0.6.2.sha256sum] =3D "9edde0db4769d2dc68579893f2306b26c6=
ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[yoke-0.8.1.sha256sum] =3D "72d6e5c6afb84d73944e5cedb052c4680d56573=
37201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] =3D "b659052874eb698efe5b9e8cf3822046=
78a0086ebf46982b79d6ca3182927e5d"
-SRC_URI[zerocopy-0.8.56.sha256sum] =3D "556764e583adb45a9f8d413c2a147fa7e8=
d821e48e12b14fd560b607998b75eb"
-SRC_URI[zerocopy-derive-0.8.56.sha256sum] =3D "f2ab42fc20575779bd240faa45f=
94a74256f755c0fa9e89f0ede20d91d0cdfc1"
+SRC_URI[zerocopy-0.8.57.sha256sum] =3D "d35102a9f36d089ccae9e4c6802bc118be=
4487b80aaffc0ab4e0cf5ce92d2873"
+SRC_URI[zerocopy-derive-0.8.57.sha256sum] =3D "146c01f5ab44258da43cf276c74=
a2763db2ff3969c9c652c3f2de07041d0b2bc"
 SRC_URI[zerofrom-0.1.6.sha256sum] =3D "50cc42e0333e05660c3587f3bf9d0478688=
e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D "d71e5d6e06ab090c67b5e44993ec=
16b72dcbaabc526db883a360057678b48502"
 SRC_URI[zerotrie-0.2.3.sha256sum] =3D "2a59c17a5562d507e4b54960e8569ebee33=
bee890c70aa3fe7b97e85a9fd7851"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb b/meta=
/recipes-devtools/python/python3-uv-build_0.13.5.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
index 2ad38b2054..8b05c79a25 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D86d3f3a=
95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=3De23fadd6c=
eef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=3Def7a6027dc4c=
2389b9afad7e690274c7"
=20
-SRC_URI[sha256sum] =3D "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e0331=
86a8423b8a3515"
+SRC_URI[sha256sum] =3D "c95a3d092cb8880b37f35013f9f7339f3867bc422abed36776=
255f34e22bc62c"
=20
 require ${BPN}-crates.inc
=20
