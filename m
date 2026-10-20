Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1792488579382617804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SYptAcEh;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDdicD8IDhOoe6rWD/jtYM+cjrSSj7Ulezm8gQGanqwzVav5M5zl1yAl5vTmiJTXwz0YKD4tTcfI+OsV4sQGYiQfYe7vEMZ524tcYzDiNuEaAT3CppR6j22+778AhLMvEISq98vvQWYP7yg+ALUbxZKTdVr8rePZx22wBhWSL6dhfVV5eZFPMwQyXfqMU6qXkoFcyF54BVs53DD/epZVHLniXFuoXxFUNef9OQm5ZNs0DQxwJ1IPUs6l+XQnu/kW24TzWIlNEs13yaMCrCWpusRK3cJ+21ZzX9o1G7MSsUsF90LZMuM5XJIWPgPGuEs5XBckEASSjnjdvz4MbWk53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JdMkwIV8WoYgy/hhXafNnUpzSmjL5prtY9Oryznods=;
 b=m2J1/CfEo3fGHJN6UfePijWbZeqU7EdPUloe46QsZ8raS7pKUH2v4fpu6ULYYZCVg4bqM+nNVOfKnxz9jPZxNiX62vw5gekLjw03urfmfdLNKDzLL0ajJi57sAEYE1RMMOoLlQ45TPP/Fy0SH2mKv1dov0qobwy2E0HMJ0bh88E+I+6LvbJt22PQBzX6ORDalPY9/ZykE2Kohs5Rvk0Pc2AcgcfraJb7xBK1Qww/dFJIA7VImpkgi1fJqGXeRiN7v0hVKkW0jFQIPa7bFm4UnamuUW0cPj5b/hUN8fIC6s7Vq6lrCsh71UlOad0WbMUuZEWyLV/QH5eqEdaoiuC7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JdMkwIV8WoYgy/hhXafNnUpzSmjL5prtY9Oryznods=;
 b=SYptAcEhgdZNr1oiqZIyNTArPpztoip6OpymQKeEUwefJTVZcJ54AMqoKYsSSRTY8duYmMlMlxp7xNj2tRKy5kjccSyLAjY+Zwo9AV2XlB5xE+bOoBkW5Px2TvCF+twBfqtpGd7lqkodXhwReNPWdIBBdIg8HahICsIniibU273nS1L9VlBMvRncKhFH+jKlhXHcY7zsF4FzPQ27EXHwLETsy0hNLqTSHO8iNK8w+kPoOLFRh2rb/q/C6sZReMVjpSZwDzEwx+pcwLBTNSFr6BsQMLQJ52RqdLCBAcxDYS6T4vclm8gfXGwNkkWNrTdRQnz+A96P2SWLTld0nIJWSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] elfutils: upgrade 0.196 -> 0.197
Date: Tue, 20 Oct 2026 11:29:25 +0200
Message-ID: <20261020092931.4330-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ec6100-1b30-4c87-b43a-08df2e8ca75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|260925022911599003|10067099003|5023799004|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|12006099003|18002099003|25016099003|22082099003|6133799003|29003799003|3023799007;
X-Microsoft-Antispam-Message-Info: yf1nKn/4bQg39tWqgmZmrzK4F/XaYjRV/uV5njmVkf0lGBwF8BuKufiN7mQm3mXKL09d1zVQWU0o5c8Qs8EYuRjRyNQjepWIKJm+hgRy8674gAR27EweqY2m0N2ucCCjNYQsVZ4mIUtPwEnCvvFIElrt0hyjEWAFq8j/YzOV3yAXFLz362YEiMpx3i4OHgirSyu1pKws6SQId9vzkiCvu50segyH3ghgcnEjoT4r+9iAWk4EtMMJCDneOpTBJO5WmiJzdNLQKSwRtnmotKoL2Rk8dJ+EX7fmMEXUfz2qWmKIutszzcXQ+LdkIO4uoApEUT1tq599Tl1Q80Lk5sNOF8i+e/iu+GteYfYwZvQNagxnsWcA7JMYsRKrDxmHz5I0MHKzwcFnpYTgFZcN/okY6sLH2+nQeoMniMfOoJmDrROY9M9nlcBH71zZ1kERaCr/9iDrbGmbcPC6QYce1OLpnGO4SHgrzJ/H0O+qGZnFy69/x9hzoYcxJ4yGJ3RV1Dj8ReRN+piZCQORWCaG/L2/QP/v9Xpr5mIyWVe4l7fRxRgss58/q1rc56HzcIblaLOANPWQ7xmgimnpTaJRh2vgK7kcYNvtnKKC17zSu5s1eEXANd2WNJMogo3e6ofJXX7i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(260925022911599003)(10067099003)(5023799004)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(12006099003)(18002099003)(25016099003)(22082099003)(6133799003)(29003799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mcTV5cvecJws8oPZAU+NGuCMasGtqr6Cet3k+yWoY9q6qjb/FnBd9cElcWMR?=
 =?us-ascii?Q?8aNOTeTgZkpTmwPneodWhoH2CaV+R7BHrW/XY4sBWNWXAF45HDo7JUiZVU8K?=
 =?us-ascii?Q?Vvt/80ghcv/auEbpdeEHCI91IVQDc5FEeHVLoH9r34al40ZRUhTpxL/89YfQ?=
 =?us-ascii?Q?p5jcouy9zCL34CcLVOO1j4bcqwcCZbHK92W7dpI/uMqQxClWzbmvOxml13yK?=
 =?us-ascii?Q?w5uAGGKnkhp3elqn/9p5MVT57TlxCLCOlsDcPjf5XuSGKD8isgFJHSHmvDep?=
 =?us-ascii?Q?A7hdOS5eeVj+j5aZCGQfmi2cjwQCqgng1di1V3A9iqH5JU4y5bWwX99cYkZd?=
 =?us-ascii?Q?i17SHru3uu8EhzGVtrEUUjR5/CMy2830DXXVG/eHxK5TjD7lW5Jvbrn0nh+6?=
 =?us-ascii?Q?CHDWJpCuehYz5CVSR+NXbFtK2DTDEEk49uSRQsnY+uZPoPOaZATpoZFleP6h?=
 =?us-ascii?Q?1TWDkx2zJXl4U0QyYIJGugUeJ5VJb4JHOXFPdKllntyDu5KxgpaSqcdFKCWa?=
 =?us-ascii?Q?yKjJPORB1SDk2/ctkXZ0H3slEyhViCVvbskAZ8/kZ4O023ttdbiHqfP3KGzq?=
 =?us-ascii?Q?mSIQ+Hp7ZK2AUMPyqNuMWQNTynnbmBkKPQKkdd8LI39CQTbrZOyGgGiwSSWm?=
 =?us-ascii?Q?08c+ciMFElU+32TBTxJeC7tz1w09N5lIv3Df9mB+48/GE1P4G/DX+yhruPR/?=
 =?us-ascii?Q?bNX/YeuMbv0gTQqJx6/aqhF20D/ZALs7Q2f5TfbD3p9VZIUx5Nmbn1Z1MQfy?=
 =?us-ascii?Q?/DPsSP9/9Ge5wFVun9XIZesO9WLtBOpgH3r3Ypcjt3z6WD8n9N2l4rjur4oI?=
 =?us-ascii?Q?WB2r9Rde0L+4/FQ/NKrmuMC1YO/X7aXqmikXQOqTcxPUDYzasK7EsRgg7ooU?=
 =?us-ascii?Q?SY23EVJ5+C8CVUhPspo0cvJvPoalOSh82KYjFhfAWXoLq4209MUL1u3SVsnE?=
 =?us-ascii?Q?IuNCJJPHS/fWfHN+3CBOE75Xbq7Ro/vw8N13+VoQOEfkkLLCBm9/cUYlNQsM?=
 =?us-ascii?Q?kGeU4ja3ZmBtl2x3Ft8Tw/6xoekBmSVw9jR0kHrIQi4+wkzv1Dh+m1r/3z27?=
 =?us-ascii?Q?8o7LBdBi1RyeRqK7Qfh/C3tegxxvY/MzDQz0/4m9W2vTZUkG6w53fVOQhg4C?=
 =?us-ascii?Q?mcTEKDoYPWMKjKzw6RTIfz2SNuo3FCYIXsQnINZyp+mpU1mJpuSCsoEEe6L2?=
 =?us-ascii?Q?fXKijg+4ziPlS2Ky9Afhkm7VHw9E2zW9smXJFTeBSoI9cjmJzdfue/bRn7O5?=
 =?us-ascii?Q?PbD/QKL3hJNA0QYUgrIrCD21JO5zQmtMaeWhUJn3YXTkud0ecFm45tXt34sn?=
 =?us-ascii?Q?ODKyqBZLhBhE6ZteDA7Bc8yG3vnLMRaR/kvfPKrDLiGlYHJFPL15ND6rv8y4?=
 =?us-ascii?Q?rcSnDZIeqSYCSZ5zVA8r31dQKjPiBhpFJ8BdAtt7qX+3JPE/mlvhfk2k2WKb?=
 =?us-ascii?Q?d/9v3HFqPD3xNK/q9fPBanEVlUBuNXjEFmZgB1nuNE2Cif3lDw/r3zOqqE16?=
 =?us-ascii?Q?0YNtmv9YwMcDCwRgw8V4kBRpyjklhXRH9nA4TI1Mm8s98AjDEmEYytjYJ8Zd?=
 =?us-ascii?Q?dFrQtVufutWicPcpoj1WZrg8BgnNFiZzN67fUTPZH5M90R01JMLDr49XQKZ3?=
 =?us-ascii?Q?6/REioPtddN5s/mCrddHGcq5EXmGOTcI9ZlJdi8TRhRgmydC4bXJlD3ymt54?=
 =?us-ascii?Q?Tv2j4c4GcU2c4PbsmVui525bSh9hWF9xSILl9mrB01Ru3Y8UeKxTY1DO6W6T?=
 =?us-ascii?Q?HNiYXkxDvA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ec6100-1b30-4c87-b43a-08df2e8ca75e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:34.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z8R3ADCO1RQHYYsjpFVf1zM9u48iM84Dj2yb48+WkEAWhwOeH2YqXY3gGv4eL9suxSLkUTVLVRflHB4Fhh93ySwmdCVwxokD1gOykB+vg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248258
Content-Type: text/plain; charset="utf-8"

Version 0.197 "Anti-Corruption"

THREAD-SAFETY: New document describing the thread safety model for elfutils
       libraries when built with --enable-thread-safety.  Thread
       safety support remains experimental.

backends: Add unwinding support for alpha core files and processes.

libdebuginfod: The progress callback function is now also invoked when
       waiting for a server's initial response.

libdw: dwarf_begin_elf_type is now exported from libdw.so.  Previously
       this function was missing from the exported symbols.

libelf: Improved handling of corrupt ZSTD compression headers.

readelf: Improved handling of corrupt .gdb_index and .debug_cu_index
 sections.

translations: New Swedish translation.

unstrip: Improved handling of corrupt symbol tables.  When -m is given,
 the -d output path is now built from the module basename to avoid
 writing the reconstructed module image outside the intended
 output directory.

- Drop already upstreamed patches
  srcfiles.patch, 0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.=
patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{elfutils_0.196.bb =3D> elfutils_0.197.bb}  |  4 +-
 ...s-uio.h-instead-of-linux-uio.h-for-s.patch | 74 -------------------
 ...001-config-eu.am-do-not-force-Werror.patch |  2 +-
 ...-check-data_list.data.d.d_buf-before.patch |  2 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  4 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      |  4 +-
 .../elfutils/files/ptest.patch                |  8 +-
 .../elfutils/files/srcfiles.patch             | 65 ----------------
 11 files changed, 14 insertions(+), 155 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.196.bb =3D> elfutils_0.1=
97.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-backends-use-=
sys-uio.h-instead-of-linux-uio.h-for-s.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.197.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.196.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.197.bb
index 4541000840b..0d0b64cb4d0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -19,13 +19,11 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/=
${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-=
C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
-           file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s=
.patch \
-           file://srcfiles.patch \
            "
 SRC_URI:append:libc-musl =3D " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] =3D "fd5cc6b77ad6773cac93cb3f415f9318ac3b3455eecf801f6b=
4a742c4f6c7209"
+SRC_URI[sha256sum] =3D "1fdf525f22dcf796d99a99ba3ea00a1f7b1ae5421bc62e8443=
a708920b99b904"
=20
 inherit autotools gettext ptest pkgconfig
=20
diff --git a/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio=
.h-instead-of-linux-uio.h-for-s.patch b/meta/recipes-devtools/elfutils/file=
s/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch
deleted file mode 100644
index 0461172fcfd..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-inst=
ead-of-linux-uio.h-for-s.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 64e89606ff4967a647525524aec00dd33765ba2a Mon Sep 17 00:00:00 2001
-From: Daeho Ro <email@daeho.ro>
-Date: Sun, 16 Aug 2026 16:27:56 +0900
-Subject: [PATCH] backends: use <sys/uio.h> instead of <linux/uio.h> for
- struct iovec
-
-Since commit 0e8b57a3 ("elfcompress: Handle existing output files
-(symlinks)") lib/system.h includes <fcntl.h>.  When _GNU_SOURCE is
-defined, glibc's <fcntl.h> pulls in <bits/types/struct_iovec.h> (via
-bits/fcntl-linux.h), which defines struct iovec.  The kernel UAPI header
-<linux/uio.h> defines struct iovec unconditionally, so including it
-after "system.h" now breaks the aarch64 backend build:
-
-  In file included from aarch64_initreg.c:36:
-  /usr/include/linux/uio.h:17:8: error: redefinition of 'struct iovec'
-     17 | struct iovec
-        |        ^~~~~
-  In file included from /usr/include/aarch64-linux-gnu/bits/fcntl-linux.h:=
38,
-                   from /usr/include/aarch64-linux-gnu/bits/fcntl.h:61,
-                   from /usr/include/fcntl.h:35,
-                   from ../lib/system.h:42,
-                   from aarch64_initreg.c:33:
-  /usr/include/aarch64-linux-gnu/bits/types/struct_iovec.h:26:8: note: ori=
ginally defined here
-
-Seen building 0.196 on aarch64 with glibc 2.39 and gcc 13.3.0.
-
-Both files only need struct iovec to call ptrace (PTRACE_GETREGSET),
-which glibc provides in <sys/uio.h>; that header guards the definition
-with __iovec_defined, so it composes with the rest of system.h.
-arm_initreg.c does not currently include "system.h" and so still builds,
-but it has the same latent conflict.
-
-* backends/aarch64_initreg.c: Include <sys/uio.h> instead of
-  <linux/uio.h>.
-* backends/arm_initreg.c: Likewise.
-
-Signed-off-by: Daeho Ro <email@daeho.ro>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Delfutils.git;a=
=3Dpatch;h=3D64e89606ff4967a647525524aec00dd33765ba2a]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- backends/aarch64_initreg.c | 2 +-
- backends/arm_initreg.c     | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
-index a6badbb4..539a6366 100644
---- a/backends/aarch64_initreg.c
-+++ b/backends/aarch64_initreg.c
-@@ -33,7 +33,7 @@
- #include "system.h"
- #include <assert.h>
- #if defined(__aarch64__) && defined(__linux__)
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- # include <asm/ptrace.h>
-diff --git a/backends/arm_initreg.c b/backends/arm_initreg.c
-index efcabaf6..062bb9e0 100644
---- a/backends/arm_initreg.c
-+++ b/backends/arm_initreg.c
-@@ -38,7 +38,7 @@
- #endif
-=20
- #ifdef __aarch64__
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.=
  */
---=20
-2.43.7
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-=
force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am=
-do-not-force-Werror.patch
index d460f2e58b4..d145c9e820a 100644
--- a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-W=
error.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-W=
error.patch
@@ -1,4 +1,4 @@
-From 975357f7585076a072f61684db20180ef8dd31b7 Mon Sep 17 00:00:00 2001
+From 645351e3057b76d9a76495c7e021b3449cd5cae5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:50:48 +0100
 Subject: [PATCH] config/eu.am: do not force -Werror
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-che=
ck-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/fil=
es/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 621be1b37dc..47f28885a99 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data=
_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data=
_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From bf22ef3c1a559dc0b265a9c7c2fcda4a20519e63 Mon Sep 17 00:00:00 2001
+From 6305e20927bc39367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before fre=
e it
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-g=
cc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-=
test-when-gcc-not-deployed.patch
index 093d03c736d..330b0565fc8 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-=
deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-=
deployed.patch
@@ -1,4 +1,4 @@
-From db59c8a80a285f9cba3f789b6c2c240481b97db8 Mon Sep 17 00:00:00 2001
+From 1741d5bb8597aaeb6ef6caefc2f4091e3b2ecb2d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-co=
mpile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/fil=
es/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index eb2d48e3bb9..d5a1f281b0e 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-t=
est_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-t=
est_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From aba735bf19c60ff85731b3bfe79a6c83e17f3436 Mon Sep 17 00:00:00 2001
+From 4af78e885d764bcc4078ccf810c125159ad327f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAG=
S
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 055fea7..ba25e61 100644
+index bb36d3a..3e98162 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -122,7 +122,7 @@ endif
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-=
if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-=
Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index cc4c5ab75bb..a93fffc32cd 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest=
-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest=
-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 0533b0d67ed99fd2a034e497f0c07ff608ca52e7 Mon Sep 17 00:00:00 2001
+From 23c89703e77a000ebed1a4a32e9d52271d25a070 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch=
 b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 41e4c738f3a..d14c5257b3f 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 78415c6fc1f464e45222ba588a6cdc0292b4230a Mon Sep 17 00:00:00 2001
+From b1cf6bc617beccc7e15d5ef52749fb7c1d4e163d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/m=
eta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index a5d913b2b7e..3e2eaab9ec3 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 0064679018642a9e0e2c9d36eeeedc3a8278356e Mon Sep 17 00:00:00 2001
+From f2a4493c7ab2d8fca4e4bd43dfed6bbb52922a4e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -74,7 +74,7 @@ index a8ecc80..bf88051 100644
 =20
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 5585b0e..adc39a3 100644
+index 39d5bb6..db79236 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -51,6 +51,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipe=
s-devtools/elfutils/files/ptest.patch
index b6a9e5bb732..771a6470ac5 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From abe164f6242825e827b6b13141883591d059d6fe Mon Sep 17 00:00:00 2001
+From 614489b65f83540644dc88598315458712598476 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index b0d1b48..acc29f0 100644
+index d3c0292..76bdda2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2026 The elfutils devel=
opers.])
@@ -34,10 +34,10 @@ index b0d1b48..acc29f0 100644
 =20
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 137e961..055fea7 100644
+index 261649f..bb36d3a 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -981,3 +981,5 @@ check: check-am coverage
+@@ -998,3 +998,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
diff --git a/meta/recipes-devtools/elfutils/files/srcfiles.patch b/meta/rec=
ipes-devtools/elfutils/files/srcfiles.patch
deleted file mode 100644
index abd0226b0fd..00000000000
--- a/meta/recipes-devtools/elfutils/files/srcfiles.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From: Mark Wielaard <mark@klomp.org>
-To: elfutils-devel@sourceware.org
-Cc: ross@burtonini.com, Mark Wielaard <mark@klomp.org>
-Subject: [PATCH] srcfiles: Always process the "zero" file table entry (CU =
comp_dir/name)
-Date: Tue, 22 Sep 2026 13:46:06 +0200
-Message-ID: <20260922114606.2865660-1-mark@klomp.org>
-X-Mailer: git-send-email 2.55.0
-MIME-Version: 1.0
-Content-Transfer-Encoding: 8bit
-X-Spam-Flag: NO
-X-Spam-Status: No, score=3D-2.9 required=3D5.0 tests=3DALL_TRUSTED,BAYES_0=
0 autolearn=3Dham autolearn_force=3Dno version=3D3.4.0
-X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.=
org
-
-If the main CU file doesn't contain any references to the file table
-it wouldn't show up in the src files list (except if --cu-only was
-given). This is because file entry "zero" is special. It cannot be
-referred to by DW_AT file attributes (because zero means, no
-file). But technically it should be equal to (implicitly before
-DWARF5) the DW_AT_name of the main CU DIE (using a zero directory
-entry, equal to DW_AT_comp_dir). collect_sourcefiles skipped this
-implicit zero entry unless --cu-only was given.
-
-Fix this by always handling the zero file table entry. And for
---cu-only to just exit the loop early, so no other entries are handled
-This is also an optimization, before --cu-only would go through all
-indexes, but always added the CU name. Which worked, because
-duplicates were removed, but was somewhat inefficient.
-
-	   * src/srcfiles.cxx (collect_sourcefiles): Go from index
-	   zero, exit after zero index for CU_only, always handle
-	   index zero specially.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=3D34666
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport [7b675cbdb0d1f216938b4b33aea30fd35fb1ae0a]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/srcfiles.cxx | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
-index 9bbb6ef10473..e2fc0f128d71 100644
---- a/src/srcfiles.cxx
-+++ b/src/srcfiles.cxx
-@@ -273,10 +273,14 @@ collect_sourcefiles (Dwfl_Module *dwflmod,
-             clog << "skipping cu=3D" << cuname << " due to empty comp_dir=
" << endl;
-           continue;
-         }
--      for (size_t f =3D 1; f < nfiles; ++f)
-+      for (size_t f =3D 0; f < nfiles; ++f)
-         {
-+	  /* For --cu-only we are only interested in the "zero" entry.  */
-+	  if (CU_only && f !=3D 0)
-+	    break;
-+
-           const char *hat;
--          if (CU_only)
-+          if (f =3D=3D 0)
-           {
-             if (strcmp(cuname, "<unknown>") =3D=3D 0 || strcmp(cuname, "<=
artificial>") =3D=3D 0 )
-               continue;
---=20
-2.55.0
