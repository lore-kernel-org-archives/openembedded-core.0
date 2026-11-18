Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14963.1795015219320867461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=x3jvg8/O;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9wWHnaPX108cIOVIwZO5SWBZJYeHNYyX4N8dJu9DWeUhqyy8PzrSPkKvPtc1XaIIc5lAzxaBE1GLtoz1uhMplW4tjZVXwWSlKLiTSVNl0kYkJQo1n/WpWGng9xAZugpYFcjCOyHpenVSlPM5W35kPl/19E6M+Q6yaRTDSEfM+he3gwei1lf9mBZi/hZAhhwRD1ShWFkYr9uBEJsRoIVT3vBGQR74cM1apJDU2KKtxk6MXc69jHkjdsGhENLKhOp6hVGw306P0XUzz1Ui7kMBP+u4P/8NPdjQFTq/gGSru6wb/uSZ11K/yAZKhsCRLUAqL8gTkuK94Pi1dEeMTItZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcYbJ7Mc7RGU5ylwYKN24Rn6l9PzBTN9/vRmLdh6EqI=;
 b=aRjFcyGFRKfqykcBU9SbdOJPgHcYGXTr1AAh5p1e1qHEewCnje5maSkYsWKEVCfcOQ3W5Ev5kwymF3oS2JrMJjKQVs36l+UtG2+nChour6dxWqBVor7ugFSSoymoENg9/+3DkEGdtzKZ5EURZd/0Pb6noP9Ft6AVAqHK40OprLW2wocS5Wbb9WuZByVH3Dh6TFjwEgF2Ujl+2sEUvnxJLJdVT5WB7SkGkef+0F1gDJq4L3eMYtDVP9B4p4hFiSz4bAfpq9JVwZOGiiqPgqozi09sjse+LT6IAuhNVRwlk7iF2tr1kBWkDfUbDOH4AvLmO8piHIXtAEYdXqApN+CsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcYbJ7Mc7RGU5ylwYKN24Rn6l9PzBTN9/vRmLdh6EqI=;
 b=x3jvg8/OXcSWHAB94Kfzb6pLoAyN6ixhdTMev7qaBA9tpyX19WuBriNoJuSL98tGxZskSPX6P2wp7CBONWqx8JT/gJRFgKR+Iy/585n40mYC78qibmE/bVfjBNYNs2RUa9K5OQplaAGDqL/Iul44wtsQEXK8NbP6vcofds6scjeUMxZQ3UdpMcEL97A7zWGl2HR0VieTH4pUcTh/JCkoLROPJWaeHEzIsYiIT/HsQUdGqznq0j9I1S6ikGBTo9s05E0pui87kAXDP0c3Qvy9EQ8MuFLEu77tgSGkmOQBmHCABBvf4FkTq0iaVyDn5NFAUn8f3EzEgzgs4R0Sem6ltg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:20:15 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:20:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] binutils: Patch CVE-2026-91781
Date: Wed, 18 Nov 2026 16:20:09 +0100
Message-ID: <20261118152011.24213-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118152011.24213-1-jaipaul.cheernam@est.tech>
References: <20261118152011.24213-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0579.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa5c5e3-87be-4adb-cc7a-08df45877247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|22082099003|13003099007|261022075727099003|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: nbB49dKS8r+fotAnJ9qzsVjsQFPL804T56Uv0mrbDQrG9Qod+iVlRfDXfOlf3G69UpkAtuvU5iMI/IZtiE+2a5VvCh6zqvuiSt6lU9VfJ+GN8eEpRCrRoVnZXDglK+BrdK+LGZZb1M37usodfMXhUdwaHQqwjaxttH9dMkGSkrrplEftLfRv2z46V6cIk1XqQx1kasFncdgb2abwEfSFp+YYChD/NzfOCKcLEX4tBaH7KbxWSYXmSM56atIfOn8UqVVMIY0hLTUOxEsuftMPdq1eoDT9VS4CmJ7emauRb42xLM6eN1LYzYjNoOgA0dCoaCLDRxRREI/U1fEwGeUFrYZk5v6SlwmUXSXIEkSHEBrpb2l4Cz8lEXUUV9UereVsQE05cIJkxXxMPD7IGHzukUYx4ijQOKM2opWOggaTQkezJZqQ4JzOfZ0523PimAA4m1NpeEullbpQAMjrFwlq6cU5V6cjXX/+tFuetgwbU4+QReJOKCYDDoR9Ob+doAz6jqQmaOYsUxgmbHau39oE4i/jPF7gtzPivU5/WwCe+ItcH6IIfhkca6yI7VBAuZtmbR1srue+Q8gI2+Ym1IVFyGSZEaSC3mAtD1FZmOEvrdejiUBRwdqO6knupqQNCbd7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(22082099003)(13003099007)(261022075727099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NNytBYnQMCjZT+ljR8dTYb2/f8K6jSaX9lN9uGswWnt79oWJHjEyMkvRw9HM?=
 =?us-ascii?Q?ttBH58zECFr6EibQNxo9kJSbFBf2iG9tliJm8EU1uZv7Y/iF0WUKVXkxRsgO?=
 =?us-ascii?Q?i4zJB8qTuyDqoOJfCttF9+pxyXXDgcyQ5a86zOVImZvn/U4ROgJyJaMr4I2L?=
 =?us-ascii?Q?6P1b0nlj/X+cO6JvDtuH9ki88U3oEI4Ni8P9et9UT+Gq5qwvBwsvFewzZrQ5?=
 =?us-ascii?Q?af/yvvH9q9soZbj9vSvgqEAum8HgYhHoC1MkVQOcBV0laexOJmbNA8fveS7D?=
 =?us-ascii?Q?7ES4g1WWnqXF+chN6GpNsRZCSEX/mhKOF6v3tYpyxHSkbOdVlNnuNTsbZZBO?=
 =?us-ascii?Q?kax5OIv0CLXtgywe9dgFwcOr9i0b6yxWoer652RLcMAJTKjZAaLMAH0UXmLv?=
 =?us-ascii?Q?R3nsDjhxUrZ4SiVbZ1s25fxQvK5Pe6pFEi6Q3rcSHIYWBbkpZ+9UDq+ZtmsU?=
 =?us-ascii?Q?X04f2YxopAdZCnUrfX0m1muMQZW9lKvQcL5gJyGk4t29s403gd8UFQoHcLjo?=
 =?us-ascii?Q?n9bok83znX0id59i0bd68mTXxv8+mrI0lhjIQTJQVO809j4Bpx4rUO71khII?=
 =?us-ascii?Q?VqxytH2X4mnMC53fouEmhPJIOA7fc7hFwUFv5vu17uHBuFqk7qHzguhyRbkE?=
 =?us-ascii?Q?q699i2xE8LtNwboKo+ml65cWlFK0EMq1/YV+oZ75QpvL/aMgF1wCqWkA2Kde?=
 =?us-ascii?Q?O9SpHurFiv6YzOoEHWEVzLr2dKIRveyJva2DsPeErCh/gqH25ia7f6IZHtOR?=
 =?us-ascii?Q?i0Fxf3xgHSbDTtlh7sqduDKlrj2kGpmRHeWYFt+xWdlWexJicaTfpSMkG9m9?=
 =?us-ascii?Q?fKHU4yEc9Sh4bG89H1hXtLIwUIlVvKR6l6vqFELhZ6QYmtKK674AAwFW6bEF?=
 =?us-ascii?Q?Y91XOlIAs4ngUh/jAKsvrrql64ATgx2ZQ/v2NzrTLbbqHctNXrdGmE42Qr0d?=
 =?us-ascii?Q?3PEBRIGAzfyt7a90iXHZHOjEx3NDlS4y0F9kePaAEXGc+UgAe57mJyI2k3eE?=
 =?us-ascii?Q?uRM+60i7ZF0E6+zIseQUEzjqoCFRUlzOopLoEOMPtaDsPbgNm0hrrRcX8i5f?=
 =?us-ascii?Q?5L+Szj6Cnu+uW3xazCEYsCx/PCQdUVOtg7DMBObRVU586ODFrYrAU5RGFa16?=
 =?us-ascii?Q?xaAhRP5SmuQMO5JrootZ5TDsUIFyc4VG1gwQKSQi0VOCGO2vjnO9ESHGa2Dc?=
 =?us-ascii?Q?4iFyvL4fJDRFpKEWvQk0ugQis+WxBnWqLJoJxU69sDgfjKNJ6x31TMdle3hj?=
 =?us-ascii?Q?Ubqxaw4x6her98SsZK0wSfaPf/RL6eMB0zUVBnvp4HZq4RgX4KiiW/7mljM5?=
 =?us-ascii?Q?3TRmN7a60WQxtJ0mw09FbWm4jZUwTjwP/QKD43PtZZqG7bZfgrrIKOibPquG?=
 =?us-ascii?Q?SAn3Lroe9VTxB1xUdRadeAwC1SncI5RDU8ie3SacQ5qAtAAIrsZjDZIsmW2N?=
 =?us-ascii?Q?1hl95JWWV3NmsRukRCW6fLld8lWgRSf505s2MPpS8zzORI58P0jDbQb38AeM?=
 =?us-ascii?Q?hKVPfl5/kfRZiLKfsEaKl+50vCgo3YwQgDxNxqQGP24H2zx8LdLdGPLWbibn?=
 =?us-ascii?Q?U+rV2QZettT7H7YULcnhXAO7V2sksPtfm+Ur/J4jwNLq5A9xkWhlMdiCjKrt?=
 =?us-ascii?Q?sooyn2zwlm9m3iit4FnIjbV8bl1r8lKhqQ+3Xxyh8lq6/T6ueUzPRky2Mz69?=
 =?us-ascii?Q?Te+zYY61OfBpdNoYjZQ47skZJxMfg/h7yMb4B9u5xRCw4uADbYgi+WhRPyvh?=
 =?us-ascii?Q?rTnXVMnEyw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa5c5e3-87be-4adb-cc7a-08df45877247
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:20:15.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zZXdyQK50NMTWPhxLhN9Jc7Q40TYwQku89sjEPdKwdqCm5PW+GmbED1v6jdK6z0UqUkRD9wAVNqNdqF1BQHRZ32aOkPluCsHfNlTbS8XYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250558
Content-Type: text/plain; charset="utf-8"

NVD[1] lists only 2.47, but PoC ([3], attachment 16881) reproduces the SEGV=
 on 2.42 and 2.46 too.
So, backported fix from [2] to 2.47

binutils-testsuite summary:

binutils: 336 tests passed, 0 expected failures, 5 untested, 7 unsupported.
gas: 2,098 tests passed, 0 expected failures, 0 untested, 4 unsupported.
ld: 2,710 tests passed, 59 expected failures, 4 untested, 339 unsupported.

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-91781
[2] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7322e9bc=
30cb282575a701c307851fd3d66fee68
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34449

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.47.inc                |  1 +
 .../binutils/binutils/CVE-2026-91781.patch    | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipe=
s-devtools/binutils/binutils-2.47.inc
index b66d9110fd2..5b57380a48a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -38,4 +38,5 @@ SRC_URI =3D "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patc=
h \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
+     file://CVE-2026-91781.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch
new file mode 100644
index 00000000000..ff14147097c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch
@@ -0,0 +1,36 @@
+From 03e5dab2f6f1b3ccc151722f189642614fa09f13 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 15:47:05 +0800
+Subject: [PATCH] x86-64: Return SHN_COMMON on non-ELF input
+
+elf_x86_64_common_definition segfaults on PE/x86-64 input.  Return
+SHN_COMMON on non-ELF input.  Linker now gets assertion fail at
+bfd/coffgen.c:575, instead of getting segfault.
+
+	PR ld/34449
+	* elf64-x86-64.c (elf_x86_64_common_definition): Return
+	SHN_COMMON on non-ELF input.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91781
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D7322e9bc30cb282575a701c307851fd3d66fee68]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf64-x86-64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index abf97b2dde5..0d1ef1d38bc 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5518,7 +5518,8 @@ elf_x86_64_common_definition (Elf_Internal_Sym *sym)
+ static unsigned int
+ elf_x86_64_common_section_index (asection *sec)
+ {
+-  if ((elf_section_flags (sec) & SHF_X86_64_LARGE) =3D=3D 0)
++  if (bfd_get_flavour (sec->owner) !=3D bfd_target_elf_flavour
++      || (elf_section_flags (sec) & SHF_X86_64_LARGE) =3D=3D 0)
+     return SHN_COMMON;
+   else
+     return SHN_X86_64_LCOMMON;
