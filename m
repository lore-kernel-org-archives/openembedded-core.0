Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUkYo-0001uA-JY
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 22:11:02 +0200
Received: by wibhm14 with SMTP id hm14so5264034wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 13:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4+TWbdCf/4p8BD34NBtFyysAO0otRLn26nEZEdYJzEk=;
	b=EjPkSmJUVZ+Phl+vtsDti/CG4dH+e1GlycJ5v997odB3W40NoJYIJnK6jtHYB0/1Wl
	5vdLyx5yJAIvIbait5KSdBnnVtD34AZY39t/K41OeKw5viuFhPgSlZJbVeV8cEvpd6uc
	3ECrPnUo9sMIyDPfeT0EDmkOt1hZyWLZz9tH/89PhbRCDawG1USI/8+oCA+gW8aSczvr
	Cd4RwVQ4nasCEkFclhCHgJn2TKQCOSV5gvC83gof81q0N/RmR0BCJ39pF93dFKm3fykf
	MqnH5jPillrabRnZa2G9I5ObbyoiTm1tT0XiZuzVv/7c8vo/qjCkgw1LGmsTqgHYTL/L
	Fi3w==
Received: by 10.180.91.225 with SMTP id ch1mr11241201wib.18.1337198461070;
	Wed, 16 May 2012 13:01:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f19sm12339549wiw.11.2012.05.16.13.00.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 13:01:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 22:00:54 +0200
Message-Id: <1337198454-31671-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1337198265-2910-1-git-send-email-Martin.Jansa@gmail.com>
References: <1337198265-2910-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFCv2] glib-2.0: upgrade to 2.32.3
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
X-List-Received-Date: Wed, 16 May 2012 20:11:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   56 ++++++++++----------
 .../{glib-2.0_2.32.2.bb => glib-2.0_2.32.3.bb}     |    6 ++-
 2 files changed, 32 insertions(+), 30 deletions(-)
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
index b9b3356..72db2ef 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -16,12 +16,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
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



