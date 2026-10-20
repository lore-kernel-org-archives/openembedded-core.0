Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10549.1792510297993376491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IbHHpoEi;
 spf=pass (domain: est.tech, ip: 40.107.130.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCxcv9ZRpE1xl0djQy8bznMeFLyLg1ryTeryXH/njMMgu9RQm+dY/47A6bXTCK05qOQMIshKogmkrC4l0Rw68ZZEVAN0z1dOokyXGkqQauLkZck0pzhWIdcnjVxx8sF0oBFwnSfOg+yLvstlpo0MgUz6Sg77KN4OMmYSHRb5Mu5zBCSxsvGaAWI+mQCY1ZianEGYz6X7i010dHBYe9L+il9Uu2IJyomQ0y8ga4+0Ec1QL+kj95aMIST6pXk4Zl3RthDocM5HGGRhSKaPw+3fy8IvkemuO0oVy6dACEPZo3EwY6S5Uo4Gnyz2yUya40wLs3UCqTis62fVfA+Q+esdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiGkGX6sWghQ4I2kLD4M0PMsFbs1GX5iQNDL3q7fqAQ=;
 b=lJEwBTpQ9zwrObUoGq0Nhaek+sclUqmvzmtwijKl5+2k3ma2RJ93iXUNrd4CP4cZUrVi8+2CkKlyMOrfKNb8aoR2GvAfROQJ50sWB8cwBfQZUW9yz9Hc7yg/TaQEd4tE4ubQRQuOJdS4kRrstWoIy/kzmIV7jtjVZHl+1is/GQHXiX4NzjqK3lKJoy8Ez5pErI6ljSzcNisnzkl+rEfzHcarD4Obx65fH+G5lYVGYAB2v6pcutwoiRA6Uoo6G6jDDCLS0c9YGwF9uOlYutchqA4fYgyil+8rd8i3FihHsO7DS8jdfy3J57UNfSIXqdSp8/LSfbK4m3SCSlqAb8n1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiGkGX6sWghQ4I2kLD4M0PMsFbs1GX5iQNDL3q7fqAQ=;
 b=IbHHpoEiO+eoaSnIbMxoQJwoxylLhwkPrHCRhY/wMvJgX5Y0/crDnw5gMRxxii3wj81f5Q5GbHpoPRC5VGA2qpWoajYRmQXhaJCQ6raaLvhLue5bIAEt0UGYuiSjN+iUSaQQ/TyqFDTAWJnikU5foQGdaQfTeQsrubjW8vuSf74d+69OVCt9DWMfuirfCbj/3S+DgTXb1yNubD+9HWeAdtDaBMgl4XjIi7j540P7NbbYqLgJcqPb6KqWi1VhAvTK8mz2hRWorG4Q+lrLijIv8FBIHmU9LkXH+3J7g8wNOngMfHGh0hqSOeh9oLN10jgsU7Mqy1rM6nQRkfhCqdpdwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB1843.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:343::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 15:31:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 15:31:32 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] elfutils: upgrade 0.196 -> 0.197
Date: Tue, 20 Oct 2026 17:31:30 +0200
Message-ID: <20261020153130.51318-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-2-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::33) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB1843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca01176-136a-4b42-9620-08df2ebf3825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|5023799004|12006099003|260925021911599003|260925022911599003|261009223027099003|260925021311599003|10067099003|22082099003|56012099006|18002099003|3023799007|25016099003|6133799003|29003799003;
X-Microsoft-Antispam-Message-Info: nUpIw6H7RIl5Lkm4OhipGxMLbsqzEucd1Iv2pvD8SXzb/QnE96ZUtz7qJ1gbPerHvJihl+13ERL7LYidQfNU0TJfNyvIkOLlPVLoBAUmRUaRPuLIIGzxzk8SCBDROJEoistwqJ20E2CeZ1RaTzBxOmM1G3QhDa1iPdR/oq36yTPme/RaENcHmGQe6/UXpsTDS1wJl29cPWByzRvUdxlMMxnNh/5qHSHq0cwFfNh6n44wH5Eh12OwvlVECNMIixKGhxUHLDpUSDRT6GmvvFoyLXisEntYSReWo0mcnUA1nlwWVX7pYeEV7BcUjveBgSRJj8gcTJ80E64V6ac9+C65efz7OF8tBth26/RG2Z2dnPoajRY3StnyHod7ES3UGRGCLWQq7tPoXurn/xoAJPeBTMp+MFEseNRsF/V8fGmmD+T0SuLUog7R9JQYn5VmrDK6puZW/7thL0Br0qEA9AVYAseW2W9fofh7njwYPshMaCznybeg/sAei9nwuGee0D7EPcrEwjRfHltLLx9s8dtHiHyc0OkScD5CJhfUaNu+sLyv2r0DAT3SscetAXEQrelO4tWcgdTx2u/41GaWHfqbZEAjoRvIyfi9UNWHTYqw9Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(5023799004)(12006099003)(260925021911599003)(260925022911599003)(261009223027099003)(260925021311599003)(10067099003)(22082099003)(56012099006)(18002099003)(3023799007)(25016099003)(6133799003)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4GCcsE1Gmmo+ef7UOwmH3OWBVyKmlYL7kJ2NoA+Hf5NiuVUzTdhcsGN5QUPx?=
 =?us-ascii?Q?pQ4c49ZERVPVhhjpRpgo2JC85173WzDdzCKJdkuySQX9yoEl1NVLszhpU/8c?=
 =?us-ascii?Q?T4DzTfCHZC4j60GS2J2Y32u/+FjfBAqq1/UAjcmxHD/ISJfhBNfHtpngZ4Ul?=
 =?us-ascii?Q?xC/rfjgPXdvFe3itB9eAf3JFbeRpomluglq2fl+fPqx8gniB9etfvPEPabfi?=
 =?us-ascii?Q?Cah2XQCDXzHFjBJA9PZCtczMNydWjk68Y7cUx/6/iJGaVzk8SedkRxeH1Ua3?=
 =?us-ascii?Q?7gLN/+hy2dXqR42c2ZibE3MdLlAbGzmsF7uthBnOb1o/bDF2Sp8x/8nT6HX/?=
 =?us-ascii?Q?dZLtFvhLbiUtEfh5uf5Io0VmIrXy0WZpgRpuyj0lOMAMX2CYxh8vrk18tTfE?=
 =?us-ascii?Q?7gkr7Gg0eA1ro7BMt+JMSr9jcR0593RX9smTqySIJHfXQv8DS/7K9vNqsqiM?=
 =?us-ascii?Q?IH7osMiDxG0bHTgxmcJveZvv0EoY2Co1bROJG28L96DVReG8T+xBUrsyAoG9?=
 =?us-ascii?Q?mOrVCeKzOsnJloYKiGR1DFr+JH777lLuf3ni91Cw5YDiSOp8+DEYDTHXNMNs?=
 =?us-ascii?Q?hOQC8QplAheB0IL7kmh4iTl0Dsup3WyobqxzF3bFHMfFHEq5+wWaWgQhNlgB?=
 =?us-ascii?Q?m/XjiHPZUPmXG7WISJJ9ozdr9Rtt8beITAcr+BNcDr1jgzSPdFU7z2hFHlVA?=
 =?us-ascii?Q?l0p8C+Up3PLT+zNQnvLpgV7ytSvAQqIw9tJgqOj0rH3GrCNXrBVpRi3RJVHC?=
 =?us-ascii?Q?G/RVvy573PikED6cpBkrbF36ykz+Hh8/zej+O/6sl03xwogPRwTR9UUtMokq?=
 =?us-ascii?Q?xsuCmuU4ynpl1X6GxKXwN05hjQo0RPmBmyjzxTfKdoeUwOkVF/Lb3d0P6hgf?=
 =?us-ascii?Q?cyn5SAEw7/bdJ/B9N6GQ0rzN7LkOOzNGWYbSxxl4zzW4hlDOj0CU1O+kRMO+?=
 =?us-ascii?Q?pSEBHmY0/N5+TEwXfb91oUuOHfwWvAbKOhSbObQgOfZBR2mp/taL0kX9vGeu?=
 =?us-ascii?Q?8tREh7XkFX+zNiNWLlZ4niWugjKypR0nxHTXIO6OFdcupw/HvhMoTz6JXJob?=
 =?us-ascii?Q?LppVWO+R0mKG54Hm1b5RIvKVegqOp4GkiEG66ZdrAc1Qn4o4o10kZA0ebMzc?=
 =?us-ascii?Q?wzn8wr1EQUna/2CdRO2FGz6AYqphUCyqr6JbJo4QRVCqhjwhebZGGOhlG59k?=
 =?us-ascii?Q?8J/COyK60tuQcCp8EX6fnk1sxA88CD224oGtyU2WlL4PO2ZUuEyUnFL8Sui2?=
 =?us-ascii?Q?woykJpP0+6+2v4ffbPLG32GNHSNztsF2uTILk1t8TC0pfwGsQQ6sxhUAaQ0e?=
 =?us-ascii?Q?5mDG4VHRebSPQ/9MuWXsDazG57p5eHEvo9qHQlNtvBGYXKIqy8M4kL5N96v7?=
 =?us-ascii?Q?uvB3rRFfvOHnx1o2GxiJSm0SLxZ+JlB/qBabSE8iEg3itkm8zUGH1wT4Es7G?=
 =?us-ascii?Q?g3eq/jqCw/wk8ZgpznApwyy0EN44Vwve5YpTxAElaqNQnghfczG0np0pzmhF?=
 =?us-ascii?Q?SErnbpu65v0onEY7NwnvNA/a+z6As4V13Dh9dbNibSmgyw6tp3NG1qMEi9gI?=
 =?us-ascii?Q?xB61Eabo8TX5fKs8abfRZ5W7lMJG6YwmIcYs7iNdwfSE5JUHwQgpc8hO/8yj?=
 =?us-ascii?Q?r01OG/Ln8WtznjVDrQJR96BxhJYB+4W0tv9mEAzKJIcVEurHYn9ZVlPjR/z9?=
 =?us-ascii?Q?kD8X4exMZO5jZD6xvdzqU/Z8ubv9NAbcifsxONbf2uRQWtWhU4wMKm3GWk/+?=
 =?us-ascii?Q?CPIiEk2yYqO++B/TKw03vNTo37E/0lE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca01176-136a-4b42-9620-08df2ebf3825
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 15:31:32.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ASFj9a/qSnqLVJzieo1o54USeNU2eUxPPcMpGsLNiN7ronh/m3ckuSVyqvWAEdv4bDNCUnkQEinAq8fhoUxtVbqwQTEqlfJwKgbhNKKVm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248302
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

- Drop stackprof systemwide tests from PTEST_XFAILS. Upstream 0.197
  added testjob_launch to generate background CPU load so these tests
  pass reliably; keeping them as XFAIL now causes XPASS build failures.

ptest results:
- with removing XFAIL change: elfutils run: 263 PASSED, 45 SKIPPED, 0 FAILE=
D
  without change: 261 PASSED, 45 SKIPPED + 1 XPASS

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
  - Drop stackprof systemwide tests from PTEST_XFAILS.

 .../{elfutils_0.196.bb =3D> elfutils_0.197.bb}  |  6 +-
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
 11 files changed, 14 insertions(+), 157 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.196.bb =3D> elfutils_0.1=
97.bb} (95%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-backends-use-=
sys-uio.h-instead-of-linux-uio.h-for-s.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.197.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.196.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.197.bb
index 4541000840b..c0b308c44b8 100644
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
@@ -66,8 +64,6 @@ PTEST_XFAILS ?=3D ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=3D32232
 PTEST_XFAILS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-ll=
d', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-r=
everse-sections-self.sh', '', d)}"
 PTEST_XFAILS:append:libc-musl =3D " run-large-elf-file.sh run-backtrace-da=
ta.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-s=
tack-demangled-test.sh run-deleted.sh run-compress-test.sh"
-# systemwide stackprof tests need userspace CPU activity, which minimal qe=
mu images lack
-PTEST_XFAILS:append:qemuall =3D " run-stackprof-system.sh run-stackprof-sy=
stem-gprof.sh"
=20
 do_install_ptest() {
 	# copy the files which needed by the cases
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
