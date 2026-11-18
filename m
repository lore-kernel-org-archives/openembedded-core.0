Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.447.1795018919893809780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lrymlafr;
 spf=pass (domain: est.tech, ip: 52.101.66.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8RetKBJs0QcSH5Eu1Ppr0FI2mtNRe+mQpeAiJ8OtSRp8S8F1BZMB0PtJ/6Mf+zsyS6tZGjCtci17XcnN6f+OMAKA49b+NO+eEJoITfTtz9s8tcG9xw8Op5UeYlksx+m2IbgZK41ITAGaWQ0emM2RAGjOCqco6+hwaqvXVp2JkhEuhZ2LZxoBNGe4S/vy9ykqEEPwksNc2UXZZX4qTeuW3UJf+/eIUKSSpGIsm53a+utH+qMxqrHLLanAtJraiVlI4JpBWA5mxRO0v56Htw4gQ/RgCGMlmzao2SD72P1glgHhEk6qFOfoqnqfyk57+nTbrE4JGBuly3K82MFRDP84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE3x7jlOj5k0opCgi1E3QNj1yavjiZ0WN2Is9LZ/1HA=;
 b=ALcf/Xb3XGWicY4z1CVc7KYFLFrO6BBuApxt9NR5/I5Sr1MRN3QiiVtZ8HisOxKoNMEvsWtDElwg9QOvoRm59QyTm/90iKVDQy7UcnktB5ED2cCieHND2KRIydcWllNCEIAF238aAxq8MRzvPCwG2ywmRt9As1PznvVCRGyeHFZA5b75R+WBnQgEDHEWPfSfaTCIBEWXv5sDCQKWAIVRIwy9GSkfA+ua7uBDQ3LGJXbQv2CO5VQvsbG1FNCTdffzi9ClAcyszn2ZFXrNNBFVWv/3QwIr6qw6TCH2GI7XMgG+x+x/i5uU9GcKCBtWVpnTGJx3QEMzj88ioV6irjSDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE3x7jlOj5k0opCgi1E3QNj1yavjiZ0WN2Is9LZ/1HA=;
 b=lrymlafrWd0tgAs5LeW5y3A+kPAhCzrfXr23ZjjF/gx9IAo7FTwZgSFQ4cVZSzB6zDavphW3da5L0RZB3At80VFLP1kLN7QXRPEMpA5Lin2N81Da4iCIrVM/SRDfyM4Sa4ZgK+X+StJx+xIK+csrAMN/iY1lZGVaFFiIKTAaEOfCdP5DVvE/VMVWJQCQRhoDL1HyJodI4D9C36ebMNm+m3J0t4EBZqABhiKHyesxvG4rva6N+VLMOco2EnEA/ZbxcrNdoxB+9FtBQs5FUgzNb6o1Fx6I/32jMVX+LD7hdhQ1wzt0ciTgvpSfFdEP7yqzZicQW0uqqPzz+rUr52NKzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0935.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:165::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:21:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:21:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/3] binutils: Patch CVE-2026-91781
Date: Wed, 18 Nov 2026 17:21:51 +0100
Message-ID: <20261118162153.25025-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
References: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0138.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0935:EE_
X-MS-Office365-Filtering-Correlation-Id: 94802e0d-0ff0-44f3-3da4-08df45901045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|13003099007|260925022911599003|11063799006|260925021911599003|56012099006|10067099003|260925021311599003|261102123227099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: KXuiSZPm9j6iY07x5ArDnClEmzMcm+yK7Lm4oc2lLlBonfR2vPzsiXSh2IRfFdhcbbo/AVjuHcIRZMCnyLQsqYuUk9DV/VYmU3Q39wDHMszdxLzNz/nf+n6yk16tKgP2OasAF6l2JBNzf47Zqwbx6Y1afWaO4Px/Npzflx2YHzZy4PIJyIf+c/OzwV4NI55Uww6yPBmMmloaSyPB/fgldpygmwqq2ahXPp25BoKKgvs9UY+AQYRLut2qiBDK8dPaLlRgCwf11PEQkVH3624/UYyd8lBGVed0LJhbUfbe7c2Wg4Jq7zgkYpqyHC3ixscqx+wXGiYk4C3LXjrqnqEXw0QumMPJpDgcUPJerd4mQkYJZ2O/Sb6ReiWq9H5Sx6J7qYFQOghJyJX/ULTGNIA/YEtGNG+cA6QSQ+aqPplgtaR+Xh9H3hlxKcoTXu50lAbj4WvDUSo84VS/qakylWEJ3SAxlXvw7yjdTHqg5ITtq3Y7kbaHBUzwjc+2IhgDvvLRQXObYqC+bv6gaDuCBUhKB+ZQ7c8RyMa3fGbLopojMcaCKuJ+bDf72eND9D0aOxyGlj44yrXhzuSW4+bBG8oGJsrZx0BJgOjViFb6GX27Ap67dnh7NlTm3HNXedYK5iTT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(13003099007)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(10067099003)(260925021311599003)(261102123227099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pdsHWECeBKjc9lyVAS1cszYl3Kk4+MG8ZyXnbmgxusNbIHucUBwI22RI1XxW?=
 =?us-ascii?Q?L5GtZyvShedTurGautbxJ1cm3Vhc1bmBssfPo7JM8qKrfTXMTe77t/bXT0EK?=
 =?us-ascii?Q?wULWdP+geoMYXp2FOVSde9X81YL+ylFGHEYjgsrWEThBR3ZPf3XDo79+ZyZ3?=
 =?us-ascii?Q?0ebtdOoGyZL/aBabXnk4wyOgJ4T+o3FNTCsqTh/BSwdfQB6O2MzBG+CSTKyn?=
 =?us-ascii?Q?6UXXE5ZlLaD3R2la+7nZ4Ar8x/8yC4i4wguuPhdpDLnWdTXgEbfvc+wUoF51?=
 =?us-ascii?Q?H3uj95SKakVVsrD2pUtLu45SmUpYIOJI6hP7i6Wagv3nrMNz61lmFSiStOew?=
 =?us-ascii?Q?nM8V6HI+3+CSQTaIe5/uTgs+h7QoyAZvg/imHoWsW9kQpegLiC9Lsbgxm3Up?=
 =?us-ascii?Q?4ZFw4whYx2Z16YEaTieVgTxaEYt1nF5FuCbUqHFLYl/OjgS5gEIaraemS4HH?=
 =?us-ascii?Q?31W29nU7wGCoI9bxUMPZ5cZ1vA/cLHx20fnHv9wxHem4urBhbkKdcJ3Usg1s?=
 =?us-ascii?Q?N2xdUAR4ZV2pEFAmIb+VP6STZ4WhVFA9b9vHQtRv4CjvV13ZHnl+PCqSlUvo?=
 =?us-ascii?Q?uV12L/deJLAzfa2ce9XN9TnfTF5pYiH7XjyRs+dZBLCGQUntvAAPmXGOMYZo?=
 =?us-ascii?Q?w3bqoqJfbs9nu4tGlUEUgxk6dvkYKU2/AcQlbfhFSNd1Cu3EDc71V7Mh4I9I?=
 =?us-ascii?Q?0B92cJxiwt4J7fQcbjF5wZYB4JIfwW2HP7VPLZnaTL3nTbzq8lc4/XGeKjtc?=
 =?us-ascii?Q?FPVU1XI6GqEFyCCYWsqCqASI+HiR+gPZDSZ0feF2DsMQrHhPSXBd0hXyBNBK?=
 =?us-ascii?Q?ZQ2dQwsBb7Lsmf1mSRYR9Y4fvC7eddFwFbktzkkgIpWOI9geDkM6b6Pk9jNt?=
 =?us-ascii?Q?U5L2kjZtTa6KTbRZGSLvRCxElRC72uSoTrGWp7FU8UlljAlDxcYLXEygmVox?=
 =?us-ascii?Q?R4czP3KFMaOJCkRGvIlla89oY2m+ZHOV3Cpm3B4v/QOt2iTZrToJVlJtawLC?=
 =?us-ascii?Q?1RXJ8723mGkFTmX47Kw9e4oDodVm+Fmb3vNZc+oK3eevW3IuerbRmvOhwBrO?=
 =?us-ascii?Q?zEKKV23xzaJLMh3x8LeIVVR+sPKtx+wlHzt7aZikPsr9vfyCkAZLqJ6r96MN?=
 =?us-ascii?Q?QzHjEWPMIPiB81HIakIMtLx2L5N0cAsRKlUBzqqnEXpLtFP6gae9C6rvpq65?=
 =?us-ascii?Q?hdfy0oyXZy5UnBwRbqmIMRPJuFlcGwNgATUOMYxoNpYUStsV08N4+CS6WC/q?=
 =?us-ascii?Q?u+b9Tj+e3k24FhEGYr+7Uhr7LFGENvmGWR2okC6lbSMj+SyLXBxDGbc6a+zZ?=
 =?us-ascii?Q?5jQiUbDc4z1Zs356y8j1NuJOnITZ5kuYOmTMnw6MkYrYjODjmJneOXMlQYdo?=
 =?us-ascii?Q?e8M3XNqG1WnyvpMdP1ff8s/ZDVaFYuT7ZWC+Jdu+vkCNh0fP1O7FZDiOt2tD?=
 =?us-ascii?Q?JgJVkXmgfSAn0siDpoEIer//v1BXumQSgH8VoDmQ8FFHzr8WmQvCoQBSOCd2?=
 =?us-ascii?Q?3wdf66YRwtxR4EerO/Yt7BmwCNhDErym6moYDB1uzr7fUUIxOPBEX6KJcSx3?=
 =?us-ascii?Q?pE+bbI/5f9XWL2SCx2GihNMbLhDtWehfj/Rr8GsEoBcMBPovLCDqNH75u78Y?=
 =?us-ascii?Q?isbXmcEtLhxHl5K9hRhdeXRhKqC3iKry4lhmR/eSDs/6gG7osZnYblkyb61T?=
 =?us-ascii?Q?VgIRyxxlLYjbOSKZ70GJiOxnj0zci765FSDY471oiGSPGCAYNN+sGDcsUrgo?=
 =?us-ascii?Q?+LGRd91scg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 94802e0d-0ff0-44f3-3da4-08df45901045
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:21:56.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NydfxASjAHGyZTYrC/xDIT9jSuXt+tAYgflTj0uPLNhhVpcOKqWVUdlVJqm8gJvCT5qyTmLvFUM6dFY9oMfoG61W0Cu332UAKAB/K4NSZN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250570
Content-Type: text/plain; charset="utf-8"

NVD[1] lists only 2.47, but PoC ([3], attachment 16881) reproduces the SEGV=
 on 2.42 and 2.46 too.
So, backported fix from [2] to 2.42

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-91781
[2] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7322e9bc=
30cb282575a701c307851fd3d66fee68
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34449

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-91781.patch    | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 37dce2cb3e..7e91b7fe57 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -84,5 +84,6 @@ SRC_URI =3D "\
      file://CVE-2026-18220.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
      file://CVE-2026-4647.patch \
+     file://CVE-2026-91781.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch
new file mode 100644
index 0000000000..ff14147097
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
