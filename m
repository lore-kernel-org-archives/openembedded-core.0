Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 51664600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 23:40:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so2766663wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 15:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jh/OYqcELN07epkJKfO+6f9b5UpiSUIGw88tZuYnDCk=;
	b=CNXQcy4NIJrrtDIQxK3ZKrob+whVxTLL1dE7DKB7Y4Rw12viuJmMJnhXIflNtvrUzt
	DmI56bDLPAwkHM+fN11G3fKxqW3SupK/OgsejIQrIJnw3Uamfl+RE0+bn/BDRyB5zQUB
	y8oeEEuOznl+7s92QH0BBAfzb1d//Th52QeFJ/W4WNtcW46X0jGoduCv0MvOCxpRKX4H
	ZdLMH6OE4Si7dEmQvzpyF2LMsi0bOxdYZFhcJ5yhr2UpK1qoCpu/TciIqW+lELo1tVxb
	9ccJJxz+Oz1W2B1Py3Y3vTezCrzb7DA890bvssu/hBmrLyc5+9EQeVcvvsJDhXYSOXCu
	aSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jh/OYqcELN07epkJKfO+6f9b5UpiSUIGw88tZuYnDCk=;
	b=UWB7J29sAElxiGFPgaS5lIUK4J2znDo530Y29hGdmNQvUpvyMGhrhvdQgoGFLqlG7c
	wy3TOu5pTiLpolgZLKJ/iU5DpUSR2YuF4pwwFxufTypS4PJofRKLRSUmSV7FozJydcql
	4ZSp5Z75pPVpHqQviyI+eOw0e37Nb6jCh0NC++XKY3W95bfMzTUEpvi2K03IVnzCd0wv
	VlBDMcx5TfFwi3wmMx+MQ9aQHb/Ob35RLP8KIrefZhiIMfaZvLPK2ZhrDt4pttNico07
	PucTSRHpKLoP73ZjEYYWBXR4lssN3Bq6jJxSkFeN+uI+kozCzOO9PbkE4Re08OkUi/l7
	FzUg==
X-Gm-Message-State: AA+aEWYthzPM3qo1oWnTZ8DUVw6JEFqERpYgU+i4XwrGXp+vZBCacmN5
	8DXT4IrfvbiHObYGVnfmLQtIHV/8J40=
X-Google-Smtp-Source: AFSGD/WbLRpY1td3qiPN904sA1Jv2ayBjE/czM7UW1j2F3kvO1dQxbYC3waxcJjm+KeozX+ZjVDQbw==
X-Received: by 2002:a1c:6382:: with SMTP id
	x124-v6mr237325wmb.145.1544139618514; 
	Thu, 06 Dec 2018 15:40:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y13sm947866wrw.85.2018.12.06.15.40.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Dec 2018 15:40:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2018 23:40:13 +0000
Message-Id: <20181206234013.5634-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libart-lgpl: remove
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
X-List-Received-Date: Thu, 06 Dec 2018 23:40:18 -0000

This is very dead, and nothing in oe-core or meta-oe depends on it anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../libart_lgpl-2.3.21-crosscompile.patch          | 84 ----------------------
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     | 22 ------
 3 files changed, 107 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch
 delete mode 100644 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 623be6219b2..c66ad878c4a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -281,7 +281,6 @@ RECIPE_MAINTAINER_pn-liba52 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libaio = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-libart-lgpl = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libassuan = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libatomic-ops = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch b/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch
deleted file mode 100644
index 0261f58c909..00000000000
--- a/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Taken from portage
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From e1443c945a4cf67096d8c27721aadd7368382b3f Mon Sep 17 00:00:00 2001
-From: Gilles Dartiguelongue <eva@gentoo.org>
-Date: Tue, 6 Apr 2010 15:22:25 +0200
-Subject: [PATCH 2/2] gentoo: use ISO types for fixed type size
-
----
- Makefile.am  |   11 ++---------
- art_config.h |    5 +++++
- configure.in |   10 ----------
- 3 files changed, 7 insertions(+), 19 deletions(-)
- create mode 100644 art_config.h
-
-diff --git a/Makefile.am b/Makefile.am
-index 95952da..6aa2fe3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,13 +2,6 @@ check_PROGRAMS = testart testuta
- 
- bin_SCRIPTS = \
- 	libart2-config
--	
--noinst_SCRIPTS = gen_art_config.sh
--
--BUILT_SOURCES = art_config.h
--
--art_config.h:
--	./gen_art_config.sh > art_config.h
- 
- EXTRA_DIST = 			\
- 	libart.def		\
-@@ -173,5 +166,5 @@ install-data-local: install-ms-lib install-libtool-import-lib
- 
- uninstall-local: uninstall-ms-lib uninstall-libtool-import-lib
- 
--CLEANFILES = $(BUILT_SOURCES) $(bin_SCRIPTS)
--DISTCLEANFILES = $(BUILT_SOURCES) $(bin_SCRIPTS)
-+CLEANFILES = $(bin_SCRIPTS)
-+DISTCLEANFILES = $(bin_SCRIPTS)
-diff --git a/art_config.h b/art_config.h
-new file mode 100644
-index 0000000..5985f1f
---- a/art_config.h
-+++ b/art_config.h
-@@ -0,0 +1,5 @@
-+#include <stdint.h>
-+
-+typedef uint8_t art_u8;
-+typedef uint16_t art_u16;
-+typedef uint32_t art_u32;
-diff --git a/configure.in b/configure.in
-index e4804f7..ddcac4f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -92,15 +92,6 @@ AC_FUNC_ALLOCA
- 
- AC_C_BIGENDIAN
- 
--AC_CHECK_SIZEOF(char)
--AC_SUBST(ART_SIZEOF_CHAR, $ac_cv_sizeof_char)
--AC_CHECK_SIZEOF(short)
--AC_SUBST(ART_SIZEOF_SHORT, $ac_cv_sizeof_short)
--AC_CHECK_SIZEOF(int)
--AC_SUBST(ART_SIZEOF_INT, $ac_cv_sizeof_int)
--AC_CHECK_SIZEOF(long)
--AC_SUBST(ART_SIZEOF_LONG, $ac_cv_sizeof_long)
--
- AC_CONFIG_FILES([
- libart-features.h
- Makefile
-@@ -109,6 +100,5 @@ libart-2.0-uninstalled.pc
- libart-zip])
- 
- AC_CONFIG_FILES([libart-config],[chmod +x libart-config])
--AC_CONFIG_FILES([gen_art_config.sh],[chmod +x gen_art_config.sh])
- 
- AC_OUTPUT
--- 
-1.7.0.4
-
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
deleted file mode 100644
index 95581b297c5..00000000000
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Library of functions for 2D graphics"
-SECTION = "x11/gnome"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-PR = "r2"
-
-# can't use gnome.oeclass due to _ in filename
-SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
-           file://libart_lgpl-2.3.21-crosscompile.patch \
-          "
-
-SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
-SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
-
-inherit autotools pkgconfig
-
-DEPENDS = ""
-
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dev += "${bindir}/libart2-config"
-
-S = "${WORKDIR}/libart_lgpl-${PV}"
-- 
2.11.0


