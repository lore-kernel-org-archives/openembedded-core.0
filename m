Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXw-00034j-4c
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:48:00 +0200
Received: by mail-pv0-f175.google.com with SMTP id 24so242869pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=kqviD2dmbVPwf6F8S11yZLMAacIV0CfSAT52kS+nrrc=;
	b=PKcFAIGN7elIU3iu4c5rb0t1BzfK56BhBNIBzflKezmwRtOxRKbimwtkBUyiRmFGAV
	gLSjdp1Od7JKNBuuGodc8PPtJGY7l2hBCykad3FrHXA9VX0DpD3IbgNDevPH26B6j6iO
	Ntbs6DlJ6O/sA52I90YL/1+XwLmQaaBvXdeyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=m5Fum0/XuX+nTSb9V2iNRVFrYkm1SRd0qWRxTq/4xosVykhLi6uNKfW0QLvFMrWxMs
	PlFH60eDmT2Ce70k2os05W6apwuPgJEGGxZETvzpN6Fk2D9h7SKrKeOj8LIjplTiJhXk
	wanALY5E6Z/qbegEssD4ypZ7q4BL9XFZZQ1r0=
Received: by 10.68.29.74 with SMTP id i10mr44242pbh.69.1308707058781;
	Tue, 21 Jun 2011 18:44:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm55947pbd.87.2011.06.21.18.44.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:44:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:44:07 -0700
Message-Id: <5d3332c7e2355760ff87e9d4d607ba8194961735.1308706511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
References: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1308706511.git.raj.khem@gmail.com>
References: <cover.1308706511.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] gettext-0.18.1.1: Remove unused patches
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
X-List-Received-Date: Wed, 22 Jun 2011 01:48:00 -0000

gettext-error_print_progname.patch is already applied upstream
others are unapplied.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gettext/gettext-0.18.1.1/autotools.patch       |   64 --------------------
 .../gettext-error_print_progname.patch             |   15 -----
 .../gettext/gettext-0.18.1.1/m4fix.patch           |   52 ----------------
 .../gettext-0.18.1.1/use_open_properly.patch       |   17 -----
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    1 -
 5 files changed, 0 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
deleted file mode 100644
index e4545fd..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gettext-0.17/gettext-runtime/man/Makefile.am
-===================================================================
---- gettext-0.17.orig/gettext-runtime/man/Makefile.am	2007-10-07 21:37:36.000000000 +0200
-+++ gettext-0.17/gettext-runtime/man/Makefile.am	2008-05-09 22:46:37.000000000 +0200
-@@ -158,8 +158,7 @@
- 	$(MAN2HTML) $(srcdir)/bind_textdomain_codeset.3.in | sed -e '/CreationDate:/d' > t-$@
- 	mv t-$@ $@
- 
--install-html-local:
--	$(mkdir_p) $(DESTDIR)$(htmldir)
-+install-html: installdirs-html
- 	for file in $(man_HTML); do \
- 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
- 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
-Index: gettext-0.17/gettext-tools/man/Makefile.am
-===================================================================
---- gettext-0.17.orig/gettext-tools/man/Makefile.am	2007-10-28 00:18:37.000000000 +0200
-+++ gettext-0.17/gettext-tools/man/Makefile.am	2008-05-09 22:46:37.000000000 +0200
-@@ -186,8 +186,7 @@
- 	$(MAN2HTML) `if test -f autopoint.1; then echo .; else echo $(srcdir); fi`/autopoint.1 | sed -e '/CreationDate:/d' > t-$@
- 	mv t-$@ $@
- 
--install-html-local:
--	$(mkdir_p) $(DESTDIR)$(htmldir)
-+install-html: installdirs-html
- 	for file in $(man_HTML); do \
- 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
- 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
-Index: gettext-0.17/gettext-runtime/libasprintf/configure.ac
-===================================================================
---- gettext-0.17.orig/gettext-runtime/libasprintf/configure.ac	2008-05-09 22:53:42.000000000 +0200
-+++ gettext-0.17/gettext-runtime/libasprintf/configure.ac	2008-05-09 22:53:54.000000000 +0200
-@@ -1,5 +1,5 @@
- dnl Configuration for the GNU libasprintf library
--dnl Copyright (C) 2002-2006 Free Software Foundation, Inc.
-+dnl Copyright (C) 2002-2007 Free Software Foundation, Inc.
- dnl
- dnl This program is free software: you can redistribute it and/or modify
- dnl it under the terms of the GNU General Public License as published by
-@@ -54,8 +54,7 @@
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_INLINE
- AC_TYPE_SIZE_T
--gl_AC_TYPE_LONG_LONG
--gt_TYPE_LONGDOUBLE
-+AC_TYPE_LONG_LONG_INT
- gt_TYPE_WCHAR_T
- gt_TYPE_WINT_T
- AC_CHECK_TYPE([ptrdiff_t], ,
-@@ -79,8 +78,11 @@
- AC_SUBST([ALLOCA_H])
- 
- AC_CHECK_FUNCS([snprintf vasprintf wcslen])
--AC_CHECK_DECLS([_snprintf])
-+dnl Use the _snprintf function only if it is declared (because on NetBSD it
-+dnl is defined as a weak alias of snprintf; we prefer to use the latter).
-+AC_CHECK_DECLS([_snprintf], , , [#include <stdio.h>])
- gt_PRINTF_POSIX
-+gl_EOVERFLOW
- 
- dnl Check for tools needed for formatting the documentation.
- ac_aux_dir_abs=`cd $ac_aux_dir && pwd`
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
deleted file mode 100644
index 4a1b2c6..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: gettext-0.17/gettext-tools/libgettextpo/error.h
-===================================================================
---- gettext-0.17.orig/gettext-tools/libgettextpo/error.h	2008-07-27 21:16:25.561115527 +0200
-+++ gettext-0.17/gettext-tools/libgettextpo/error.h	2008-07-27 21:16:52.454440505 +0200
-@@ -49,7 +49,7 @@
- /* If NULL, error will flush stdout, then print on stderr the program
-    name, a colon and a space.  Otherwise, error will call this
-    function without parameters instead.  */
--extern DLL_VARIABLE void (*error_print_progname) (void);
-+void (*error_print_progname) (void);
- 
- /* This variable is incremented each time `error' is called.  */
- extern DLL_VARIABLE unsigned int error_message_count;
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
deleted file mode 100644
index 34930d1..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-When I try to `./autogen.sh --quick' CVS gettext, using git Autoconf,
-things fall over like this (several instances):
-
-| gnulib-m4/openmp.m4:29: error: m4_copy: won't overwrite defined macro: 
-_AC_LANG_OPENMP(C++)
-| gnulib-m4/openmp.m4:29: the top level
-| autom4te: /usr/bin/m4 failed with exit status: 1
-| aclocal: autom4te failed with exit status: 1
-
-I'm not quite sure whether an Autoconf bug/incompatibility is involved
-here (therefore the Cc: to bug-autoconf).  m4_copy wasn't documented in
-earlier Autoconf releases, but there may still have been problematic
-semantic changes, I don't know.
-
-Anyway, the following patch seems to fix it.  OK to apply?
-
-Cheers,
-Ralf
-
-2008-12-03  Ralf Wildenhues  <[EMAIL PROTECTED]>
-
-        * m4/openmp.m4 (AC_OPENMP): Do not define with Autoconf 2.62 or
-        newer.
-
-Upstream-Status: Pending
-
-Index: gettext-0.17/gettext-tools/gnulib-m4/openmp.m4
-===================================================================
---- gettext-0.17.orig/gettext-tools/gnulib-m4/openmp.m4	2010-02-01 10:51:00.437788710 +0000
-+++ gettext-0.17/gettext-tools/gnulib-m4/openmp.m4	2010-02-01 10:51:50.697789220 +0000
-@@ -1,11 +1,13 @@
--# openmp.m4 serial 4
--dnl Copyright (C) 2006-2007 Free Software Foundation, Inc.
-+# openmp.m4 serial 5
-+dnl Copyright (C) 2006-2008 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
- 
- dnl This file can be removed once we assume autoconf >= 2.62.
- 
-+m4_version_prereq([2.62],, [
-+
- # _AC_LANG_OPENMP
- # ---------------
- # Expands to some language dependent source code for testing the presence of
-@@ -90,3 +92,5 @@
-   fi
-   AC_SUBST([OPENMP_]_AC_LANG_PREFIX[FLAGS])
- ])
-+
-+])
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
deleted file mode 100644
index a04a32d..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Index: gettext-0.17/gettext-tools/src/write-catalog.c
-===================================================================
---- gettext-0.17.orig/gettext-tools/src/write-catalog.c	2008-10-16 15:18:16.000000000 +0200
-+++ gettext-0.17/gettext-tools/src/write-catalog.c	2008-10-16 18:17:13.000000000 +0200
-@@ -220,7 +220,9 @@
-       /* Open the output file.  */
-       if (!to_stdout)
- 	{
--	  fd = open (filename, O_WRONLY | O_CREAT);
-+	  fd = open (filename, O_WRONLY | O_CREAT,
-+		    /* 0666 in portable POSIX notation: */
-+		    S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);
- 	  if (fd < 0)
- 	    {
- 	      const char *errno_description = strerror (errno);
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index f54c111..b64fbdb 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
           "
 
 SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
-                               file://gettext-error_print_progname.patch \
                                file://gnulib-uclibc-sched_param-def.patch \
                              "
 
-- 
1.7.5.1



