Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUutS-0005fL-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:13:02 +0200
Received: by wgbdr1 with SMTP id dr1so1286265wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Qo8mXN6+fp88HK3BajQGPOQN75h8AM9hH2wgQgLvg1Q=;
	b=jtufmLZ1sq0oCQ5WxKOeYVFrsANR/6xrp3gEMGy+2OYboNJ0T+/ncTQYtT/EijCeu9
	GdKmfhI0YLEDzWNiO276IlqFMokiICkhLaeBQuy+qg9qTfk6doV+FIAAgOGVpfseybmG
	6JJXf9OD6fE4B5Ace3s70VA1n+g1L1EIosx+479SgKMak1IJD4mG7b7emC20NDp91M6c
	xQe5J2FIijuTyrsv0vkaEmhBUig89egWfo55B3bH5uKaOJbCbT9WLaAmPEGM8azKaxtv
	kazXB7JX3noun7xRpb6vW+WEKiNS999xjrQX8b20NisNo0qfh1yZD5JpsByPyVklHJYr
	8XhQ==
Received: by 10.216.135.234 with SMTP id u84mr3996804wei.108.1337238180127;
	Thu, 17 May 2012 00:03:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm12834062wia.6.2012.05.17.00.02.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:02:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 09:02:51 +0200
Message-Id: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFCv3] glib-2.0: upgrade to 2.32.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 07:13:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   56 ++++++++++----------
 .../{glib-2.0_2.32.2.bb => glib-2.0_2.32.3.bb}     |    7 ++-
 2 files changed, 32 insertions(+), 31 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.2.bb => glib-2.0_2.32.3.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
index e9b3b26..0149767 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
@@ -1,37 +1,37 @@
-Ideally there would be configureation option for this but there is not. We
-can't allow this code since it could detect the host system's libelf with
-disasterous effects when cross compiling.
+From 0040842024725c0e74f84c1719ead6c79ba94aba Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 16 May 2012 20:03:34 +0200
+Subject: [PATCH] configure: add option to disable libelf support
 
-RP 2012/5/7
+Upstream-Status: Pending
 
-Upstream-Status: Pending (would need to be made a configure option to disabe)
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
 
-Index: glib-2.32.2/configure.ac
-===================================================================
---- glib-2.32.2.orig/configure.ac	2012-05-07 08:30:04.481149925 +0000
-+++ glib-2.32.2/configure.ac	2012-05-07 08:31:02.185148588 +0000
-@@ -1816,23 +1816,7 @@
+diff --git a/configure.ac b/configure.ac
+index aa65648..1bb49bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
+ dnl ************************
  dnl *** check for libelf ***
  dnl ************************
++AC_ARG_ENABLE(libelf,
++              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
++if test "x$enable_libelf" != "xno"; then
+ 
+ PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
  
--PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
--
--if test $have_libelf = maybe; then
--  AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=no])
--  AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=no])
--  AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=no])
--  AC_CHECK_HEADER([libelf.h], , [have_libelf=no])
--
--  if test $have_libelf != no; then
--    LIBELF_LIBS=-lelf
--    have_libelf = yes
--  fi
--fi
--
--if test $have_libelf = yes; then
--  AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
--fi
-+have_libelf=no
+@@ -1835,6 +1838,7 @@ fi
+ if test $have_libelf = yes; then
+   AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
+ fi
++fi
  
  dnl ****************************************
  dnl *** platform dependent source checks ***
+-- 
+1.7.8.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
index b9b3356..c453941 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -1,7 +1,6 @@
 require glib.inc
 
 PE = "1"
-PR = "r1"
 
 DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
@@ -16,12 +15,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://nodbus.patch \
            file://nolibelf.patch \
           "
-SRC_URI[md5sum] = "5bfdb6197afb90e4dbc7b1bb98f0eae0"
-SRC_URI[sha256sum] = "b1764abf00bac96e0e93e29fb9715ce75f3583579acac40648e18771d43d6136"
+SRC_URI[md5sum] = "9bd3ac535c24b6c162be13b2c43c5adc"
+SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e40363ff4d"
 
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
+EXTRA_OECONF = "--disable-libelf"
+
 PERLPATH = "${bindir}/env perl"
 PERLPATH_virtclass-native = "/usr/bin/env perl"
 PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-- 
1.7.8.6



