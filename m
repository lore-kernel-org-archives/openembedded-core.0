Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19054.1795531218039474643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 06:40:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hxLc+qKI;
 spf=pass (domain: est.tech, ip: 52.101.84.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9KNVehmXyot/npqADHdRT32HYdfghNu6e36A8p/py+NJFiMEDGbwj9DDH4neqtnOGtpg6dLojmIEcBRAFYqhF5W5ghIGPjs2weBG9UqhTo6+NVlKh0xnAxD25CSt270SNbwHKtaL+pPZAQjSysHFLpgSDrnkm+FSAO/odFl00dOTqrGkL6pNFJKOUIIk7Pcwib1PBox8LmZVYq5tcec3Xgwlm+DJEDajbfaFUMlWhk1nYOKN3rHDIj4k3NbuP457eqN1qU6jxO4pekBvNTIS48uerALPbOISf27ggBM/zLdxDqceh293E+NdLqOhm4gfa/S1+mHKr/lScCF0bYcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA7OGfX/raun4VUC6x2M9wWoNvVHxKtii056VjS2uqA=;
 b=YxpPf/xSfVlX0jTiUekRaE35Vbycd/YaWldfVTEB0z8wLu+Z3jZs7jUN2rDicEynCIv+tHRpEVub6Pd2GKj/vNcVqUIsdnlN9VSpQSO4jtAdQhc1hGxnTSbtWqBx3j1iOCK9304xz2j4gDLdeJeFRzzXmkTUyPcmk9ErZVg5WJVxtJ3i1RJ10vjofBTITSr6fKQ1twMo/A1+zdwc1wkcxShMVMgJKuWYI7zrPRKbjG32CYSth16vctlbBn93D9axoYOujzb45LgrpVbCcoA7bWxWt8Fj52FI8JAGolRim7RQOP0dtq0uQCoWbq/ixT2BcgdNlGb9M2cceeP83oTJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA7OGfX/raun4VUC6x2M9wWoNvVHxKtii056VjS2uqA=;
 b=hxLc+qKIenLN2buIFXo5wqRADBDQhU+q0Zh//pt1Q+Qq3GR8b0Jbtl9foOGgLqUpaMJT2vhsbx8GljQ6l8r7/p4kcjaQ1oHIpPGWIRyQyjPGpToG2rPH9mHxqHja6RZrNIYx/OaA5tRIK42H88WB7ss2xU8UeBa3wIlz47XtLRlnnYMcC7V98JkDeP0di0fd9b5e+tEXR+urgt8ypBBC/VCKDanROWNoyeKroRM8SSgo0a1l/DKcCcYr4/tETOrn7C07df9gUzM8uTDGfyxndla5tG1PYwSWXzRT+ZiY5i3n22kO9Q4o8QoZ6vP+5+rtqkh8X/ioVrViPxYwnMdIwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB2651.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:24c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:40:14 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:40:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [blacksail][PATCH 1/3] binutils: Patch CVE-2026-91781
Date: Tue, 24 Nov 2026 15:40:08 +0100
Message-ID: <20261124144010.72865-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
References: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB2651:EE_
X-MS-Office365-Filtering-Correlation-Id: 0335d52d-5d54-44d4-f5bc-08df4a38d9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|261021123027099003|261009223027099003|260925021911599003|11063799006|56012099006|260925021311599003|260925022911599003|261021121427099003|261022075727099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: yEu/aRg+8OSbdl5d85PuHGhdET2s/D0unzgFfrpZHcwVgBdH3MfinzbqK0UuSxLsnyVVzpGotQxtAbi11MvwL60x/2PibNZNDNB18vCMnvNf34W4820ugiV46FSSt96SekdcVf27Cwj3erMSqvs7GDDZLrN8NweEsu2rcQm38mevpQ3OvZRlPKFRj9npI/Qv8KyNahS1CVP0zUXas+++t6gWkxwylrhs4sHUmhSDuepffhr6/NkFhYQ858TZJVIvi2+Xj6qkPRDZ20/JGKLZktsJxsDOTluDS+aoIyOrYPAD+FaFNPHrsVxMSSs/hVAZqalHPnfNTdBksKeWynXUw1os3TO1Zw1YmWWlhVVYhE7MIZDdZP66Sj2dc43IApFoKvHEVpXnQBUqrEncEeOkkJwkM/iDLBsO3EWOnnWnZ2RGHWHJhZX862xZ6pdb0/CfRil3O0pL293LN25hnBHcM/WOPLSg3A7QNKM0uUGPCF6GO7I35Rq+FNI9aHBqJMNtG180k4rgT8q1MwvkpaEsmB3W0bk/sEqpSk0W9w+raAvhsH3St/3vGS+EBikiFDioPpzYAv2aJeee2RxIE2imGlqEjDMGJWdhTIK8r/OsgLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(261021123027099003)(261009223027099003)(260925021911599003)(11063799006)(56012099006)(260925021311599003)(260925022911599003)(261021121427099003)(261022075727099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePxXHS33dVVeNr/j6K20DbO+/vL1Otop775aQ9zM5h0apev+OmG2RDsZ2F1v?=
 =?us-ascii?Q?fY9dPG7Q9WH8G1y7Uw/lmMx+r20nV4C5+9L/K50xBWHkeyaPErWHV5JqCXIH?=
 =?us-ascii?Q?zTX2MAEFixDgq6ocAdnI8UC2NUNcvEHo/kH8/LHLBQkSDZORkoclFv7kYtH4?=
 =?us-ascii?Q?8BRznCG8ZY0cBXeniqtlcKiKcDpopdgNiOZu13JK074H/XITEU+6O0ryCo0b?=
 =?us-ascii?Q?6lZSdz6hFFOqpL42OTmyuN/23tT2bQLSgw69ZyeGSCuESenPr4MhNHuU9LfX?=
 =?us-ascii?Q?Pj2JoPd9raDjM0CLIKi354ypBvQOJRMwkemwLzHDqihFjcPCmeXZLMeW9rMJ?=
 =?us-ascii?Q?XcFWgAi7qRmfpcXBv1Ccy1Q3JAmIs5ZvhwXkI5OhjqlK6i0UWdYufIdwXb3D?=
 =?us-ascii?Q?ZgSlDUSE28rwSi6UPGlYP1QK/BfOE5P5MV4uz5ufLBSOtn6dPwA+E3nD37Wu?=
 =?us-ascii?Q?U+9pk0GFn4W4CzA2+hOZZR0oFTphvhcdTeOGG5fFcOo+sVZijKCarmSs6jEn?=
 =?us-ascii?Q?s7iiVg29C3SvDDAx7gggWj0NoBe6FYp7aulVq8hOvv+EkmHLh/dzJEGPFkuL?=
 =?us-ascii?Q?qOwgclU+mvyANY+UpTuQdGru7gxn5WzC9LY2i/bCjTLoNZUsoXS/9YxuFb5j?=
 =?us-ascii?Q?+q4HhzdIF3K/cb1GRBw81Vml8oXv2k/6pccOp9vxFGiTaV8tGy4+YqE3pvmn?=
 =?us-ascii?Q?/FxVBHgcEYgp+oSMwUGAOSZQxNj4o0ZA+HyDSGxbOEmgHpnaUnMgCLGib5fM?=
 =?us-ascii?Q?acgtmtkL2jK9CeiEKIDAtFyB//wNw7DnC4611KTrBJWt4TVEunO3HJFMPywr?=
 =?us-ascii?Q?c0ELhgKuVdzI5HBmuSJcXFic6pgVxLq9D/sRvaLs2+YeqNWHnK1NUY/3YdzI?=
 =?us-ascii?Q?6qKWzgWn6CF6bfbH8kXsXmQhdg9qT4HIdOrp9ZZS6xBC4pdlK/xzRmbeVG3O?=
 =?us-ascii?Q?dWzOj1n9o1Ym5lVVwAhhEEtCxmi7TUpePI4L9YrETIDFg2crj29czfON3qfT?=
 =?us-ascii?Q?0s2ZjHqmzCdko+CvISX0mv8B2CPJoEtO07qrRZzJ71RmIXCsr73i7npXZRR3?=
 =?us-ascii?Q?3FXGsEBl0ClSKmcMTcs84njCjZHAbx5gkCqkvudLsY/Iw//GeKs8LWY7N2On?=
 =?us-ascii?Q?sLrrQi603CuwT7t3SHwAi4lw7RyycSUYbq0aic/EoaKXTI5KmqB2u9DL7GxC?=
 =?us-ascii?Q?5IMphwmvmak2XRKHMDL5FSMnRUN+1jlrk+IxNLhEOfP+G2CIfoEM4fQLmavK?=
 =?us-ascii?Q?xATtja60BPWl3vV9UEf79vS/Y5wIcKXmrZnYlr2WoM5jEZ8rf0UPIhQV6J+N?=
 =?us-ascii?Q?2iZdUjXdXhTi6OuJ47XSbBKbW6VWHcd+I82Chc6C9+3BFZRIMAPxB+i7/BbO?=
 =?us-ascii?Q?uF3aYE93sEpeHhxIfgbNDuMB+4oCJF8Y2K7KlULKhqq96ygTHuM4UcWaqQnD?=
 =?us-ascii?Q?kmnB3dEKXlJTH8y6n4Z0JXVuDJnz3cHAgAfdCrF0th5kvw7J/Pu83D/zAfgi?=
 =?us-ascii?Q?YP3iCJ6ba/eQwrlt3r6t3Iro+NsnWqUlqznKI87cYJaHu97hT47IEeiWLvYy?=
 =?us-ascii?Q?NJ6rWZOef8zpa4qmr5aAltxS0VtgJmaS/qtpivh1ktsaCExXEIqKwEObyatM?=
 =?us-ascii?Q?FqBLwaqYVb3LVZK9BhXvv6ryMkoNOb7tBFw0Di/V7NyfVazoy96sTvK5V/VH?=
 =?us-ascii?Q?Wuz1EHGt6fFiAZIQV1ShIJ7aQStZaacRD76gsd8I30nG9vaYH2S8bMJzAwWD?=
 =?us-ascii?Q?zyEp9vgKUw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0335d52d-5d54-44d4-f5bc-08df4a38d9cf
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:40:14.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSUJZUxS9oPjtbp5+W0kj6/+zoB8QpqFWGeAs+HxXFseGQkchtF+tC3DDHW39TbbdWsuj30FKErPpcWCMyOWvxYoJTfMMpfFgrsFpuEw6qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251037
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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67974995c69f5502c423ae3c1b0c2ae3cd29d7ea)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.47.inc                |  1 +
 .../binutils/binutils/CVE-2026-91781.patch    | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipe=
s-devtools/binutils/binutils-2.47.inc
index b66d9110fd..5b57380a48 100644
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
