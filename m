Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B5FB671C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 21:37:22 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id i11so2214656wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HB0oAAVIHrk3EtLdJDod1VwcKVsNDIWDNgbwnr1cYYg=;
	b=PFQ40PNDJqyAf2dZQ2AL7293AKCaOKce+lggksnDSIqEj+e1nojRvNDaoU4GsvZiON
	arYAA6ZI5v9P8kii7dULmTD+6dDmxJ2xPRh2VV2lEzpLlcnldhs6GSE7IHG2SBg0abEC
	1TBSCz73UgZwfpezwCc/pAbytNLI/54JZn+8BwAShwJtD418OGGoL19rhLKrx184LZSG
	WCh4lOOMw7iDiWxxxUbGiu7szjA+0uT7T6uRgm5k9S+Z/XAAnSzSncSmiqunI/hwRkoW
	Uiar0OAlwGp+nlupU+z647RE72W7SETBP3PbLnV2sNQDaiaHW2QyqJopHWwGH4a/x7Is
	X66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HB0oAAVIHrk3EtLdJDod1VwcKVsNDIWDNgbwnr1cYYg=;
	b=XedBtf0JoH7KaSzaw3QoR0evdy8bNuoEKl3j5aQZKnqiDPRmkPi94HFdQWJAJ5sQP4
	n/l9pvWEKYq4nvxZg0UdK5nER1Blj8Q6ME3oeVN8OoYq5NB6euXnZaBiva5FClinQCEX
	Nd8f1Mw88HePrm7sP1BGFHXR29/54DOJ7whIJAGNuGJeQaBN5+UT+b4svdmtZyqHbNJk
	u8c7i0q++mRHf80T+8QDS/BmiqInrWg0hJzCHQgy/9IhOXrGEFGg57KgumkBGxZdLTPh
	znWy6dqkAMe8HIF5pvuxQsG6h5GXtLj0rUT8pBB6wV2yVMkgnNTAb9OAXuXh9X6CDbjN
	toIA==
X-Gm-Message-State: AJaThX7ehMjoNwnYaOeCo2aKIDKXLxjUntLyStGJp5lkYLYaot8Px8KP
	yuhqQVOkkHPFAYUUUjPSaDD8NKm8
X-Google-Smtp-Source: AGs4zMZtLtmXEhBZSENZONQsbJVwQFj2sQoNyqyBWpkqXSIg6N4H5SkDcYvLEjKZSgcfqhK7lQ0n3w==
X-Received: by 10.28.59.133 with SMTP id i127mr852641wma.30.1511905043078;
	Tue, 28 Nov 2017 13:37:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f56sm210160wra.75.2017.11.28.13.37.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 13:37:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 21:37:20 +0000
Message-Id: <20171128213720.18606-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] e2fsprogs: remove aclocal/acinclude dance
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
X-List-Received-Date: Tue, 28 Nov 2017 21:37:23 -0000

Upstream has fixed their use of aclocal.m4 vs acinclude.m4, so now we can remove
some hacks that were previously required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../e2fsprogs/e2fsprogs/acinclude.m4               | 135 ---------------------
 .../e2fsprogs/e2fsprogs/mkdir.patch                |  18 ---
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb |   7 +-
 3 files changed, 1 insertion(+), 159 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
deleted file mode 100644
index c0bd7dbdee9..00000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
+++ /dev/null
@@ -1,135 +0,0 @@
-# Extracted from the package's shipped aclocal.m4. Custom macros should be in
-# acinclude.m4 so running aclocal doesn't blow them away.
-#
-# Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-# from http://autoconf-archive.cryp.to/ax_tls.html
-#
-# This was licensed under the GPL with the following exception:
-#
-# As a special exception, the respective Autoconf Macro's copyright
-# owner gives unlimited permission to copy, distribute and modify the
-# configure scripts that are the output of Autoconf when processing
-# the Macro. You need not follow the terms of the GNU General Public
-# License when using or distributing such scripts, even though
-# portions of the text of the Macro appear in them. The GNU General
-# Public License (GPL) does govern all other use of the material that
-# constitutes the Autoconf Macro.
-#
-# This special exception to the GPL applies to versions of the
-# Autoconf Macro released by the Autoconf Macro Archive. When you make
-# and distribute a modified version of the Autoconf Macro, you may
-# extend this special exception to the GPL to apply to your modified
-# version as well.
-#
-AC_DEFUN([AX_TLS], [
-  AC_MSG_CHECKING(for thread local storage (TLS) class)
-  AC_CACHE_VAL(ac_cv_tls, [
-    ax_tls_keywords="__thread __declspec(thread) none"
-    for ax_tls_keyword in $ax_tls_keywords; do
-       case $ax_tls_keyword in
-          none) ac_cv_tls=none ; break ;;
-          *)
-             AC_TRY_COMPILE(
-                [#include <stdlib.h>
-                 static void
-                 foo(void) {
-                 static ] $ax_tls_keyword [ int bar;
-                 exit(1);
-                 }],
-                 [],
-                 [ac_cv_tls=$ax_tls_keyword ; break],
-                 ac_cv_tls=none
-             )
-          esac
-    done
-])
-
-  if test "$ac_cv_tls" != "none"; then
-    dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS storage class define it to that here])
-    AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler supports a TLS storage class define it to that here])
-  fi
-  AC_MSG_RESULT($ac_cv_tls)
-])
-
-# ===========================================================================
-#         http://www.nongnu.org/autoconf-archive/check_gnu_make.html
-# ===========================================================================
-#
-# SYNOPSIS
-#
-#   CHECK_GNU_MAKE()
-#
-# DESCRIPTION
-#
-#   This macro searches for a GNU version of make. If a match is found, the
-#   makefile variable `ifGNUmake' is set to the empty string, otherwise it
-#   is set to "#". This is useful for including a special features in a
-#   Makefile, which cannot be handled by other versions of make. The
-#   variable _cv_gnu_make_command is set to the command to invoke GNU make
-#   if it exists, the empty string otherwise.
-#
-#   Here is an example of its use:
-#
-#   Makefile.in might contain:
-#
-#       # A failsafe way of putting a dependency rule into a makefile
-#       $(DEPEND):
-#               $(CC) -MM $(srcdir)/*.c > $(DEPEND)
-#
-#       @ifGNUmake@ ifeq ($(DEPEND),$(wildcard $(DEPEND)))
-#       @ifGNUmake@ include $(DEPEND)
-#       @ifGNUmake@ endif
-#
-#   Then configure.in would normally contain:
-#
-#       CHECK_GNU_MAKE()
-#       AC_OUTPUT(Makefile)
-#
-#   Then perhaps to cause gnu make to override any other make, we could do
-#   something like this (note that GNU make always looks for GNUmakefile
-#   first):
-#
-#       if  ! test x$_cv_gnu_make_command = x ; then
-#               mv Makefile GNUmakefile
-#               echo .DEFAULT: > Makefile ;
-#               echo \  $_cv_gnu_make_command \$@ >> Makefile;
-#       fi
-#
-#   Then, if any (well almost any) other make is called, and GNU make also
-#   exists, then the other make wraps the GNU make.
-#
-# LICENSE
-#
-#   Copyright (c) 2008 John Darrington <j.darrington@elvis.murdoch.edu.au>
-#
-#   Copying and distribution of this file, with or without modification, are
-#   permitted in any medium without royalty provided the copyright notice
-#   and this notice are preserved.
-#
-# Note: Modified by Ted Ts'o to add @ifNotGNUMake@
-
-AC_DEFUN(
-        [CHECK_GNU_MAKE], [ AC_CACHE_CHECK( for GNU make,_cv_gnu_make_command,
-                _cv_gnu_make_command='' ;
-dnl Search all the common names for GNU make
-                for a in "$MAKE" make gmake gnumake ; do
-                        if test -z "$a" ; then continue ; fi ;
-                        if  ( sh -c "$a --version" 2> /dev/null | grep GNU  2>&1 > /dev/null ) ;  then
-                                _cv_gnu_make_command=$a ;
-                                break;
-                        fi
-                done ;
-        ) ;
-dnl If there was a GNU version, then set @ifGNUmake@ to the empty string, '#' otherwise
-        if test  "x$_cv_gnu_make_command" != "x"  ; then
-                ifGNUmake='' ;
-                ifNotGNUmake='#' ;
-        else
-                ifGNUmake='#' ;
-                ifNotGNUmake='' ;
-                AC_MSG_RESULT("Not found");
-        fi
-        AC_SUBST(ifGNUmake)
-        AC_SUBST(ifNotGNUmake)
-] )
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
deleted file mode 100644
index 2a3aeff6136..00000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index c1fe224..f5ac628 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1374,7 +1374,8 @@ if test -n "$WITH_DIET_LIBC" ; then
- 	INCLUDES="$INCLUDES -D_REENTRANT"
- fi
- AC_SUBST(INCLUDES)
--AM_MKINSTALLDIRS
-+MKINSTALLDIRS="mkdir -p"
-+AC_SUBST(MKINSTALLDIRS)
- dnl
- dnl Build CFLAGS
- dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
index 33a991883c2..168eecfe8e6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
@@ -1,11 +1,9 @@
 require e2fsprogs.inc
 
-SRC_URI += "file://acinclude.m4 \
-            file://remove.ldconfig.call.patch \
+SRC_URI += "file://remove.ldconfig.call.patch \
             file://quiet-debugfs.patch \
             file://run-ptest \
             file://ptest.patch \
-            file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
@@ -25,9 +23,6 @@ EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enabl
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
-do_configure_prepend () {
-	cp ${WORKDIR}/acinclude.m4 ${S}/
-}
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.11.0


