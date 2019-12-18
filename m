Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4424D7FF23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z7so2508092wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=07XJwkjCz7TzxFaIRRe9rtos86kqiMZS79wEaFv3XbM=;
	b=vC5YmSVFYyLyghjHmk0vrbslBNCORXOJXKPjg7E7IzTMeZZLkFjRp4gn2YqxlCtN1I
	V7Sl1ZKqiLZ48nroXFonCRFZkiZAZKpKIEa0WoMrLpHefNsQBSUJr7g9svrceypzzci7
	AdDSBGwslEq3Tia+wCPSxlZl344AMAUDn0hFy11ICfN1gXq4upYLYb+YGNLws2CCqxKY
	NVHRPNHXLGlcgnmy4c77nE09+qNcpIzNp2IWvxtZpmPFGEECovdb4i0qS6TKFL5d0tt2
	7n89rwEm/nWo+covOTyg4+LbSPCMO8Zng2HEr5dgnrYA8hWor76KOZYAgHUNz2ZCkVMq
	KSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=07XJwkjCz7TzxFaIRRe9rtos86kqiMZS79wEaFv3XbM=;
	b=kOoLtC24SIuyZc5Rlbxzb09UWOWdc5tt0TGz4bXQqgPCVUxD55pR3HvFN960WZBHIm
	Ssb8bc/QFBleg2V/wEk1mQrd6PvIb3Zf0aP/NAKqO7/SE3PBfFJKLmYqq9IMgMxSS9nz
	hd2PHfYjL0MyIprrM+hc/4/2HGc1nMrK9dqT93KJXH2AtXEk13aF+mjZVGzLCueLNOjO
	bYIfLp7/gFsifCn+MiuOd7fJUX5Ar8GDsfuylYNZ6zYdJkxqdm21cx2tlOvgs4sEUopA
	argb5hNldMF9HyFIk1bHh7SXN6uvFBOD1tkBSI1Jxm1Z/KMF+meqRvOuVEQwytGVL503
	77SA==
X-Gm-Message-State: APjAAAULy973uaaMqaeJsG/bxsyDHGDEpqoAqj0VhMirFZ10yTd85mNz
	YeU0X0sceQs/M9oWzZ8Fh3BfhceQqpM=
X-Google-Smtp-Source: APXvYqwSGyxaayqXFb72Xa0PwpJTPD+SDnEmYE6QnXqPjzDCYhJRr0vc5jGrVq+omclz/6jGIISyRw==
X-Received: by 2002:a5d:4807:: with SMTP id l7mr3386390wrq.64.1576679885585;
	Wed, 18 Dec 2019 06:38:05 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:35 +0100
Message-Id: <20191218143758.129308-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/25] gettext: update to 0.20.1
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:07 -0000

License-Update: URLs changed from http to https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gettext-0.19.8.1/fix-CVE-2018-18751.patch | 141 ----
 .../gettext/gettext-0.19.8.1/parallel.patch   |  23 -
 .../gettext-0.19.8.1/use-pkgconfig.patch      | 321 --------
 .../add-with-bisonlocaledir.patch             |   0
 ...nt.c-timsort.h-fix-formatting-issues.patch |  30 +-
 .../gettext/gettext-0.20.1/parallel.patch     |  32 +
 .../run-ptest                                 |   0
 .../serial-tests-config.patch                 |  26 +-
 .../gettext-0.20.1/use-pkgconfig.patch        | 713 ++++++++++++++++++
 ...{gettext_0.19.8.1.bb => gettext_0.20.1.bb} |  23 +-
 10 files changed, 775 insertions(+), 534 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
 rename meta/recipes-core/gettext/{gettext-0.19.8.1 => gettext-0.20.1}/add-with-bisonlocaledir.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.19.8.1 => gettext-0.20.1}/cr-statement.c-timsort.h-fix-formatting-issues.patch (68%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
 rename meta/recipes-core/gettext/{gettext-0.19.8.1 => gettext-0.20.1}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.19.8.1 => gettext-0.20.1}/serial-tests-config.patch (75%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
 rename meta/recipes-core/gettext/{gettext_0.19.8.1.bb => gettext_0.20.1.bb} (94%)

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
deleted file mode 100644
index 6dfe200d654..00000000000
--- a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=dce3a16]
-CVE: CVE-2018-18751
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From dce3a16e5e9368245735e29bf498dcd5e3e474a4 Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Thu, 15 Sep 2016 13:57:24 +0200
-Subject: [PATCH] xgettext: Fix crash with *.po file input
-
-When xgettext was given two *.po files with the same msgid_plural, it
-crashed with double-free.  Problem reported by Davlet Panech in:
-http://lists.gnu.org/archive/html/bug-gettext/2016-09/msg00001.html
-* gettext-tools/src/po-gram-gen.y: Don't free msgid_pluralform after
-calling do_callback_message, assuming that it takes ownership.
-* gettext-tools/src/read-catalog.c (default_add_message): Free
-msgid_plural after calling message_alloc.
-* gettext-tools/tests/xgettext-po-2: New file.
-* gettext-tools/tests/Makefile.am (TESTS): Add new test.
----
- gettext-tools/src/po-gram-gen.y   | 13 ++++-----
- gettext-tools/src/read-catalog.c  |  2 ++
- gettext-tools/tests/Makefile.am   |  2 +-
- gettext-tools/tests/xgettext-po-2 | 55 +++++++++++++++++++++++++++++++++++++++
- 4 files changed, 63 insertions(+), 9 deletions(-)
- create mode 100755 gettext-tools/tests/xgettext-po-2
-
-diff --git a/gettext-tools/src/po-gram-gen.y b/gettext-tools/src/po-gram-gen.y
-index becf5e6..4428e77 100644
---- a/gettext-tools/src/po-gram-gen.y
-+++ b/gettext-tools/src/po-gram-gen.y
-@@ -221,14 +221,11 @@ message
-                   check_obsolete ($1, $3);
-                   check_obsolete ($1, $4);
-                   if (!$1.obsolete || pass_obsolete_entries)
--                    {
--                      do_callback_message ($1.ctxt, string2, &$1.pos, $3.string,
--                                           $4.rhs.msgstr, $4.rhs.msgstr_len, &$4.pos,
--                                           $1.prev_ctxt,
--                                           $1.prev_id, $1.prev_id_plural,
--                                           $1.obsolete);
--                      free ($3.string);
--                    }
-+                    do_callback_message ($1.ctxt, string2, &$1.pos, $3.string,
-+                                         $4.rhs.msgstr, $4.rhs.msgstr_len, &$4.pos,
-+                                         $1.prev_ctxt,
-+                                         $1.prev_id, $1.prev_id_plural,
-+                                         $1.obsolete);
-                   else
-                     {
-                       free_message_intro ($1);
-diff --git a/gettext-tools/src/read-catalog.c b/gettext-tools/src/read-catalog.c
-index 571d18e..6af6d20 100644
---- a/gettext-tools/src/read-catalog.c
-+++ b/gettext-tools/src/read-catalog.c
-@@ -397,6 +397,8 @@ default_add_message (default_catalog_reader_ty *this,
-          appropriate.  */
-       mp = message_alloc (msgctxt, msgid, msgid_plural, msgstr, msgstr_len,
-                           msgstr_pos);
-+      if (msgid_plural != NULL)
-+        free (msgid_plural);
-       mp->prev_msgctxt = prev_msgctxt;
-       mp->prev_msgid = prev_msgid;
-       mp->prev_msgid_plural = prev_msgid_plural;
-diff --git a/gettext-tools/tests/Makefile.am b/gettext-tools/tests/Makefile.am
-index 23b09b1..0dfb4d8 100644
---- a/gettext-tools/tests/Makefile.am
-+++ b/gettext-tools/tests/Makefile.am
-@@ -95,7 +95,7 @@ TESTS = gettext-1 gettext-2 gettext-3 gettext-4 gettext-5 gettext-6 gettext-7 \
- 	xgettext-perl-1 xgettext-perl-2 xgettext-perl-3 xgettext-perl-4 \
- 	xgettext-perl-5 xgettext-perl-6 xgettext-perl-7 xgettext-perl-8 \
- 	xgettext-php-1 xgettext-php-2 xgettext-php-3 xgettext-php-4 \
--	xgettext-po-1 \
-+	xgettext-po-1 xgettext-po-2 \
- 	xgettext-properties-1 \
- 	xgettext-python-1 xgettext-python-2 xgettext-python-3 \
- 	xgettext-python-4 \
-diff --git a/gettext-tools/tests/xgettext-po-2 b/gettext-tools/tests/xgettext-po-2
-new file mode 100755
-index 0000000..c4bd9d0
---- /dev/null
-+++ b/gettext-tools/tests/xgettext-po-2
-@@ -0,0 +1,55 @@
-+#! /bin/sh
-+. "${srcdir=.}/init.sh"; path_prepend_ . ../src
-+
-+# Test PO extractors with multiple input files.
-+
-+cat <<EOF > xg-po-2-1.po
-+msgid "first msgid"
-+msgid_plural "first msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+
-+msgid "second msgid"
-+msgid_plural "second msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+EOF
-+
-+cat <<EOF > xg-po-2-2.po
-+msgid "third msgid"
-+msgid_plural "third msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+
-+msgid "second msgid"
-+msgid_plural "second msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+EOF
-+
-+: ${XGETTEXT=xgettext}
-+${XGETTEXT} --omit-header xg-po-2-1.po xg-po-2-2.po -o xg-po-2.tmp.po || Exit 1
-+LC_ALL=C tr -d '\r' < xg-po-2.tmp.po > xg-po-2.po || Exit 1
-+
-+cat <<EOF > xg-po-2.ok
-+msgid "first msgid"
-+msgid_plural "first msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+
-+msgid "second msgid"
-+msgid_plural "second msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+
-+msgid "third msgid"
-+msgid_plural "third msgid (plural)"
-+msgstr[0] ""
-+msgstr[1] ""
-+EOF
-+
-+: ${DIFF=diff}
-+${DIFF} xg-po-2.ok xg-po-2.po
-+result=$?
-+
-+exit $result
--- 
-1.9.1
-
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
deleted file mode 100644
index c8e2c94af0e..00000000000
--- a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-instal libgettextlib.a before removing it
-
-In a multiple job build, Makefile can simultaneously
-be installing and removing libgettextlib.a.  We serialize
-the operations.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
---- a/gettext-tools/gnulib-lib/Makefile.am
-+++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -57,6 +57,10 @@ endif
- # Rules generated and collected by gnulib-tool.
- include Makefile.gnulib
- 
-+# defined in Makefile.gnulib but missing this dependency
-+#
-+install-exec-clean: install-libLTLIBRARIES
-+
- # Which classes to export from the shared library.
- MOOPPFLAGS += --dllexport=styled_ostream
- 
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
deleted file mode 100644
index 6156a153f74..00000000000
--- a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
+++ /dev/null
@@ -1,321 +0,0 @@
-For reasons which I just can't fathom gnulib doesn't use the expected tools to
-find libraries but badly reinvents the wheel.  This will trivially lead to host
-contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
-canonicalisation resulting in relative paths).
-
-Simply delete all the crazy, and replace with a single call to pkg-config.
-
-Upstream-Status: Inappropriate (upstream still refuse to consider pkg-config)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/gnulib-local/m4/libcroco.m4 b/gnulib-local/m4/libcroco.m4
-index f79ea82f1..1f67274db 100644
---- a/gettext-tools/gnulib-m4/libcroco.m4
-+++ b/gettext-tools/gnulib-m4/libcroco.m4
-@@ -8,6 +8,7 @@ dnl From Bruno Haible.
- 
- AC_DEFUN([gl_LIBCROCO],
- [
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-   dnl libcroco depends on libglib.
-   AC_REQUIRE([gl_LIBGLIB])
- 
-@@ -23,65 +24,10 @@ AC_DEFUN([gl_LIBCROCO],
-   LTLIBCROCO=
-   INCCROCO=
-   if test "$gl_cv_libcroco_use_included" != yes; then
--    dnl Figure out whether we can use a preinstalled libcroco-0.6, or have to
--    dnl use the included one.
--    AC_CACHE_VAL([gl_cv_libcroco], [
--      gl_cv_libcroco=no
--      gl_cv_LIBCROCO=
--      gl_cv_LTLIBCROCO=
--      gl_cv_INCCROCO=
--      gl_save_LIBS="$LIBS"
--      dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6 and
--      dnl INCCROCO_0_6 accordingly.
--      dnl Don't use croco-0.6-config nor pkg-config, since it doesn't work when
--      dnl cross-compiling or when the C compiler in use is different from the
--      dnl one that built the library.
--      AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
--      LIBS="$gl_save_LIBS $LIBCROCO_0_6"
--      AC_TRY_LINK([#include <libcroco-config.h>],
--        [const char *version = LIBCROCO_VERSION; return !version;],
--        [gl_cv_libcroco=yes
--         gl_cv_LIBCROCO="$LIBCROCO_0_6"
--         gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
--        ])
--      if test "$gl_cv_libcroco" != yes; then
--        gl_save_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
--        AC_TRY_LINK([#include <libcroco-config.h>],
--          [const char *version = LIBCROCO_VERSION; return !version;],
--          [gl_cv_libcroco=yes
--           gl_cv_LIBCROCO="$LIBCROCO_0_6"
--           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
--           gl_cv_INCCROCO="$INCCROCO_0_6"
--          ])
--        if test "$gl_cv_libcroco" != yes; then
--          dnl Often the include files are installed in
--          dnl /usr/include/libcroco-0.6/libcroco.
--          AC_TRY_LINK([#include <libcroco-0.6/libcroco/libcroco-config.h>],
--            [const char *version = LIBCROCO_VERSION; return !version;],
--            [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
--             libcroco_include_dir=`echo "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
--             if test -d "$libcroco_include_dir"; then
--               gl_cv_libcroco=yes
--               gl_cv_LIBCROCO="$LIBCROCO_0_6"
--               gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
--               gl_cv_INCCROCO="-I$libcroco_include_dir"
--             fi
--            ])
--        fi
--        CPPFLAGS="$gl_save_CPPFLAGS"
--      fi
--      LIBS="$gl_save_LIBS"
--    ])
--    AC_MSG_CHECKING([for libcroco])
--    AC_MSG_RESULT([$gl_cv_libcroco])
--    if test $gl_cv_libcroco = yes; then
--      LIBCROCO="$gl_cv_LIBCROCO"
--      LTLIBCROCO="$gl_cv_LTLIBCROCO"
--      INCCROCO="$gl_cv_INCCROCO"
--    else
--      gl_cv_libcroco_use_included=yes
--    fi
-+    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
-+    LIBCROCO=$CROCO_LIBS
-+    LTLIBCROCO=$CROCO_LIBS
-+    INCCROCO=$CROCO_CFLAGS
-   fi
-   AC_SUBST([LIBCROCO])
-   AC_SUBST([LTLIBCROCO])
-diff --git a/gnulib-local/m4/libglib.m4 b/gnulib-local/m4/libglib.m4
-index 42e55e6fd..ab25a5b22 100644
---- a/gettext-tools/gnulib-m4/libglib.m4
-+++ b/gettext-tools/gnulib-m4/libglib.m4
-@@ -8,6 +8,7 @@ dnl From Bruno Haible.
- 
- AC_DEFUN([gl_LIBGLIB],
- [
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-   AC_MSG_CHECKING([whether included glib is requested])
-   AC_ARG_WITH([included-glib],
-     [  --with-included-glib    use the glib2 included here],
-@@ -20,76 +21,10 @@ AC_DEFUN([gl_LIBGLIB],
-   LTLIBGLIB=
-   INCGLIB=
-   if test "$gl_cv_libglib_use_included" != yes; then
--    dnl Figure out whether we can use a preinstalled libglib-2.0, or have to use
--    dnl the included one.
--    AC_CACHE_VAL([gl_cv_libglib], [
--      gl_cv_libglib=no
--      gl_cv_LIBGLIB=
--      gl_cv_LTLIBGLIB=
--      gl_cv_INCGLIB=
--      gl_save_LIBS="$LIBS"
--      dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0 and
--      dnl INCGLIB_2_0 accordingly.
--      dnl Don't use glib-config nor pkg-config, since it doesn't work when
--      dnl cross-compiling or when the C compiler in use is different from the
--      dnl one that built the library.
--      AC_LIB_LINKFLAGS_BODY([glib-2.0])
--      LIBS="$gl_save_LIBS $LIBGLIB_2_0"
--      AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--        [g_string_new ("foo");],
--        [gl_cv_libglib=yes
--         gl_cv_LIBGLIB="$LIBGLIB_2_0"
--         gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
--        ])
--      if test "$gl_cv_libglib" != yes; then
--        gl_save_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
--        AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--          [g_string_new ("foo");],
--          [gl_cv_libglib=yes
--           gl_cv_LIBGLIB="$LIBGLIB_2_0"
--           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
--           gl_cv_INCGLIB="$INCGLIB_2_0"
--          ])
--        if test "$gl_cv_libglib" != yes; then
--          dnl Often the include files are installed in /usr/include/glib-2.0
--          dnl and /usr/lib/glib-2.0/include.
--          if test -n "$LIBGLIB_2_0_PREFIX"; then
--            CPPFLAGS="$gl_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
--            AC_TRY_LINK([#include <glib.h>
--#ifndef G_BEGIN_DECLS
--error this glib.h includes a glibconfig.h from a glib version 1.x
--#endif
--],
--              [g_string_new ("foo");],
--              [gl_cv_libglib=yes
--               gl_cv_LIBGLIB="$LIBGLIB_2_0"
--               gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
--               gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
--              ])
--          fi
--        fi
--        CPPFLAGS="$gl_save_CPPFLAGS"
--      fi
--      LIBS="$gl_save_LIBS"
--    ])
--    AC_MSG_CHECKING([for glib])
--    AC_MSG_RESULT([$gl_cv_libglib])
--    if test $gl_cv_libglib = yes; then
--      LIBGLIB="$gl_cv_LIBGLIB"
--      LTLIBGLIB="$gl_cv_LTLIBGLIB"
--      INCGLIB="$gl_cv_INCGLIB"
--    else
--      gl_cv_libglib_use_included=yes
--    fi
-+    PKG_CHECK_MODULES([GLIB], [glib-2.0])
-+    LIBGLIB="$GLIB_LIBS"
-+    LTLIBGLIB="$GLIB_LIBS"
-+    INCGLIB="$GLIB_CFLAGS"
-   fi
-   AC_SUBST([LIBGLIB])
-   AC_SUBST([LTLIBGLIB])
-diff --git a/gnulib-local/m4/libxml.m4 b/gnulib-local/m4/libxml.m4
-index 480c700d2..cb39309d5 100644
---- a/gettext-tools/gnulib-m4/libxml.m4
-+++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -8,6 +8,7 @@ dnl From Bruno Haible.
-
- AC_DEFUN([gl_LIBXML],
- [
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-   AC_REQUIRE([AM_ICONV_LINK])
-
-   AC_MSG_CHECKING([whether included libxml is requested])
-@@ -22,100 +22,10 @@ AC_DEFUN([gl_LIBXML],
-   LTLIBXML=
-   INCXML=
-   if test "$gl_cv_libxml_use_included" != yes; then
--    dnl Figure out whether we can use a preinstalled libxml2, or have to use
--    dnl the included one.
--    AC_CACHE_VAL([gl_cv_libxml], [
--      gl_cv_libxml=no
--      gl_cv_LIBXML=
--      gl_cv_LTLIBXML=
--      gl_cv_INCXML=
--      gl_save_LIBS="$LIBS"
--      LIBS="$LIBS $LIBICONV"
--      dnl Search for libxml2 and define LIBXML2, LTLIBXML2 and INCXML2
--      dnl accordingly.
--      dnl Don't use xml2-config nor pkg-config, since it doesn't work when
--      dnl cross-compiling or when the C compiler in use is different from the
--      dnl one that built the library.
--      dnl Use a test program that tries to invoke xmlFree. On Cygwin 1.7.x,
--      dnl libxml2 is built in such a way that uses of xmlFree work fine with
--      dnl -Wl,--enable-auto-import but lead to a link error with
--      dnl -Wl,--disable-auto-import.
--      AC_LIB_LINKFLAGS_BODY([xml2])
--      LIBS="$gl_save_LIBS $LIBXML2 $LIBICONV"
--      AC_TRY_LINK([#include <libxml/xmlversion.h>
--                   #include <libxml/xmlmemory.h>
--                   #include <libxml/xpath.h>
--                  ],
--        [xmlCheckVersion (0);
--         xmlFree ((void *) 0);
--         xmlXPathSetContextNode ((void *)0, (void *)0);
--        ],
--        [gl_cv_libxml=yes
--         gl_cv_LIBXML="$LIBXML2 $LIBICONV"
--         gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
--        ])
--      if test "$gl_cv_libxml" != yes; then
--        gl_save_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS="$CPPFLAGS $INCXML2"
--        AC_TRY_LINK([#include <libxml/xmlversion.h>
--                     #include <libxml/xmlmemory.h>
--                     #include <libxml/xpath.h>
--                    ],
--          [xmlCheckVersion (0);
--           xmlFree ((void *) 0);
--           xmlXPathSetContextNode ((void *)0, (void *)0);
--          ],
--          [gl_cv_libxml=yes
--           gl_cv_LIBXML="$LIBXML2 $LIBICONV"
--           gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
--           gl_cv_INCXML="$INCXML2"
--          ])
--        if test "$gl_cv_libxml" != yes; then
--          dnl Often the include files are installed in /usr/include/libxml2.
--          dnl In libxml2-2.5, <libxml/xmlversion.h> is self-contained.
--          dnl In libxml2-2.6, it includes <libxml/xmlexports.h> which is
--          dnl self-contained.
--          libxml2_include_dir=
--          AC_TRY_CPP([#include <libxml2/libxml/xmlexports.h>],
--            [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlexports.h])
--             libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlexports_h" | sed -e 's,.libxml.xmlexports\.h$,,'`
--            ])
--          if test -z "$libxml2_include_dir"; then
--            AC_TRY_CPP([#include <libxml2/libxml/xmlversion.h>],
--              [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlversion.h])
--               libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlversion_h" | sed -e 's,.libxml.xmlversion\.h$,,'`
--              ])
--          fi
--          if test -n "$libxml2_include_dir" && test -d "$libxml2_include_dir"; then
--            CPPFLAGS="$gl_save_CPPFLAGS -I$libxml2_include_dir"
--            AC_TRY_LINK([#include <libxml/xmlversion.h>
--                         #include <libxml/xmlmemory.h>
--                         #include <libxml/xpath.h>
--                        ],
--              [xmlCheckVersion (0);
--               xmlFree ((void *) 0);
--               xmlXPathSetContextNode ((void *)0, (void *)0);
--              ],
--              [gl_cv_libxml=yes
--               gl_cv_LIBXML="$LIBXML2 $LIBICONV"
--               gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
--               gl_cv_INCXML="-I$libxml2_include_dir"
--              ])
--          fi
--        fi
--        CPPFLAGS="$gl_save_CPPFLAGS"
--      fi
--      LIBS="$gl_save_LIBS"
--    ])
--    AC_MSG_CHECKING([for libxml])
--    AC_MSG_RESULT([$gl_cv_libxml])
--    if test $gl_cv_libxml = yes; then
--      LIBXML="$gl_cv_LIBXML"
--      LTLIBXML="$gl_cv_LTLIBXML"
--      INCXML="$gl_cv_INCXML"
--    else
--      gl_cv_libxml_use_included=yes
--    fi
-+    PKG_CHECK_MODULES([XML], [libxml-2.0])
-+    LIBXML=$XML_LIBS
-+    LTLIBXML=$XML_LIBS
-+    INCXML=$XML_CFLAGS
-   fi
-   AC_SUBST([LIBXML])
-   AC_SUBST([LTLIBXML])
-diff --git a/gnulib-local/lib/term-styled-ostream.oo.c b/gnulib-local/lib/term-styled-ostream.oo.c
-index 81a407467..218565329 100644
---- a/gettext-tools/gnulib-lib/term-styled-ostream.oo.c
-+++ b/gettext-tools/gnulib-lib/term-styled-ostream.oo.c
-@@ -25,4 +25,4 @@
--#include <cr-om-parser.h>
--#include <cr-sel-eng.h>
--#include <cr-style.h>
--#include <cr-rgb.h>
-+#include <libcroco/cr-om-parser.h>
-+#include <libcroco/cr-sel-eng.h>
-+#include <libcroco/cr-style.h>
-+#include <libcroco/cr-rgb.h>
-@@ -31 +31 @@
--# include <cr-fonts.h>
-+# include <libcroco/cr-fonts.h>
-@@ -33 +33 @@
--#include <cr-string.h>
-+#include <libcroco/cr-string.h>
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch
rename to meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
similarity index 68%
rename from meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
rename to meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
index 6af16041987..0561ed7d32c 100644
--- a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
+++ b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
@@ -1,4 +1,4 @@
-From e546de65a333789e83f5485757967cee29ee3681 Mon Sep 17 00:00:00 2001
+From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 19 Feb 2017 23:32:46 -0800
 Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
@@ -15,15 +15,15 @@ gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu' expects
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- gettext-tools/gnulib-lib/libcroco/cr-statement.c | 10 +++++-----
- gettext-tools/gnulib-lib/libxml/timsort.h        |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
+ libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/gettext-tools/gnulib-lib/libcroco/cr-statement.c b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
+diff --git a/libtextstyle/lib/libcroco/cr-statement.c b/libtextstyle/lib/libcroco/cr-statement.c
 index 617520f..100104b 100644
---- a/gettext-tools/gnulib-lib/libcroco/cr-statement.c
-+++ b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
+--- a/libtextstyle/lib/libcroco/cr-statement.c
++++ b/libtextstyle/lib/libcroco/cr-statement.c
 @@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this, FILE * a_fp, glong a_indent)
          g_return_if_fail (a_fp && a_this);
          str = cr_statement_ruleset_to_string (a_this, a_indent);
@@ -69,19 +69,3 @@ index 617520f..100104b 100644
                  g_free (str) ;
                  str = NULL ;
          }
-diff --git a/gettext-tools/gnulib-lib/libxml/timsort.h b/gettext-tools/gnulib-lib/libxml/timsort.h
-index 795f272..443918a 100644
---- a/gettext-tools/gnulib-lib/libxml/timsort.h
-+++ b/gettext-tools/gnulib-lib/libxml/timsort.h
-@@ -323,7 +323,7 @@ static void TIM_SORT_RESIZE(TEMP_STORAGE_T *store, const size_t new_size)
-     SORT_TYPE *tempstore = (SORT_TYPE *)realloc(store->storage, new_size * sizeof(SORT_TYPE));
-     if (tempstore == NULL)
-     {
--      fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
-+      fprintf(stderr, "Error allocating temporary storage for tim sort: need %zu bytes", sizeof(SORT_TYPE) * new_size);
-       exit(1);
-     }
-     store->storage = tempstore;
--- 
-2.10.2
-
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
new file mode 100644
index 00000000000..d96a376b7d1
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
@@ -0,0 +1,32 @@
+From 4a2a0a93b469093b60ffd0bec55d33d1e03d4713 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Thu, 7 Jun 2012 16:37:01 -0700
+Subject: [PATCH] instal libgettextlib.a before removing it
+
+In a multiple job build, Makefile can simultaneously
+be installing and removing libgettextlib.a.  We serialize
+the operations.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+---
+ gettext-tools/gnulib-lib/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib-lib/Makefile.am
+index 2126699..d2dd7e4 100644
+--- a/gettext-tools/gnulib-lib/Makefile.am
++++ b/gettext-tools/gnulib-lib/Makefile.am
+@@ -58,6 +58,10 @@ endif
+ # Rules generated and collected by gnulib-tool.
+ include Makefile.gnulib
+ 
++# defined in Makefile.gnulib but missing this dependency
++#
++install-exec-clean: install-libLTLIBRARIES
++
+ # OS/2 does not support a DLL name longer than 8 characters.
+ if OS2
+ libgettextlib_la_LDFLAGS += -os2dllname gtlib
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest b/meta/recipes-core/gettext/gettext-0.20.1/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
rename to meta/recipes-core/gettext/gettext-0.20.1/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
similarity index 75%
rename from meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
index 31ff9138a91..93f7c03334a 100644
--- a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From c4b1f3a0c7b7c40b343be9b95deb84e0485643be Mon Sep 17 00:00:00 2001
+From ed64a5724ef7d6eb4e9a876f817ea266a536e195 Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Thu, 28 Jul 2016 12:36:15 +0800
 Subject: [PATCH] fix for ptest
@@ -8,6 +8,7 @@ Add serial-tests support, ptest need it
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  configure.ac                 | 2 +-
  gettext-runtime/configure.ac | 2 +-
@@ -15,24 +16,24 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5e996fa..880581f 100644
+index 38db6fd..f019ae0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_INIT([gettext],
- 	[bug-gnu-gettext@gnu.org])
+@@ -22,7 +22,7 @@ AC_INIT([gettext],
+ 	[bug-gettext@gnu.org])
  AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])
  AC_CONFIG_AUX_DIR([build-aux])
--AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests dist-xz dist-lzip])
-+AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests dist-xz dist-lzip])
+-AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests tar-ustar])
++AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests tar-ustar])
  
  dnl Override automake's tar command used for creating distributions.
- am__tar='${AMTAR} chof - --owner=root --group=root "$$tardir"'
+ am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
-index e9299b6..d4f5528 100644
+index de203e7..138a07f 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
- 	[bug-gnu-gettext@gnu.org])
+ 	[bug-gettext@gnu.org])
  AC_CONFIG_SRCDIR([intl/dcigettext.c])
  AC_CONFIG_AUX_DIR([../build-aux])
 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
@@ -41,11 +42,11 @@ index e9299b6..d4f5528 100644
  
  dnl Installation directories.
 diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index 920eeb6..c507434 100644
+index cf1dd73..b544d6d 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
- 	[bug-gnu-gettext@gnu.org])
+ 	[bug-gettext@gnu.org])
  AC_CONFIG_SRCDIR([src/msgfmt.c])
  AC_CONFIG_AUX_DIR([../build-aux])
 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
@@ -53,6 +54,3 @@ index 920eeb6..c507434 100644
  AC_CONFIG_HEADERS([config.h])
  
  dnl Installation directories.
--- 
-2.1.4
-
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
new file mode 100644
index 00000000000..d3f3fe8e2f9
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
@@ -0,0 +1,713 @@
+From ef414b06be80c6f605731abc9e674e396b80ec9e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 23 Jan 2018 00:54:13 +0000
+Subject: [PATCH] gettext: beat library detection into shape
+
+For reasons which I just can't fathom gnulib doesn't use the expected tools to
+find libraries but badly reinvents the wheel.  This will trivially lead to host
+contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
+canonicalisation resulting in relative paths).
+
+Simply delete all the crazy, and replace with a single call to pkg-config.
+
+Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
+ .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
+ libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
+ libtextstyle/gnulib-local/m4/libglib.m4       | 104 +++---------------
+ libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
+ libtextstyle/gnulib-m4/libglib.m4             | 104 +++---------------
+ libtextstyle/lib/term-styled-ostream.c        |  12 +-
+ libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
+ 8 files changed, 87 insertions(+), 454 deletions(-)
+
+diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
+index 05b9550..031ee65 100644
+--- a/gettext-tools/gnulib-m4/libxml.m4
++++ b/gettext-tools/gnulib-m4/libxml.m4
+@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+ dnl   forces the use of the included or an external libxml.
+ AC_DEFUN([gl_LIBXML],
+ [
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+   AC_REQUIRE([AM_ICONV_LINK])
+ 
+   ifelse([$1], , [
+@@ -30,100 +31,10 @@ AC_DEFUN([gl_LIBXML],
+   INCXML=
+   ifelse([$1], [yes], , [
+     if test "$gl_cv_libxml_use_included" != yes; then
+-      dnl Figure out whether we can use a preinstalled libxml2, or have to use
+-      dnl the included one.
+-      AC_CACHE_VAL([gl_cv_libxml], [
+-        gl_cv_libxml=no
+-        gl_cv_LIBXML=
+-        gl_cv_LTLIBXML=
+-        gl_cv_INCXML=
+-        gl_save_LIBS="$LIBS"
+-        LIBS="$LIBS $LIBICONV"
+-        dnl Search for libxml2 and define LIBXML2, LTLIBXML2 and INCXML2
+-        dnl accordingly.
+-        dnl Don't use xml2-config nor pkg-config, since it doesn't work when
+-        dnl cross-compiling or when the C compiler in use is different from the
+-        dnl one that built the library.
+-        dnl Use a test program that tries to invoke xmlFree. On Cygwin 1.7.x,
+-        dnl libxml2 is built in such a way that uses of xmlFree work fine with
+-        dnl -Wl,--enable-auto-import but lead to a link error with
+-        dnl -Wl,--disable-auto-import.
+-        AC_LIB_LINKFLAGS_BODY([xml2])
+-        LIBS="$gl_save_LIBS $LIBXML2 $LIBICONV"
+-        AC_TRY_LINK([#include <libxml/xmlversion.h>
+-                     #include <libxml/xmlmemory.h>
+-                     #include <libxml/xpath.h>
+-                    ],
+-          [xmlCheckVersion (0);
+-           xmlFree ((void *) 0);
+-           xmlXPathSetContextNode ((void *)0, (void *)0);
+-          ],
+-          [gl_cv_libxml=yes
+-           gl_cv_LIBXML="$LIBXML2 $LIBICONV"
+-           gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
+-          ])
+-        if test "$gl_cv_libxml" != yes; then
+-          gl_save_CPPFLAGS="$CPPFLAGS"
+-          CPPFLAGS="$CPPFLAGS $INCXML2"
+-          AC_TRY_LINK([#include <libxml/xmlversion.h>
+-                       #include <libxml/xmlmemory.h>
+-                       #include <libxml/xpath.h>
+-                      ],
+-            [xmlCheckVersion (0);
+-             xmlFree ((void *) 0);
+-             xmlXPathSetContextNode ((void *)0, (void *)0);
+-            ],
+-            [gl_cv_libxml=yes
+-             gl_cv_LIBXML="$LIBXML2 $LIBICONV"
+-             gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
+-             gl_cv_INCXML="$INCXML2"
+-            ])
+-          if test "$gl_cv_libxml" != yes; then
+-            dnl Often the include files are installed in /usr/include/libxml2.
+-            dnl In libxml2-2.5, <libxml/xmlversion.h> is self-contained.
+-            dnl In libxml2-2.6, it includes <libxml/xmlexports.h> which is
+-            dnl self-contained.
+-            libxml2_include_dir=
+-            AC_TRY_CPP([#include <libxml2/libxml/xmlexports.h>],
+-              [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlexports.h])
+-               libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlexports_h" | sed -e 's,.libxml.xmlexports\.h$,,'`
+-              ])
+-            if test -z "$libxml2_include_dir"; then
+-              AC_TRY_CPP([#include <libxml2/libxml/xmlversion.h>],
+-                [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlversion.h])
+-                 libxml2_include_dir=`echo "$gl_cv_absolute_libxml2_libxml_xmlversion_h" | sed -e 's,.libxml.xmlversion\.h$,,'`
+-                ])
+-            fi
+-            if test -n "$libxml2_include_dir" && test -d "$libxml2_include_dir"; then
+-              CPPFLAGS="$gl_save_CPPFLAGS -I$libxml2_include_dir"
+-              AC_TRY_LINK([#include <libxml/xmlversion.h>
+-                           #include <libxml/xmlmemory.h>
+-                           #include <libxml/xpath.h>
+-                          ],
+-                [xmlCheckVersion (0);
+-                 xmlFree ((void *) 0);
+-                 xmlXPathSetContextNode ((void *)0, (void *)0);
+-                ],
+-                [gl_cv_libxml=yes
+-                 gl_cv_LIBXML="$LIBXML2 $LIBICONV"
+-                 gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
+-                 gl_cv_INCXML="-I$libxml2_include_dir"
+-                ])
+-            fi
+-          fi
+-          CPPFLAGS="$gl_save_CPPFLAGS"
+-        fi
+-        LIBS="$gl_save_LIBS"
+-      ])
+-      AC_MSG_CHECKING([for libxml])
+-      AC_MSG_RESULT([$gl_cv_libxml])
+-      if test $gl_cv_libxml = yes; then
+-        LIBXML="$gl_cv_LIBXML"
+-        LTLIBXML="$gl_cv_LTLIBXML"
+-        INCXML="$gl_cv_INCXML"
+-      else
+-        gl_cv_libxml_use_included=yes
+-      fi
++      PKG_CHECK_MODULES([XML], [libxml-2.0])
++      LIBXML=$XML_LIBS
++      LTLIBXML=$XML_LIBS
++      INCXML=$XML_CFLAGS
+     fi
+   ])
+   AC_SUBST([LIBXML])
+diff --git a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
+index 2cfd4a8..d42c8b4 100644
+--- a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
++++ b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
+@@ -22,15 +22,15 @@
+ 
+ #include <stdlib.h>
+ 
+-#include <cr-om-parser.h>
+-#include <cr-sel-eng.h>
+-#include <cr-style.h>
+-#include <cr-rgb.h>
++#include <libcroco/cr-om-parser.h>
++#include <libcroco/cr-sel-eng.h>
++#include <libcroco/cr-style.h>
++#include <libcroco/cr-rgb.h>
+ /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1.  */
+ #ifndef __CR_FONTS_H__
+-# include <cr-fonts.h>
++# include <libcroco/cr-fonts.h>
+ #endif
+-#include <cr-string.h>
++#include <libcroco/cr-string.h>
+ 
+ #include "term-ostream.h"
+ #include "hash.h"
+diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/gnulib-local/m4/libcroco.m4
+index bc53cc6..10b2455 100644
+--- a/libtextstyle/gnulib-local/m4/libcroco.m4
++++ b/libtextstyle/gnulib-local/m4/libcroco.m4
+@@ -1,99 +1,34 @@
+-# libcroco.m4 serial 3
+-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
++# libcroco.m4 serial 2 (gettext-0.17)
++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl From Bruno Haible.
+ 
+-dnl gl_LIBCROCO
+-dnl   gives the user the option to decide whether to use the included or
+-dnl   an external libcroco.
+-dnl gl_LIBCROCO(FORCE-INCLUDED)
+-dnl   forces the use of the included or an external libcroco.
+ AC_DEFUN([gl_LIBCROCO],
+ [
+-  ifelse([$1], [yes], , [
+-    dnl libcroco depends on libglib.
+-    AC_REQUIRE([gl_LIBGLIB])
+-  ])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
++  dnl libcroco depends on libglib.
++  AC_REQUIRE([gl_LIBGLIB])
+ 
+-  ifelse([$1], , [
+-    AC_MSG_CHECKING([whether included libcroco is requested])
+-    AC_ARG_WITH([included-libcroco],
+-      [  --with-included-libcroco  use the libcroco included here],
+-      [gl_cv_libcroco_force_included=$withval],
+-      [gl_cv_libcroco_force_included=no])
+-    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
+-  ], [gl_cv_libcroco_force_included=$1])
++  AC_MSG_CHECKING([whether included libcroco is requested])
++  AC_ARG_WITH([included-libcroco],
++    [  --with-included-libcroco  use the libcroco included here],
++    [gl_cv_libcroco_force_included=$withval],
++    [gl_cv_libcroco_force_included=no])
++  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
+ 
+   gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
+   LIBCROCO=
+   LTLIBCROCO=
+   INCCROCO=
+-  ifelse([$1], [yes], , [
+-    if test "$gl_cv_libcroco_use_included" != yes; then
+-      dnl Figure out whether we can use a preinstalled libcroco-0.6, or have to
+-      dnl use the included one.
+-      AC_CACHE_VAL([gl_cv_libcroco], [
+-        gl_cv_libcroco=no
+-        gl_cv_LIBCROCO=
+-        gl_cv_LTLIBCROCO=
+-        gl_cv_INCCROCO=
+-        gl_save_LIBS="$LIBS"
+-        dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6 and
+-        dnl INCCROCO_0_6 accordingly.
+-        dnl Don't use croco-0.6-config nor pkg-config, since it doesn't work when
+-        dnl cross-compiling or when the C compiler in use is different from the
+-        dnl one that built the library.
+-        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
+-        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
+-        AC_TRY_LINK([#include <libcroco-config.h>],
+-          [const char *version = LIBCROCO_VERSION; return !version;],
+-          [gl_cv_libcroco=yes
+-           gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-          ])
+-        if test "$gl_cv_libcroco" != yes; then
+-          gl_save_CPPFLAGS="$CPPFLAGS"
+-          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
+-          AC_TRY_LINK([#include <libcroco-config.h>],
+-            [const char *version = LIBCROCO_VERSION; return !version;],
+-            [gl_cv_libcroco=yes
+-             gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-             gl_cv_INCCROCO="$INCCROCO_0_6"
+-            ])
+-          if test "$gl_cv_libcroco" != yes; then
+-            dnl Often the include files are installed in
+-            dnl /usr/include/libcroco-0.6/libcroco.
+-            AC_TRY_LINK([#include <libcroco-0.6/libcroco/libcroco-config.h>],
+-              [const char *version = LIBCROCO_VERSION; return !version;],
+-              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
+-               libcroco_include_dir=`echo "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
+-               if test -d "$libcroco_include_dir"; then
+-                 gl_cv_libcroco=yes
+-                 gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-                 gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-                 gl_cv_INCCROCO="-I$libcroco_include_dir"
+-               fi
+-              ])
+-          fi
+-          CPPFLAGS="$gl_save_CPPFLAGS"
+-        fi
+-        LIBS="$gl_save_LIBS"
+-      ])
+-      AC_MSG_CHECKING([for libcroco])
+-      AC_MSG_RESULT([$gl_cv_libcroco])
+-      if test $gl_cv_libcroco = yes; then
+-        LIBCROCO="$gl_cv_LIBCROCO"
+-        LTLIBCROCO="$gl_cv_LTLIBCROCO"
+-        INCCROCO="$gl_cv_INCCROCO"
+-      else
+-        gl_cv_libcroco_use_included=yes
+-      fi
+-    fi
+-  ])
++  if test "$gl_cv_libcroco_use_included" != yes; then
++    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
++    LIBCROCO=$CROCO_LIBS
++    LTLIBCROCO=$CROCO_LIBS
++    INCCROCO=$CROCO_CFLAGS
++  fi
+   AC_SUBST([LIBCROCO])
+   AC_SUBST([LTLIBCROCO])
+   AC_SUBST([INCCROCO])
+diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
+index bef6fa3..8841755 100644
+--- a/libtextstyle/gnulib-local/m4/libglib.m4
++++ b/libtextstyle/gnulib-local/m4/libglib.m4
+@@ -1,105 +1,31 @@
+-# libglib.m4 serial 4
+-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
++# libglib.m4 serial 3 (gettext-0.17)
++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl From Bruno Haible.
+ 
+-dnl gl_LIBGLIB
+-dnl   gives the user the option to decide whether to use the included or
+-dnl   an external libglib.
+-dnl gl_LIBGLIB(FORCE-INCLUDED)
+-dnl   forces the use of the included or an external libglib.
+ AC_DEFUN([gl_LIBGLIB],
+ [
+-  ifelse([$1], , [
+-    AC_MSG_CHECKING([whether included glib is requested])
+-    AC_ARG_WITH([included-glib],
+-      [  --with-included-glib    use the glib2 included here],
+-      [gl_cv_libglib_force_included=$withval],
+-      [gl_cv_libglib_force_included=no])
+-    AC_MSG_RESULT([$gl_cv_libglib_force_included])
+-  ], [gl_cv_libglib_force_included=$1])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
++  AC_MSG_CHECKING([whether included glib is requested])
++  AC_ARG_WITH([included-glib],
++    [  --with-included-glib    use the glib2 included here],
++    [gl_cv_libglib_force_included=$withval],
++    [gl_cv_libglib_force_included=no])
++  AC_MSG_RESULT([$gl_cv_libglib_force_included])
+ 
+   gl_cv_libglib_use_included="$gl_cv_libglib_force_included"
+   LIBGLIB=
+   LTLIBGLIB=
+   INCGLIB=
+-  ifelse([$1], [yes], , [
+-    if test "$gl_cv_libglib_use_included" != yes; then
+-      dnl Figure out whether we can use a preinstalled libglib-2.0, or have to use
+-      dnl the included one.
+-      AC_CACHE_VAL([gl_cv_libglib], [
+-        gl_cv_libglib=no
+-        gl_cv_LIBGLIB=
+-        gl_cv_LTLIBGLIB=
+-        gl_cv_INCGLIB=
+-        gl_save_LIBS="$LIBS"
+-        dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0 and
+-        dnl INCGLIB_2_0 accordingly.
+-        dnl Don't use glib-config nor pkg-config, since it doesn't work when
+-        dnl cross-compiling or when the C compiler in use is different from the
+-        dnl one that built the library.
+-        AC_LIB_LINKFLAGS_BODY([glib-2.0])
+-        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
+-        AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-          [g_string_new ("foo");],
+-          [gl_cv_libglib=yes
+-           gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-          ])
+-        if test "$gl_cv_libglib" != yes; then
+-          gl_save_CPPFLAGS="$CPPFLAGS"
+-          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
+-          AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-            [g_string_new ("foo");],
+-            [gl_cv_libglib=yes
+-             gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-             gl_cv_INCGLIB="$INCGLIB_2_0"
+-            ])
+-          if test "$gl_cv_libglib" != yes; then
+-            dnl Often the include files are installed in /usr/include/glib-2.0
+-            dnl and /usr/lib/glib-2.0/include.
+-            if test -n "$LIBGLIB_2_0_PREFIX"; then
+-              CPPFLAGS="$gl_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
+-              AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-                [g_string_new ("foo");],
+-                [gl_cv_libglib=yes
+-                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-                 gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
+-                ])
+-            fi
+-          fi
+-          CPPFLAGS="$gl_save_CPPFLAGS"
+-        fi
+-        LIBS="$gl_save_LIBS"
+-      ])
+-      AC_MSG_CHECKING([for glib])
+-      AC_MSG_RESULT([$gl_cv_libglib])
+-      if test $gl_cv_libglib = yes; then
+-        LIBGLIB="$gl_cv_LIBGLIB"
+-        LTLIBGLIB="$gl_cv_LTLIBGLIB"
+-        INCGLIB="$gl_cv_INCGLIB"
+-      else
+-        gl_cv_libglib_use_included=yes
+-      fi
+-    fi
+-  ])
++  if test "$gl_cv_libglib_use_included" != yes; then
++    PKG_CHECK_MODULES([GLIB], [glib-2.0])
++    LIBGLIB="$GLIB_LIBS"
++    LTLIBGLIB="$GLIB_LIBS"
++    INCGLIB="$GLIB_CFLAGS"
++  fi
+   AC_SUBST([LIBGLIB])
+   AC_SUBST([LTLIBGLIB])
+   AC_SUBST([INCGLIB])
+diff --git a/libtextstyle/gnulib-m4/libcroco.m4 b/libtextstyle/gnulib-m4/libcroco.m4
+index bc53cc6..10b2455 100644
+--- a/libtextstyle/gnulib-m4/libcroco.m4
++++ b/libtextstyle/gnulib-m4/libcroco.m4
+@@ -1,99 +1,34 @@
+-# libcroco.m4 serial 3
+-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
++# libcroco.m4 serial 2 (gettext-0.17)
++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl From Bruno Haible.
+ 
+-dnl gl_LIBCROCO
+-dnl   gives the user the option to decide whether to use the included or
+-dnl   an external libcroco.
+-dnl gl_LIBCROCO(FORCE-INCLUDED)
+-dnl   forces the use of the included or an external libcroco.
+ AC_DEFUN([gl_LIBCROCO],
+ [
+-  ifelse([$1], [yes], , [
+-    dnl libcroco depends on libglib.
+-    AC_REQUIRE([gl_LIBGLIB])
+-  ])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
++  dnl libcroco depends on libglib.
++  AC_REQUIRE([gl_LIBGLIB])
+ 
+-  ifelse([$1], , [
+-    AC_MSG_CHECKING([whether included libcroco is requested])
+-    AC_ARG_WITH([included-libcroco],
+-      [  --with-included-libcroco  use the libcroco included here],
+-      [gl_cv_libcroco_force_included=$withval],
+-      [gl_cv_libcroco_force_included=no])
+-    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
+-  ], [gl_cv_libcroco_force_included=$1])
++  AC_MSG_CHECKING([whether included libcroco is requested])
++  AC_ARG_WITH([included-libcroco],
++    [  --with-included-libcroco  use the libcroco included here],
++    [gl_cv_libcroco_force_included=$withval],
++    [gl_cv_libcroco_force_included=no])
++  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
+ 
+   gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
+   LIBCROCO=
+   LTLIBCROCO=
+   INCCROCO=
+-  ifelse([$1], [yes], , [
+-    if test "$gl_cv_libcroco_use_included" != yes; then
+-      dnl Figure out whether we can use a preinstalled libcroco-0.6, or have to
+-      dnl use the included one.
+-      AC_CACHE_VAL([gl_cv_libcroco], [
+-        gl_cv_libcroco=no
+-        gl_cv_LIBCROCO=
+-        gl_cv_LTLIBCROCO=
+-        gl_cv_INCCROCO=
+-        gl_save_LIBS="$LIBS"
+-        dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6 and
+-        dnl INCCROCO_0_6 accordingly.
+-        dnl Don't use croco-0.6-config nor pkg-config, since it doesn't work when
+-        dnl cross-compiling or when the C compiler in use is different from the
+-        dnl one that built the library.
+-        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
+-        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
+-        AC_TRY_LINK([#include <libcroco-config.h>],
+-          [const char *version = LIBCROCO_VERSION; return !version;],
+-          [gl_cv_libcroco=yes
+-           gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-          ])
+-        if test "$gl_cv_libcroco" != yes; then
+-          gl_save_CPPFLAGS="$CPPFLAGS"
+-          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
+-          AC_TRY_LINK([#include <libcroco-config.h>],
+-            [const char *version = LIBCROCO_VERSION; return !version;],
+-            [gl_cv_libcroco=yes
+-             gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-             gl_cv_INCCROCO="$INCCROCO_0_6"
+-            ])
+-          if test "$gl_cv_libcroco" != yes; then
+-            dnl Often the include files are installed in
+-            dnl /usr/include/libcroco-0.6/libcroco.
+-            AC_TRY_LINK([#include <libcroco-0.6/libcroco/libcroco-config.h>],
+-              [const char *version = LIBCROCO_VERSION; return !version;],
+-              [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
+-               libcroco_include_dir=`echo "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e 's,.libcroco-config\.h$,,'`
+-               if test -d "$libcroco_include_dir"; then
+-                 gl_cv_libcroco=yes
+-                 gl_cv_LIBCROCO="$LIBCROCO_0_6"
+-                 gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
+-                 gl_cv_INCCROCO="-I$libcroco_include_dir"
+-               fi
+-              ])
+-          fi
+-          CPPFLAGS="$gl_save_CPPFLAGS"
+-        fi
+-        LIBS="$gl_save_LIBS"
+-      ])
+-      AC_MSG_CHECKING([for libcroco])
+-      AC_MSG_RESULT([$gl_cv_libcroco])
+-      if test $gl_cv_libcroco = yes; then
+-        LIBCROCO="$gl_cv_LIBCROCO"
+-        LTLIBCROCO="$gl_cv_LTLIBCROCO"
+-        INCCROCO="$gl_cv_INCCROCO"
+-      else
+-        gl_cv_libcroco_use_included=yes
+-      fi
+-    fi
+-  ])
++  if test "$gl_cv_libcroco_use_included" != yes; then
++    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
++    LIBCROCO=$CROCO_LIBS
++    LTLIBCROCO=$CROCO_LIBS
++    INCCROCO=$CROCO_CFLAGS
++  fi
+   AC_SUBST([LIBCROCO])
+   AC_SUBST([LTLIBCROCO])
+   AC_SUBST([INCCROCO])
+diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
+index bef6fa3..8841755 100644
+--- a/libtextstyle/gnulib-m4/libglib.m4
++++ b/libtextstyle/gnulib-m4/libglib.m4
+@@ -1,105 +1,31 @@
+-# libglib.m4 serial 4
+-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
++# libglib.m4 serial 3 (gettext-0.17)
++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl From Bruno Haible.
+ 
+-dnl gl_LIBGLIB
+-dnl   gives the user the option to decide whether to use the included or
+-dnl   an external libglib.
+-dnl gl_LIBGLIB(FORCE-INCLUDED)
+-dnl   forces the use of the included or an external libglib.
+ AC_DEFUN([gl_LIBGLIB],
+ [
+-  ifelse([$1], , [
+-    AC_MSG_CHECKING([whether included glib is requested])
+-    AC_ARG_WITH([included-glib],
+-      [  --with-included-glib    use the glib2 included here],
+-      [gl_cv_libglib_force_included=$withval],
+-      [gl_cv_libglib_force_included=no])
+-    AC_MSG_RESULT([$gl_cv_libglib_force_included])
+-  ], [gl_cv_libglib_force_included=$1])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
++  AC_MSG_CHECKING([whether included glib is requested])
++  AC_ARG_WITH([included-glib],
++    [  --with-included-glib    use the glib2 included here],
++    [gl_cv_libglib_force_included=$withval],
++    [gl_cv_libglib_force_included=no])
++  AC_MSG_RESULT([$gl_cv_libglib_force_included])
+ 
+   gl_cv_libglib_use_included="$gl_cv_libglib_force_included"
+   LIBGLIB=
+   LTLIBGLIB=
+   INCGLIB=
+-  ifelse([$1], [yes], , [
+-    if test "$gl_cv_libglib_use_included" != yes; then
+-      dnl Figure out whether we can use a preinstalled libglib-2.0, or have to use
+-      dnl the included one.
+-      AC_CACHE_VAL([gl_cv_libglib], [
+-        gl_cv_libglib=no
+-        gl_cv_LIBGLIB=
+-        gl_cv_LTLIBGLIB=
+-        gl_cv_INCGLIB=
+-        gl_save_LIBS="$LIBS"
+-        dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0 and
+-        dnl INCGLIB_2_0 accordingly.
+-        dnl Don't use glib-config nor pkg-config, since it doesn't work when
+-        dnl cross-compiling or when the C compiler in use is different from the
+-        dnl one that built the library.
+-        AC_LIB_LINKFLAGS_BODY([glib-2.0])
+-        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
+-        AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-          [g_string_new ("foo");],
+-          [gl_cv_libglib=yes
+-           gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-          ])
+-        if test "$gl_cv_libglib" != yes; then
+-          gl_save_CPPFLAGS="$CPPFLAGS"
+-          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
+-          AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-            [g_string_new ("foo");],
+-            [gl_cv_libglib=yes
+-             gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-             gl_cv_INCGLIB="$INCGLIB_2_0"
+-            ])
+-          if test "$gl_cv_libglib" != yes; then
+-            dnl Often the include files are installed in /usr/include/glib-2.0
+-            dnl and /usr/lib/glib-2.0/include.
+-            if test -n "$LIBGLIB_2_0_PREFIX"; then
+-              CPPFLAGS="$gl_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
+-              AC_TRY_LINK([#include <glib.h>
+-#ifndef G_BEGIN_DECLS
+-error this glib.h includes a glibconfig.h from a glib version 1.x
+-#endif
+-],
+-                [g_string_new ("foo");],
+-                [gl_cv_libglib=yes
+-                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
+-                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
+-                 gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
+-                ])
+-            fi
+-          fi
+-          CPPFLAGS="$gl_save_CPPFLAGS"
+-        fi
+-        LIBS="$gl_save_LIBS"
+-      ])
+-      AC_MSG_CHECKING([for glib])
+-      AC_MSG_RESULT([$gl_cv_libglib])
+-      if test $gl_cv_libglib = yes; then
+-        LIBGLIB="$gl_cv_LIBGLIB"
+-        LTLIBGLIB="$gl_cv_LTLIBGLIB"
+-        INCGLIB="$gl_cv_INCGLIB"
+-      else
+-        gl_cv_libglib_use_included=yes
+-      fi
+-    fi
+-  ])
++  if test "$gl_cv_libglib_use_included" != yes; then
++    PKG_CHECK_MODULES([GLIB], [glib-2.0])
++    LIBGLIB="$GLIB_LIBS"
++    LTLIBGLIB="$GLIB_LIBS"
++    INCGLIB="$GLIB_CFLAGS"
++  fi
+   AC_SUBST([LIBGLIB])
+   AC_SUBST([LTLIBGLIB])
+   AC_SUBST([INCGLIB])
+diff --git a/libtextstyle/lib/term-styled-ostream.c b/libtextstyle/lib/term-styled-ostream.c
+index 3675b5f..811e546 100644
+--- a/libtextstyle/lib/term-styled-ostream.c
++++ b/libtextstyle/lib/term-styled-ostream.c
+@@ -28,15 +28,15 @@
+ 
+ #include <stdlib.h>
+ 
+-#include <cr-om-parser.h>
+-#include <cr-sel-eng.h>
+-#include <cr-style.h>
+-#include <cr-rgb.h>
++#include <libcroco/cr-om-parser.h>
++#include <libcroco/cr-sel-eng.h>
++#include <libcroco/cr-style.h>
++#include <libcroco/cr-rgb.h>
+ /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1.  */
+ #ifndef __CR_FONTS_H__
+-# include <cr-fonts.h>
++# include <libcroco/cr-fonts.h>
+ #endif
+-#include <cr-string.h>
++#include <libcroco/cr-string.h>
+ 
+ #include "term-ostream.h"
+ #include "hash.h"
+diff --git a/libtextstyle/lib/term-styled-ostream.oo.c b/libtextstyle/lib/term-styled-ostream.oo.c
+index 2cfd4a8..d42c8b4 100644
+--- a/libtextstyle/lib/term-styled-ostream.oo.c
++++ b/libtextstyle/lib/term-styled-ostream.oo.c
+@@ -22,15 +22,15 @@
+ 
+ #include <stdlib.h>
+ 
+-#include <cr-om-parser.h>
+-#include <cr-sel-eng.h>
+-#include <cr-style.h>
+-#include <cr-rgb.h>
++#include <libcroco/cr-om-parser.h>
++#include <libcroco/cr-sel-eng.h>
++#include <libcroco/cr-style.h>
++#include <libcroco/cr-rgb.h>
+ /* <cr-fonts.h> has a broken double-inclusion guard in libcroco-0.6.1.  */
+ #ifndef __CR_FONTS_H__
+-# include <cr-fonts.h>
++# include <libcroco/cr-fonts.h>
+ #endif
+-#include <cr-string.h>
++#include <libcroco/cr-string.h>
+ 
+ #include "term-ostream.h"
+ #include "hash.h"
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
similarity index 94%
rename from meta/recipes-core/gettext/gettext_0.19.8.1.bb
rename to meta/recipes-core/gettext/gettext_0.20.1.bb
index 30121ad23e1..fc05ef2e0a3 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -6,7 +6,7 @@ a few stand-alone programs to massage in various ways the sets of translatable a
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 # Because po-gram-gen.y has been modified by fix-CVE-2018-18751.patch,
 # it requires yacc which provided by bison-native
@@ -17,17 +17,16 @@ PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-	   file://parallel.patch \
-	   file://add-with-bisonlocaledir.patch \
-	   file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
-	   file://use-pkgconfig.patch \
-	   file://fix-CVE-2018-18751.patch \
-	   file://run-ptest \
-	   file://serial-tests-config.patch \
-"
+           file://parallel.patch \
+           file://add-with-bisonlocaledir.patch \
+           file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
+           file://use-pkgconfig.patch \
+           file://run-ptest \
+           file://serial-tests-config.patch \
+           "
 
-SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
-SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
+SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
+SRC_URI[sha256sum] = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
 
 inherit autotools texinfo pkgconfig ptest
 
@@ -127,7 +126,7 @@ do_install_append_class-native () {
 	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
 
         create_wrapper ${D}${bindir}/msgfmt \
-                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
+                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.20/"
 
 }
 
-- 
2.17.1


