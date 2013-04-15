Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgax-00014i-9e
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:25:08 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so2070353ead.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=3EUDGUKxbQv6W58aovyam8ts23ewrb1/oLD9/bXR7Gw=;
	b=dKAkdLk0LrMZNlaWTOjlSpHR20svyV8WNfwRBS7TJu4dI2U1Dsyj38oF17+lK/5gzC
	cMRv/x2WyRbcj3FdXaPVWeE51IqcuAST7Mh+KvO5KrQt2LKGMpDbKBcmctMHWgUtwjxv
	gQaJ2N1LOcbjpreH4+DPYS7nAYKeH7+tp2oVbsEaPiR5xP3Qbdxhx2v4aKBG2rcfF9wo
	ycl8kF8Onk9pI6hMwaAcdBIRTV4B0t+0FwsbKoX1/Nf8SIPFjDzCQrRkZN3/ai2FIiA0
	KkU6HqZFa1a8yPNPIHmmxO62TYalYs3GBz8jiodbEz60RqoOYyxwOQz6Aic+Wz3r0WmM
	CcWg==
X-Received: by 10.15.41.2 with SMTP id r2mr60434320eev.20.1366020458786;
	Mon, 15 Apr 2013 03:07:38 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id b47sm6468118eez.2.2013.04.15.03.07.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:07:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:31 +0200
Message-Id: <1366020451-2664-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQm+7D74jHM6umxv7iyZyGXkkf9T8rB4kMfeSTEkPG1U2cZJ+JW5nwAi7huaBJn+JojXmAMx
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFT][PATCH] libpng: update to 1.6.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 10:25:10 -0000

This attempts to fix [YOCTO #4060]  - connman-applet spews warnings, but with this one PNG images still don't work in weston :(

The ARM NEON option was added because the autodetection code in configure.ac is broken:

	/usr/lib/weston/weston-desktop-shell: symbol lookup error: /usr/lib/libpng16.so.16: undefined symbol: png_init_filter_functions_neon

License checksums update due to date and package version changes:

index e95d359..d86a7da 100644
--- a/LICENSE
+++ b/LICENSE

-libpng versions 1.2.6, August 15, 2004, through 1.6.0, February 14, 2013, are
+libpng versions 1.2.6, August 15, 2004, through 1.6.1, March 28, 2013, are

-February 14, 2013
+March 28, 2013

index 448fe88..0ad09eb 100644
--- a/png.h
+++ b/png.h

- * libpng version 1.6.0 - February 14, 2013
+ * libpng version 1.6.1 - March 28, 2013

- *   libpng versions 0.97, January 1998, through 1.6.0 - February 14, 2013: Glenn
+ *   libpng versions 0.97, January 1998, through 1.6.1 - March 28, 2013: Glenn

+ *    1.6.1beta01-10          16    10601  16.so.16.1[.0]
+ *    1.6.1rc01               16    10601  16.so.16.1[.0]
+ *    1.6.1                   16    10601  16.so.16.1[.0]

- * libpng versions 1.2.6, August 15, 2004, through 1.6.0, February 14, 2013, are
+ * libpng versions 1.2.6, August 15, 2004, through 1.6.1, March 28, 2013, are

- *    February 14, 2013
+ *    March 28, 2013

- *    upward through 1.6.0 are Y2K compliant.  It is my belief that
+ *    upward through 1.6.1 are Y2K compliant.  It is my belief that

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...0001-configure-lower-automake-requirement.patch | 30 ++++++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.0.bb     | 20 ---------------
 meta/recipes-multimedia/libpng/libpng_1.6.1.bb     | 22 ++++++++++++++++
 3 files changed, 52 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.0.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.1.bb

diff --git a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
new file mode 100644
index 0000000..da5df48
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
@@ -0,0 +1,30 @@
+From a4fd84bdc69e9929a1040f20ea291ee3115bf5b2 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 15 Apr 2013 11:16:20 +0200
+Subject: [PATCH] configure: lower automake requirement
+
+We're not using parallel tests in OE-core yet
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Upstream-status: Inapropriate [OE specific build hack]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1745d31..7f015fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,7 +27,7 @@ AC_CONFIG_MACRO_DIR([scripts])
+ # dist-xz requires automake 1.11 or later
+ # 1.12.2 fixes a security issue in 1.11.2 and 1.12.1
+ # 1.13 is required for parallel tests
+-AM_INIT_AUTOMAKE([1.13 foreign dist-xz color-tests silent-rules])
++AM_INIT_AUTOMAKE([1.12.2 foreign dist-xz color-tests silent-rules])
+ # The following line causes --disable-maintainer-mode to be the default to
+ # configure, this is necessary because libpng distributions cannot rely on the
+ # time stamps of the autotools generated files being correct
+-- 
+1.8.1.4
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
deleted file mode 100644
index 951e34a..0000000
--- a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "PNG Library"
-DESCRIPTION = "PNG Library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03b8ec701cb796c0ec84af22f884edef \
-                    file://png.h;beginline=207;endline=321;md5=e829cebefd08488ba5142ea5faea6821"
-DEPENDS = "zlib"
-PR = "r0"
-LIBV = "16"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
-          "
-
-SRC_URI[md5sum] = "3ee623b9a4d33bda7310a5124080b14d"
-SRC_URI[sha256sum] = "5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
-
-inherit autotools binconfig pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.1.bb b/meta/recipes-multimedia/libpng/libpng_1.6.1.bb
new file mode 100644
index 0000000..7895a6c
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "PNG Library"
+DESCRIPTION = "PNG Library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8273188b2e21c831f5a09fd9285db62f \
+                    file://png.h;beginline=207;endline=321;md5=de107fb61766e9d826943f3b6a354fc9"
+DEPENDS = "zlib"
+LIBV = "16"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+           file://0001-configure-lower-automake-requirement.patch \
+          "
+SRC_URI[md5sum] = "93fc0b0841ce2db0e6756673e22dafc3"
+SRC_URI[sha256sum] = "5ef57f8b9ef591c8504e2a8f78d31779f0c8f2b34b34d01d533360d2483c8946"
+
+inherit autotools binconfig pkgconfig
+
+# Work around missing symbols
+EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.4



