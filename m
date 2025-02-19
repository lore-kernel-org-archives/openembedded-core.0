Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D47C021B1
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 18:51:45 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.30784.1739991101407032197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 10:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZhAx1MNd;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: festevam@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-520a473d2adso69305e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739991099; x=1740595899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JK1rdNFrCicTpD+LriRi/IqjmxcVHMwAsp5uRgYzsdQ=;
        b=ZhAx1MNd8l5V7Z21+DuA8WXcLEdIijWwRx6fgTgSyFV0aN8RVCr3JKk+oYigNX/VM7
         PJ/JlklpXa8Gnavb68bTqR+cv9z5gyxW9Cj+SRZTuwXJQd4diMevVL14fRDfIfnRk739
         eX6eyUKAqTAnw0sFGDxuhL62KfGm0SpXOM9HAdDyaPukQ26+3yxNTps3END88+JZ+YGG
         xdH+KVnMp0JBe9u58JWodCpheHD545rQx05ccO3bdNplUeOkB28EDRfo1q8Gu+RqBC8F
         1yk7rd2DKOEzEEVPF8tVJudI7zjuVs/DTIYCQKq45km+LpFrpIuWdeyw1OQlarc2t928
         gBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991099; x=1740595899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JK1rdNFrCicTpD+LriRi/IqjmxcVHMwAsp5uRgYzsdQ=;
        b=xArmMH+DRtG47dwGbbgDEuxriYUZPXigTcGB+A6mfJ5M8jlUmcb8hhPOvbG5c9gYhO
         kHBZKFUvhCwwrC/lIZUCm9ZKGbnqbgQuKrTz3Z65n+3eUnKUCAc6WCsbwp2Eeu70xJOC
         cl0zYwXHKvMSHqhcZwbKOMU9q55TjahmQqKVX6+FILhr2NFbIKpTUYQbdglW1Rvgej8U
         5kD9JnycYt3Pj5EGeuaAGHTAWPyv5mibDzXGLAQzDlUsNp8UWC4MgmSymWAKsRCoMTcD
         d64tcd6fuiYFDTQtqmC0nZd0drA6jOoWayi6Hn+99y94yoVjVuLVb4hOPQVAAhnlWWUT
         o0pw==
X-Gm-Message-State: AOJu0YzMHQhwEbNQoKj0oj+KhagIKdCf0lb/RsuxuRTk0bvZgUX5hsDy
	xn8hg584Fgly4eY2joknCdCwef4/sviPUnuADghUEbk/nohkFgE8PDvdlQ==
X-Gm-Gg: ASbGncuCgKAtmMjetMfONU2NDts3fK7yjs89GTYyTve4K9DGrW6SzJ9fdB2kUTz4lFa
	x9K2nkv59fCDIeMgxt+0Ew5esedeYZhGphJYSyzhKmR0FodsUS6rV4YgVdxg5cASh+rJwgY2aGP
	jx+WrbK8XGOhfHAdah4G1xzopaSvCApk5v0MXiqJqsDqlMS3DvK95/V0JfxaGkW0Sc41uEdND1f
	3qwEwLNfRa4nVWsK9/bgNzuogR5cNKQzRQCOD8sTY0lQf+SJsLLGLiM0SIRxQ0rdHYjRsDuUnn9
	Wgxo7f7n48zUdAIq7DbPA72CVnmrwA==
X-Google-Smtp-Source: AGHT+IF8EXi0Ck96vPpgO6DDAAwVHh6OTmiU6rgU66hCvbnI313eQiVnElJO7T0X67H8vxDainYw5A==
X-Received: by 2002:a05:6122:21a4:b0:520:5a87:66f0 with SMTP id 71dfb90a1353d-521c424d065mr3046392e0c.0.1739991099311;
        Wed, 19 Feb 2025 10:51:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52085b489bbsm3087187e0c.42.2025.02.19.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:51:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Date: Wed, 19 Feb 2025 15:51:19 -0300
Message-Id: <20250219185119.2168718-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219185119.2168718-1-festevam@gmail.com>
References: <20250219185119.2168718-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 18:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211727

From: Fabio Estevam <festevam@denx.de>

Upgrade to mtd-utils 2.3.0.

Details about the 2.3.0 release:

https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at/T/#u

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Use v4 of the series submitted to linux-mtd kernel mailing list.

 ...-ubifs-utils-ubifs.h-Include-fcntl.h.patch | 53 ++++++++++++++++++
 ...ifs-utils-journal-Include-sys-stat.h.patch | 41 ++++++++++++++
 ...d-a-check-for-execinfo-and-backtrace.patch | 54 +++++++++++++++++++
 ...extract_files-Include-linux-limits.h.patch | 41 ++++++++++++++
 ...{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} | 11 +++-
 5 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} (89%)

diff --git a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
new file mode 100644
index 0000000000..a9ececc14c
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
@@ -0,0 +1,53 @@
+From 2fc872697f72214e1e3efc6c2523e374fa5d681d Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 17 Feb 2025 16:02:04 -0300
+Subject: [PATCH v4 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
+
+Include the <fcntl.h> header file to fix the following error
+when building with musl:
+
+| In file included from ../git/ubifs-utils/common/compr.c:42:
+| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|   313 |         loff_t ui_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1341 |         loff_t i_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1342 |         loff_t d_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1899 |                              int deletion, loff_t new_size);
+|       |                                            ^~~~~~
+|       |                                            off_t
+| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-1-festevam@gmail.com/T/#t]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
+Reviewed-by: Khem Raj <raj.khem@gmail.com>
+---
+Changes since v3:
+- Removed Upstream-Status tag.
+
+ ubifs-utils/libubifs/ubifs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
+index 0908a2289208..1c7bc7bd0c80 100644
+--- a/ubifs-utils/libubifs/ubifs.h
++++ b/ubifs-utils/libubifs/ubifs.h
+@@ -11,6 +11,7 @@
+ #ifndef __UBIFS_H__
+ #define __UBIFS_H__
+ 
++#include <fcntl.h>
+ #include <string.h>
+ 
+ #include "linux_types.h"
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
new file mode 100644
index 0000000000..ea376437df
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
@@ -0,0 +1,41 @@
+From 65077d8d664821e323d011956049c1c1b97d9560 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 17 Feb 2025 16:07:49 -0300
+Subject: [PATCH v4 mtd-utils 2/4] ubifs-utils: journal: Include <sys/stat.h>
+
+Include the <sys/stat.h> header file to fix the following error
+when building with musl:
+
+| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
+| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
+|   414 |         switch (mode & S_IFMT) {
+|       |                        ^~~~~~
+| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
+| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
+|   415 |         case S_IFREG:
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-2-festevam@gmail.com/T/#t]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
+---
+Changes since v3:
+- Removed Upstream-Status tag.
+
+ ubifs-utils/libubifs/journal.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
+index e78ea14f3e69..45d82fd54bdb 100644
+--- a/ubifs-utils/libubifs/journal.c
++++ b/ubifs-utils/libubifs/journal.c
+@@ -46,6 +46,7 @@
+  * all the nodes.
+  */
+ 
++#include <sys/stat.h>
+ #include "bitops.h"
+ #include "kmem.h"
+ #include "ubifs.h"
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch b/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
new file mode 100644
index 0000000000..8ab7d7369c
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
@@ -0,0 +1,54 @@
+From 8503bc3de0d3ff016caa715716578a3be3698548 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Tue, 18 Feb 2025 18:25:56 -0300
+Subject: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo and backtrace
+
+musl relies on an external execinfo library to provide backtrace
+functionality. If musl cannot link to libexecinfo, the following link
+error happens:
+
+| /work/festevam/oe/poky/build/tmp/work/core2-64-poky-linux-musl/mtd-utils/2.3.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/14.2.0/ld: ubifs-utils/libubifs/mkfs_ubifs-io.o: in function `dump_stack':
+| /usr/src/debug/mtd-utils/2.3.0/ubifs-utils/common/defs.h:71:(.text+0x25): undefined reference to `backtrace'
+....
+| collect2: error: ld returned 1 exit status
+| make: *** [Makefile:2959: mkfs.ubifs] Error 1
+
+Fix the problem by checking for backtrace support in libc first and if not
+found, then check for backtrace support in the external libexecinfo.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-3-festevam@gmail.com/T/#t]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+Suggested-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
+---
+Change since v3:
+- None.
+
+ configure.ac | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2a79ba820fc0..296901e61760 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -238,6 +238,17 @@ if test "x$need_cmocka" = "xyes"; then
+ 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
+ fi
+ 
++AC_CHECK_FUNC([backtrace], [have_backtrace=yes], [have_backtrace=no])
++
++if test "x$have_backtrace" = "xno"; then
++    AC_CHECK_LIB([execinfo], [backtrace],
++        [LIBS="$LIBS -lexecinfo"
++         AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via libexecinfo])],
++        [AC_MSG_WARN([backtrace support not found])])
++else
++    AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via libc])
++fi
++
+ AC_CHECK_HEADERS([execinfo.h])
+ 
+ ##### produce summary on dependencies #####
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
new file mode 100644
index 0000000000..87806af27d
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
@@ -0,0 +1,41 @@
+From f218be1ce0c8923d690221160a3dd9f1492acaf1 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Tue, 18 Feb 2025 08:17:30 -0300
+Subject: [PATCH v4 mtd-utils 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
+
+Include <linux/limits.h> to fix the following build error when building
+with musl:
+
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
+|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
+|       |                                               ^~~~~~~~~~~~~~
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
+| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-4-festevam@gmail.com/T/#t]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
+---
+Changes since v3:
+- None.
+
+ ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
+index c83d37749bc0..000ef5d10565 100644
+--- a/ubifs-utils/fsck.ubifs/extract_files.c
++++ b/ubifs-utils/fsck.ubifs/extract_files.c
+@@ -10,6 +10,8 @@
+ #include <getopt.h>
+ #include <sys/stat.h>
+ 
++#include <linux/limits.h>
++
+ #include "linux_err.h"
+ #include "bitops.h"
+ #include "kmem.h"
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
similarity index 89%
rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 5ab5f6c729..09d191ba32 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -11,8 +11,15 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
+DEPENDS:append:libc-musl = " libexecinfo"
+LDFLAGS:append:libc-musl = " -lexecinfo"
+
+SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
+SRC_URI += "file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch"
+SRC_URI += "file://0002-ubifs-utils-journal-Include-sys-stat.h.patch"
+SRC_URI += "file://0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch"
+SRC_URI += "file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +38,8 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 # Use higher priority than corresponding BusyBox-provided applets
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.40.1


