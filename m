Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TCZRp1Db;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPIgWRENPtxOK5QK0FnirkLuqCXloiy2drgYKzZqI21qdA5B58vkNeizf5xk8dOm1Ma2cPtt4pNTAObHLG9sDpwfhd5HPl44ZDc/94LFLgQbSuKz/76xBlUZmzEipRz5LlUhv22VmhczcyYQFeEM3jXIMh/T4pobpa+LR4lD8PWDZCXqLBDhPRpmUjsf5CdL+o+2jbzkci/wqCj+m0hG+o0Ld2u9AthWn5l+bi8TDAvXMU33PHaJOJYhRRM2jwsJM/l3iZsciRq6mKxygZ0Fil6CLqth9zRiYOjlWMevJCOw1VCWc+EMbFKrS1opO0NJPFJgLEEuySTOFR1Eh30Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vmws/J5JPc5CvWQL3Z46M3aTbXegp5/qJCZQdaAjC8A=;
 b=vL3J1jVFdsdC5IOSQ3NzIN+ySAIaooMhtMvF8DCzMgH8jOqgki6afbqyouGbDm+WwFlZ5fJDiH+h30PaxsDOcvlCB/oLqJAOMUwVMRfOGMf51itFlVXpX4o+KyFY8wh516g/ff5rE6bIhD1sN2ycLEIsvzTZxeGbHYEtiofYKc/aNxf0H8qfG+s8VOSpmGGPIEDlUcRnKjZTzC604eRVhMSwvpHBIFTQ2ntqD+mc+E1cyXU0rwJRe9X6fv552+2g/qa9SdfCNuM7PKqf0MUhiz/FSEjU14ed/WWBzPXaqMCT1JLJvBgncD9E0hhhSye6gteLe7apvZMjYmX6EdJgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vmws/J5JPc5CvWQL3Z46M3aTbXegp5/qJCZQdaAjC8A=;
 b=TCZRp1Db3ZkK7k5CDdGIZKPEkL9QFBXiQgq/IsT6g1g6PauC5pT4DsUtV8EOtgS7YARzEqGO9C3zbQImqAAW4xOLWaKfaqapbMLwbSTUS2v4lkA+mps/1XUHXJj/H1U8Q7cmJ4Ct85eZXEKZEFav2AHDkBCE15crXSrBS1hkeaQbcz/YX8ggsw4OeM8gBjEStR8fMUmDxWQ8YidqE8dWDPQYiTMZvOgJTa4/+qsmkgpRxdws5wO8sni3JbYSskkqrda6UT0ZATIOPk2XgeLrjTHWdQJqY6W/JIV8f8RC+c/zHzbm7x2Yo+b4x7JAMkQom890ltUxYPXk3lKWohpWUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:13 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] python3-uv-build: upgrade 0.13.5 -> 0.13.7
Date: Tue,  3 Nov 2026 10:27:55 +0100
Message-ID: <20261103092800.39286-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0c28e3-ddc6-47e6-a016-08df398cc87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|260925021311599003|260925021911599003|260925022911599003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022113327099003|261022115727099003|261022105027099003|261021133027099003|261021130227099003|261021135927099003|261009223027099003|261026121527099003|261026135527099003|261026130827099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 4ayl16Ac6ufc7DwY5i5nG41MJeo5p1xVF2MKJ5pcJdq2U8kmDZT6OE2XHgJYUFpDxD5SDFmRt2odIMMaTu/fpyD8qfKXCGMkJRzwWA1+mXbs6z5z6W5f2ODNS0kfweUlshW2MmIsAVEh50200EEHYypFNAewY/xXviozHkMhCilL4FdZdy4Q9rKn1YpCLvQ7wXGiu0dZC2O4AtPW+ClOEPsSRZXXKAiDU1QJJY28pfee7nGNChbZERjdalDSqw+6csmlM8LCnV1TultktkAa7tzhI+ngPf3XH2FyZ1/iQKbofkBmfkA9KXW8mFWGH/mePYAWmvyA3Vr9z5n1kivlfM+FWRcwCooe8gyVD49SrUcxCXcNcG3SDOEMLAy3UQQ1UkApSGkizsJt+fRhOroigSd2VUzKWE8XdVgD+1zoR1H1jLlKPkvUH/lGTLYwVgvya6vgpcyOLbCj6FA23uCQLaDwntkpjXISg/1X7NOJAgasIWd5v8d8hYsOGM34EYTZ3Tdk0opTo7Z1JGRTb2gBzdn8IvMqRkebx6jnyT/kBgyG2lkqCOITBwU8Pgb3M7vGRg2RRpM1V2h0xzEcMVae0JEmSXZpsDqFp4/1hX3ldyWjkprkaZi4sb+7vj1DylL4yVuUuoP+dvNvXEsTaIhQTHms+Y+WZlaqgxjVRpRvCiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261009223027099003)(261026121527099003)(261026135527099003)(261026130827099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eOmJlST8i5w6jwSg1gnkXjZxhjuUi9tZyhPTaxDHGLJkp1jgm9jw4g/+TTnl?=
 =?us-ascii?Q?2gWH1fxLyQJUL+h5hR+sZRHboVQtMMUJFuDkzina/9NazcufAkqraj+dw7HR?=
 =?us-ascii?Q?53kAQ8Q4mHmgbv5jmiFKZoE7kjoiQxAMfTAeObwe8Ay4/R/VwA4lLZaKYhc0?=
 =?us-ascii?Q?cPDAJqP83XTNk542fWt1TGFGQXXpp2Vm/U61Xs3KRv+/b8kgg9hqpyuP0/so?=
 =?us-ascii?Q?v34RsROFW5vFoyvvwbzMK3S8kFL+N2Ja8qxVpBIn03CC6dcJU/k3aZPKCOC0?=
 =?us-ascii?Q?8zuy7aM+DZ3mhDAk3VlKqdK0nURT+LXiR23aybWf56tMqqh8ISJ62CcmLaOy?=
 =?us-ascii?Q?aZHeLAvZLlqECgAfkF/H809cTUNOuzp+TUKzP4ksdIvMf3mrRzseUZxA4WA7?=
 =?us-ascii?Q?tsvumsAqDYJCuNFfzG91uevMjTFhW+xgp17ela22VJyClspM9rLii0S42Zk2?=
 =?us-ascii?Q?zpes0OsGoed7rN2iDIrNEM4BkB8ic92rflB8cN9YwyhajXxkz2lLyKbFprq0?=
 =?us-ascii?Q?FK/JyMUC5CDvHnnLk/3zYTs0RqpSXFeh4VbBZPHULQBZMggPBWAYGUYUbf5D?=
 =?us-ascii?Q?qV+abayV9cQRfDaXMmZ1W6+oGuCzcIPQLG2HIzXpl7QMbDvN33G3oS5tEn33?=
 =?us-ascii?Q?CxiR79V9pPqX4aTma0Z7OzYhL5NSPuTVoKkIWmzxYVR1ZVWzMXceswWoctSd?=
 =?us-ascii?Q?Mm7T6INxJMQoyEH7Kxq32c9N8CwMGa5UurC9x5l/phZMpybbp7bSyrB2kWbI?=
 =?us-ascii?Q?LfedrXOw9TyJ3UfTuOW4GBWrtKxjWZSpcv7iQqoFUC/ZJZ175S+6nwikLWa6?=
 =?us-ascii?Q?CZr1AeM6HiZ2tj/zCI4JrHyKXXbyV+sSBMt8z0eldI7qgGWOotawxsViaOrk?=
 =?us-ascii?Q?PZggzqiheleNvUp8V2/eZNwzuvJ2Nid9kvKJPPNEip0h/x8N29gPyfDQYzJ2?=
 =?us-ascii?Q?ACTKPUu4IvkD3KYr2YIlM52gaGguq4MN+NmYi4QcYdcLCobarP2zcsLmipD3?=
 =?us-ascii?Q?LiLHzbW8ByGMZS+Mw57GkjezVFCXN7o63wncd1itMEeQTQ2Dq4iffu2SNr1Z?=
 =?us-ascii?Q?toKeRMUwG2uwZkTtjwffiq+rpFqAoZv6sBy5YV7P4u6aY/Ofx6xE/hjBGKQB?=
 =?us-ascii?Q?2nnwvC3GRnh8go7BeCcr2IXMTAyn6CAAb17hTblUPX5+cDpr0EYxadFYq26w?=
 =?us-ascii?Q?kTxao0z7Oq3PNN5tC4h5e1H8zlm2erssG3jqyN1FxamH4cBcseBIeg+HU/gV?=
 =?us-ascii?Q?1NHjbrX9ui+sTbarHAld9FL5vmtjC9IAFg0Db8ypVUB5ndZ2UgCwZ4VZIj5C?=
 =?us-ascii?Q?5V4YUPiOE9LgfBR/EAVPoYqfowURP19q4qubfwLQ39JpZej9c0hBXS80N5fL?=
 =?us-ascii?Q?Gau1kDqq4wLGBTX8x52icUX+bBgKXQyL6bUlBs2DGrgpGb2vMHSoXCRtMOk/?=
 =?us-ascii?Q?Opr/QiwDJoPMerAYFSKhkRu5SD+Xwp/gYL1pyA0TFwbo3ipyk9SKvW9gj23K?=
 =?us-ascii?Q?3iRhR7pjVV2wp4rD5TtN7qWVQP2QECJTnX+xEQ2Wsjb7ieZYuSIYI1wtgwUu?=
 =?us-ascii?Q?i1FJYrwd0tTN9fiN23eGH3UrHjcS75WX7crY6zbuv6B+1my6Xdap/zIFlCl1?=
 =?us-ascii?Q?fFDSIxe82hSHHrXVKd83hDKgaCcJUc2a9G3tTeeenH6fZymTv20ksWPcmuiq?=
 =?us-ascii?Q?3/7QJcnHjUkqOcE6iueY4bDkXu0imUWvv7UqYXaRQysPwk1ECPwTM1lW0mP5?=
 =?us-ascii?Q?v7LN7oM0ZQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0c28e3-ddc6-47e6-a016-08df398cc87f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:13.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePOe2vBFFqaa2AW3H9ZGLHTeZ2BRHRLLli3KoK20zu/Y2lUfIYHnuNh+nRYDPuv+KvbTcuJEU3HACdwUi59FGjL6xcDsksBGS2xE9dJ1tXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249260
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/astral-sh/uv/blob/main/CHANGELOG.md#0137

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-uv-build-crates.inc        | 42 ++++++++++---------
 ...d_0.13.5.bb =3D> python3-uv-build_0.13.7.bb} |  2 +-
 2 files changed, 23 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.5.bb =3D> pytho=
n3-uv-build_0.13.7.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/met=
a/recipes-devtools/python/python3-uv-build-crates.inc
index a5746f7693..d668493bd0 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -18,10 +18,11 @@ SRC_URI +=3D " \
     crate://crates.io/astral-tokio-tar/0.7.0 \
     crate://crates.io/astral-version-ranges/0.2.3 \
     crate://crates.io/astral_async_zip/0.0.22 \
-    crate://crates.io/async-compression/0.4.48 \
+    crate://crates.io/async-compression/0.4.50 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
+    crate://crates.io/base64/0.23.1 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/block-buffer/0.10.4 \
@@ -103,7 +104,7 @@ SRC_URI +=3D " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.48.0 \
+    crate://crates.io/insta/1.49.0 \
     crate://crates.io/io-extras/0.19.0 \
     crate://crates.io/io-lifetimes/2.0.4 \
     crate://crates.io/io-lifetimes/3.0.1 \
@@ -115,7 +116,7 @@ SRC_URI +=3D " \
     crate://crates.io/jiff-core/0.1.0 \
     crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/js-sys/0.3.91 \
-    crate://crates.io/junction/2.0.0 \
+    crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -192,10 +193,10 @@ SRC_URI +=3D " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.1 \
+    crate://crates.io/smallvec/1.16.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
-    crate://crates.io/spdx/0.13.5 \
+    crate://crates.io/spdx/0.13.6 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
@@ -208,8 +209,8 @@ SRC_URI +=3D " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.4 \
-    crate://crates.io/thiserror/2.0.20 \
-    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/thiserror/2.0.21 \
+    crate://crates.io/thiserror-impl/2.0.21 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -237,7 +238,7 @@ SRC_URI +=3D " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.26.1 \
+    crate://crates.io/uuid/1.27.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -286,8 +287,8 @@ SRC_URI +=3D " \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
-    crate://crates.io/zerocopy/0.8.57 \
-    crate://crates.io/zerocopy-derive/0.8.57 \
+    crate://crates.io/zerocopy/0.8.63 \
+    crate://crates.io/zerocopy-derive/0.8.63 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
     crate://crates.io/zerotrie/0.2.3 \
@@ -313,10 +314,11 @@ SRC_URI[astral-mail-headers-0.0.1.sha256sum] =3D "dc0=
19ecca82cfc91ffa31ab4ffe705aa
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] =3D "6f2e989b33246fe9240d39accf4=
dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
 SRC_URI[astral-version-ranges-0.2.3.sha256sum] =3D "b315acc4dc7f0d3ccdd557=
a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
 SRC_URI[astral_async_zip-0.0.22.sha256sum] =3D "0f8508d09c6bc6abd42767d1d4=
3c7702891691484875ce94f7997da1301d95e9"
-SRC_URI[async-compression-0.4.48.sha256sum] =3D "fb61aea1a7def73ee7c350a18=
4f0e70b32c182344e2e75bf70c9b621b83417fd"
+SRC_URI[async-compression-0.4.50.sha256sum] =3D "ee19bd99b43e3691acbad4e84=
0420a4881cea6c0b66a208125a824f8fd53f5a1"
 SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] =3D "cffb0e931875b666fc4fcb20fee52e9bbd1ef=
836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[base64-0.23.1.sha256sum] =3D "ac07cdecf99051d9a5238b80f35af32cdeba=
5b336e55d957b318b50137e18da5"
 SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.13.2.sha256sum] =3D "3ded4057c258ba199e2d26386d3af37809=
57ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
@@ -398,7 +400,7 @@ SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994=
f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc588455225f=
b2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
 SRC_URI[indoc-2.0.7.sha256sum] =3D "79cf5c93f93228cf8efb3ba362535fb11199ac=
548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.48.0.sha256sum] =3D "86f0f8fee8c926415c58d6ae43a08523a26fa=
ccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[insta-1.49.0.sha256sum] =3D "b67d3d2e287e4b86c10b3f3b641033d1f89b7=
4bdb39d05f34952e2b9a6fe21cd"
 SRC_URI[io-extras-0.19.0.sha256sum] =3D "20fd6de4ccfcc187e38bc21cfa543cb5a=
302cb86a8b114eb7f0bf0dc9f8ac00f"
 SRC_URI[io-lifetimes-2.0.4.sha256sum] =3D "06432fb54d3be7964ecd3649233cddf=
80db2832f47fec34c01f65b3d9d774983"
 SRC_URI[io-lifetimes-3.0.1.sha256sum] =3D "2f0fb0570afe1fed943c5c3d4102d53=
58592d8625fda6a0007fdbe65a92fba96"
@@ -410,7 +412,7 @@ SRC_URI[jiff-0.2.37.sha256sum] =3D "0ab1baf72f08796de02=
60609515130699b890ac25f30e6
 SRC_URI[jiff-core-0.1.0.sha256sum] =3D "7feca88439efe53da3754500c1851dedf3=
cb36c524dd5cf8225cc0794de95d09"
 SRC_URI[jiff-static-0.2.37.sha256sum] =3D "378268a1116ad67ae6228701118ac9f=
491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[js-sys-0.3.91.sha256sum] =3D "b49715b7073f385ba4bc528e5747d02e66cb=
39c6146efb66b781f131f0fb399c"
-SRC_URI[junction-2.0.0.sha256sum] =3D "160f2eade097f30263b548aae5deb12ad34=
9c909baa710fa24b92c9090b2e006"
+SRC_URI[junction-2.1.0.sha256sum] =3D "cde48f36530cbd91b65f050101e6c056d6e=
b743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
@@ -487,10 +489,10 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] =3D "e320a6c5ad=
31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] =3D "e3a9fe34e3e7a50316060351f37187a3f54=
6bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] =3D "bbbb5d9659141646ae647b42fe094daf6c61=
92d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.1.sha256sum] =3D "ba467056f1b547ed52077911161fc86985=
becbc60e8e1857c8a144dab0def891"
+SRC_URI[smallvec-1.16.2.sha256sum] =3D "f9395f0f0eee849a9b707b2f06bb92a6a4=
22090e2123bb2ef8e87a0e61892a8e"
 SRC_URI[smawk-0.3.2.sha256sum] =3D "b7c388c1b5e93756d0c740965c41e8822f8666=
21d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] =3D "3a766e1110788c36f4fa1c2b71b387a7815a=
a65f88ce0229841826633d93723e"
-SRC_URI[spdx-0.13.5.sha256sum] =3D "081670c233dfbed55690cc0cd38424e0e24ac1=
b2673d0b408b3f7b684738dfa9"
+SRC_URI[spdx-0.13.6.sha256sum] =3D "646c5a367da914e3babcb9cd8e91c37ccaac42=
325b8f86f036513ad103f2a716"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71bf=
a12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] =3D "2a8f8038e7e7969abb3f1b7c2=
a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
@@ -503,8 +505,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] =3D "96374855068f4740=
2c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] =3D "230a1b821ccbd75b185820a1f1ff7b=
14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.4.sha256sum] =3D "6ecfad6c3abc80a577f2b91c1e412ee57e=
7a060d430b553c1b0c940974ebcd49"
-SRC_URI[thiserror-2.0.20.sha256sum] =3D "ec86235f5fcc2a73650310756d2ac5b13=
8a5780bbbdfae3eeccec992c435ba4f"
-SRC_URI[thiserror-impl-2.0.20.sha256sum] =3D "bc04cd3e1236dd4a98afca4569f2=
deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[thiserror-2.0.21.sha256sum] =3D "09e52cb86a36cede5cb101bf8908837b3=
e4c6e5e59fe7fd85c23fb56200d189e"
+SRC_URI[thiserror-impl-2.0.21.sha256sum] =3D "fe5197923287db20a58125f0bc85=
c062f7f2c892de97b18c356f9efb14b28524"
 SRC_URI[thread_local-1.1.9.sha256sum] =3D "f60246a4944f24f6e018aa17cdeffb7=
818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] =3D "42d3e9c45c09de15d06dd8acf5f4e0e399e8=
5927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] =3D "3e61e67053d25a4e82c844e8424039d9745=
781b3fc4f32b8d55ed50f5f667ef3"
@@ -532,7 +534,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] =3D "e9df2af067a7953e=
9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] =3D "ff67a8a4397373c3ef660812acab326822203501=
0ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.26.1.sha256sum] =3D "2ef6dac1e96601b4fb3acccccff2139741fcb7=
57cb9a36089bf5be91cfb285ce"
+SRC_URI[uuid-1.27.0.sha256sum] =3D "97277d36b9c3ace13e58fa6e753f8b0bbbf302=
a18dd193240d70f9e29681059a"
 SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25df0c8caa16c51acb937d5=
712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] =3D "231fdcd7ef3037e8330d8e17e61011a2c244126=
acc0a982f4040ac3f9f0bc077"
@@ -581,8 +583,8 @@ SRC_URI[winx-0.36.4.sha256sum] =3D "3f3fd376f71958b862e=
7afb20cfe5a22830e1963462f3a
 SRC_URI[writeable-0.6.2.sha256sum] =3D "9edde0db4769d2dc68579893f2306b26c6=
ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[yoke-0.8.1.sha256sum] =3D "72d6e5c6afb84d73944e5cedb052c4680d56573=
37201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] =3D "b659052874eb698efe5b9e8cf3822046=
78a0086ebf46982b79d6ca3182927e5d"
-SRC_URI[zerocopy-0.8.57.sha256sum] =3D "d35102a9f36d089ccae9e4c6802bc118be=
4487b80aaffc0ab4e0cf5ce92d2873"
-SRC_URI[zerocopy-derive-0.8.57.sha256sum] =3D "146c01f5ab44258da43cf276c74=
a2763db2ff3969c9c652c3f2de07041d0b2bc"
+SRC_URI[zerocopy-0.8.63.sha256sum] =3D "e5fe1f8f1b06191a00962174c61aa5005e=
0bb391a6d80d07e24d115c01a92ed8"
+SRC_URI[zerocopy-derive-0.8.63.sha256sum] =3D "863ad3ac83293fb4d740aedbfdc=
9240dd8d1a50c1099acd76ce80ce7c7230c7f"
 SRC_URI[zerofrom-0.1.6.sha256sum] =3D "50cc42e0333e05660c3587f3bf9d0478688=
e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D "d71e5d6e06ab090c67b5e44993ec=
16b72dcbaabc526db883a360057678b48502"
 SRC_URI[zerotrie-0.2.3.sha256sum] =3D "2a59c17a5562d507e4b54960e8569ebee33=
bee890c70aa3fe7b97e85a9fd7851"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb b/meta=
/recipes-devtools/python/python3-uv-build_0.13.7.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
index 8b05c79a25..8974550c86 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D86d3f3a=
95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=3De23fadd6c=
eef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=3Def7a6027dc4c=
2389b9afad7e690274c7"
=20
-SRC_URI[sha256sum] =3D "c95a3d092cb8880b37f35013f9f7339f3867bc422abed36776=
255f34e22bc62c"
+SRC_URI[sha256sum] =3D "c561c4fa00f64efd348bdbe3a01ade41bc9af99ba57d807cc7=
b2abdf73571366"
=20
 require ${BPN}-crates.inc
=20
