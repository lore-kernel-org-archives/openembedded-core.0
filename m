Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id D59557FEE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 18:29:19 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 0041D60335;
	Tue, 21 Jan 2020 19:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1579631359;
	bh=pm+M9TQhr+UTpRvXmwv3xl+jsSN7PGT0M76Q5FAgfj4=;
	h=From:To:Cc:Subject:Date:From;
	b=kRU8u6kDq2iwGZeX5n5Xgcu+WYrstAmmwGDyAaBwgrdVoqzUL9QS9kGngZmj1QaMy
	qCjbHFqZBQYKZq4rXkz+oKRE8rNxrBGTZau93arkVuFLvFtUpo0aaxMDmSMdI8pCIZ
	l/khJhu2+fh8aIyTrmi4PFn9WPiiIhXXn2kjbS+FPdbmq0pWaNGmoezoetmFWHJdFT
	19qCY8EoJRAJVoDfGo47YaPPACdOyVT1SJp/0s4VpvL0aTYEI419uv2WqgSiZEngEW
	alHxObGo/q60cFXicSZO4TLfb4/L8/i78lCqCfCZjSRSDDnilOqSJK/MYCezpeTSNO
	krU9PK2O3dhiQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 19:28:44 +0100
Message-Id: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] util-linux: upgrade 2.34 -> 2.35
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
X-List-Received-Date: Tue, 21 Jan 2020 18:29:20 -0000

License-Update: add GPLv3 text

Drop upstreamed patch

See full changelog https://lore.kernel.org/util-linux/20200121105711.zzeeolydlivqnik7@ws.net.home/T/#u

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-core/util-linux/util-linux.inc        |  5 +--
 ...lsblk-force-to-print-PKNAME-for-partition.patch | 36 ----------------------
 .../{util-linux_2.34.bb => util-linux_2.35.bb}     |  5 ++-
 3 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
 rename meta/recipes-core/util-linux/{util-linux_2.34.bb => util-linux_2.35.bb} (58%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 179cb3d..0f8a6c2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,11 +6,12 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-3.0-or-later;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
deleted file mode 100644
index 5d4c148..0000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 27 Jun 2019 09:22:18 +0200
-Subject: [PATCH] lsblk: force to print PKNAME for partition
-
-PKNAME (parent kernel device name) is based on printed tree according
-to parent -> child relationship. The tree is optional and not printed
-if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
-versions print the PKNAME also in this case.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
-
-Addresses: https://github.com/karelzak/util-linux/issues/813
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- misc-utils/lsblk.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
-index e95af7af0256..3ce6da730264 100644
---- a/misc-utils/lsblk.c
-+++ b/misc-utils/lsblk.c
-@@ -1019,6 +1019,9 @@ static void device_to_scols(
- 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
- 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %s ---> is open!", dev->name));
- 
-+	if (!parent && dev->wholedisk)
-+		parent = dev->wholedisk;
-+
- 	/* Do not print device more than one in --list mode */
- 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
- 		return;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.35.bb
similarity index 58%
rename from meta/recipes-core/util-linux/util-linux_2.34.bb
rename to meta/recipes-core/util-linux/util-linux_2.35.bb
index e9c2d80..71f7cd1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.bb
@@ -7,7 +7,6 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
-            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
 "
-SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
-SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
+SRC_URI[md5sum] = "479488469f057ddeed0d3ca7d6ab5f16"
+SRC_URI[sha256sum] = "b3081b560268c1ec3367e035234e91616fa7923a0afc2b1c80a2a6d8b9dfe2c9"
-- 
2.7.4


