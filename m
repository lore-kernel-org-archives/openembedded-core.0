Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6128.1794231673296071714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=F6W+hUhf;
 spf=pass (domain: est.tech, ip: 52.101.65.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSYGkiAFsoTyW7UT8VoKJRobJsc3fnOoF6R2GFMgRTIqoXmCuy0SR4tCIlsY5DK4uhzfX/NQtzvXDl5zN2Pym5B1vgALNWk3+49zFWM/7qjN74LGE399Dqo45CsQh/x8yvQqcoBKeHxF5ao/sP57VPi8t02/dyr35sPF2xRu5ZOVBUdPUWMfRwAlK9qJudzZM1V1w45UOZNx9+8yULXV+vrTgtmWs1MTInbQX/YSXxIurxfpyGu0iiuviwb9ex0VZCKLk/cx8/RG8D1yRhci+ihG6p+KzhcSezaMyF5zchbMXrNQz1iImU+9jTuSPCApiyv5Z25gE2sZJh28sEKxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bjYB7p6M+LHI5kw8s5kvVcLwL9FXphLLaiDM4cKEPg=;
 b=LKtXyljm1OpYQXdXNAl+0iP6zAsclGb6NtX1KoBloUF47gOpkCP0Cr5yR2kZSzXkJwuqWmV+eIg5MOxmXE3nVcRJhFkxGBzyBYmUljX/nzlsFa2RuDWUZT/s+/WIEoCKty1YJsAu7nivrvzkARVhDkxsel3BDDEWtEkb9Ud5LSbfwgoTXk07LKaIChf4eWXmjVdKptqXWfgdjxP/4OPSSUFY0n1pJ8YRMiI1pGpdmLQ60CPaO5piIs2yd+99b7nay0wvYwrZQswRr9MFzm9rCNlc8Ml/2qdk55mjRicpFdQo664sip+KgxV0wmZ5c4j5WAqdrBlmlHkLzd3KaGInKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bjYB7p6M+LHI5kw8s5kvVcLwL9FXphLLaiDM4cKEPg=;
 b=F6W+hUhfZwt6MyepLq++ZsxnspZ5qBMVE2+PK7GgFMT05fF69ocWH6N+cXmEkEDijGwIISJAYEp8X0iwrr6FuFy7iExmM4ohZ3BrW5HfK/UaGje8PuHsQwIBBNPGda6aS1P2R2AjYyPaI1yFyPxcrZGDLUqgEtd1YLZwPyaDBRGVAnZi9FtYI+TpqNmSmX75Mz3/aOVqtL6MYNJ76wIrsHTVcdSBh49l8+zJvyfzjF9PoIwWzPDqmLRnoNrYfujKyKrnp2dgORXr7MrLlwMVGENPv6qZXZV+rnSzCgix/sQHXGcC2e8iOtfMSdu1tLYSxP8jwhahTRU0fSQo6/+lUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0994.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:41:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/21] rpm-sequoia: Upgrade 1.10.2 -> 1.10.3
Date: Mon,  9 Nov 2026 14:40:34 +0100
Message-ID: <20261109134034.74458-22-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0994:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e875048-d131-4019-1f81-08df3e671d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925022911599003|260925021911599003|260925021311599003|11063799006|261021121427099003|56012099006|261021135927099003|261021123027099003|261022113327099003|261022075727099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261026140227099003|261026121527099003|261102130727099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: xq8Ouy121WpUZhHiEjzH3+n9UxQoxpJS7LGbh1lCBhfu8HA5UkGTdO5l4gPiLW3Rwaly4p9c4L5pKFs79ck5l1bSulLN9sMRz2VWGkSaqnCa0PJ3kRakIY916dl51o6EUG03yGbjpiyoX8JxPyhUcgmQCpmfY0X95b/GcEPDHLVD2C/BcfBjjH1wNOcAWoYuvCh0EXwd8wjq6byJoIWsnUmjWwDpDbWuZLo0xRks0O3tvJS+ja/Ti9pYOoRF4z5AxgW4maGSXaaVO0uKuMG+LWDbqGz1Ex3r2jCry1Y0aaoKbjby190LbKro0SYOJGXALjJIymEYMwj+p+tpfF8r834pnsYNtdEpEL8/3YER9YH1IBCtVjyyFOLsAhYnLNsWrpmPfxo+lYhz7m9ZOdZerYQGkz2m8LHQDWej0zeTvFaoLy5VIXihKbLMKVVPgihC3xxJSSE9AFYdg+hWwAP+X89AwB9TfVxI6eCEANROBiuo5rc8U82YFNAU8HFFwNY0D4TqKw4ZF+rVnchiWpi/8ZTNHxYOCma2amhgzxnGfZLEThXKTzZegvtTQYWcA0kMnyOFjWQHmmX3TOlUibyiXAqGF1kzRqe/ageblE/okHv51psgEeC0klwdzXVkFr9X1jo/YDjV/sx6vqmcjGHa9NP8M9rP1PcQBldlJp2gv1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(261021121427099003)(56012099006)(261021135927099003)(261021123027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261102130727099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7QkKwDsKBDPkSclQ+drYxa37jErzz5WxhVHFkicbV4C07ENjSBpFEk/EX/RY?=
 =?us-ascii?Q?/MxeXBr0uklcLh1GbzuujfENe5fneu+E4RkaUMRfGMo4HP3DqHPd8/0b4Hop?=
 =?us-ascii?Q?mfKNiH0yemF0Gfdo5DE09cdHXGEfrfCgL+xIzdu7VB85A0xt+7GH1bx5SLUL?=
 =?us-ascii?Q?M8PKY5X0+JgAXFmNiUcIeSJ9+gk6GWnlhdBg8iZ12491s3UC4mJqsypGLx80?=
 =?us-ascii?Q?PShUU+rowyPaBrOUw8w8ZKgmP03GCRJ2s9DJYdCUgwXnm9GDh7lA68YL2s+D?=
 =?us-ascii?Q?xKarHfIMfU5wHgvrvnSiyrQgyHnM/cELL30/gJp4zo1DDAiYMXFQenMqdb7z?=
 =?us-ascii?Q?G3CUvXz+Ez0K7G13aN1S84kAKylwja0zNBspJDKL3yaxQ3uTZ2kkc0FKjSsm?=
 =?us-ascii?Q?Q5Ld0YybMzNnWrlW/WRes7ved8tYRe7k4AYCFyjSabrXgiuaPgR4bB1JyLQF?=
 =?us-ascii?Q?1vYmUzOSNdLS3DHjOS2kUVQT6J1aDW2pZnQI64dVGHhb/UyS+KtFaiWRThMj?=
 =?us-ascii?Q?U8ddTlGq8G9dGMNpVrYDBRbEs5zyXA78+7z4NiCO5vSwBR3EomIZnGm+ZVph?=
 =?us-ascii?Q?6cW0ip82enKXBEN3C3fWe1ZCs7hDmbodQIhgTFy5IoCVNMKJVLI2cZ34Pp+T?=
 =?us-ascii?Q?ZRLYNPPBxBbBm+X8DF3P+X/0/53KimnflpMSckbQrzIt+vXak7p+jcrOomMB?=
 =?us-ascii?Q?fvU2Z4kVWDEHf68Ru6/sKETrtEBAWnRTM2+ije7Opw3xyVURG2WbSqSNBbLA?=
 =?us-ascii?Q?D9N59ByH8KxaqN0Xd48l4csZ7TE+9b2K0hhjvNh+vP0k9wGUJLOswJyAmfeL?=
 =?us-ascii?Q?PYJoV29Ii2t+3hQxsLykGpklvYv+MT0p1NmHanSBHETNF5o9coxJbZhTiA+M?=
 =?us-ascii?Q?vUPW/VORN9Z/3oQizJZK9kkn2QcocBu28icwb6n1mO4Q1Lj2uJ1vmO/fYavr?=
 =?us-ascii?Q?XmFzv2QmxoVBRiSyuQjDCvP7aMpy+0OW3zMAn1mad63rTufIByKxj0gUeFr1?=
 =?us-ascii?Q?L8wL8LcrcI42ZdEEAG/+I/GgqnjnvudXi2t+gpt/qLnB5tAAMKM9DND/pfqY?=
 =?us-ascii?Q?R7Rt3TMgI41UgYVkfCfGVv67XXUrjMpo0q4X/52MvPPseV4PuoZ5JunwB2ac?=
 =?us-ascii?Q?zCyKEaDFnA14hD7PTBM/DPzinvGMcCPBW35qkELMiw3MRDq4mSAhoPPqUUcC?=
 =?us-ascii?Q?JJQYaljizUu87WQovOjzlo9RnxDUPfGfd6AOiD0z7sveZsYC+5+owXjsZ4a1?=
 =?us-ascii?Q?IA3fozmykSrrIXo/NOZOBUqU+/qRT3LYeoGyWt3E71GUvhLkFJv7iSdgu1Cg?=
 =?us-ascii?Q?SiZDGz9Mc9vA09t6JcgHb7SSSeG/0G7KC6gJl6g7JbFn8A1T6aVEWr8dAMa7?=
 =?us-ascii?Q?1tHj071306VIypg0GyQYwQLef72EssI8ry/45D+pwR4Tip3ah/nrwq5vx/OV?=
 =?us-ascii?Q?0vRWfEYsk+G43dl12HW5+ZtEdIVlltTgjxkVsiQs5C7BA3rtzx6DYYT+LvaS?=
 =?us-ascii?Q?UUg1Teasc82kmeTqm53E91ZBl+pNt3yp9QWryqlFPHbH2qSzQrdI+0kF7BHe?=
 =?us-ascii?Q?amwYDNjzfGlTazf/VFntt858aSBfsRYy2yUS2i2fGxXXQKV/6IbDGbT+Dodf?=
 =?us-ascii?Q?EUMGXl01MrMzBU5JqhzoHhNonlno0zJTffWoGkpMC63PbiCYvx5yHZFbnxbG?=
 =?us-ascii?Q?kR1X7k42EmtKakm+ZbYGFTYrMvbOa7QBOTVfQGjwXjzsMSeBZ20d8iaAkICW?=
 =?us-ascii?Q?Z40HVV5C6A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e875048-d131-4019-1f81-08df3e671d86
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:10.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwMbN8pJzx2bG1oX18ut6dytCeKl5CJE+/8cZZxIzEWok/BEMM/MFMx1XN39rEeb8xYioZ4DwMxvF3mQoX1FQYe4zrRoY1UWMnBb23chuqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249826
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/rpm-software-management/rpm-sequoia/compare/=
v1.10.2...v1.10.3

- 1.10.3 makes openssl-sys run bindgen, which needs clang. Depend on
  clang-native and set CLANG_PATH/LIBCLANG_PATH like bindgen-cli does.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-vars-to-force-runtime-paths-in-test.patch |   2 +-
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 418 ++++++++++--------
 ...equoia_1.10.2.bb =3D> rpm-sequoia_1.10.3.bb} |   9 +-
 3 files changed, 243 insertions(+), 186 deletions(-)
 rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.10.2.bb =3D> rpm-s=
equoia_1.10.3.bb} (90%)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-=
vars-to-force-runtime-paths-in-test.patch b/meta/recipes-devtools/rpm-sequo=
ia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
index b1f1e668cf4..fc3d442a939 100644
--- a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to=
-force-runtime-paths-in-test.patch
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to=
-force-runtime-paths-in-test.patch
@@ -1,4 +1,4 @@
-From 9b7031f633fe9e269555f4ddd21f023d4d8917c3 Mon Sep 17 00:00:00 2001
+From debbabde2240241e71cc6d810598467fda21cb40 Mon Sep 17 00:00:00 2001
 From: Ines KCHELFI <ines.kchelfi@smile.fr>
 Date: Thu, 10 Apr 2025 15:14:11 +0200
 Subject: [PATCH] Use optional env vars to force runtime paths in tests
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/met=
a/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
index b12f44d8273..da24ecabfaa 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
@@ -5,57 +5,67 @@ SRC_URI +=3D " \
     crate://crates.io/aead/0.5.2 \
     crate://crates.io/aes/0.8.4 \
     crate://crates.io/aes-gcm/0.10.3 \
-    crate://crates.io/aho-corasick/1.1.4 \
-    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/aho-corasick/1.1.5 \
+    crate://crates.io/android_system_properties/0.1.6 \
+    crate://crates.io/annotate-snippets/0.11.5 \
     crate://crates.io/anstyle/1.0.14 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/argon2/0.5.3 \
     crate://crates.io/ascii-canvas/4.0.0 \
-    crate://crates.io/assert_cmd/2.2.1 \
-    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/assert_cmd/2.2.2 \
+    crate://crates.io/autocfg/1.5.1 \
     crate://crates.io/base16ct/0.2.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64ct/1.8.3 \
     crate://crates.io/bindgen/0.72.1 \
     crate://crates.io/bit-set/0.8.0 \
     crate://crates.io/bit-vec/0.8.0 \
-    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/bitvec/1.1.1 \
     crate://crates.io/blake2/0.10.6 \
     crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/block-padding/0.3.3 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/botan/0.11.1 \
     crate://crates.io/botan-sys/0.11.1 \
-    crate://crates.io/bstr/1.12.1 \
-    crate://crates.io/buffered-reader/1.4.0 \
-    crate://crates.io/bumpalo/3.20.2 \
+    crate://crates.io/bstr/1.13.1 \
+    crate://crates.io/buffered-reader/1.4.1 \
+    crate://crates.io/bumpalo/3.20.3 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/camellia/0.1.0 \
     crate://crates.io/cast5/0.11.1 \
     crate://crates.io/cbc/0.1.2 \
-    crate://crates.io/cc/1.2.61 \
+    crate://crates.io/cc/1.4.5 \
     crate://crates.io/cdylib-link-lines/0.1.5 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfb-mode/0.8.2 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/chrono/0.4.44 \
+    crate://crates.io/chrono/0.4.45 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/clang-sys/1.8.1 \
+    crate://crates.io/clang-sys/1.9.1 \
     crate://crates.io/cmac/0.7.2 \
+    crate://crates.io/cmov/0.5.4 \
     crate://crates.io/const-oid/0.9.6 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/cpufeatures/0.3.1 \
     crate://crates.io/crypto-bigint/0.5.5 \
     crate://crates.io/crypto-common/0.1.7 \
+    crate://crates.io/crypto-common/0.2.2 \
+    crate://crates.io/ctor/1.0.13 \
     crate://crates.io/ctr/0.9.2 \
+    crate://crates.io/ctutils/0.4.2 \
     crate://crates.io/curve25519-dalek/4.1.3 \
     crate://crates.io/curve25519-dalek-derive/0.1.1 \
+    crate://crates.io/cx448/0.1.1 \
     crate://crates.io/dbl/0.3.2 \
     crate://crates.io/der/0.7.10 \
     crate://crates.io/des/0.8.1 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/digest/0.10.7 \
-    crate://crates.io/displaydoc/0.2.5 \
+    crate://crates.io/digest/0.11.3 \
+    crate://crates.io/displaydoc/0.2.7 \
     crate://crates.io/doc-comment/0.3.4 \
     crate://crates.io/dsa/0.6.3 \
     crate://crates.io/dyn-clone/1.0.20 \
@@ -64,32 +74,33 @@ SRC_URI +=3D " \
     crate://crates.io/ecdsa/0.16.9 \
     crate://crates.io/ed25519/2.2.3 \
     crate://crates.io/ed25519-dalek/2.2.0 \
-    crate://crates.io/either/1.15.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/elliptic-curve/0.13.8 \
     crate://crates.io/ena/0.14.4 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/fastrand/2.4.1 \
+    crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/ff/0.13.1 \
     crate://crates.io/fiat-crypto/0.2.9 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/find-msvc-tools/0.1.12 \
     crate://crates.io/fixedbitset/0.5.7 \
-    crate://crates.io/foldhash/0.1.5 \
-    crate://crates.io/foreign-types/0.3.2 \
-    crate://crates.io/foreign-types-shared/0.1.1 \
+    crate://crates.io/funty/2.0.0 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/generic-array/1.3.5 \
+    crate://crates.io/generic-array/1.4.5 \
     crate://crates.io/getrandom/0.2.17 \
     crate://crates.io/getrandom/0.3.4 \
-    crate://crates.io/getrandom/0.4.2 \
+    crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/ghash/0.5.1 \
-    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/glob/0.3.4 \
     crate://crates.io/group/0.13.0 \
-    crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.17.0 \
-    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/hkdf/0.12.4 \
     crate://crates.io/hmac/0.12.1 \
+    crate://crates.io/hybrid-array/0.3.1 \
+    crate://crates.io/hybrid-array/0.4.14 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
     crate://crates.io/icu_collections/2.1.1 \
@@ -99,46 +110,50 @@ SRC_URI +=3D " \
     crate://crates.io/icu_properties/2.1.2 \
     crate://crates.io/icu_properties_data/2.1.2 \
     crate://crates.io/icu_provider/2.1.1 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idea/0.5.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/inout/0.1.4 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/js-sys/0.3.95 \
+    crate://crates.io/js-sys/0.3.105 \
     crate://crates.io/keccak/0.1.6 \
+    crate://crates.io/keccak/0.2.2 \
+    crate://crates.io/kem/0.3.0 \
     crate://crates.io/lalrpop/0.22.2 \
     crate://crates.io/lalrpop-util/0.22.2 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libm/0.2.16 \
+    crate://crates.io/link-section/0.19.3 \
+    crate://crates.io/linktime-proc-macro/0.2.3 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/litemap/0.8.2 \
+    crate://crates.io/litemap/0.8.3 \
     crate://crates.io/lock_api/0.4.14 \
-    crate://crates.io/log/0.4.29 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/md-5/0.10.6 \
-    crate://crates.io/memchr/2.8.0 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/memsec/0.7.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/ml-dsa/0.1.1 \
+    crate://crates.io/ml-kem/0.3.2 \
+    crate://crates.io/module-lattice/0.2.3 \
     crate://crates.io/nettle/7.5.0 \
     crate://crates.io/nettle-sys/2.3.2 \
     crate://crates.io/new_debug_unreachable/1.0.6 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-bigint-dig/0.8.6 \
-    crate://crates.io/num-integer/0.1.46 \
-    crate://crates.io/num-iter/0.1.45 \
+    crate://crates.io/num-integer/0.1.47 \
+    crate://crates.io/num-iter/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/ocb3/0.1.0 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/opaque-debug/0.3.1 \
-    crate://crates.io/openssl/0.10.78 \
-    crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.114 \
+    crate://crates.io/openssl-sys/0.9.117 \
+    crate://crates.io/ossl/1.5.2 \
     crate://crates.io/p256/0.13.2 \
     crate://crates.io/p384/0.13.1 \
     crate://crates.io/p521/0.13.3 \
@@ -148,11 +163,12 @@ SRC_URI +=3D " \
     crate://crates.io/pem-rfc7468/0.7.0 \
     crate://crates.io/petgraph/0.7.1 \
     crate://crates.io/phf_shared/0.11.3 \
+    crate://crates.io/pin-project-lite/0.2.17 \
     crate://crates.io/pkcs1/0.7.5 \
     crate://crates.io/pkcs8/0.10.2 \
-    crate://crates.io/pkg-config/0.3.33 \
+    crate://crates.io/pkg-config/0.3.34 \
     crate://crates.io/polyval/0.6.2 \
-    crate://crates.io/potential_utf/0.1.5 \
+    crate://crates.io/potential_utf/0.1.6 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/precomputed-hash/0.1.1 \
     crate://crates.io/predicates/3.1.4 \
@@ -160,62 +176,77 @@ SRC_URI +=3D " \
     crate://crates.io/predicates-tree/1.0.13 \
     crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/primeorder/0.13.6 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.8.6 \
-    crate://crates.io/rand/0.9.4 \
+    crate://crates.io/radium/0.7.0 \
+    crate://crates.io/rand/0.8.8 \
+    crate://crates.io/rand/0.9.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.9.5 \
+    crate://crates.io/rand_core/0.10.1 \
     crate://crates.io/redox_syscall/0.5.18 \
-    crate://crates.io/regex/1.12.3 \
-    crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rfc6979/0.4.0 \
     crate://crates.io/ripemd/0.1.3 \
     crate://crates.io/rsa/0.9.10 \
-    crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustix/1.1.4 \
-    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sec1/0.7.3 \
     crate://crates.io/semver/1.0.28 \
-    crate://crates.io/sequoia-openpgp/2.2.0 \
-    crate://crates.io/sequoia-policy-config/0.8.1 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/sequoia-openpgp/2.4.1 \
+    crate://crates.io/sequoia-policy-config/0.8.2 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_json/1.0.151 \
+    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serdect/0.2.0 \
     crate://crates.io/sha1collisiondetection/0.3.4 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sha3/0.10.9 \
+    crate://crates.io/sha3/0.11.0 \
+    crate://crates.io/shake/0.1.0 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/signature/2.2.0 \
-    crate://crates.io/siphasher/1.0.2 \
-    crate://crates.io/smallvec/1.15.1 \
-    crate://crates.io/spin/0.9.8 \
+    crate://crates.io/signature/3.0.0 \
+    crate://crates.io/siphasher/1.0.3 \
+    crate://crates.io/slab/0.4.12 \
+    crate://crates.io/slh-dsa/0.0.3 \
+    crate://crates.io/smallvec/1.16.0 \
+    crate://crates.io/spin/0.9.9 \
     crate://crates.io/spki/0.7.3 \
+    crate://crates.io/sponge-cursor/0.1.0 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/string_cache/0.8.9 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.5 \
     crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/term/1.2.1 \
     crate://crates.io/termtree/0.5.1 \
-    crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.18 \
-    crate://crates.io/tinystr/0.8.3 \
-    crate://crates.io/toml/0.5.11 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/tinystr/0.8.4 \
+    crate://crates.io/toml/1.1.5+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/twofish/0.7.1 \
-    crate://crates.io/typenum/1.20.0 \
+    crate://crates.io/typenum/1.20.1 \
     crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/universal-hash/0.5.1 \
     crate://crates.io/utf8_iter/1.0.4 \
@@ -225,14 +256,10 @@ SRC_URI +=3D " \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
-    crate://crates.io/wasm-bindgen/0.2.118 \
-    crate://crates.io/wasm-bindgen-macro/0.2.118 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.118 \
-    crate://crates.io/wasm-bindgen-shared/0.2.118 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
+    crate://crates.io/wasm-bindgen/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.128 \
+    crate://crates.io/wasm-bindgen-shared/0.2.128 \
     crate://crates.io/win-crypto-ng/0.5.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -245,84 +272,92 @@ SRC_URI +=3D " \
     crate://crates.io/windows-result/0.4.1 \
     crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/winnow/1.0.4 \
     crate://crates.io/wit-bindgen/0.46.0 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
-    crate://crates.io/writeable/0.6.3 \
+    crate://crates.io/writeable/0.6.4 \
+    crate://crates.io/wyz/0.5.1 \
     crate://crates.io/x25519-dalek/2.0.1 \
-    crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/yoke/0.8.2 \
+    crate://crates.io/xxhash-rust/0.8.18 \
+    crate://crates.io/yoke/0.8.3 \
     crate://crates.io/yoke-derive/0.8.2 \
-    crate://crates.io/zerocopy/0.8.48 \
-    crate://crates.io/zerocopy-derive/0.8.48 \
-    crate://crates.io/zerofrom/0.1.7 \
+    crate://crates.io/zerocopy/0.7.35 \
+    crate://crates.io/zerocopy/0.8.56 \
+    crate://crates.io/zerocopy-derive/0.7.35 \
+    crate://crates.io/zerocopy-derive/0.8.56 \
+    crate://crates.io/zerofrom/0.1.8 \
     crate://crates.io/zerofrom-derive/0.1.7 \
-    crate://crates.io/zeroize/1.8.2 \
-    crate://crates.io/zeroize_derive/1.4.3 \
-    crate://crates.io/zerotrie/0.2.4 \
-    crate://crates.io/zerovec/0.11.6 \
-    crate://crates.io/zerovec-derive/0.11.3 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/zeroize/1.9.0 \
+    crate://crates.io/zeroize_derive/1.5.0 \
+    crate://crates.io/zerotrie/0.2.5 \
+    crate://crates.io/zerovec/0.11.8 \
+    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zmij/1.0.23 \
 "
=20
 SRC_URI[aead-0.5.2.sha256sum] =3D "d122413f284cf2d62fb1b7db97e02edb8cda96d=
769b16e443a4f6195e35662b0"
 SRC_URI[aes-0.8.4.sha256sum] =3D "b169f7a6d4742236a0a00c541b845991d0ac43e5=
46831af1249753ab4c3aa3a0"
 SRC_URI[aes-gcm-0.10.3.sha256sum] =3D "831010a0f742e1209b3bcea8fab6a8e1490=
51ba6099432c8cb2cc117dec3ead1"
-SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a5308=
ed92d4b226cc639f5a8f1002816174301"
-SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043ac=
279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[aho-corasick-1.1.5.sha256sum] =3D "c982642fa9e8606056828ee9a850573=
7230110bb1099153c79efe865c59d12ba"
+SRC_URI[android_system_properties-0.1.6.sha256sum] =3D "ae221649c9976a6f6c=
56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc"
+SRC_URI[annotate-snippets-0.11.5.sha256sum] =3D "710e8eae58854cdc1790fcb56=
cca04d712a17be849eeb81da2a724bf4bae2bc4"
 SRC_URI[anstyle-1.0.14.sha256sum] =3D "940b3a0ca603d1eade50a4846a2afffd5ef=
57a9feac2c0e2ec2e14f9ead76000"
-SRC_URI[anyhow-1.0.102.sha256sum] =3D "7f202df86484c868dbad7eaa557ef785d5c=
66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.104.sha256sum] =3D "330a5ed07fa54e4702c9d6c4174f74427fc=
0ef6e214bbd677ae50a5099946470"
 SRC_URI[argon2-0.5.3.sha256sum] =3D "3c3610892ee6e0cbce8ae2700349fcf8f98ad=
b0dbfbee85aec3c9179d29cc072"
 SRC_URI[ascii-canvas-4.0.0.sha256sum] =3D "ef1e3e699d84ab1b0911a1010c5c106=
aa34ae89aeac103be5ce0c3859db1e891"
-SRC_URI[assert_cmd-2.2.1.sha256sum] =3D "39bae1d3fa576f7c6519514180a725592=
68dd7d1fe104070956cb687bc6673bd"
-SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
+SRC_URI[assert_cmd-2.2.2.sha256sum] =3D "2aa3a22042e45de04255c7bf3626e239f=
450200fd0493c1e382263544b20aea6"
+SRC_URI[autocfg-1.5.1.sha256sum] =3D "f2032f911046de80f0a198e0901378627c33=
f59ea0ac00e363d481118bd70a53"
 SRC_URI[base16ct-0.2.0.sha256sum] =3D "4c7f02d4ea65f2c1853089ffd8d2787bdbc=
63de2f0d29dedbcf8ccdfa0ccd4cf"
 SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64ct-1.8.3.sha256sum] =3D "2af50177e190e07a26ab74f8b1efbfe2ef8=
7da2116221318cb1c2e82baf7de06"
 SRC_URI[bindgen-0.72.1.sha256sum] =3D "993776b509cfb49c750f11b8f07a46fa23e=
0a1386ffc01fb1e7d343efc387895"
 SRC_URI[bit-set-0.8.0.sha256sum] =3D "08807e080ed7f9d5433fa9b275196cfc3541=
4f66a0c79d864dc51a0d825231a3"
 SRC_URI[bit-vec-0.8.0.sha256sum] =3D "5e764a1d40d510daf35e07be9eb06e757709=
08c27d411ee6c92109c9840eaaf7"
-SRC_URI[bitflags-2.11.1.sha256sum] =3D "c4512299f36f043ab09a583e57bceb5a5a=
ab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[bitflags-2.13.1.sha256sum] =3D "b588b76d00fde79687d7646a9b5bdf3cc0=
f655e0bbd080335a95d7e96f3587da"
+SRC_URI[bitvec-1.1.1.sha256sum] =3D "ddcec3d12c579d40898fe0a9a358a803c23e9=
c52ca3c425707f81c9436211837"
 SRC_URI[blake2-0.10.6.sha256sum] =3D "46502ad458c9a52b69d4d4d32775c788b7a1=
b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[block-buffer-0.12.1.sha256sum] =3D "d2f6c7dbe95a6ed67ad9f18e57daf9=
3a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[block-padding-0.3.3.sha256sum] =3D "a8894febbff9f758034a5b8e12d879=
18f56dfc64a8e1fe757d65e29041538d93"
 SRC_URI[blowfish-0.9.1.sha256sum] =3D "e412e2cd0f2b2d93e02543ceae7917b3c70=
331573df19ee046bcbc35e45e87d7"
 SRC_URI[botan-0.11.1.sha256sum] =3D "24d4c7647d67c53194fa0740404c6c508880a=
ef2bfe99a9868dbb4b86f090377"
 SRC_URI[botan-sys-0.11.1.sha256sum] =3D "04285fa0c094cc9961fe435b1b279183d=
b9394844ad82ce483aa6196c0e6da38"
-SRC_URI[bstr-1.12.1.sha256sum] =3D "63044e1ae8e69f3b5a92c736ca6269b8d12fa7=
efe39bf34ddb06d102cf0e2cab"
-SRC_URI[buffered-reader-1.4.0.sha256sum] =3D "db26bf1f092fd5e05b5ab3be2f29=
0915aeb6f3f20c4e9f86ce0f07f336c2412f"
-SRC_URI[bumpalo-3.20.2.sha256sum] =3D "5d20789868f4b01b2f2caec9f5c4e0213b4=
1e3e5702a50157d699ae31ced2fcb"
+SRC_URI[bstr-1.13.1.sha256sum] =3D "6bb31b46c14244e20ee9984b11bf5c992b91fb=
6939fea616e3512c8baecdbe5f"
+SRC_URI[buffered-reader-1.4.1.sha256sum] =3D "c7531a07caf83a3fa3b47a233b43=
7ee7910cccfb688555d224338295a0a64fcc"
+SRC_URI[bumpalo-3.20.3.sha256sum] =3D "72f5acc6cb2ba439de613abc23857ec3d78=
374d8ed5ac84e9d11336e87da8649"
 SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf35=
3beff7305ebd1ae69500e27c67f64b"
 SRC_URI[camellia-0.1.0.sha256sum] =3D "3264e2574e9ef2b53ce6f536dea83a69ac0=
bc600b762d1523ff83fe07230ce30"
 SRC_URI[cast5-0.11.1.sha256sum] =3D "26b07d673db1ccf000e90f54b819db9e75a83=
48d6eb056e9b8ab53231b7a9911"
 SRC_URI[cbc-0.1.2.sha256sum] =3D "26b52a9543ae338f279b96b0b9fed9c809374468=
5043739079ce85cd58f289a6"
-SRC_URI[cc-1.2.61.sha256sum] =3D "d16d90359e986641506914ba71350897565610e8=
7ce0ad9e6f28569db3dd5c6d"
+SRC_URI[cc-1.4.5.sha256sum] =3D "005ec2760ca554fae18df7a11195552ec576cd665=
632a881bc011d5bb2fd4d80"
 SRC_URI[cdylib-link-lines-0.1.5.sha256sum] =3D "d98eabef08bbdf5afd0b9c0cab=
b1ac335f7c70447ef095eed85dffd9628b20bc"
 SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb6299=
00026402633ae9160df93a8766"
 SRC_URI[cfb-mode-0.8.2.sha256sum] =3D "738b8d467867f80a71351933f70461f5b56=
f24d5c93e0cf216e59229c968d330"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
-SRC_URI[chrono-0.4.44.sha256sum] =3D "c673075a2e0e5f4a1dde27ce9dee1ea4558c=
7ffe648f576438a20ca1d2acc4b0"
+SRC_URI[chrono-0.4.45.sha256sum] =3D "1aa79e62e7697b8e29b513a68abacf485adc=
d1fe8284a4316c5ae868e6633327"
 SRC_URI[cipher-0.4.4.sha256sum] =3D "773f3b9af64447d2ce9850330c473515014aa=
235e6a783b02db81ff39e4a3dad"
-SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd619=
ad4718dcaa767947df1cadb14f39f4"
+SRC_URI[clang-sys-1.9.1.sha256sum] =3D "157a8ba7b480713b56f4c09fd13fc3e0a2=
2a5dfab8097ba61cbc5feef950788a"
 SRC_URI[cmac-0.7.2.sha256sum] =3D "8543454e3c3f5126effff9cd44d562af4e31fb8=
ce1cc0d3dcd8f084515dbc1aa"
+SRC_URI[cmov-0.5.4.sha256sum] =3D "0c9ea0ac24bc397ab3c98583a3c9ba74fa56b09=
a4449bbe172b9b1ddb016027a"
 SRC_URI[const-oid-0.9.6.sha256sum] =3D "c2459377285ad874054d797f3ccebf9849=
78aa39129f6eafde5cdc8315b612f8"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f280=
777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b5316=
989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[cpufeatures-0.3.1.sha256sum] =3D "5ca28b0ae3115b884660db4118d80379=
1fd6756b6e88f39c0f3f7859060d7566"
 SRC_URI[crypto-bigint-0.5.5.sha256sum] =3D "0dc92fb57ca44df6db8059111ab3af=
99a63d5d0f8375d9972e319a379c6bab76"
 SRC_URI[crypto-common-0.1.7.sha256sum] =3D "78c8292055d1c1df0cce5d180393dc=
8cce0abec0a7102adb6c7b1eef6016d60a"
+SRC_URI[crypto-common-0.2.2.sha256sum] =3D "ce6e4c961d6cd6c9a86db418387425=
e8bdeaf05b3c8bc1411e6dca4c252f1453"
+SRC_URI[ctor-1.0.13.sha256sum] =3D "914a755b7c2d4af2bdcff7ce1739e2db9a1b81=
a9b07123d8015786ae03c0980d"
 SRC_URI[ctr-0.9.2.sha256sum] =3D "0369ee1ad671834580515889b80f2ea915f23b8b=
e8d0daa4bbaf2ac5c7590835"
+SRC_URI[ctutils-0.4.2.sha256sum] =3D "7d5515a3834141de9eafb9717ad39eea8247=
b5674e6066c404e8c4b365d2a29e"
 SRC_URI[curve25519-dalek-4.1.3.sha256sum] =3D "97fb8b7c4503de7d6ae7b42ab72=
a5a59857b4c937ec27a3d4539dba95b5ab2be"
 SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] =3D "f46882e17999c6cc590a=
f592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
+SRC_URI[cx448-0.1.1.sha256sum] =3D "b4c0cf476284b03eb6c10e78787b21c7abb7d7=
d43cb2f02532ba6b831ed892fa"
 SRC_URI[dbl-0.3.2.sha256sum] =3D "bd2735a791158376708f9347fe8faba9667589d8=
2427ef3aed6794a8981de3d9"
 SRC_URI[der-0.7.10.sha256sum] =3D "e7c1832837b905bbfb5101e07cc24c8deddf52f=
93225eee6ead5f4d63d53ddcb"
 SRC_URI[des-0.8.1.sha256sum] =3D "ffdd80ce8ce993de27e9f063a444a4d53ce8e8db=
4c1f00cc03af5ad5a9867a1e"
 SRC_URI[difflib-0.4.0.sha256sum] =3D "6184e33543162437515c2e2b48714794e378=
45ec9851711914eec9d308f6ebe8"
 SRC_URI[digest-0.10.7.sha256sum] =3D "9ed9a281f7bc9b7576e61468ba615a66a5c8=
cfdff42420a70aa82701a3b1e292"
-SRC_URI[displaydoc-0.2.5.sha256sum] =3D "97369cbbc041bc366949bc74d34658d6c=
da5621039731c6310521892a3a20ae0"
+SRC_URI[digest-0.11.3.sha256sum] =3D "f1dd6dbb5841937940781866fa1281a1ff7b=
d3bf827091440879f9994983d5c2"
+SRC_URI[displaydoc-0.2.7.sha256sum] =3D "c6232dd377dcc64799954cbd3a9bb882e=
9cdc1308ccd87b1c098f1fb2eaf82a8"
 SRC_URI[doc-comment-0.3.4.sha256sum] =3D "780955b8b195a21ab8e4ac6b60dd1dbd=
cec1dc6c51c0617964b08c81785e12c9"
 SRC_URI[dsa-0.6.3.sha256sum] =3D "48bc224a9084ad760195584ce5abb3c2c34a225f=
a312a128ad245a6b412b7689"
 SRC_URI[dyn-clone-1.0.20.sha256sum] =3D "d0881ea181b1df73ff77ffaaf9c7544ec=
c11e82fba9b5f27b262a3c73a332555"
@@ -331,32 +366,33 @@ SRC_URI[ecb-0.1.2.sha256sum] =3D "1a8bfa975b1aec21458=
50fcaa1c6fe269a16578c44705a53
 SRC_URI[ecdsa-0.16.9.sha256sum] =3D "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c1=
5daded5a60300e4abb9d8020bca"
 SRC_URI[ed25519-2.2.3.sha256sum] =3D "115531babc129696a58c64a4fef0a8bf9e96=
98629fb97e9e40767d235cfbcd53"
 SRC_URI[ed25519-dalek-2.2.0.sha256sum] =3D "70e796c081cee67dc755e1a36a0a17=
2b897fab85fc3f6bc48307991f64e4eca9"
-SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5ede0e46177b7add2e67155f70=
e33c07fea8284df6576da70b3719"
+SRC_URI[either-1.18.0.sha256sum] =3D "252afb9ae5eaa683babdc6a068b3f5726eb1=
9e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[elliptic-curve-0.13.8.sha256sum] =3D "b5e6043086bf7973472e0c7dff21=
42ea0b680d30e18d9cc40f267efbf222bd47"
 SRC_URI[ena-0.14.4.sha256sum] =3D "eabffdaee24bd1bf95c5ef7cec31260444317e7=
2ea56c4c91750e8b7ee58d5f1"
 SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
-SRC_URI[fastrand-2.4.1.sha256sum] =3D "9f1f227452a390804cdb637b74a86990f2a=
7d7ba4b7d5693aac9b4dd6defd8d6"
+SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
 SRC_URI[ff-0.13.1.sha256sum] =3D "c0b50bfb653653f9ca9095b427bed08ab8d75a13=
7839d9ad64eb11810d5b6393"
 SRC_URI[fiat-crypto-0.2.9.sha256sum] =3D "28dea519a9695b9977216879a3ebfddf=
92f1c08c05d984f8996aecd6ecdc811d"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc41989=
300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[find-msvc-tools-0.1.12.sha256sum] =3D "3e0f1c7c3a72c66fd80abe96517=
5f7523475c0489a87d3ff9d6e8c87d87a9d2d"
 SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df0792=
7c6d4aa5b027d7da16ba32d1d21ecd99"
-SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40b3=
9fe946cbe4c263c7209467bc83af2"
-SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda86=
9aefa38d22d5cb648e6485e4d3fc06f3b1"
-SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D "00b0228411908ca8685dba7=
fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
+SRC_URI[funty-2.0.0.sha256sum] =3D "e6d5a32815ae3f33302d95fdcb2ce17862f8c6=
5363dcfd29360480ba1001fc9c"
+SRC_URI[futures-core-0.3.34.sha256sum] =3D "92d699e522242e69e3003b94ecc1f9=
60f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-task-0.3.34.sha256sum] =3D "cd417de3d1d015fc3bfd2b1ea46dfc=
7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] =3D "0d50a92467f8ba5dd6e3ee5d4bd04d=
73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf274a=
d91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[generic-array-1.3.5.sha256sum] =3D "eaf57c49a95fd1fe24b90b3033bee6=
dc7e8f1288d51494cb44e627c295e38542"
+SRC_URI[generic-array-1.4.5.sha256sum] =3D "337d46834ee672ab3e48caca2cb0c7=
8cc174fb12b3a68d0d88f99a0519a5e36e"
 SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae276a=
d847ad0a6b3faa4bcb027e9a4614ad0"
 SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
-SRC_URI[getrandom-0.4.2.sha256sum] =3D "0de51e6874e94e7bf76d726fc5d13ba782=
deca734ff60d5bb2fb2607c7406555"
+SRC_URI[getrandom-0.4.3.sha256sum] =3D "300e883d756b2e4ec94e02791f39b04b52=
2276138852cfc41d9fb7e904106099"
 SRC_URI[ghash-0.5.1.sha256sum] =3D "f0d8a4362ccb29cb0b265253fb0a2728f59289=
5ee6854fd9bc13f2ffda266ff1"
-SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b4136a=
8bc82338574f23baf47bbd280"
+SRC_URI[glob-0.3.4.sha256sum] =3D "e4eba85ea1d0a966a983acd07deee566e67395d=
2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[group-0.13.0.sha256sum] =3D "f0f9ef7462f7c099f518d754361858f86d8a0=
7af53ba9af0fe635bbccb151a63"
-SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.17.0.sha256sum] =3D "4f467dd6dccf739c208452f8014c75c18=
bb8301b050ad1cfb27153803edb0f51"
-SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
+SRC_URI[hashbrown-0.17.1.sha256sum] =3D "ed5909b6e89a2db4456e54cd5f673791d=
7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[hkdf-0.12.4.sha256sum] =3D "7b5f8eb2ad728638ea2c7d47a21db23b7b58a7=
2ed6a38256b8a1849f15fbbdf7"
 SRC_URI[hmac-0.12.1.sha256sum] =3D "6c49c37c09c17a53d937dfbb742eb3a961d65a=
994e6bcdcf37e7399d0cc8ab5e"
+SRC_URI[hybrid-array-0.3.1.sha256sum] =3D "891d15931895091dea5c47afa5b3c9a=
01ba634b311919fd4d41388fa0e3d76af"
+SRC_URI[hybrid-array-0.4.14.sha256sum] =3D "707114b52a152fa7bdb290cd7cd591=
2d9467273b6d74e21b8d81aca1f8533f6b"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9ef=
0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
 SRC_URI[icu_collections-2.1.1.sha256sum] =3D "4c6b649701667bbe825c3b7e6388=
cb521c23d88644678e83c0c4d0a621a34b43"
@@ -366,46 +402,50 @@ SRC_URI[icu_normalizer_data-2.1.1.sha256sum] =3D "7ae=
dcccd01fc5fe81e6b489c15b247b8
 SRC_URI[icu_properties-2.1.2.sha256sum] =3D "020bfc02fe870ec3a66d93e677ccc=
a0562506e5872c650f893269e08615d74ec"
 SRC_URI[icu_properties_data-2.1.2.sha256sum] =3D "616c294cf8d725c6afcd8f55=
abc17c56464ef6211f9ed59cccffe534129c77af"
 SRC_URI[icu_provider-2.1.1.sha256sum] =3D "85962cf0ce02e1e0a629cc34e7ca3e3=
73ce20dda4c4d7294bbd0bf1fdb59e614"
-SRC_URI[id-arena-2.3.0.sha256sum] =3D "3d3067d79b975e8844ca9eb072e16b31c3c=
1c36928edf9c6789548c524d0d954"
 SRC_URI[idea-0.5.1.sha256sum] =3D "075557004419d7f2031b8bb7f44bb43e55a83ca=
7b63076a8fb8fe75753836477"
 SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc588455225f=
b2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.14.0.sha256sum] =3D "d466e9454f08e4a911e14806c24e16fba1=
b4c121d1ea474396f396069cf949d9"
+SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
 SRC_URI[inout-0.1.4.sha256sum] =3D "879f10e63c20629ecabbb64a8010319738c66a=
5cd0c29b02d63d272b03751d01"
 SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33f2=
d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.18.sha256sum] =3D "8f42a60cbdf9a97f5d2305f08a87dc4e09308d=
1276d28c869c684d7777685682"
-SRC_URI[js-sys-0.3.95.sha256sum] =3D "2964e92d1d9dc3364cae4d718d93f227e3ab=
b088e747d92e0395bfdedf1c12ca"
+SRC_URI[js-sys-0.3.105.sha256sum] =3D "ce57d20d1ea864ce2ac172ab472d409214f=
4fd359f0b2a2775abdf522e2af99e"
 SRC_URI[keccak-0.1.6.sha256sum] =3D "cb26cec98cce3a3d96cbb7bced3c4b16e3d13=
f27ec56dbd62cbc8f39cfb9d653"
+SRC_URI[keccak-0.2.2.sha256sum] =3D "d8f198d1db720e4940b5a493201d199d9f24f=
568f8f746bd13706243a2f71598"
+SRC_URI[kem-0.3.0.sha256sum] =3D "01737161ba802849cfd486b5bd209d38ba494349=
4c249a8126005170c7621edd"
 SRC_URI[lalrpop-0.22.2.sha256sum] =3D "ba4ebbd48ce411c1d10fb35185f5a51a7bf=
a3d8b24b4e330d30c9e3a34129501"
 SRC_URI[lalrpop-util-0.22.2.sha256sum] =3D "b5baa5e9ff84f1aefd264e68699076=
46538a52147a755d494517a8007fb48733"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
-SRC_URI[leb128fmt-0.1.0.sha256sum] =3D "09edd9e8b54e49e587e4f6295a7d29c3ea=
94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.186.sha256sum] =3D "68ab91017fe16c622486840e4c83c9a37afef=
f978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
 SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79a6=
ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.16.sha256sum] =3D "b6d2cec3eae94f9f509c767b45932f1ada8350=
c4bdb85af2fcab4a3c14807981"
+SRC_URI[link-section-0.19.3.sha256sum] =3D "39c29a617ce3df32c08497bdc1ab6e=
2376e0b17948ac166a2fbe5977c5954cd9"
+SRC_URI[linktime-proc-macro-0.2.3.sha256sum] =3D "7e57c38c1e860fd37c604281=
cdfb1dd2216977fd76a50f85ba2f388ef3219616"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
-SRC_URI[litemap-0.8.2.sha256sum] =3D "92daf443525c4cce67b150400bc231607610=
0ce0b3686209eb8cf3c31612e6f0"
+SRC_URI[litemap-0.8.3.sha256sum] =3D "47d9d19d1d6efa0109d2f65ff4c85cddd50b=
d572e5a00127ab10987290bcefae"
 SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b1408=
9b3dadafcab6bb93eab67d3aace965"
-SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf3856=
3a65908389bf7978758920897"
+SRC_URI[log-0.4.34.sha256sum] =3D "f9f8bd3e56ce4dfc153cf470fffbfa98c762095=
8b312ca5c3a4b8d5181fd13c6"
 SRC_URI[md-5-0.10.6.sha256sum] =3D "d89e7ee0cfbedfc4da3340218492196241d89e=
efb6dab27de5df917a6d2e78cf"
-SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd205e=
060fb3ce5b979b8ed8e59ff3f79"
+SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4=
beb022d3b367256b91b87513d98"
 SRC_URI[memsec-0.7.0.sha256sum] =3D "c797b9d6bb23aab2fc369c65f871be49214f5=
c759af65bde26ffaaa2b646b492"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[ml-dsa-0.1.1.sha256sum] =3D "add6b9d92e496f16f4526d68ff29da1483aba=
4b119baeab8bed3b9e3544a6f3d"
+SRC_URI[ml-kem-0.3.2.sha256sum] =3D "5e15f3e5b957493873e396a66914e83e616b6=
afe335cdef7efe5c6e1216aba66"
+SRC_URI[module-lattice-0.2.3.sha256sum] =3D "0c61b87c9683ab7cb1c6871d261ad=
5479b6b10ceb52c4352aaca3b5d35a8febe"
 SRC_URI[nettle-7.5.0.sha256sum] =3D "2578a3627c28fefb60f1680e20e85f38bd8c8=
bf98c288b370489a573b0640907"
 SRC_URI[nettle-sys-2.3.2.sha256sum] =3D "f35502358aa77e598570bbf9a79ad19c4=
985a1bcd157b5d70197688dafca9b48"
 SRC_URI[new_debug_unreachable-1.0.6.sha256sum] =3D "650eef8c711430f1a879fd=
d01d4745a7deea475becfb90269c06775983bbf086"
 SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
 SRC_URI[num-bigint-dig-0.8.6.sha256sum] =3D "e661dda6640fad38e827a6d4a310f=
f4763082116fe217f279885c97f511bb0b7"
-SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2958a5cb096e56c8e1ad04=
44ac2bbcd0061bd28660485a44879858f"
-SRC_URI[num-iter-0.1.45.sha256sum] =3D "1429034a0490724d0075ebb2bc9e875d65=
03c3cf69e235a8941aa757d83ef5bf"
+SRC_URI[num-integer-0.1.47.sha256sum] =3D "7ce2d95d4b3734dc35aa2f45e1aa22c=
d416814592a4f9d9205e11affd5b8e10b"
+SRC_URI[num-iter-0.1.46.sha256sum] =3D "c92800bd69a1eac91786bcfe9da64a897e=
b72911b8dc3095decbd07429e8048b"
 SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72ad=
0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[ocb3-0.1.0.sha256sum] =3D "c196e0276c471c843dd5777e7543a36a298a4be=
942a2a688d8111cd43390dedb"
 SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f85d45ae3e3a179218570=
6c8e16d043238c593331cc7cd313b50"
 SRC_URI[opaque-debug-0.3.1.sha256sum] =3D "c08d65885ee38876c4f86fa503fb49d=
7b507c2b62552df7c70b2fce627e06381"
-SRC_URI[openssl-0.10.78.sha256sum] =3D "f38c4372413cdaaf3cc79dd92d29d7d9f5=
ab09b51b10dded508fb90bb70b9222"
-SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e89d=
4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.114.sha256sum] =3D "13ce1245cd07fcc4cfdb438f7507b0=
c7e4f3849a69fd84d52374c66d83741bb6"
+SRC_URI[openssl-sys-0.9.117.sha256sum] =3D "b47e7e6bb2c38cd930d25a23b40fa5=
2e068c10e85f3e03a7f5ba5aaca5713695"
+SRC_URI[ossl-1.5.2.sha256sum] =3D "8f34df8ca6a2920b0fae969ced913c714b41f23=
b655a434a45c6a9843a75c019"
 SRC_URI[p256-0.13.2.sha256sum] =3D "c9863ad85fa8f4460f9c48cb909d38a0d689db=
a1f6f6988a5e3e0d31071bcd4b"
 SRC_URI[p384-0.13.1.sha256sum] =3D "fe42f1670a52a47d448f14b6a5c61dd78fce51=
856e68edaa38f7ae3a46b8d6b6"
 SRC_URI[p521-0.13.3.sha256sum] =3D "0fc9e2161f1f215afdfce23677034ae137bbd4=
5016a880c2eb3ba8eb95f085b2"
@@ -415,11 +455,12 @@ SRC_URI[password-hash-0.5.0.sha256sum] =3D "346f04948=
ba92c43e8469c1ee6736c7563d710
 SRC_URI[pem-rfc7468-0.7.0.sha256sum] =3D "88b39c9bfcfc231068454382784bb460=
aae594343fb030d46e9f50a645418412"
 SRC_URI[petgraph-0.7.1.sha256sum] =3D "3672b37090dbd86368a4145bc067582552b=
29c27377cad4e0a306c97f9bd7772"
 SRC_URI[phf_shared-0.11.3.sha256sum] =3D "67eabc2ef2a60eb7faa00097bd1ffdb5=
bd28e62bf39990626a582201b7a754e5"
+SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c923=
18e070967d1042b512afbe49518723f4e6d5cd"
 SRC_URI[pkcs1-0.7.5.sha256sum] =3D "c8ffb9f10fa047879315e6625af03c164b1696=
2a5368d724ed16323b68ace47f"
 SRC_URI[pkcs8-0.10.2.sha256sum] =3D "f950b2377845cebe5cf8b5165cb3cc1a5e0fa=
5cfa3e1f7f55707d8fd82e0a7b7"
-SRC_URI[pkg-config-0.3.33.sha256sum] =3D "19f132c84eca552bf34cab8ec81f1c1d=
cc229b811638f9d283dceabe58c5569e"
+SRC_URI[pkg-config-0.3.34.sha256sum] =3D "f6b464fbc74e149a392436b17d523f76=
9e057cb6877f6a5c4618bc6f11800548"
 SRC_URI[polyval-0.6.2.sha256sum] =3D "9d1fe60d06143b2430aa532c94cfe9e29783=
047f06c0d7fd359a9a51b729fa25"
-SRC_URI[potential_utf-0.1.5.sha256sum] =3D "0103b1cef7ec0cf76490e969665504=
990193874ea05c85ff9bab8b911d0a0564"
+SRC_URI[potential_utf-0.1.6.sha256sum] =3D "d83eb9bc6d8e5cf568e7a1101d60ee=
05e81ed50ea106026f3d18deeb046d7661"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[precomputed-hash-0.1.1.sha256sum] =3D "925383efa346730478fb4838dbe=
9137d2a47675ad789c546d150a6e1dd4ab31c"
 SRC_URI[predicates-3.1.4.sha256sum] =3D "ada8f2932f28a27ee7b70dd6c1c39ea06=
75c55a36879ab92f3a715eaa1e63cfe"
@@ -427,62 +468,77 @@ SRC_URI[predicates-core-1.0.10.sha256sum] =3D "cad387=
46f3166b4031b1a0d39ad9f954dd2
 SRC_URI[predicates-tree-1.0.13.sha256sum] =3D "d0de1b847b39c8131db0467e9df=
1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
 SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9ecccb=
fe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[primeorder-0.13.6.sha256sum] =3D "353e1ca18966c16d9deb1c69278edbc5=
f194139612772bd9537af60ac231e1e6"
-SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593e1=
29785a36d6ee376ddf37259b924"
+SRC_URI[proc-macro2-1.0.107.sha256sum] =3D "985e7ec9bb745e6ce6535b544d84d6=
cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458bf=
8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f92=
b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.8.6.sha256sum] =3D "5ca0ecfa931c29007047d1bc58e623ab12e5590=
e8c7cc53200d5202b69266d8a"
-SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
+SRC_URI[radium-0.7.0.sha256sum] =3D "dc33ff2d4973d518d823d61aa239014831e52=
1c75da58e3df4840d3f47749d09"
+SRC_URI[rand-0.8.8.sha256sum] =3D "e058c7de0b26af77780c769414d6257830bb240=
f3c38477dbc2c16e5f54d6d4c"
+SRC_URI[rand-0.9.5.sha256sum] =3D "b9ef1d0d795eb7d84685bca4f72f3649f064e66=
41543d3a8c415898726a57b41"
 SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d4d=
4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac9b=
afc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19e3=
74fd8dd986b0d2af0d02377261d83c"
+SRC_URI[rand_core-0.10.1.sha256sum] =3D "63b8176103e19a2643978565ca18b5054=
9f6101881c443590420e4dc998a3c69"
 SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3f9=
38979645c44812fbfcda098faae3f1a362d"
-SRC_URI[regex-1.12.3.sha256sum] =3D "e10754a14b9137dd7b1e3e5b0493cc9171fdd=
105e0ab477f51b72e7f3ac0e276"
-SRC_URI[regex-automata-0.4.14.sha256sum] =3D "6e1dd4122fc1595e816261894547=
6892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] =3D "dc897dd8d9e8bd1ed8cdad82b5966c=
3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-1.13.1.sha256sum] =3D "f020237b6c8eed93db2e2cb53c00c60a8e1bc=
73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] =3D "ad8553b9b26413251cbf30e62059=
5c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da66=
5ba74413d36db0979633275d2e708145d4"
 SRC_URI[rfc6979-0.4.0.sha256sum] =3D "f8dd2a808d456c4a54e300a23e9f5a67e122=
c3024119acbfd73e3bf664491cb2"
 SRC_URI[ripemd-0.1.3.sha256sum] =3D "bd124222d17ad93a644ed9d011a40f4fb64aa=
54275c08cc216524a9ea82fb09f"
 SRC_URI[rsa-0.9.10.sha256sum] =3D "b8573f03f5883dcaebdfcf4725caa1ecb9c15b2=
ef50c43a07b816e06799bb12d"
-SRC_URI[rustc-hash-2.1.2.sha256sum] =3D "94300abf3f1ae2e2b8ffb7b58043de3d3=
99c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rustc-hash-2.1.3.sha256sum] =3D "6b1e7f9a428571be2dc5bc0505c13fb6b=
f936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
-SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
+SRC_URI[rustversion-1.0.23.sha256sum] =3D "cf54715a573b99ac80df0bc206da022=
bcd442c974952c7b9720069370852e21f"
 SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4baf7=
e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59bce=
7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sec1-0.7.3.sha256sum] =3D "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3=
eccfb189469f11ec4901c47dc"
 SRC_URI[semver-1.0.28.sha256sum] =3D "8a7852d02fc848982e0c167ef163aaff9cd9=
1dc640ba85e263cb1ce46fae51cd"
-SRC_URI[sequoia-openpgp-2.2.0.sha256sum] =3D "0620e44a7d514adf7df87b44db23=
5f13b81fed7ddc265adb26f014d42626ac47"
-SRC_URI[sequoia-policy-config-0.8.1.sha256sum] =3D "c8c2be5e64986e3192d571=
4c2334fbfb9e22c8cb41d7ad4583847eb590a8cea1"
-SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a9143618=
0c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c3983=
b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab66=
608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] =3D "83fc039473c5595ace860d8c4fafa22=
0ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[sequoia-openpgp-2.4.1.sha256sum] =3D "0fbc8f9818a6fad141d85993777b=
a298ee52c80a09bd23d45dda461a6b7c83cb"
+SRC_URI[sequoia-policy-config-0.8.2.sha256sum] =3D "54ecc2eeefc0ccbba225e6=
e57ef1cde9df78e55b315e71fd95ebebc5bd1dbbb6"
+SRC_URI[serde-1.0.229.sha256sum] =3D "4148590afebada386688f18773da617792bf=
2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] =3D "67dca2c9c51e58a4791a4b1ed58308b=
39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] =3D "e7a5d71263a5a7d47b41f6b3f06ba=
276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_json-1.0.151.sha256sum] =3D "c841b55ecdae098c80dcae9cf767f6f=
8a0c2cdb3416bbef72181df4d0fe73f14"
+SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879511e06e8999a8a235d848=
113e942c9124f211511b16466ee2995f26"
+SRC_URI[serdect-0.2.0.sha256sum] =3D "a84f14a19e9a014bb9f4512488d9829a68e0=
4ecabffb0f9904cd1ace94598177"
 SRC_URI[sha1collisiondetection-0.3.4.sha256sum] =3D "1f606421e4a6012877e89=
3c399822a4ed4b089164c5969424e1b9d1e66e6964b"
 SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01a365ab707794a4084392c82=
4f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha3-0.10.9.sha256sum] =3D "77fd7028345d415a4034cf8777cd4f8ab18512=
74233b45f84e3d955502d93874"
+SRC_URI[sha3-0.11.0.sha256sum] =3D "be176f1a57ce4e3d31c1a166222d9768de5954=
f811601fb7ca06fc8203905ce1"
+SRC_URI[shake-0.1.0.sha256sum] =3D "09057cb2149ad4cbd2da1e26b351f9a4c35421=
9421229c69c3063e6f61947c4a"
 SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
+SRC_URI[shlex-2.0.1.sha256sum] =3D "f8fadd59c855ef2080decdef8ff161eb6661b8=
6933c9d82e5ba29dc602a55aba"
 SRC_URI[signature-2.2.0.sha256sum] =3D "77549399552de45a898a580c1b41d445bf=
730df867cc44e6c0233bbc4b8329de"
-SRC_URI[siphasher-1.0.2.sha256sum] =3D "b2aa850e253778c88a04c3d7323b043aed=
a9d3e30d5971937c1855769763678e"
-SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45c6=
9e92af734b7aaddc05fb777b6fbd03"
-SRC_URI[spin-0.9.8.sha256sum] =3D "6980e8d7511241f8acf4aebddbb1ff938df5eeb=
e98691418c4468d0b72a96a67"
+SRC_URI[signature-3.0.0.sha256sum] =3D "28d567dcbaf0049cb8ac2608a76cd95ff9=
e4412e1899d389ee400918ca7537f5"
+SRC_URI[siphasher-1.0.3.sha256sum] =3D "8ee5873ec9cce0195efcb7a4e9507a04cd=
49aec9c83d0389df45b1ef7ba2e649"
+SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
+SRC_URI[slh-dsa-0.0.3.sha256sum] =3D "bd2f20f4049197e03db1104a6452f4d9e966=
65d79f880198dce4a7026ba5f267"
+SRC_URI[smallvec-1.16.0.sha256sum] =3D "b9be42f50aa861c555654aa3a37f52f4b1=
074bacf4e48fe0ef7fa584e80f1f0f"
+SRC_URI[spin-0.9.9.sha256sum] =3D "3763264f6b73151db08c50ff20d7d8a0b8796e0=
21cdea7ceedad07b80155fa0e"
 SRC_URI[spki-0.7.3.sha256sum] =3D "d91ed6c858b01f942cd56b37a94b3e0a1798290=
327d1236e4d9cf4eaca44d29d"
+SRC_URI[sponge-cursor-0.1.0.sha256sum] =3D "3a0219bd7d979d58245a4f41f695e1=
ac9f8befdffadd7f61f1bae9e39abc6620"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71bf=
a12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[string_cache-0.8.9.sha256sum] =3D "bf776ba3fa74f83bf4b63c3dcbbf821=
73db2632ed8452cb2d891d33f459de70f"
 SRC_URI[subtle-2.6.1.sha256sum] =3D "13c2bddecc57b384dee18652358fb23172fac=
b8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.117.sha256sum] =3D "e665b8803e7b1d2a727f4023456bbbbe74da67=
099c585258af0ad9c5013b9b99"
+SRC_URI[syn-2.0.119.sha256sum] =3D "872831b642d1a07999a962a351ed35b955ea2c=
fc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.5.sha256sum] =3D "12df2e0110f65b775f769bb17ef989067a1d931b=
2eb822bd4346631eeada89f9"
 SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[tap-1.0.1.sha256sum] =3D "55937e1799185b12863d447f42597ed69d992868=
6b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[term-1.2.1.sha256sum] =3D "d8c27177b12a6399ffc08b98f76f7c9a1f4fe9f=
c967c784c5a071fa8d93cf7e1"
 SRC_URI[termtree-0.5.1.sha256sum] =3D "8f50febec83f5ee1df3015341d8bd429f2d=
1cc62bcba7ea2076759d315084683"
-SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b578ea85b50e080feb250a3e=
8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.18.sha256sum] =3D "4288b5bcbc7920c07a1149a35cf9590a2=
aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42c6=
0a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D "ebc4ee7f67670e9b64d05fa4253e=
753e016c6c95ff35b89b7941d6b856dec1d5"
-SRC_URI[tinystr-0.8.3.sha256sum] =3D "c8323304221c2a851516f22236c5722a72ea=
a19749016521d6dff0824447d96d"
-SRC_URI[toml-0.5.11.sha256sum] =3D "f4f7f0dd8d50a853a531c426359045b1998f04=
219d88799810762cd4ad314234"
+SRC_URI[thiserror-2.0.20.sha256sum] =3D "ec86235f5fcc2a73650310756d2ac5b13=
8a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] =3D "bc04cd3e1236dd4a98afca4569f2=
deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[tinystr-0.8.4.sha256sum] =3D "b1e27c91459209c2986af3dcf603a5a74a43=
68754ce37414f59acc971167f643"
+SRC_URI[toml-1.1.5+spec-1.1.0.sha256sum] =3D "12c0ba9680044b4ce98d391a6209=
4047eada0d64860b80166c39f4a6b5640785"
+SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] =3D "3165f65f62e28e0115a=
00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] =3D "1d38ac1cf9b95face3229=
6c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
+SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41a4=
21187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[twofish-0.7.1.sha256sum] =3D "a78e83a30223c757c3947cd144a31014ff04=
298d8719ae10d03c31c0448c8013"
-SRC_URI[typenum-1.20.0.sha256sum] =3D "40ce102ab67701b8526c123c1bab5cbe42d=
7040ccfd0f64af1a385808d2f43de"
+SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b371b77fe0ee0bafb859fa=
4964b4404c27de1d380043c4dda20"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d71ede7ee76d585517add45=
da530660ef4390e49b098733c6e897f254"
 SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c350734c=
9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[universal-hash-0.5.1.sha256sum] =3D "fc1de2c688dc15305988b563c3854=
064043356019f97a4b46276fe734c4f07ea"
 SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
@@ -492,14 +548,10 @@ SRC_URI[wait-timeout-0.2.1.sha256sum] =3D "09ac3b126d=
3914f9849036f826e054cbabdc851
 SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1dc0=
6c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c345a1=
882263bbf4d65cf3f42e90921f787ef5ad58e7"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D "5428f8bf88ea=
5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
-SRC_URI[wasm-bindgen-0.2.118.sha256sum] =3D "0bf938a0bacb0469e83c1e148908b=
d7d5a6010354cf4fb73279b7447422e3a89"
-SRC_URI[wasm-bindgen-macro-0.2.118.sha256sum] =3D "eeff24f84126c0ec2db7a44=
9f0c2ec963c6a49efe0698c4242929da037ca28ed"
-SRC_URI[wasm-bindgen-macro-support-0.2.118.sha256sum] =3D "9d08065faf983b2=
b80a79fd87d8254c409281cf7de75fc4b773019824196c904"
-SRC_URI[wasm-bindgen-shared-0.2.118.sha256sum] =3D "5fd04d9e306f1907bd13c6=
361b5c6bfc7b3b3c095ed3f8a9246390f8dbdee129"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] =3D "990065f2fe63003fe337b932cfb5e=
3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] =3D "bb0e353e6a2fbdc176932bbaab49=
3762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] =3D "47b807c72e1bac69382b3a6fb3dbe8e=
a4c0ed87ff5629b8685ae6b9a611028fe"
+SRC_URI[wasm-bindgen-0.2.128.sha256sum] =3D "aecb87a33d3b0c5e3b7aa46336eaf=
486cffafbd281b195e4c8b80d50df2351bf"
+SRC_URI[wasm-bindgen-macro-0.2.128.sha256sum] =3D "a690d511e3c1a8b3a55e335=
11e3c2c00c78415cd23650f32b808627f5696b9ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.128.sha256sum] =3D "411e4887f0071ef=
2d2164a9d5fdf2d20efbef78fccd3a78b0c10a1dc5295e48a"
+SRC_URI[wasm-bindgen-shared-0.2.128.sha256sum] =3D "81941cd78d0c92026c33e5=
e01312845a4cb1e9af3407f9134b100dd03144103e"
 SRC_URI[win-crypto-ng-0.5.1.sha256sum] =3D "99abfb435a71e54ab2971d8d8c32f1=
a7e006cdbf527f71743b1d45b93517bb92"
 SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -512,25 +564,23 @@ SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e5=
7f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-result-0.4.1.sha256sum] =3D "7781fa89eaf60850ac3d2da7af8e5=
242a5ea78d1a11c49bf2910bb5a73853eb5"
 SRC_URI[windows-strings-0.5.1.sha256sum] =3D "7837d08f69c77cf6b07689544538=
e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[winnow-1.0.4.sha256sum] =3D "23b97319f7b8343df12cc98938e5c3eb43606=
4524c8d2b4e30a1d3a36eecdf81"
 SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de764d=
abcc06133f7f1d55dce5cdc070ad7fe59"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D "d7249219f66ced02969388cf2bb044a=
09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] =3D "ea61de684c3ea68cb082b7a885=
08a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] =3D "b7c566e0f4b284dd6561c786d9=
cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] =3D "0c0f9bfd77e6a48eccf5=
1359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] =3D "9d66ea20e9553b30172b5e831994=
e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] =3D "ecc8ac4bc1dc3381b7f59c34f00b67e=
18f910c2c0f50015669dde7def656a736"
-SRC_URI[writeable-0.6.3.sha256sum] =3D "1ffae5123b2d3fc086436f8834ae3ab053=
a283cfac8fe0a0b8eaae044768a4c4"
+SRC_URI[writeable-0.6.4.sha256sum] =3D "3ad82d2a33cdc9674dc7465672f271e096=
168fcdbe0f799d9e6db8c5892679dc"
+SRC_URI[wyz-0.5.1.sha256sum] =3D "05f360fc0b24296329c78fda852a1e9ae82de9cf=
7b27dae4b7f62f118f77b9ed"
 SRC_URI[x25519-dalek-2.0.1.sha256sum] =3D "c7e468321c81fb07fa7f4c636c3972b=
9100f0346e5b6a9f2bd0603a52f7ed277"
-SRC_URI[xxhash-rust-0.8.15.sha256sum] =3D "fdd20c5420375476fbd4394763288da=
7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[yoke-0.8.2.sha256sum] =3D "abe8c5fda708d9ca3df187cae8bfb9ceda00dd9=
6231bed36e445a1a48e66f9ca"
+SRC_URI[xxhash-rust-0.8.18.sha256sum] =3D "aee1b19627c7c60102ab80d3a9cbe18=
de90bfe03bfa6c3715447681f0e8c8af6"
+SRC_URI[yoke-0.8.3.sha256sum] =3D "709fe23a0424b6a435d82152b1bd3fdfb083348=
7d5fa90d05d42762a9891fef5"
 SRC_URI[yoke-derive-0.8.2.sha256sum] =3D "de844c262c8848816172cef550288e7d=
c6c7b7814b4ee56b3e1553f275f1858e"
-SRC_URI[zerocopy-0.8.48.sha256sum] =3D "eed437bf9d6692032087e337407a86f04c=
d8d6a16a37199ed57949d415bd68e9"
-SRC_URI[zerocopy-derive-0.8.48.sha256sum] =3D "70e3cd084b1788766f53af483dd=
21f93881ff30d7320490ec3ef7526d203bad4"
-SRC_URI[zerofrom-0.1.7.sha256sum] =3D "69faa1f2a1ea75661980b013019ed6687ed=
0e83d069bc1114e2cc74c6c04c4df"
+SRC_URI[zerocopy-0.7.35.sha256sum] =3D "1b9b4fd18abc82b8136838da5d50bae7bd=
ea537c574d8dc1a34ed098d6c166f0"
+SRC_URI[zerocopy-0.8.56.sha256sum] =3D "556764e583adb45a9f8d413c2a147fa7e8=
d821e48e12b14fd560b607998b75eb"
+SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D "fa4f8080344d4671fb4e831a13a=
d1e68092748387dfc4f55e356242fae12ce3e"
+SRC_URI[zerocopy-derive-0.8.56.sha256sum] =3D "f2ab42fc20575779bd240faa45f=
94a74256f755c0fa9e89f0ede20d91d0cdfc1"
+SRC_URI[zerofrom-0.1.8.sha256sum] =3D "0ec05a11813ea801ff6d75110ad09cd0824=
ddba17dfe17128ea0d5f68e6c5272"
 SRC_URI[zerofrom-derive-0.1.7.sha256sum] =3D "11532158c46691caf0f2593ea835=
8fed6bbf68a0315e80aae9bd41fbade684a1"
-SRC_URI[zeroize-1.8.2.sha256sum] =3D "b97154e67e32c85465826e8bcc1c59429aaa=
f107c1e4a9e53c8d8ccd5eff88d0"
-SRC_URI[zeroize_derive-1.4.3.sha256sum] =3D "85a5b4158499876c763cb03bc4e49=
185d3cccbabb15b33c627f7884f43db852e"
-SRC_URI[zerotrie-0.2.4.sha256sum] =3D "0f9152d31db0792fa83f70fb2f83148effb=
5c1f5b8c7686c3459e361d9bc20bf"
-SRC_URI[zerovec-0.11.6.sha256sum] =3D "90f911cbc359ab6af17377d242225f4d751=
19aec87ea711a880987b18cd7b239"
-SRC_URI[zerovec-derive-0.11.3.sha256sum] =3D "625dc425cab0dca6dc3c3319506e=
6593dcb08a9f387ea3b284dbd52a92c40555"
-SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff8926392=
31befc6a1b58d29fff4c2cabaa"
+SRC_URI[zeroize-1.9.0.sha256sum] =3D "e13c156562582aa81c60cb29407084cdb54c=
4164760106ab78e6c5b0858cf64e"
+SRC_URI[zeroize_derive-1.5.0.sha256sum] =3D "3c50655cbb0fe3fc43170059e702f=
1ce5e19b84cec58dc87b037a09935c2f328"
+SRC_URI[zerotrie-0.2.5.sha256sum] =3D "4ea269c3bd32f0a32c321907a2ae912ba6f=
4649bb0fc764a15627e99a7095a3f"
+SRC_URI[zerovec-0.11.8.sha256sum] =3D "bb0464e17806c1d976d5cba29399c7f08e5=
16e279e2ba493f63123b5fca67dd8"
+SRC_URI[zerovec-derive-0.11.6.sha256sum] =3D "34df6fc39dbd26ddc9c10e6a2984=
476e13acce22e64e4487636ef494369225da"
+SRC_URI[zmij-1.0.23.sha256sum] =3D "29666d0abbfad1e3dc4dcf6144730dd3a3ab22=
5bbbdac83319345b1b44ccfc1b"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb b/meta=
/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
similarity index 90%
rename from meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
rename to meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
index 0251b0b92c2..a91a952f261 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
@@ -10,13 +10,16 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0ff5ff7=
747cf7d394079c6ae87f5f0c"
=20
 DEPENDS =3D "openssl"
=20
+# openssl-sys now runs bindgen, which needs libclang and its headers.
+DEPENDS +=3D "clang-native"
+
 inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
=20
 SRC_URI =3D "git://github.com/rpm-software-management/rpm-sequoia.git;prot=
ocol=3Dhttps;branch=3Dmain;tag=3Dv${PV} \
            file://0001-Use-optional-env-vars-to-force-runtime-paths-in-tes=
t.patch \
            file://run-ptest \
 "
-SRCREV =3D "401dbd9ae2eca087a82b7c15c0379f878aea02da"
+SRCREV =3D "8e0b76e1e75c83d7d8e6f38976b0c83b52ebe7ee"
=20
 require ${BPN}-crates.inc
=20
@@ -28,6 +31,10 @@ do_compile:prepend () {
 	# but the target directory does not exist there.
 	mkdir -p ${S}/target/${BUILD_DIR}
=20
+	# openssl-sys runs bindgen, which needs the native clang (like bindgen-cl=
i).
+	export CLANG_PATH=3D"${STAGING_BINDIR_NATIVE}/clang"
+	export LIBCLANG_PATH=3D"${STAGING_LIBDIR_NATIVE}"
+
 	# From rpm-sequoia's README.md:
 	#
 	# We also set two environment variables when calling `cargo build`:
