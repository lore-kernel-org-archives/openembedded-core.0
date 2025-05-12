Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E831C54795
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.45917.1747040640301092208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GKf/kh4z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mbjIZZPk/lacz5Vda6wMkfZ796G19Y3gHgT61we6KzI=;
  b=GKf/kh4z3GrTmvpk0T1GfCQ/ldGizXdVCUGhx9C4GCQMtbCI1E+ePiWj
   Wgn17AY4BsWdJ7BiU/K7v2QGGMGentrHInTLopySbleWvIpNhlylY+voJ
   BeKAplYS4+LYhstMz/SbMs3TtJKS+IHz4eu+nZOOByZBagdmSKRNdLnc4
   xXLHHFUNZmLhfMWEGhI/skhmaRuCvLhL8nDVpV36CIh44QU2NV4mLl4+E
   lzBi2l9NsumQQwqB1IOPVR0XIpl1FGRb6MeU/qf1qeKnv6/tCmXIUP0rN
   najKOKHhIheEeuALNy8cKzuvY2yahzOcMFlQAM8ugozwRrCTPW+nAx6ot
   Q==;
X-CSE-ConnectionGUID: HyjUt+GpSlyrPsow4tya4g==
X-CSE-MsgGUID: DvfJg1FrSH6XUB69XQCS3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178046170"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178046170"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F3D7D6F02
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFC23D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 858271A00AF;
	Mon, 12 May 2025 17:03:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/56] man-db: upgrade 2.13.0 -> 2.13.1
Date: Mon, 12 May 2025 17:03:15 +0800
Message-Id: <1747040619-7566-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216329

From: Wang Mingyu <wangmy@fujitsu.com>

0001-check-for-_nl_msg_cat_cntr-in-configure.patch
flex.patch
removed since they're included in 2.13.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ck-for-_nl_msg_cat_cntr-in-configure.patch | 61 -------------------
 meta/recipes-extended/man-db/files/flex.patch | 36 -----------
 .../{man-db_2.13.0.bb => man-db_2.13.1.bb}    |  6 +-
 3 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
 delete mode 100644 meta/recipes-extended/man-db/files/flex.patch
 rename meta/recipes-extended/man-db/{man-db_2.13.0.bb => man-db_2.13.1.bb} (92%)

diff --git a/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
deleted file mode 100644
index feef52b11c..0000000000
--- a/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ea00e32a87cc733dd5aa05cef407a5bee3e6db29 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Mar 2025 22:42:45 -0700
-Subject: [PATCH] check for _nl_msg_cat_cntr in configure
-
-_nl_msg_cat_cntr is not available in all implementations e.g. musl libintl
-does not have it, therefore add a check to detect it and use it only if
-it is found.
-
-Upstream-Status: Backport [https://gitlab.com/man-db/man-db/-/commit/7430ca617b5cee3d4420da3158382c5ffbc3e77d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac        | 9 +++++++++
- include/manconfig.h | 6 ++++--
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -404,6 +404,15 @@ AC_TYPE_PID_T
- AC_TYPE_UID_T
- AC_TYPE_SIZE_T
- 
-+dnl _nl_msg_cat_cntr is required for GNU gettext
-+AC_MSG_CHECKING([for _nl_msg_cat_cntr])
-+AC_LINK_IFELSE([AC_LANG_PROGRAM(
-+	[[#include <libintl.h>
-+	extern int _nl_msg_cat_cntr;]],
-+	[[++_nl_msg_cat_cntr;]])],
-+	AC_MSG_RESULT([yes]); AC_DEFINE([HAVE_NL_MSG_CAT_CNTR], [], [_nl_msg_cat_cntr from GNU Gettext]),
-+	AC_MSG_RESULT([no]))
-+
- # Check for pipeline library.
- PKG_CHECK_MODULES([libpipeline], [libpipeline >= 1.5.0])
- 
---- a/include/manconfig.h
-+++ b/include/manconfig.h
-@@ -24,6 +24,8 @@
- #ifndef MANCONFIG_H
- #define MANCONFIG_H
- 
-+#include "config.h"
-+
- /* STD_SECTIONS must contain all of your man hierarchy subdirectories. The
-    order is important. Manual pages will be displayed in this order. Ie
-    if "1" comes before "2", then a kill(1) will be displayed in preference to
-@@ -138,13 +140,13 @@
- #define UNLIKELY(cond) __builtin_expect ((cond), 0)
- 
- /* GNU gettext needs to know when the locale changes. This macro tells it. */
--#ifdef ENABLE_NLS
-+#ifdef HAVE_NL_MSG_CAT_CNTR
- extern int _nl_msg_cat_cntr;
- #  define locale_changed()                                                    \
- 	  do {                                                                \
- 		  ++_nl_msg_cat_cntr;                                         \
- 	  } while (0)
--#else /* !ENABLE_NLS */
-+#else /* !HAVE_NL_MSG_CAT_CNTR */
- #  define locale_changed()
- #endif /* ENABLE_NLS */
- 
diff --git a/meta/recipes-extended/man-db/files/flex.patch b/meta/recipes-extended/man-db/files/flex.patch
deleted file mode 100644
index c18be7e36a..0000000000
--- a/meta/recipes-extended/man-db/files/flex.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d3f7c160bddf5d879c74e19e4f577882e8b22559 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 22 Jan 2025 14:16:48 +0000
-Subject: [PATCH] configure: check for shipped generated sources in source
- directory
-
-The configure script fails if it can't find flex and the pregenerated
-source code isn't available, as is the case in builds from git whereas
-tarballs include the code.
-
-However this breaks with out-of-tree builds, where cwd during configure
-is the build directory not the source directory, and the pregenerated
-sources will always be inside the source directory.
-
-Upstream-Status: Submitted [https://gitlab.com/man-db/man-db/-/merge_requests/12]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7e9148fb..49a213fd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -380,7 +380,7 @@ dnl To add more decompressors just follow the scheme above.
- dnl The "noyywrap" argument is new in Autoconf 2.70, but this also works
- dnl fine with older versions that ignore the argument.
- AC_PROG_LEX([noyywrap])
--if test "$LEX" = ":" && (test ! -e src/lexgrog.c || test ! -e src/zsoelim.c)
-+if test "$LEX" = ":" && (test ! -e $srcdir/src/lexgrog.c || test ! -e $srcdir/src/zsoelim.c)
- then
- 	AC_MSG_ERROR([flex is required when building from revision control])
- fi
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.1.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.13.0.bb
rename to meta/recipes-extended/man-db/man-db_2.13.1.bb
index a0ce2150f9..f044a47f7d 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.1.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                    "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
-           file://flex.patch \
-           file://0001-check-for-_nl_msg_cat_cntr-in-configure.patch \
            file://99_mandb \
-          "
-SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
+           "
+SRC_URI[sha256sum] = "8afebb6f7eb6bb8542929458841f5c7e6f240e30c86358c1fbcefbea076c87d9"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.43.0


