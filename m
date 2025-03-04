Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39883C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:11:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.21348.1741093892874066858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a21bW7IK;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2feb9076a1cso9146110a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741093892; x=1741698692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgpuGTDv9z/9MEcSCrKDWYjUg8fLuriIHwQ00cDk1Cc=;
        b=a21bW7IKdw61OTwX9wkPUyKItEz66+aX71RgxTZ7EW5oHHOH7eC+WsRFGfsfIzznXi
         XapERyxtBBrvrpk3k7yhcaCi6sW9tYm+Gt4rUke6wlkVmI/hnRDt4T0qSyG9+psKCTBT
         lr3ozCSSL5LlOPFeoewAdKzggww0k/NYwjKkJxATPiD2VL3Jznr/fDNUH39gl75omjnR
         pNrkZUp2v3dDpul3zKXhe26DWsln1EMuL7aCVfUNSEdMdK76QNhXHrSlmfXWeBUKE4Km
         xL5dFwJ2ir64OicWE6IdZ6xaMmPAKQl1H3yl0yR7zpRcq4F0gWGDtTi4OSWJZ6reAFd/
         4VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093892; x=1741698692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgpuGTDv9z/9MEcSCrKDWYjUg8fLuriIHwQ00cDk1Cc=;
        b=s0HTWT0k+hM8DPlW10ZmVaJH+RrJLc3PjBHkfxVVq9Uimu7K0VVY/IOOXTXpNXiBMJ
         prxZOsKKIdaDq62L796EvmCHrzNlSpPM4G9Q4eXCMP503OsYMpDTSVgrc56ttxoTiUuk
         OI5I2FmIPSrEkAk77c1U8fHmAZaDTQt/0X07QlpN7lEJUUpbXZC/5NLuoBjynfxDbjVk
         kAkWEpSXdj3LA5oDJaqmbQ5iRWePjye98mlyLpAtQ/FosgCC9HB+/1G2NJi0VboF4VYk
         /ytM+EsHG63xkso+DOgX74tKvDExHdoV5V9vRjDj1A54d7Ovxf+s1Wjg7ZPug9x9pS8L
         UCGA==
X-Gm-Message-State: AOJu0Yz+suhaUnXCdRGnO375NoipV3aQEyH+hKrC892AOfP3SRS5iNA8
	TnpKCyuJw53RWkpJ8Gt5BZkEUelU24QSVsHJAGnBlDRlxe4iOygVNJQynQ==
X-Gm-Gg: ASbGncvjcbRg3LElV0QpXqtMmqYnB/uBWb2JEtnZt2J0YkbU5Ts//xQgJ7M7XnhhJsq
	wLBPokzwsCxD/XASE4OpltA8vDgyblHkPrHGv9iUMb+A4TNArUITWjrnv4cdgqq8nTK9YSbinXb
	1FOoM5i4n7gsfWHLoHGYnb8BrudCyh+15GnZGdISnTzLP5tyJImlrLPLbS9PryPSQ9iDassrmUa
	bskOj2aUjy2hNBH9omMllHo6uAbshVWg78UV4qXFfxRoe6ObJeI2l9bahz6mfMj2oXQr4EhQicT
	eZ1dLC5UHVrKrqOe+X+pxe9oa/Dyd9j23rkyGnIthQLIIl/EPHkuNVTGt+I=
X-Google-Smtp-Source: AGHT+IGrMaLQPFBSkRf6GvTc9TV3EQJDMd4HsQuWy1ndwI/84ZFiNn8qtv8fORX4s61gTWf3p+HA7g==
X-Received: by 2002:a17:90b:574c:b0:2fa:b84:b304 with SMTP id 98e67ed59e1d1-2febabdc1fdmr22895901a91.22.1741093891768;
        Tue, 04 Mar 2025 05:11:31 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7580:38c1:824a:7893])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea696d58esm11024236a91.30.2025.03.04.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:11:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	raj.khem@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4] mtd-utils: Upgrade to 2.3.0
Date: Tue,  4 Mar 2025 10:11:05 -0300
Message-Id: <20250304131105.1187410-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 13:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212282

From: Fabio Estevam <festevam@denx.de>

Upgrade to mtd-utils 2.3.0.

Details about the 2.3.0 release:

https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at/T/#u

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Applied Ross' mtd-utils patch. With this patch it is no longer
needed to move libexecinfo to the oe-core.

 ...-ubifs-utils-ubifs.h-Include-fcntl.h.patch | 53 +++++++++++++++
 ...ifs-utils-journal-Include-sys-stat.h.patch | 41 ++++++++++++
 ...-libmissing.a-in-case-execinfo.h-isn.patch | 66 +++++++++++++++++++
 ...extract_files-Include-linux-limits.h.patch | 41 ++++++++++++
 ...{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} |  6 +-
 5 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} (91%)

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
diff --git a/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch b/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
new file mode 100644
index 0000000000..b4c190d554
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
@@ -0,0 +1,66 @@
+From 52db447c94974cd946de8d9d7031b91d41ad1280 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 26 Feb 2025 18:24:00 +0000
+Subject: [PATCH 3/4] ubifs-utils: link libmissing.a in case execinfo.h isn't
+ present
+
+On musl execinfo.h doesn't exist, but ubifs-utils uses backtrace() when
+reporting errors.  This results in build failures under musl.
+
+Handily, libmissing.a already exists with a stub implementation of
+backtrace().
+
+Guard the execinfo.h include and if it isn't available instead include
+libmissing.h, and link to libmissing.a to provide backtrace() if needed.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250226182400.1723418-1-ross.burton@arm.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ ubifs-utils/Makemodule.am | 4 ++--
+ ubifs-utils/common/defs.h | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
+index 21ba0597d84a..f84569a6da44 100644
+--- a/ubifs-utils/Makemodule.am
++++ b/ubifs-utils/Makemodule.am
+@@ -72,7 +72,7 @@ mkfs_ubifs_SOURCES = \
+ 	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+ 
+ mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
+-		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
++		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
+ mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
+ 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
+ 
+@@ -90,7 +90,7 @@ fsck_ubifs_SOURCES = \
+ 	ubifs-utils/fsck.ubifs/handle_disconnected.c
+ 
+ fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
+-		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
++		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
+ fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
+ 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs \
+ 	-I$(top_srcdir)/ubifs-utils/fsck.ubifs
+diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
+index 7ff1771674d9..d5edbf67439a 100644
+--- a/ubifs-utils/common/defs.h
++++ b/ubifs-utils/common/defs.h
+@@ -13,8 +13,11 @@
+ #include <errno.h>
+ #include <time.h>
+ #include <assert.h>
++#if HAVE_EXECINFO_H
+ #include <execinfo.h>
+-
++#else
++#include "libmissing.h"
++#endif
+ #include "ubifs.h"
+ 
+ /* common.h requires the PROGRAM_NAME macro */
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
similarity index 91%
rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 5ab5f6c729..7a132a9aef 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -11,8 +11,12 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
+SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
+SRC_URI += "file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch"
+SRC_URI += "file://0002-ubifs-utils-journal-Include-sys-stat.h.patch"
+SRC_URI += "file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch"
+SRC_URI += "file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.1


