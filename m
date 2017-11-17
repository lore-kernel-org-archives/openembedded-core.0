Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8123778852
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 20:25:00 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b189so8589997wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Y9zgE4s1Xagxu8DX9naKVF73FDULimnbYdzbAeahS6U=;
	b=lEPKRgNCwvoQrjL5lsCF9DkV1Os5NDG25b0dibX+s3/nSAwslyJXyCXX+r/MDKBcA1
	eCX//UJwG6pl1tr69goXqcCc54kL8viixQGaZGnB6l2B70ki3ttLWSqD5LpUo9SeJpLH
	Xbt0LSx4FewJrB3hP8qDzRwmenTgyWCcnjuO0o+6LdGKixtHwIQvgjz8qbfNa/h92hXz
	0XCkIB/giDlinx8TFDENbXqxPCFlNUNU2tdmdkBRMyIxt4aUdWUjwjWCBdOGlISQ6SuD
	vWK2mJvvjN7I7AYlq7A7zorVe5v0oid5SW+h3LQ7pbfD9vlwl7E62eyoHA6LWleMbRpo
	SBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y9zgE4s1Xagxu8DX9naKVF73FDULimnbYdzbAeahS6U=;
	b=sI8z9+Xv3SUZGglqrt3lFgentImUXW9WcbUXHN81mcLrJnEOGALMLkIWve64B2VtUu
	IFUGAAqmv8McdfhSbQTBRSdw0KeCcyM9mtwobB4khDmWXWun4ne+ioSpENqqA04gwSZg
	2jJthdAPs/X9eTNzbR8cnpq91cO6hGmc0VL39A//2a+MVqIzsf2AwRd4AlQTcrXADmC4
	7/n3ZF0LR6r/0Dd9hfGvqHXGaN9OXKaxDzxeVcQ/FSLA2VT9N7d6Ezu5xOt9xwQEVFRC
	IXsz4ggF8k7mnlJCFAGblZ4OWr9sTf/lle9AWXj3X0PFq6PESlbTSLE/YpKGjx56LV3x
	yb8Q==
X-Gm-Message-State: AJaThX4QbFVaNqiZ3t3mkHyuOWWf31hlxzJHw+AikdMsmBXQHIjmwoRp
	vr9R8hw6uR2f+SMRdkPJqlw5dbmo
X-Google-Smtp-Source: AGs4zMYFGtJbJxuI8v6jqVn8/+HkzVPOrUPtZzOb2iR2Rw0LcW7tYOp+hE+NTqHs31j2s1vkaEjIYA==
X-Received: by 10.28.66.25 with SMTP id p25mr4662354wma.154.1510950300706;
	Fri, 17 Nov 2017 12:25:00 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r14sm9537255wrb.43.2017.11.17.12.24.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 12:24:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 20:24:56 +0000
Message-Id: <20171117202456.10196-1-ross.burton@intel.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 20:25:00 -0000

Upstream has fixed their use of aclocal.m4 vs acinclude.m4, so now we can remove
some hacks that were previously required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../e2fsprogs/e2fsprogs/acinclude.m4               | 135 ---------------------
 .../e2fsprogs/e2fsprogs/mkdir.patch                |  18 ---
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb |   7 +-
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index 00093cc20c5..bf12d701241 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
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
             file://reproducible-doc.patch \
@@ -26,9 +24,6 @@ EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enabl
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
-do_configure_prepend () {
-	cp ${WORKDIR}/acinclude.m4 ${S}/
-}
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.11.0


