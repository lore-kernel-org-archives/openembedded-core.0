Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5182771A36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 22:21:28 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id f4so10168288qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 14:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1FfmjKQDyhbvXmpVapb+aVXfbD0DqVy3b4v2l2ki9mI=;
	b=Ggq75hCbEqYPym0yKWGXnN2kNA/J7JkBTwGuYveMjoim1+v+Z0fG4nL6cG4iD2kewz
	WiTltm9LQpCLpjaVrHfwxKT9vlkXlbSY6adwdlDHqbLpNe7dZK0MnesDu5bKL89hQkCJ
	6kZZ+7OMrBrsFp+UWqpE2aERqTAWrOIbVE5K8QR+zeH9B+R1QI1dWd/8a1Y9lAtMkyCq
	vpM/NTck+jPZTu8E5yXBojlhueA1IAKcxzYU1c3yuK2Rhbb9QFB0QubGk6XhgSRn7OHr
	qeLVsjZ6q810KubW5g29iF0k1vC3bqQnEw8ODEC74Fn5hKlP3iV2h2fNgB/kwoK9WAMV
	8Q4Q==
X-Gm-Message-State: APf1xPCzBcQ4w4CzLWNDjjWU4uh7PIKIwVwMS+JbvpeyEaFhGNRVy58B
	8UN9IvWi0+TJzOF5UQ05HZ+8AQ==
X-Google-Smtp-Source: AH8x225JsCHEp1+2sxQbQCXuluAQJhvKjTVU5UEV2DWRnq8k2jBlrsR9iH2sDeSY3H/fdQqg8f0gJQ==
X-Received: by 10.200.27.172 with SMTP id z41mr22494433qtj.58.1518992489526;
	Sun, 18 Feb 2018 14:21:29 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q2sm8490399qtf.52.2018.02.18.14.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Feb 2018 14:21:28 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 18 Feb 2018 19:21:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Feb 2018 19:21:19 -0300
Message-Id: <20180218222120.28451-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] mtd-utils: Bump revision to 1bfee866
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Feb 2018 22:21:29 -0000

This bumps the version to 2.0.1 release plus some more changes.

The following patches were merged upstream:

 - 0001-Fix-build-with-musl.patch
 - 010-fix-rpmatch.patch
 - fix-armv7-neon-alignment.patch

The `mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch`
patch has been removed as the issue seems to have been addressed
in the Linux MTD subsystem. The discussion can be seen at:

 http://lists.infradead.org/pipermail/linux-mtd/2011-August/037320.html

Also a research to see if any other distribution had a similar patch
included and they don't. So there is no clear need to keep diverging
from upstream.

See the logs below:

,----[ Changes from 2.0.0 -> 2.0.1 ]
| 81049e5 Release mtd-utils-2.0.1
| 4458ad6 mtd-utils: tests: Avoid using less than two blocks in nandpagetest
| 76a55b1 mtd-utils: ubinfo: add parameter check
| 454a3d0 mkfs-ubifs: fix inclusion of uuid.h
| df913e4 mtd-utils: tests: Add Erased Pages Bit Flip Test
| f8bc7d9 Add const modifier to read only strings and string constants
| a7c8cb3 Silence warnings about unused arguments
| e511691 Remove unused variables and functions
| ca517e8 Eliminate warnings about missing prototypes
| 3029b65 Enable compiler warnings
| 9eae306 Move libfec declarations to public header in global include directory
| 022ce62 Use autoconf header detection correctly for libmissing
| 1a3e3af Restructure autoconf configure.ac
| e772dc8 Replace defunct ubifs_assert
| b0b1bc5 mtd-utils: tests: Fix nandbiterrs Failure Check
| 76e27a7 ubi-utils: Return error code if command line option is unknown
| b8e785a nor-utils: Return error code if command line option is unknown
| 12e27a1 jffsX-utils: Return error code if command line option is unknown
| 9a357ee ftl_format: Use return directly to leave main function
| 6890608 flashcp: Drop exit code defines
| ccffc10 Use defines for exit code values
| 871c2f1 mkfs.ubifs: Add support for symlinks in device table
| c0972a5 libiniparser: remove unused function needing float
| 5c57076 libubi.c: add klibc specific fixes for ioctl
| dede98f Return correct error number in ubi_get_vol_info1
| a2eeedb Fix libmtd behaviour if MTD is not present on the system
| 4dab9be Fix build with musl
| 82839c3 Replace rpmatch() usage with checking first character of line
| 7d026a8 Fix alignment trap triggered by NEON instructions
| d7e8612 mtd-utils: Support jffs2 flash-erase for large OOB (>32b)
| fc7aa01 ubi: tests: Speedup io_paral by using rand_r()
| fdec8a4 ubi: tests: Support up to 65k NAND page size
| d600419 ubi: tests: Replace variable-length array with malloc()
| 1710e0c Remove README.udev from ubi-tests extra dist
| e3e010c ubirename: trivial fixes to the help text
| 1fed9b4 Remove UDEV_SETTLE_HACK
| 22089b0 mtd-utils: serve_image: Use PRIdoff_t as format specifier.
| 5a80691 mtd-utils: Fix format specifier definitions for off_t and loff_t.
| 44558d1 nanddump: Add --skip-bad-blocks-to-start option
| 2fc8058 nandwrite: Add --skip-bad-blocks-to-start option
| 6df83fd nandwrite: fix/cleanup bad block skipping
| 7b8981a nandwrite: replace erase loop with mtd_erase_multi
| dffaa1d nandwrite: add stricter sanity checking for blockalign
`----

,----[ Changes from 2.0.1 -> 9c61735 ]
| 9c61735 mtd: unittests: Stop testing stat() calls
| daef4f1 mtd: unittests: Decode arg size from ioctl request
| fd0b70b mtd: unittests: Use proper unsigned long type for ioctl requests
| c75d104 ubi-utils: ubiformat.c: convert to integer arithmetic
| 61afcc6 mtd-utils: common.c: convert to integer arithmetic
| 6766178 Run unit test programs through "make check"
| 098e91a mtd: tests: Fix check on ebcnt in nandpagetest
| 9cfb02c libscan: fix a comment typo in libscan.h
| 7086393 libmtd: fix a comment typo in dev_node2num
| 3c54e4e ubi-utils: ubicrc32: process command line arguments first
| ce50e6d nandbiterrs: Fix copy & paste fail
| 03dafe3 Enable further warning flags, address new warnings
| 0555cb2 jittertest: Use the appropriate versions of abs()
| 475bf70 Mark or fix switch cases that fall through
| cb2fcfc Add no-return attribute to usage() style functions
| 81fd176 Remove self-assignments of unused paramters
| 3b421ab mkfs.ubifs: ignore EOPNOTSUPP when listing extended attributes
| 030a63b tests: checkfs: Remove unused source file from makefiles
| 40dd609 misc-utils: initialize "ip" in docfdisk to NULL
| 94f6573 ubi-tests: io_update: fix missleading indentation
| afba4fc mkfs.ubifs: Apply squash-uids to the root node
| 3a34784 Add ctags files to .gitignore
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |  28 -----
 .../mtd/mtd-utils/010-fix-rpmatch.patch            |  63 ----------
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   |  55 ---------
 ...t-cleanmarker-with-flash_erase--j-command.patch | 137 ---------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   8 +-
 5 files changed, 2 insertions(+), 289 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
deleted file mode 100644
index bf3f98f14d2..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4dab9bed1033f797ef9b482c77342fe3fe26d0be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Oct 2015 23:51:34 +0000
-Subject: [PATCH] Fix build with musl
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
----
- jffsX-utils/mkfs.jffs2.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
-index 5446a16..ca5e0d5 100644
---- a/jffsX-utils/mkfs.jffs2.c
-+++ b/jffsX-utils/mkfs.jffs2.c
-@@ -72,6 +72,7 @@
- #include <byteswap.h>
- #include <crc32.h>
- #include <inttypes.h>
-+#include <limits.h>
- 
- #include "rbtree.h"
- #include "common.h"
--- 
-2.6.1
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch b/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
deleted file mode 100644
index 853de6af984..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 82839c3c0371ca2a1643a99d7d01f5bc1c850b28 Mon Sep 17 00:00:00 2001
-From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Date: Thu, 2 Mar 2017 11:40:36 +0100
-Subject: [PATCH] Replace rpmatch() usage with checking first character of line
-
-This is based on the patch from Khem Raj used by openembedded. In
-addition to the original patch, this also removes the fallback
-implementation that was provided for C libraries that don't implement
-rpmatch.
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
----
- include/common.h | 25 ++++++-------------------
- 1 file changed, 6 insertions(+), 19 deletions(-)
-
-diff --git a/include/common.h b/include/common.h
-index d0c706d..d609257 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -129,21 +129,6 @@ extern "C" {
- 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
- } while(0)
- 
--/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
--#if defined(__UCLIBC__) && \
--		(__UCLIBC_MAJOR__ == 0 && \
--		(__UCLIBC_MINOR__ < 9 || \
--		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
--	!defined(__GLIBC__)
--#undef rpmatch
--#define rpmatch __rpmatch
--static inline int __rpmatch(const char *resp)
--{
--    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
--	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
--}
--#endif
--
- /**
-  * prompt the user for confirmation
-  */
-@@ -164,10 +149,12 @@ static inline bool prompt(const char *msg, bool def)
- 		}
- 
- 		if (strcmp("\n", line) != 0) {
--			switch (rpmatch(line)) {
--			case 0: ret = false; break;
--			case 1: ret = true; break;
--			case -1:
-+			switch (line[0]) {
-+			case 'N':
-+			case 'n': ret = false; break;
-+			case 'Y':
-+			case 'y': ret = true; break;
-+			default:
- 				puts("unknown response; please try again");
- 				continue;
- 			}
--- 
-2.6.1
diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
deleted file mode 100644
index 6fc594f00bc..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 7d026a85946a08b8167dcd792ea6660bf6a49e08 Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
-Date: Thu, 2 Mar 2017 10:43:56 +0100
-Subject: [PATCH] Fix alignment trap triggered by NEON instructions
-
-NEON instruction VLD1.64 was used to copy 64 bits data after type
-casting, and they will trigger alignment trap.
-This patch uses memcpy to avoid alignment problem.
-
-Upstream-Status: Backport
-
-Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
----
- ubifs-utils/mkfs.ubifs/key.h | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
-index 39379fd..118858b 100644
---- a/ubifs-utils/mkfs.ubifs/key.h
-+++ b/ubifs-utils/mkfs.ubifs/key.h
-@@ -159,10 +159,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
-  */
- static inline void key_write(const union ubifs_key *from, void *to)
- {
--	union ubifs_key *t = to;
-+	__le32 x[2];
- 
--	t->j32[0] = cpu_to_le32(from->u32[0]);
--	t->j32[1] = cpu_to_le32(from->u32[1]);
-+	x[0] = cpu_to_le32(from->u32[0]);
-+	x[1] = cpu_to_le32(from->u32[1]);
-+
-+	memcpy(to, &x, 8);
- 	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
- }
- 
-@@ -174,10 +176,12 @@ static inline void key_write(const union ubifs_key *from, void *to)
-  */
- static inline void key_write_idx(const union ubifs_key *from, void *to)
- {
--	union ubifs_key *t = to;
-+	__le32 x[2];
-+
-+	x[0] = cpu_to_le32(from->u32[0]);
-+	x[1] = cpu_to_le32(from->u32[1]);
- 
--	t->j32[0] = cpu_to_le32(from->u32[0]);
--	t->j32[1] = cpu_to_le32(from->u32[1]);
-+	memcpy(to, &x, 8);
- }
- 
- /**
--- 
-2.6.1
diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
deleted file mode 100644
index 0f42e73e9ae..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-Upstream-Status: Pending
-From patchwork Mon Aug  8 08:16:43 2011
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: mtd-utils: fix corrupt cleanmarker with flash_erase -j command
-Date: Sun, 07 Aug 2011 22:16:43 -0000
-From: b35362@freescale.com
-X-Patchwork-Id: 108873
-Message-Id: <1312791403-13473-1-git-send-email-b35362@freescale.com>
-To: <dwmw2@infradead.org>
-Cc: Liu Shuo <b35362@freescale.com>, Artem.Bityutskiy@nokia.com,
- Li Yang <leoli@freescale.com>, linux-mtd@lists.infradead.org
-
-From: Liu Shuo <b35362@freescale.com>
-
-Flash_erase -j should fill discrete freeoob areas with required bytes
-of JFFS2 cleanmarker in jffs2_check_nand_cleanmarker(). Not just fill
-the first freeoob area.
-
-The below is the result without this workaround:
-
-JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00004000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
-JFFS2: Erase block at 0x0000c000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00014000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
-JFFS2: Erase block at 0x0001c000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00024000 is not formatted. It will be erased
-JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
-...
-
-Signed-off-by: Liu Shuo <b35362@freescale.com>
-Signed-off-by: Li Yang <leoli@freescale.com>
-
-Updated for the new version
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
-v2 : get length of availble freeoob bytes from oobinfo information,
-      not use the ioctl ECCGETLAYOUT which is being deprecated.
-
- flash_erase.c |   46 +++++++++++++++++++++++++++++++++++++++-------
- 1 files changed, 39 insertions(+), 7 deletions(-)
-
-diff --git a/flash_erase.c b/flash_erase.c
-index 933373a..4b9d84b 100644
---- a/misc-utils/flash_erase.c
-+++ b/misc-utils/flash_erase.c
-@@ -99,6 +99,7 @@ int main(int argc, char *argv[])
- 	bool isNAND;
- 	int error = 0;
- 	off_t offset = 0;
-+	void *oob_data = NULL;
- 
- 	/*
- 	 * Process user arguments
-@@ -201,15 +202,43 @@ int main(int argc, char *argv[])
- 			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
- 				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
- 
-+			cleanmarker.totlen = cpu_to_je32(8);
- 			/* Check for autoplacement */
- 			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
--				/* Get the position of the free bytes */
--				if (!oobinfo.oobfree[0][1])
-+				struct nand_ecclayout_user ecclayout;
-+				int i, oobavail;
-+
-+				for (i = 0, oobavail = 0; oobinfo.oobfree[i][1]; i++)
-+					oobavail += oobinfo.oobfree[i][1];
-+
-+				if (!oobavail)
- 					return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
-+
-+				/* Get the position of the free bytes */
- 				clmpos = oobinfo.oobfree[0][0];
--				clmlen = oobinfo.oobfree[0][1];
--				if (clmlen > 8)
--					clmlen = 8;
-+				clmlen = MIN(oobavail, 8);
-+
-+				if (oobinfo.oobfree[0][1] < 8 && oobavail >= 8) {
-+					int left, n, last = 0;
-+					void *cm;
-+
-+					oob_data = malloc(mtd.oob_size);
-+					if (!oob_data)
-+						return -ENOMEM;
-+
-+					memset(oob_data, 0xff, mtd.oob_size);
-+					cm = &cleanmarker;
-+					for (i = 0, left = clmlen; left ; i++) {
-+						n = MIN(left, oobinfo.oobfree[i][1]);
-+						memcpy(oob_data + oobinfo.oobfree[i][0],
-+								cm, n);
-+						left -= n;
-+						cm   += n;
-+						last = oobinfo.oobfree[i][0] + n;
-+					}
-+
-+					clmlen = last - clmpos;
-+				}
- 			} else {
- 				/* Legacy mode */
- 				switch (mtd.oob_size) {
-@@ -227,7 +256,6 @@ int main(int argc, char *argv[])
- 						break;
- 				}
- 			}
--			cleanmarker.totlen = cpu_to_je32(8);
- 		}
- 		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
- 	}
-@@ -276,7 +304,8 @@ int main(int argc, char *argv[])
- 
- 		/* write cleanmarker */
- 		if (isNAND) {
--			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, &cleanmarker) != 0) {
-+			void *data = oob_data ? oob_data + clmpos : &cleanmarker;
-+			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, data) != 0) {
- 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
- 				continue;
- 			}
-@@ -291,5 +320,8 @@ int main(int argc, char *argv[])
- 	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
- 	bareverbose(!quiet, "\n");
- 
-+	if (oob_data)
-+		free(oob_data);
-+
- 	return 0;
- }
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 48ba2ee07a9..3c34bdd84ea 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -9,15 +9,11 @@ inherit autotools pkgconfig update-alternatives
 
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 
-PV = "2.0.0"
+PV = "2.0.1+${SRCPV}"
 
-SRCREV = "1bfee8660131fca7a18f68e9548a18ca6b3378a0"
+SRCREV = "9c6173559f95e939e66efb2ec3193d6f3618cf69"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://fix-armv7-neon-alignment.patch \
-           file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
-           file://0001-Fix-build-with-musl.patch \
-           file://010-fix-rpmatch.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
2.16.1


