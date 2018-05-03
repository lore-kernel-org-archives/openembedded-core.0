Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 996E474840
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 09:09:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39520888"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 May 2018 17:09:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D1184B314BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 17:09:25 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 3 May 2018 17:09:24 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 17:09:18 +0800
Message-ID: <20180503090918.20964-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
References: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 7D1184B314BC.AE18E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] btrfs-tools: Update to 4.16
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
X-List-Received-Date: Thu, 03 May 2018 09:09:32 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

* 0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch was deleted because it has been fixed in upstream.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 ...ith-musl-missing-header-include-for-dev_t.patch | 26 ----------------------
 .../{btrfs-tools_4.13.3.bb => btrfs-tools_4.16.bb} | 10 +++++----
 2 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.13.3.bb => btrfs-tools_4.16.bb} (81%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
deleted file mode 100644
index 790676b..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bc35c4caebb57cc8b96c30c25432b12ca8dc18d5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 6 Oct 2017 15:03:49 +0300
-Subject: [PATCH] Fix build with musl (missing header include for dev_t).
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- convert/source-fs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/convert/source-fs.h b/convert/source-fs.h
-index 23f3356..6fd770f 100644
---- a/convert/source-fs.h
-+++ b/convert/source-fs.h
-@@ -20,6 +20,7 @@
- #include "kerncompat.h"
- #include <linux/kdev_t.h>
- #include <pthread.h>
-+#include <sys/types.h>
- 
- #define CONV_IMAGE_SUBVOL_OBJECTID BTRFS_FIRST_FREE_OBJECTID
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.bb
similarity index 81%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.bb
index bc157e2..28fd2c5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.16.bb
@@ -10,21 +10,22 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl"
+DEPENDS = "util-linux attr e2fsprogs lzo acl python3"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "a7a1ea0f4f2a1d6eeeb3d106e062c7f1034f16d4"
+SRCREV = "23df5de0d07028f31f017a0f80091ba158980742"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
-           file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
            "
 
-RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://github.com/kdave/btrfs-progs/issues/109"
 inherit autotools-brokensep pkgconfig manpages
 
 CLEANBROKEN = "1"
 
+EXTRA_OECONF = "--disable-zstd --disable-python"
+
+
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
@@ -36,4 +37,5 @@ do_configure_prepend() {
 
 S = "${WORKDIR}/git"
 
+INSANE_SKIP_${PN} = "ldflags"
 BBCLASSEXTEND = "native"
-- 
2.7.4




