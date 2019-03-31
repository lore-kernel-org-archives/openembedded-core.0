Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07BE46BF37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 01:01:11 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h22so5117739edw.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mBKYteuhPOop+YOAtHrJ4gmgmggfZldXxNNzq5gvvok=;
	b=ZLZq4ePXTd9oivwOvoghJFGlLm/8oR7a1OQDjNSQxaMYLBa8UgCt0rlffc3jtJaUyR
	oLD8nVmDsRh0PQccNVAwdfI48zLK+XNvgzQtS39BkSYl6x7g4ZD9FiVaNjtY74gJGrFW
	ZyCa8LQ2O9TRjc61LD/IIsMd/EVN29+kGYcR0oG9Fq/Qlch1TX9vxW9B4P8pAAmO6Ili
	FbrcDZQCG0yP4ezmFtibB8oJ7/0ELNzjcyzHRdtfK9ZzkjSPKDcLzivqUpJyd8Hhe0qy
	FJz2M0IA6FE+BCyLBFnHMbEnTSX40R8Ffne9qhXcGXfYinABQv8n5jQBDsNa0eMKENhN
	K9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mBKYteuhPOop+YOAtHrJ4gmgmggfZldXxNNzq5gvvok=;
	b=f+zF5bAKR3GjW5Sp9a+SBfUIQnwYCEw9PC/7hNynKv1qqw3Cfm4jPOtto1H6dTq0vY
	enWaoysUjpgvSKCNH/desVD/Oe2i3lbYcb/GDINvYawszrHxWUh3jE54QOp2U/a8GcIE
	4lTAA2h0tvi0uXiBLMB9igpRXsmMMGRdp/jutY66TBP3XZ9lSp08QGtLHiMD+50A2oF/
	y04jRK50OVW5XlvEw7cyTk9oa/oXh4bve/Tqz0e4W5J1BhuWiMq0gaYkR6HSWXBDK/UK
	qirZejB+cwEiXUKxTlQEBF0ea9zSiWOG3QHfWg+N7VSpMLxiT9y/OdonxLd5Q17asq3C
	hQ1A==
X-Gm-Message-State: APjAAAWiuX40KwukGyF0MxNMP2OMfbkoJfJD05NB5DHKWwllx2ZLV3Uo
	7RuUsVKhCagxQy75yVosWXO9nTNFbBc=
X-Google-Smtp-Source: APXvYqxAdT5JzLJYFo4aC1Y2mj6Ks43BtH2eHz4yvwYoZT1tEABS5fVxMB5R/EX+JDAJhIOmhkixvg==
X-Received: by 2002:a50:bd8b:: with SMTP id y11mr38128201edh.26.1553994072106; 
	Sat, 30 Mar 2019 18:01:12 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x3sm1875566ede.25.2019.03.30.18.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 18:01:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 03:01:09 +0200
Message-Id: <20190331010109.8941-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] fontconfig: update to 2.13.1
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
X-List-Received-Date: Sun, 31 Mar 2019 01:01:12 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ....c-Fix-define-for-HAVE_POSIX_FADVISE.patch | 33 -------------------
 ...cxml.c-avoid-double-free-of-filename.patch | 28 ----------------
 .../fontconfig/revert-static-pkgconfig.patch  | 12 +++----
 ...tconfig_2.12.6.bb => fontconfig_2.13.1.bb} | 14 ++++----
 4 files changed, 12 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.6.bb => fontconfig_2.13.1.bb} (81%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
deleted file mode 100644
index d9bce212f6..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ab9522177a8396a51812fdbebb6387df451a8499 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 24 Dec 2018 11:03:58 +0800
-Subject: [PATCH] src/fccache.c: Fix define for HAVE_POSIX_FADVISE
-
-Otherwise, there would be build errors in the following 2 cases:
-* define HAVE_POSIX_FADVISE
-Or:
-* undef HAVE_POSIX_FADVISE
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/fontconfig/fontconfig/commit/586e35450e9ca7c1dc647ceb9d75ac8ed08c5c16]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- fccache.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/fccache.c b/src/fccache.c
-index 6f3c68a..85cc4b4 100644
---- a/src/fccache.c
-+++ b/src/fccache.c
-@@ -700,7 +700,7 @@ FcDirCacheMapFd (FcConfig *config, int fd, struct stat *fd_stat, struct stat *di
-     {
- #if defined(HAVE_MMAP) || defined(__CYGWIN__)
- 	cache = mmap (0, fd_stat->st_size, PROT_READ, MAP_SHARED, fd, 0);
--#if (HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
-+#if defined(HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
- 	posix_fadvise (fd, 0, fd_stat->st_size, POSIX_FADV_WILLNEED);
- #endif
- 	if (cache == MAP_FAILED)
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
deleted file mode 100644
index 3ca9fde967..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a163c81ac430cdc292add200f3e6a0c048be4d7e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Oct 2017 17:40:09 +0300
-Subject: [PATCH] src/fcxml.c: avoid double free() of filename
-
-It's also freed after bail1, so no need to do it here.
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=103221]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/fcxml.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/fcxml.c b/src/fcxml.c
-index 19ce96a..edb6054 100644
---- a/src/fcxml.c
-+++ b/src/fcxml.c
-@@ -3398,7 +3398,6 @@ FcConfigParseAndLoad (FcConfig	    *config,
- 
-     fd = FcOpen ((char *) filename, O_RDONLY);
-     if (fd == -1) {
--	FcStrFree (filename);
- 	goto bail1;
-     }
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index fca1e65946..30d6423037 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -8,13 +8,13 @@ gently refuses and rightly so.
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: fontconfig-2.11.93/fontconfig.pc.in
-===================================================================
---- fontconfig-2.11.93.orig/fontconfig.pc.in
-+++ fontconfig-2.11.93/fontconfig.pc.in
+diff --git a/fontconfig.pc.in b/fontconfig.pc.in
+index 61b35fb..5bc9bab 100644
+--- a/fontconfig.pc.in
++++ b/fontconfig.pc.in
 @@ -15,4 +15,4 @@ Requires: @PKGCONFIG_REQUIRES@
  Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
  Libs: -L${libdir} -lfontconfig
- Libs.private: @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@ @LIBXML2_LIBS@
--Cflags: -I${includedir} @EXPAT_CFLAGS@ @FREETYPE_CFLAGS@ @ICONV_CFLAGS@ @LIBXML2_CFLAGS@
+ Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@
+-Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@
 +Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
similarity index 81%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
index 8fa739de24..9c7fcace43 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
@@ -14,20 +14,18 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1367;endline=1382;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1671;endline=1686;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
-DEPENDS = "expat freetype zlib gperf-native"
+DEPENDS = "expat freetype zlib gperf-native util-linux"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
-           file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
-           file://0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch \
            "
 
-SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
-SRC_URI[sha256sum] = "064b9ebf060c9e77011733ac9dc0e2ce92870b574cca2405e11f5353a683c334"
+SRC_URI[md5sum] = "690c6cb840a92fa8908cdf462d19ec66"
+SRC_URI[sha256sum] = "9f0d852b39d75fc655f9f53850eb32555394f36104a044bb2b2fc9e66dbbfa7f"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
@@ -49,7 +47,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGES =+ "fontconfig-utils"
-FILES_${PN} =+ "${datadir}/xml/*"
+FILES_${PN} =+ "${datadir}/xml/* ${datadir}/gettext/*"
 FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
 
 # Work around past breakage in debian.bbclass
@@ -58,7 +56,7 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-inherit autotools pkgconfig relative_symlinks
+inherit autotools pkgconfig relative_symlinks gettext
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
-- 
2.17.1


