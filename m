Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2A4607E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:21:06 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r82so17666502wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OSzHhdpKf+rzDHQziA/VgbPeeCsg4Lg+IEMblYgh6jE=;
	b=c7rI4BbQHmIne0B2Gu5FTY22mP/wKycj7e3EYBNBlQEIZfoyLkZO11RZONlLXb7rw6
	rc/2eAhwotXucTbNtxO8iTtp2OEf5SC+HSvwoqOPljRCh1bzDP1cDOLa3IHZtBBJtV0E
	ueTRiw7V7LWvw36OvxUlqnFT0olXGnF47Tobbxw6CT1uZ/FHwEs41LZoQ0HYSShfUr4x
	DMZRlLZDeZnf3o82zBSfwutxIpO0PLWC4t3x96xenWcwPiHcU5LJ7A4Tpzkz/pP8DI8k
	3SjoRfcRxQAaZewhSb01kNM4iOnv/O+BWuXyzvlV450LPRRIz/UQdnvfaNnPhbIGEpK0
	GC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OSzHhdpKf+rzDHQziA/VgbPeeCsg4Lg+IEMblYgh6jE=;
	b=JMa/e0bkTLeSwR+XBQY7kWKm1IHFCW76DzSWyKSRbo62K7Ymo+mXaWkhMkY7mrj7Kr
	yn4g8RcSDkTeZks3+CEcEwSI3aBncTczoSmXxbvTCh06U196XSfjN3cD24ibeGbbABq4
	yNzaVQ+kTYkTd3MR5bYHATasa/79o60DnkNSdWeIO2T7COyIbepy2G4/tv0rhb8ffrBs
	S47vleMc+1cg9RxNaKQGT9no73XUjkqLOMczX5KiUU9ZlxnHLKkE3ZUNi0h/OYeaGGRo
	mM+UNd/ChNScF6mgWsLAmmcFT8lP11LPQRIqIq1Vt2rZnJNT5+Y+MZZ7zpUC5xQcObUW
	Z2LQ==
X-Gm-Message-State: ALQs6tCeEVFtJL5AZd0b9jMSBiwr2HfaVIiUAVOlcwYlTjb7cyHrSTgl
	OjaLqe+Vp/FIkRRMKAGeNFVRo8WB
X-Google-Smtp-Source: AIpwx4+aZCxtjWpdW8UgC4nSka5zWoTTalxVAxMn+81dC3QFnmDdre88uTaIxMKmgBJNltAd5Fvb3g==
X-Received: by 10.28.229.145 with SMTP id c139mr280328wmh.19.1523287266332;
	Mon, 09 Apr 2018 08:21:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n29sm1224720wmi.32.2018.04.09.08.21.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 08:21:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 16:21:03 +0100
Message-Id: <20180409152103.9556-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pixz: remove
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
X-List-Received-Date: Mon, 09 Apr 2018 15:21:06 -0000

Nothing in oe-core is using this now as xz can do multithreaded compression, so
remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 -
 ...onfigure-Detect-headers-before-using-them.patch | 51 ----------------
 ...-Use-macro-bswap_64-instead-of-__bswap_64.patch | 47 ---------------
 .../936d8068ae19d95260d3058f41dd6cf718101cd6.patch | 68 ----------------------
 meta/recipes-extended/pixz/pixz_1.0.6.bb           | 25 --------
 5 files changed, 192 deletions(-)
 delete mode 100644 meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
 delete mode 100644 meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch
 delete mode 100644 meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch
 delete mode 100644 meta/recipes-extended/pixz/pixz_1.0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f682ac63080..993d6c66a5e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -560,7 +560,6 @@ RECIPE_MAINTAINER_pn-piglit = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-pixman = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-pixz = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-pkgconf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pkgconfig = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-pm-utils = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch b/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
deleted file mode 100644
index 12bae28dc76..00000000000
--- a/meta/recipes-extended/pixz/pixz/0001-configure-Detect-headers-before-using-them.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c84480be8df6966c538d1fb67ccae2f42cc46421 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Mar 2016 07:36:54 +0000
-Subject: [PATCH 1/2] configure: Detect headers before using them
-
-Current logic does not work when system does not have
-sys/endian.h, since it tried to reuse the cached results
-from first try of detecting htole64 in sys/endian.h which is
-'no' and hence the second try to look into endian.h also
-comes out negative.
-
-So we check for header and then run the test for symbols
-and these symbols are not standard and we need to define _GNU_SOURCE
-for it to work, this issue is exposed by systems using musl e.g.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- configure.ac | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4cb56bc..5e23c50 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,12 +69,17 @@ AC_FUNC_MALLOC
- AC_FUNC_REALLOC
- AC_FUNC_STRTOD
- AC_CHECK_FUNCS([memchr memmove memset strerror strtol])
--AC_CHECK_DECLS([htole64, le64toh],
--               [],
-+AC_CHECK_HEADER([sys/endian.h],
-                [
--                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#include <endian.h>])
-+                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#define _GNU_SOURCE 1 #include <sys/endian.h>])
-                ],
--               [#include <sys/endian.h>])
-+               [], [])
-+
-+AC_CHECK_HEADER([endian.h],
-+               [
-+                 AC_CHECK_DECLS([htole64, le64toh], [], [], [#define _GNU_SOURCE 1 #include <endian.h>])
-+               ],
-+               [], [])
- 
- AC_CONFIG_FILES([Makefile
-                  src/Makefile
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch b/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch
deleted file mode 100644
index 6b615988db7..00000000000
--- a/meta/recipes-extended/pixz/pixz/0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5f3a535987bae4c3e3d9e9079c7526e399f7aecd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Mar 2016 07:42:39 +0000
-Subject: [PATCH 2/2] endian: Use macro bswap_64 instead of __bswap_64
-
-byteswap.h defines then as public APIs on all libc
-on linux including musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
- src/endian.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/endian.c b/src/endian.c
-index b7724f3..51aea58 100644
---- a/src/endian.c
-+++ b/src/endian.c
-@@ -15,6 +15,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
- #include <stdint.h>
- #ifdef __linux__
- 	#include <endian.h>
-+	#include <byteswap.h>
- #else
- 	#include <sys/endian.h>
- #endif
-@@ -23,7 +24,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
- # if __BYTE_ORDER == __LITTLE_ENDIAN
- #  define htole64(x) (x)
- # else
--#  define htole64(x) __bswap_64 (x)
-+#  define htole64(x) bswap_64 (x)
- # endif
- #endif
- 
-@@ -31,7 +32,7 @@ void xle64enc(uint8_t *d, uint64_t n) {
- # if __BYTE_ORDER == __LITTLE_ENDIAN
- #  define le64toh(x) (x)
- # else
--#  define le64toh(x) __bswap_64 (x)
-+#  define le64toh(x) bswap_64 (x)
- # endif
- #endif
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch b/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch
deleted file mode 100644
index e3489db5b8f..00000000000
--- a/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 936d8068ae19d95260d3058f41dd6cf718101cd6 Mon Sep 17 00:00:00 2001
-From: Christian Krause <kizkizzbangbang@googlemail.com>
-Date: Sat, 26 Dec 2015 14:36:17 +0100
-Subject: [PATCH] option to not build man page
-
-fixes #56
----
- configure.ac    | 23 +++++++++++++++++++----
- src/Makefile.am |  2 ++
- 2 files changed, 21 insertions(+), 4 deletions(-)
-
-Upstream-Status: Backport
-RP 2016/01/22
-
-diff --git a/configure.ac b/configure.ac
-index b437e56..4cb56bc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -20,13 +20,28 @@ AC_CHECK_FILE(
-   [src/pixz.1],
-   [],
-   [
--    AC_CHECK_PROG(A2X, a2x, a2x, [])
--    if test "x$A2X" = x ; then
--      AC_MSG_ERROR([AsciiDoc not found, not able to generate the man page.])
--    fi
-+    AC_ARG_WITH(
-+      [manpage],
-+      [  --without-manpage       don't build man page],
-+      [case ${withval} in
-+        yes) manpage=true ;;
-+        no)  manpage=false ;;
-+        *)   AC_MSG_ERROR([bad value ${withval} for --with-manpage]) ;;
-+      esac],
-+      [manpage=true]
-+    )
-   ]
- )
- 
-+AM_CONDITIONAL([MANPAGE], [test x$manpage = xtrue])
-+
-+if test x$manpage = xtrue ; then
-+  AC_CHECK_PROG(A2X, a2x, a2x, [])
-+  if test "x$A2X" = x ; then
-+    AC_MSG_ERROR([AsciiDoc not found, not able to generate the man page.])
-+  fi
-+fi
-+
- # Checks for libraries.
- AC_CHECK_LIB([m], [ceil])
- AX_PTHREAD
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 600ec90..b98f450 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -15,6 +15,7 @@ pixz_SOURCES = \
- 	read.c \
- 	write.c
- 
-+if MANPAGE
- # TODO remove when possible: This is a hack because a2x is not able to output the man pages to a
- # specific directory, only to where the source is.
- pixz.1: pixz.1.asciidoc
-@@ -26,3 +27,4 @@ man_MANS = pixz.1
- CLEANFILES = pixz.1
- 
- EXTRA_DIST = $(man_MANS) pixz.1.asciidoc
-+endif
diff --git a/meta/recipes-extended/pixz/pixz_1.0.6.bb b/meta/recipes-extended/pixz/pixz_1.0.6.bb
deleted file mode 100644
index 30325865812..00000000000
--- a/meta/recipes-extended/pixz/pixz_1.0.6.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Parallel, indexed xz compressor"
-
-DEPENDS = "xz libarchive"
-
-SRC_URI = "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f6dc5909c9a31b192f69aa397ae8df48"
-SRC_URI[sha256sum] = "02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
-
-SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch \
-            file://0001-configure-Detect-headers-before-using-them.patch \
-            file://0002-endian-Use-macro-bswap_64-instead-of-__bswap_64.patch \
-"
-UPSTREAM_CHECK_URI = "https://github.com/vasi/pixz/releases"
-
-PACKAGECONFIG[manpages] = "--with-manpage, --without-manpage, asciidoc-native"
-
-CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
-CACHED_CONFIGUREVARS += "ac_cv_file_src_pixz_1=no"
-
-inherit autotools pkgconfig manpages
-
-BBCLASSEXTEND = "native"
-- 
2.11.0


