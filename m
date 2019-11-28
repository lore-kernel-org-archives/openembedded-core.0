Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 829467F8F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 17:47:12 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id a13so8443964uaq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W+vQYmbD4gUAKcYAonsEN9do8XCYejJeyeePx1uACrs=;
	b=sSaQ124Y7JuwdTkIY91F6zBeU2n5f6VmHE0trX048P/SeQeGndGxw4TQmDAs+J+uHq
	XJObQj6b/fQIQFXMOL2v2KiBxjb04gYQFiFTNgXTFX0UzJWiP04Ox0Ef76nOEWzdkzen
	6/RhtZXs3mKZoItUPxUdO4faV479UmdKUjUpj2+dInVOMNzmLkSog35h2/Y5RuZwOM/o
	3UoGsIqhQlYeiMMMfaWM28r1pmxMlN8zoHit6GbGXo2CVSvUF335TW5qTlQRjBlFPKlK
	v68UhH9Pdp4bMfqA66Dyg+QHtr38FEt5rGbqfibSqCKmqFlnIWZtTyY+w6CEsTM7LLRe
	psGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W+vQYmbD4gUAKcYAonsEN9do8XCYejJeyeePx1uACrs=;
	b=aIrWFS4e2XNuW5aWCGJMRVnj5/bRTzBZrHjRQRtOKTPrw7ZKH9K+H9r6XBJ1VOOM2X
	8BPih4oKm1duV+uqpkuNz94IRGrtzp5tPIIlmIpkm1HbQOExf3/MlLE5fZ/NV124Fm58
	qwPZ2djReZ02TnlRLJ85zFx3BjNY1zLxpy1Txr/bCs+dwM8JrhwTbZ1+NIbPfO+MuHOp
	MAy5z5MVdxu3mCS+u+sUL1/SO4r3BuXrvrLh4/OnyTsKL0JBSybPT63ZmOF5VApCGC/D
	6NrI4CL/5m/ocNkd8WbUb2CuDbWwU9NjbWSq79NsONeriHwQS1yYet+fkXhzTjV++9pC
	h6/Q==
X-Gm-Message-State: APjAAAVJc7jWF6PaEORhbg0eCwMrOCyR3FjNAyiym44r3FuX3ZQm+Yb0
	FfGzLlUopE+OiTvhE4dQ+1bRHD260yHdA35jhuo=
X-Google-Smtp-Source: APXvYqxGNCm7zKk6h4V0iHH5ZUsyFW+0angH7VESgEPDyHyqIskG1iooTVKENjDvUXvQFS6xMPbI4/3SCOo4kRFWVvw=
X-Received: by 2002:ab0:49e9:: with SMTP id f38mr7163468uad.71.1574963232790; 
	Thu, 28 Nov 2019 09:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-8-alex.kanavin@gmail.com>
	<4b9811bd-bbeb-c2f3-9020-3d9c624bb652@gmail.com>
In-Reply-To: <4b9811bd-bbeb-c2f3-9020-3d9c624bb652@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Nov 2019 18:47:01 +0100
Message-ID: <CANNYZj_p=RM2SycCwa5kq=1FwQHSggxQT8wYPhRsLpgOEkegpg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/14] gettext: update to 0.20.1
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
X-List-Received-Date: Thu, 28 Nov 2019 17:47:13 -0000
Content-Type: multipart/alternative; boundary="000000000000065e4b05986bb464"

--000000000000065e4b05986bb464
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2019 at 16:19, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/27/19 8:39 AM, Alexander Kanavin wrote:
> > License-Update: URLs changed from http to https
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This failed on the AB
>
> https://errors.yoctoproject.org/Errors/Details/288797/
>

Weird this didn't fail locally for my world builds, I queued a patch to fix
this.



> an for meta-mingw bbappend.
>
> https://errors.yoctoproject.org/Errors/Details/284185/
>

Patch sent.


> > ---
> >  .../gettext-0.19.8.1/fix-CVE-2018-18751.patch | 141 ----
> >  .../gettext/gettext-0.19.8.1/parallel.patch   |  23 -
> >  .../gettext-0.19.8.1/use-pkgconfig.patch      | 321 --------
> >  .../add-with-bisonlocaledir.patch             |   0
> >  ...nt.c-timsort.h-fix-formatting-issues.patch |  30 +-
> >  .../gettext/gettext-0.20.1/parallel.patch     |  32 +
> >  .../run-ptest                                 |   0
> >  .../serial-tests-config.patch                 |  26 +-
> >  .../gettext-0.20.1/use-pkgconfig.patch        | 713 ++++++++++++++++++
> >  ...{gettext_0.19.8.1.bb => gettext_0.20.1.bb} |  23 +-
> >  10 files changed, 775 insertions(+), 534 deletions(-)
> >  delete mode 100644
> meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
> >  delete mode 100644
> meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
> >  delete mode 100644
> meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
> >  rename meta/recipes-core/gettext/{gettext-0.19.8.1 =>
> gettext-0.20.1}/add-with-bisonlocaledir.patch (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.19.8.1 =>
> gettext-0.20.1}/cr-statement.c-timsort.h-fix-formatting-issues.patch (68%)
> >  create mode 100644
> meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> >  rename meta/recipes-core/gettext/{gettext-0.19.8.1 =>
> gettext-0.20.1}/run-ptest (100%)
> >  rename meta/recipes-core/gettext/{gettext-0.19.8.1 =>
> gettext-0.20.1}/serial-tests-config.patch (75%)
> >  create mode 100644
> meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> >  rename meta/recipes-core/gettext/{gettext_0.19.8.1.bb =>
> gettext_0.20.1.bb} (94%)
> >
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
> b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
> > deleted file mode 100644
> > index 6dfe200d654..00000000000
> > --- a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
> > +++ /dev/null
> > @@ -1,141 +0,0 @@
> > -Upstream-Status: Backport [
> https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=dce3a16]
> > -CVE: CVE-2018-18751
> > -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > -
> > -From dce3a16e5e9368245735e29bf498dcd5e3e474a4 Mon Sep 17 00:00:00 2001
> > -From: Daiki Ueno <ueno@gnu.org>
> > -Date: Thu, 15 Sep 2016 13:57:24 +0200
> > -Subject: [PATCH] xgettext: Fix crash with *.po file input
> > -
> > -When xgettext was given two *.po files with the same msgid_plural, it
> > -crashed with double-free.  Problem reported by Davlet Panech in:
> > -http://lists.gnu.org/archive/html/bug-gettext/2016-09/msg00001.html
> > -* gettext-tools/src/po-gram-gen.y: Don't free msgid_pluralform after
> > -calling do_callback_message, assuming that it takes ownership.
> > -* gettext-tools/src/read-catalog.c (default_add_message): Free
> > -msgid_plural after calling message_alloc.
> > -* gettext-tools/tests/xgettext-po-2: New file.
> > -* gettext-tools/tests/Makefile.am (TESTS): Add new test.
> > ----
> > - gettext-tools/src/po-gram-gen.y   | 13 ++++-----
> > - gettext-tools/src/read-catalog.c  |  2 ++
> > - gettext-tools/tests/Makefile.am   |  2 +-
> > - gettext-tools/tests/xgettext-po-2 | 55
> +++++++++++++++++++++++++++++++++++++++
> > - 4 files changed, 63 insertions(+), 9 deletions(-)
> > - create mode 100755 gettext-tools/tests/xgettext-po-2
> > -
> > -diff --git a/gettext-tools/src/po-gram-gen.y
> b/gettext-tools/src/po-gram-gen.y
> > -index becf5e6..4428e77 100644
> > ---- a/gettext-tools/src/po-gram-gen.y
> > -+++ b/gettext-tools/src/po-gram-gen.y
> > -@@ -221,14 +221,11 @@ message
> > -                   check_obsolete ($1, $3);
> > -                   check_obsolete ($1, $4);
> > -                   if (!$1.obsolete || pass_obsolete_entries)
> > --                    {
> > --                      do_callback_message ($1.ctxt, string2, &$1.pos,
> $3.string,
> > --                                           $4.rhs.msgstr,
> $4.rhs.msgstr_len, &$4.pos,
> > --                                           $1.prev_ctxt,
> > --                                           $1.prev_id,
> $1.prev_id_plural,
> > --                                           $1.obsolete);
> > --                      free ($3.string);
> > --                    }
> > -+                    do_callback_message ($1.ctxt, string2, &$1.pos,
> $3.string,
> > -+                                         $4.rhs.msgstr,
> $4.rhs.msgstr_len, &$4.pos,
> > -+                                         $1.prev_ctxt,
> > -+                                         $1.prev_id, $1.prev_id_plural,
> > -+                                         $1.obsolete);
> > -                   else
> > -                     {
> > -                       free_message_intro ($1);
> > -diff --git a/gettext-tools/src/read-catalog.c
> b/gettext-tools/src/read-catalog.c
> > -index 571d18e..6af6d20 100644
> > ---- a/gettext-tools/src/read-catalog.c
> > -+++ b/gettext-tools/src/read-catalog.c
> > -@@ -397,6 +397,8 @@ default_add_message (default_catalog_reader_ty
> *this,
> > -          appropriate.  */
> > -       mp = message_alloc (msgctxt, msgid, msgid_plural, msgstr,
> msgstr_len,
> > -                           msgstr_pos);
> > -+      if (msgid_plural != NULL)
> > -+        free (msgid_plural);
> > -       mp->prev_msgctxt = prev_msgctxt;
> > -       mp->prev_msgid = prev_msgid;
> > -       mp->prev_msgid_plural = prev_msgid_plural;
> > -diff --git a/gettext-tools/tests/Makefile.am
> b/gettext-tools/tests/Makefile.am
> > -index 23b09b1..0dfb4d8 100644
> > ---- a/gettext-tools/tests/Makefile.am
> > -+++ b/gettext-tools/tests/Makefile.am
> > -@@ -95,7 +95,7 @@ TESTS = gettext-1 gettext-2 gettext-3 gettext-4
> gettext-5 gettext-6 gettext-7 \
> > -     xgettext-perl-1 xgettext-perl-2 xgettext-perl-3 xgettext-perl-4 \
> > -     xgettext-perl-5 xgettext-perl-6 xgettext-perl-7 xgettext-perl-8 \
> > -     xgettext-php-1 xgettext-php-2 xgettext-php-3 xgettext-php-4 \
> > --    xgettext-po-1 \
> > -+    xgettext-po-1 xgettext-po-2 \
> > -     xgettext-properties-1 \
> > -     xgettext-python-1 xgettext-python-2 xgettext-python-3 \
> > -     xgettext-python-4 \
> > -diff --git a/gettext-tools/tests/xgettext-po-2
> b/gettext-tools/tests/xgettext-po-2
> > -new file mode 100755
> > -index 0000000..c4bd9d0
> > ---- /dev/null
> > -+++ b/gettext-tools/tests/xgettext-po-2
> > -@@ -0,0 +1,55 @@
> > -+#! /bin/sh
> > -+. "${srcdir=.}/init.sh"; path_prepend_ . ../src
> > -+
> > -+# Test PO extractors with multiple input files.
> > -+
> > -+cat <<EOF > xg-po-2-1.po
> > -+msgid "first msgid"
> > -+msgid_plural "first msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+
> > -+msgid "second msgid"
> > -+msgid_plural "second msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+EOF
> > -+
> > -+cat <<EOF > xg-po-2-2.po
> > -+msgid "third msgid"
> > -+msgid_plural "third msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+
> > -+msgid "second msgid"
> > -+msgid_plural "second msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+EOF
> > -+
> > -+: ${XGETTEXT=xgettext}
> > -+${XGETTEXT} --omit-header xg-po-2-1.po xg-po-2-2.po -o xg-po-2.tmp.po
> || Exit 1
> > -+LC_ALL=C tr -d '\r' < xg-po-2.tmp.po > xg-po-2.po || Exit 1
> > -+
> > -+cat <<EOF > xg-po-2.ok
> > -+msgid "first msgid"
> > -+msgid_plural "first msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+
> > -+msgid "second msgid"
> > -+msgid_plural "second msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+
> > -+msgid "third msgid"
> > -+msgid_plural "third msgid (plural)"
> > -+msgstr[0] ""
> > -+msgstr[1] ""
> > -+EOF
> > -+
> > -+: ${DIFF=diff}
> > -+${DIFF} xg-po-2.ok xg-po-2.po
> > -+result=$?
> > -+
> > -+exit $result
> > ---
> > -1.9.1
> > -
> > diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
> b/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
> > deleted file mode 100644
> > index c8e2c94af0e..00000000000
> > --- a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -instal libgettextlib.a before removing it
> > -
> > -In a multiple job build, Makefile can simultaneously
> > -be installing and removing libgettextlib.a.  We serialize
> > -the operations.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Joe Slater <jslater@windriver.com>
> > -
> > ---- a/gettext-tools/gnulib-lib/Makefile.am
> > -+++ b/gettext-tools/gnulib-lib/Makefile.am
> > -@@ -57,6 +57,10 @@ endif
> > - # Rules generated and collected by gnulib-tool.
> > - include Makefile.gnulib
> > -
> > -+# defined in Makefile.gnulib but missing this dependency
> > -+#
> > -+install-exec-clean: install-libLTLIBRARIES
> > -+
> > - # Which classes to export from the shared library.
> > - MOOPPFLAGS += --dllexport=styled_ostream
> > -
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
> b/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
> > deleted file mode 100644
> > index 6156a153f74..00000000000
> > --- a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch
> > +++ /dev/null
> > @@ -1,321 +0,0 @@
> > -For reasons which I just can't fathom gnulib doesn't use the expected
> tools to
> > -find libraries but badly reinvents the wheel.  This will trivially lead
> to host
> > -contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
> > -canonicalisation resulting in relative paths).
> > -
> > -Simply delete all the crazy, and replace with a single call to
> pkg-config.
> > -
> > -Upstream-Status: Inappropriate (upstream still refuse to consider
> pkg-config)
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -diff --git a/gnulib-local/m4/libcroco.m4 b/gnulib-local/m4/libcroco.m4
> > -index f79ea82f1..1f67274db 100644
> > ---- a/gettext-tools/gnulib-m4/libcroco.m4
> > -+++ b/gettext-tools/gnulib-m4/libcroco.m4
> > -@@ -8,6 +8,7 @@ dnl From Bruno Haible.
> > -
> > - AC_DEFUN([gl_LIBCROCO],
> > - [
> > -+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > -   dnl libcroco depends on libglib.
> > -   AC_REQUIRE([gl_LIBGLIB])
> > -
> > -@@ -23,65 +24,10 @@ AC_DEFUN([gl_LIBCROCO],
> > -   LTLIBCROCO=
> > -   INCCROCO=
> > -   if test "$gl_cv_libcroco_use_included" != yes; then
> > --    dnl Figure out whether we can use a preinstalled libcroco-0.6, or
> have to
> > --    dnl use the included one.
> > --    AC_CACHE_VAL([gl_cv_libcroco], [
> > --      gl_cv_libcroco=no
> > --      gl_cv_LIBCROCO=
> > --      gl_cv_LTLIBCROCO=
> > --      gl_cv_INCCROCO=
> > --      gl_save_LIBS="$LIBS"
> > --      dnl Search for libcroco and define LIBCROCO_0_6, LTLIBCROCO_0_6
> and
> > --      dnl INCCROCO_0_6 accordingly.
> > --      dnl Don't use croco-0.6-config nor pkg-config, since it doesn't
> work when
> > --      dnl cross-compiling or when the C compiler in use is different
> from the
> > --      dnl one that built the library.
> > --      AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
> > --      LIBS="$gl_save_LIBS $LIBCROCO_0_6"
> > --      AC_TRY_LINK([#include <libcroco-config.h>],
> > --        [const char *version = LIBCROCO_VERSION; return !version;],
> > --        [gl_cv_libcroco=yes
> > --         gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > --         gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > --        ])
> > --      if test "$gl_cv_libcroco" != yes; then
> > --        gl_save_CPPFLAGS="$CPPFLAGS"
> > --        CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
> > --        AC_TRY_LINK([#include <libcroco-config.h>],
> > --          [const char *version = LIBCROCO_VERSION; return !version;],
> > --          [gl_cv_libcroco=yes
> > --           gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > --           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > --           gl_cv_INCCROCO="$INCCROCO_0_6"
> > --          ])
> > --        if test "$gl_cv_libcroco" != yes; then
> > --          dnl Often the include files are installed in
> > --          dnl /usr/include/libcroco-0.6/libcroco.
> > --          AC_TRY_LINK([#include
> <libcroco-0.6/libcroco/libcroco-config.h>],
> > --            [const char *version = LIBCROCO_VERSION; return !version;],
> > --
> [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
> > --             libcroco_include_dir=`echo
> "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e
> 's,.libcroco-config\.h$,,'`
> > --             if test -d "$libcroco_include_dir"; then
> > --               gl_cv_libcroco=yes
> > --               gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > --               gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > --               gl_cv_INCCROCO="-I$libcroco_include_dir"
> > --             fi
> > --            ])
> > --        fi
> > --        CPPFLAGS="$gl_save_CPPFLAGS"
> > --      fi
> > --      LIBS="$gl_save_LIBS"
> > --    ])
> > --    AC_MSG_CHECKING([for libcroco])
> > --    AC_MSG_RESULT([$gl_cv_libcroco])
> > --    if test $gl_cv_libcroco = yes; then
> > --      LIBCROCO="$gl_cv_LIBCROCO"
> > --      LTLIBCROCO="$gl_cv_LTLIBCROCO"
> > --      INCCROCO="$gl_cv_INCCROCO"
> > --    else
> > --      gl_cv_libcroco_use_included=yes
> > --    fi
> > -+    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
> > -+    LIBCROCO=$CROCO_LIBS
> > -+    LTLIBCROCO=$CROCO_LIBS
> > -+    INCCROCO=$CROCO_CFLAGS
> > -   fi
> > -   AC_SUBST([LIBCROCO])
> > -   AC_SUBST([LTLIBCROCO])
> > -diff --git a/gnulib-local/m4/libglib.m4 b/gnulib-local/m4/libglib.m4
> > -index 42e55e6fd..ab25a5b22 100644
> > ---- a/gettext-tools/gnulib-m4/libglib.m4
> > -+++ b/gettext-tools/gnulib-m4/libglib.m4
> > -@@ -8,6 +8,7 @@ dnl From Bruno Haible.
> > -
> > - AC_DEFUN([gl_LIBGLIB],
> > - [
> > -+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > -   AC_MSG_CHECKING([whether included glib is requested])
> > -   AC_ARG_WITH([included-glib],
> > -     [  --with-included-glib    use the glib2 included here],
> > -@@ -20,76 +21,10 @@ AC_DEFUN([gl_LIBGLIB],
> > -   LTLIBGLIB=
> > -   INCGLIB=
> > -   if test "$gl_cv_libglib_use_included" != yes; then
> > --    dnl Figure out whether we can use a preinstalled libglib-2.0, or
> have to use
> > --    dnl the included one.
> > --    AC_CACHE_VAL([gl_cv_libglib], [
> > --      gl_cv_libglib=no
> > --      gl_cv_LIBGLIB=
> > --      gl_cv_LTLIBGLIB=
> > --      gl_cv_INCGLIB=
> > --      gl_save_LIBS="$LIBS"
> > --      dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0 and
> > --      dnl INCGLIB_2_0 accordingly.
> > --      dnl Don't use glib-config nor pkg-config, since it doesn't work
> when
> > --      dnl cross-compiling or when the C compiler in use is different
> from the
> > --      dnl one that built the library.
> > --      AC_LIB_LINKFLAGS_BODY([glib-2.0])
> > --      LIBS="$gl_save_LIBS $LIBGLIB_2_0"
> > --      AC_TRY_LINK([#include <glib.h>
> > --#ifndef G_BEGIN_DECLS
> > --error this glib.h includes a glibconfig.h from a glib version 1.x
> > --#endif
> > --],
> > --        [g_string_new ("foo");],
> > --        [gl_cv_libglib=yes
> > --         gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > --         gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > --        ])
> > --      if test "$gl_cv_libglib" != yes; then
> > --        gl_save_CPPFLAGS="$CPPFLAGS"
> > --        CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
> > --        AC_TRY_LINK([#include <glib.h>
> > --#ifndef G_BEGIN_DECLS
> > --error this glib.h includes a glibconfig.h from a glib version 1.x
> > --#endif
> > --],
> > --          [g_string_new ("foo");],
> > --          [gl_cv_libglib=yes
> > --           gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > --           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > --           gl_cv_INCGLIB="$INCGLIB_2_0"
> > --          ])
> > --        if test "$gl_cv_libglib" != yes; then
> > --          dnl Often the include files are installed in
> /usr/include/glib-2.0
> > --          dnl and /usr/lib/glib-2.0/include.
> > --          if test -n "$LIBGLIB_2_0_PREFIX"; then
> > --            CPPFLAGS="$gl_save_CPPFLAGS
> -I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > --            AC_TRY_LINK([#include <glib.h>
> > --#ifndef G_BEGIN_DECLS
> > --error this glib.h includes a glibconfig.h from a glib version 1.x
> > --#endif
> > --],
> > --              [g_string_new ("foo");],
> > --              [gl_cv_libglib=yes
> > --               gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > --               gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > --               gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > --              ])
> > --          fi
> > --        fi
> > --        CPPFLAGS="$gl_save_CPPFLAGS"
> > --      fi
> > --      LIBS="$gl_save_LIBS"
> > --    ])
> > --    AC_MSG_CHECKING([for glib])
> > --    AC_MSG_RESULT([$gl_cv_libglib])
> > --    if test $gl_cv_libglib = yes; then
> > --      LIBGLIB="$gl_cv_LIBGLIB"
> > --      LTLIBGLIB="$gl_cv_LTLIBGLIB"
> > --      INCGLIB="$gl_cv_INCGLIB"
> > --    else
> > --      gl_cv_libglib_use_included=yes
> > --    fi
> > -+    PKG_CHECK_MODULES([GLIB], [glib-2.0])
> > -+    LIBGLIB="$GLIB_LIBS"
> > -+    LTLIBGLIB="$GLIB_LIBS"
> > -+    INCGLIB="$GLIB_CFLAGS"
> > -   fi
> > -   AC_SUBST([LIBGLIB])
> > -   AC_SUBST([LTLIBGLIB])
> > -diff --git a/gnulib-local/m4/libxml.m4 b/gnulib-local/m4/libxml.m4
> > -index 480c700d2..cb39309d5 100644
> > ---- a/gettext-tools/gnulib-m4/libxml.m4
> > -+++ b/gettext-tools/gnulib-m4/libxml.m4
> > -@@ -8,6 +8,7 @@ dnl From Bruno Haible.
> > -
> > - AC_DEFUN([gl_LIBXML],
> > - [
> > -+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > -   AC_REQUIRE([AM_ICONV_LINK])
> > -
> > -   AC_MSG_CHECKING([whether included libxml is requested])
> > -@@ -22,100 +22,10 @@ AC_DEFUN([gl_LIBXML],
> > -   LTLIBXML=
> > -   INCXML=
> > -   if test "$gl_cv_libxml_use_included" != yes; then
> > --    dnl Figure out whether we can use a preinstalled libxml2, or have
> to use
> > --    dnl the included one.
> > --    AC_CACHE_VAL([gl_cv_libxml], [
> > --      gl_cv_libxml=no
> > --      gl_cv_LIBXML=
> > --      gl_cv_LTLIBXML=
> > --      gl_cv_INCXML=
> > --      gl_save_LIBS="$LIBS"
> > --      LIBS="$LIBS $LIBICONV"
> > --      dnl Search for libxml2 and define LIBXML2, LTLIBXML2 and INCXML2
> > --      dnl accordingly.
> > --      dnl Don't use xml2-config nor pkg-config, since it doesn't work
> when
> > --      dnl cross-compiling or when the C compiler in use is different
> from the
> > --      dnl one that built the library.
> > --      dnl Use a test program that tries to invoke xmlFree. On Cygwin
> 1.7.x,
> > --      dnl libxml2 is built in such a way that uses of xmlFree work
> fine with
> > --      dnl -Wl,--enable-auto-import but lead to a link error with
> > --      dnl -Wl,--disable-auto-import.
> > --      AC_LIB_LINKFLAGS_BODY([xml2])
> > --      LIBS="$gl_save_LIBS $LIBXML2 $LIBICONV"
> > --      AC_TRY_LINK([#include <libxml/xmlversion.h>
> > --                   #include <libxml/xmlmemory.h>
> > --                   #include <libxml/xpath.h>
> > --                  ],
> > --        [xmlCheckVersion (0);
> > --         xmlFree ((void *) 0);
> > --         xmlXPathSetContextNode ((void *)0, (void *)0);
> > --        ],
> > --        [gl_cv_libxml=yes
> > --         gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > --         gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > --        ])
> > --      if test "$gl_cv_libxml" != yes; then
> > --        gl_save_CPPFLAGS="$CPPFLAGS"
> > --        CPPFLAGS="$CPPFLAGS $INCXML2"
> > --        AC_TRY_LINK([#include <libxml/xmlversion.h>
> > --                     #include <libxml/xmlmemory.h>
> > --                     #include <libxml/xpath.h>
> > --                    ],
> > --          [xmlCheckVersion (0);
> > --           xmlFree ((void *) 0);
> > --           xmlXPathSetContextNode ((void *)0, (void *)0);
> > --          ],
> > --          [gl_cv_libxml=yes
> > --           gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > --           gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > --           gl_cv_INCXML="$INCXML2"
> > --          ])
> > --        if test "$gl_cv_libxml" != yes; then
> > --          dnl Often the include files are installed in
> /usr/include/libxml2.
> > --          dnl In libxml2-2.5, <libxml/xmlversion.h> is self-contained.
> > --          dnl In libxml2-2.6, it includes <libxml/xmlexports.h> which
> is
> > --          dnl self-contained.
> > --          libxml2_include_dir=
> > --          AC_TRY_CPP([#include <libxml2/libxml/xmlexports.h>],
> > --            [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlexports.h])
> > --             libxml2_include_dir=`echo
> "$gl_cv_absolute_libxml2_libxml_xmlexports_h" | sed -e
> 's,.libxml.xmlexports\.h$,,'`
> > --            ])
> > --          if test -z "$libxml2_include_dir"; then
> > --            AC_TRY_CPP([#include <libxml2/libxml/xmlversion.h>],
> > --              [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlversion.h])
> > --               libxml2_include_dir=`echo
> "$gl_cv_absolute_libxml2_libxml_xmlversion_h" | sed -e
> 's,.libxml.xmlversion\.h$,,'`
> > --              ])
> > --          fi
> > --          if test -n "$libxml2_include_dir" && test -d
> "$libxml2_include_dir"; then
> > --            CPPFLAGS="$gl_save_CPPFLAGS -I$libxml2_include_dir"
> > --            AC_TRY_LINK([#include <libxml/xmlversion.h>
> > --                         #include <libxml/xmlmemory.h>
> > --                         #include <libxml/xpath.h>
> > --                        ],
> > --              [xmlCheckVersion (0);
> > --               xmlFree ((void *) 0);
> > --               xmlXPathSetContextNode ((void *)0, (void *)0);
> > --              ],
> > --              [gl_cv_libxml=yes
> > --               gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > --               gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > --               gl_cv_INCXML="-I$libxml2_include_dir"
> > --              ])
> > --          fi
> > --        fi
> > --        CPPFLAGS="$gl_save_CPPFLAGS"
> > --      fi
> > --      LIBS="$gl_save_LIBS"
> > --    ])
> > --    AC_MSG_CHECKING([for libxml])
> > --    AC_MSG_RESULT([$gl_cv_libxml])
> > --    if test $gl_cv_libxml = yes; then
> > --      LIBXML="$gl_cv_LIBXML"
> > --      LTLIBXML="$gl_cv_LTLIBXML"
> > --      INCXML="$gl_cv_INCXML"
> > --    else
> > --      gl_cv_libxml_use_included=yes
> > --    fi
> > -+    PKG_CHECK_MODULES([XML], [libxml-2.0])
> > -+    LIBXML=$XML_LIBS
> > -+    LTLIBXML=$XML_LIBS
> > -+    INCXML=$XML_CFLAGS
> > -   fi
> > -   AC_SUBST([LIBXML])
> > -   AC_SUBST([LTLIBXML])
> > -diff --git a/gnulib-local/lib/term-styled-ostream.oo.c
> b/gnulib-local/lib/term-styled-ostream.oo.c
> > -index 81a407467..218565329 100644
> > ---- a/gettext-tools/gnulib-lib/term-styled-ostream.oo.c
> > -+++ b/gettext-tools/gnulib-lib/term-styled-ostream.oo.c
> > -@@ -25,4 +25,4 @@
> > --#include <cr-om-parser.h>
> > --#include <cr-sel-eng.h>
> > --#include <cr-style.h>
> > --#include <cr-rgb.h>
> > -+#include <libcroco/cr-om-parser.h>
> > -+#include <libcroco/cr-sel-eng.h>
> > -+#include <libcroco/cr-style.h>
> > -+#include <libcroco/cr-rgb.h>
> > -@@ -31 +31 @@
> > --# include <cr-fonts.h>
> > -+# include <libcroco/cr-fonts.h>
> > -@@ -33 +33 @@
> > --#include <cr-string.h>
> > -+#include <libcroco/cr-string.h>
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
> > similarity index 100%
> > rename from
> meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch
> > rename to
> meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> > similarity index 68%
> > rename from
> meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> > rename to
> meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> > index 6af16041987..0561ed7d32c 100644
> > ---
> a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> > +++
> b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> > @@ -1,4 +1,4 @@
> > -From e546de65a333789e83f5485757967cee29ee3681 Mon Sep 17 00:00:00 2001
> > +From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001
> >  From: Robert Yang <liezhi.yang@windriver.com>
> >  Date: Sun, 19 Feb 2017 23:32:46 -0800
> >  Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
> > @@ -15,15 +15,15 @@ gettext-tools/gnulib-lib/libxml/timsort.h:326:80:
> warning: format '%lu' expects
> >  Upstream-Status: Pending
> >
> >  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> >  ---
> > - gettext-tools/gnulib-lib/libcroco/cr-statement.c | 10 +++++-----
> > - gettext-tools/gnulib-lib/libxml/timsort.h        |  2 +-
> > - 2 files changed, 6 insertions(+), 6 deletions(-)
> > + libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > -diff --git a/gettext-tools/gnulib-lib/libcroco/cr-statement.c
> b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
> > +diff --git a/libtextstyle/lib/libcroco/cr-statement.c
> b/libtextstyle/lib/libcroco/cr-statement.c
> >  index 617520f..100104b 100644
> > ---- a/gettext-tools/gnulib-lib/libcroco/cr-statement.c
> > -+++ b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
> > +--- a/libtextstyle/lib/libcroco/cr-statement.c
> > ++++ b/libtextstyle/lib/libcroco/cr-statement.c
> >  @@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this,
> FILE * a_fp, glong a_indent)
> >           g_return_if_fail (a_fp && a_this);
> >           str = cr_statement_ruleset_to_string (a_this, a_indent);
> > @@ -69,19 +69,3 @@ index 617520f..100104b 100644
> >                   g_free (str) ;
> >                   str = NULL ;
> >           }
> > -diff --git a/gettext-tools/gnulib-lib/libxml/timsort.h
> b/gettext-tools/gnulib-lib/libxml/timsort.h
> > -index 795f272..443918a 100644
> > ---- a/gettext-tools/gnulib-lib/libxml/timsort.h
> > -+++ b/gettext-tools/gnulib-lib/libxml/timsort.h
> > -@@ -323,7 +323,7 @@ static void TIM_SORT_RESIZE(TEMP_STORAGE_T *store,
> const size_t new_size)
> > -     SORT_TYPE *tempstore = (SORT_TYPE *)realloc(store->storage,
> new_size * sizeof(SORT_TYPE));
> > -     if (tempstore == NULL)
> > -     {
> > --      fprintf(stderr, "Error allocating temporary storage for tim
> sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
> > -+      fprintf(stderr, "Error allocating temporary storage for tim
> sort: need %zu bytes", sizeof(SORT_TYPE) * new_size);
> > -       exit(1);
> > -     }
> > -     store->storage = tempstore;
> > ---
> > -2.10.2
> > -
> > diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> > new file mode 100644
> > index 00000000000..d96a376b7d1
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> > @@ -0,0 +1,32 @@
> > +From 4a2a0a93b469093b60ffd0bec55d33d1e03d4713 Mon Sep 17 00:00:00 2001
> > +From: Joe Slater <jslater@windriver.com>
> > +Date: Thu, 7 Jun 2012 16:37:01 -0700
> > +Subject: [PATCH] instal libgettextlib.a before removing it
> > +
> > +In a multiple job build, Makefile can simultaneously
> > +be installing and removing libgettextlib.a.  We serialize
> > +the operations.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Joe Slater <jslater@windriver.com>
> > +
> > +---
> > + gettext-tools/gnulib-lib/Makefile.am | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/gettext-tools/gnulib-lib/Makefile.am
> b/gettext-tools/gnulib-lib/Makefile.am
> > +index 2126699..d2dd7e4 100644
> > +--- a/gettext-tools/gnulib-lib/Makefile.am
> > ++++ b/gettext-tools/gnulib-lib/Makefile.am
> > +@@ -58,6 +58,10 @@ endif
> > + # Rules generated and collected by gnulib-tool.
> > + include Makefile.gnulib
> > +
> > ++# defined in Makefile.gnulib but missing this dependency
> > ++#
> > ++install-exec-clean: install-libLTLIBRARIES
> > ++
> > + # OS/2 does not support a DLL name longer than 8 characters.
> > + if OS2
> > + libgettextlib_la_LDFLAGS += -os2dllname gtlib
> > diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
> b/meta/recipes-core/gettext/gettext-0.20.1/run-ptest
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
> > rename to meta/recipes-core/gettext/gettext-0.20.1/run-ptest
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
> > similarity index 75%
> > rename from
> meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
> > rename to
> meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
> > index 31ff9138a91..93f7c03334a 100644
> > ---
> a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
> > +++ b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
> > @@ -1,4 +1,4 @@
> > -From c4b1f3a0c7b7c40b343be9b95deb84e0485643be Mon Sep 17 00:00:00 2001
> > +From ed64a5724ef7d6eb4e9a876f817ea266a536e195 Mon Sep 17 00:00:00 2001
> >  From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> >  Date: Thu, 28 Jul 2016 12:36:15 +0800
> >  Subject: [PATCH] fix for ptest
> > @@ -8,6 +8,7 @@ Add serial-tests support, ptest need it
> >  Upstream-Status: Inappropriate [oe specific]
> >
> >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +
> >  ---
> >   configure.ac                 | 2 +-
> >   gettext-runtime/configure.ac | 2 +-
> > @@ -15,24 +16,24 @@ Signed-off-by: Changqing Li <
> changqing.li@windriver.com>
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index 5e996fa..880581f 100644
> > +index 38db6fd..f019ae0 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -23,7 +23,7 @@ AC_INIT([gettext],
> > -     [bug-gnu-gettext@gnu.org])
> > +@@ -22,7 +22,7 @@ AC_INIT([gettext],
> > +     [bug-gettext@gnu.org])
> >   AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])
> >   AC_CONFIG_AUX_DIR([build-aux])
> > --AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests dist-xz dist-lzip])
> > -+AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests dist-xz dist-lzip])
> > +-AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests tar-ustar])
> > ++AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests tar-ustar])
> >
> >   dnl Override automake's tar command used for creating distributions.
> > - am__tar='${AMTAR} chof - --owner=root --group=root "$$tardir"'
> > + am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root
> "$$tardir"'
> >  diff --git a/gettext-runtime/configure.ac b/gettext-runtime/
> configure.ac
> > -index e9299b6..d4f5528 100644
> > +index de203e7..138a07f 100644
> >  --- a/gettext-runtime/configure.ac
> >  +++ b/gettext-runtime/configure.ac
> >  @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
> > -     [bug-gnu-gettext@gnu.org])
> > +     [bug-gettext@gnu.org])
> >   AC_CONFIG_SRCDIR([intl/dcigettext.c])
> >   AC_CONFIG_AUX_DIR([../build-aux])
> >  -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
> > @@ -41,11 +42,11 @@ index e9299b6..d4f5528 100644
> >
> >   dnl Installation directories.
> >  diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
> > -index 920eeb6..c507434 100644
> > +index cf1dd73..b544d6d 100644
> >  --- a/gettext-tools/configure.ac
> >  +++ b/gettext-tools/configure.ac
> >  @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
> > -     [bug-gnu-gettext@gnu.org])
> > +     [bug-gettext@gnu.org])
> >   AC_CONFIG_SRCDIR([src/msgfmt.c])
> >   AC_CONFIG_AUX_DIR([../build-aux])
> >  -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
> > @@ -53,6 +54,3 @@ index 920eeb6..c507434 100644
> >   AC_CONFIG_HEADERS([config.h])
> >
> >   dnl Installation directories.
> > ---
> > -2.1.4
> > -
> > diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> > new file mode 100644
> > index 00000000000..d1b2603779b
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> > @@ -0,0 +1,713 @@
> > +From ef414b06be80c6f605731abc9e674e396b80ec9e Mon Sep 17 00:00:00 2001
> > +From: Ross Burton <ross.burton@intel.com>
> > +Date: Tue, 23 Jan 2018 00:54:13 +0000
> > +Subject: [PATCH] gettext: beat library detection into shape
> > +
> > +For reasons which I just can't fathom gnulib doesn't use the expected
> tools to
> > +find libraries but badly reinvents the wheel.  This will trivially lead
> to host
> > +contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
> > +canonicalisation resulting in relative paths).
> > +
> > +Simply delete all the crazy, and replace with a single call to
> pkg-config.
> > +
> > +Upstream-Status: Inappropriate (upstream still refuse to consider
> pkg-config)
> > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +---
> > + gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
> > + .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
> > + libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
> > + libtextstyle/gnulib-local/m4/libglib.m4       | 104 +++---------------
> > + libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
> > + libtextstyle/gnulib-m4/libglib.m4             | 104 +++---------------
> > + libtextstyle/lib/term-styled-ostream.c        |  12 +-
> > + libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
> > + 8 files changed, 87 insertions(+), 454 deletions(-)
> > +
> > +diff --git a/gettext-tools/gnulib-m4/libxml.m4
> b/gettext-tools/gnulib-m4/libxml.m4
> > +index 05b9550..031ee65 100644
> > +--- a/gettext-tools/gnulib-m4/libxml.m4
> > ++++ b/gettext-tools/gnulib-m4/libxml.m4
> > +@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
> > + dnl   forces the use of the included or an external libxml.
> > + AC_DEFUN([gl_LIBXML],
> > + [
> > ++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > +   AC_REQUIRE([AM_ICONV_LINK])
> > +
> > +   ifelse([$1], , [
> > +@@ -30,100 +31,10 @@ AC_DEFUN([gl_LIBXML],
> > +   INCXML=
> > +   ifelse([$1], [yes], , [
> > +     if test "$gl_cv_libxml_use_included" != yes; then
> > +-      dnl Figure out whether we can use a preinstalled libxml2, or
> have to use
> > +-      dnl the included one.
> > +-      AC_CACHE_VAL([gl_cv_libxml], [
> > +-        gl_cv_libxml=no
> > +-        gl_cv_LIBXML=
> > +-        gl_cv_LTLIBXML=
> > +-        gl_cv_INCXML=
> > +-        gl_save_LIBS="$LIBS"
> > +-        LIBS="$LIBS $LIBICONV"
> > +-        dnl Search for libxml2 and define LIBXML2, LTLIBXML2 and
> INCXML2
> > +-        dnl accordingly.
> > +-        dnl Don't use xml2-config nor pkg-config, since it doesn't
> work when
> > +-        dnl cross-compiling or when the C compiler in use is different
> from the
> > +-        dnl one that built the library.
> > +-        dnl Use a test program that tries to invoke xmlFree. On Cygwin
> 1.7.x,
> > +-        dnl libxml2 is built in such a way that uses of xmlFree work
> fine with
> > +-        dnl -Wl,--enable-auto-import but lead to a link error with
> > +-        dnl -Wl,--disable-auto-import.
> > +-        AC_LIB_LINKFLAGS_BODY([xml2])
> > +-        LIBS="$gl_save_LIBS $LIBXML2 $LIBICONV"
> > +-        AC_TRY_LINK([#include <libxml/xmlversion.h>
> > +-                     #include <libxml/xmlmemory.h>
> > +-                     #include <libxml/xpath.h>
> > +-                    ],
> > +-          [xmlCheckVersion (0);
> > +-           xmlFree ((void *) 0);
> > +-           xmlXPathSetContextNode ((void *)0, (void *)0);
> > +-          ],
> > +-          [gl_cv_libxml=yes
> > +-           gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > +-           gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > +-          ])
> > +-        if test "$gl_cv_libxml" != yes; then
> > +-          gl_save_CPPFLAGS="$CPPFLAGS"
> > +-          CPPFLAGS="$CPPFLAGS $INCXML2"
> > +-          AC_TRY_LINK([#include <libxml/xmlversion.h>
> > +-                       #include <libxml/xmlmemory.h>
> > +-                       #include <libxml/xpath.h>
> > +-                      ],
> > +-            [xmlCheckVersion (0);
> > +-             xmlFree ((void *) 0);
> > +-             xmlXPathSetContextNode ((void *)0, (void *)0);
> > +-            ],
> > +-            [gl_cv_libxml=yes
> > +-             gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > +-             gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > +-             gl_cv_INCXML="$INCXML2"
> > +-            ])
> > +-          if test "$gl_cv_libxml" != yes; then
> > +-            dnl Often the include files are installed in
> /usr/include/libxml2.
> > +-            dnl In libxml2-2.5, <libxml/xmlversion.h> is
> self-contained.
> > +-            dnl In libxml2-2.6, it includes <libxml/xmlexports.h>
> which is
> > +-            dnl self-contained.
> > +-            libxml2_include_dir=
> > +-            AC_TRY_CPP([#include <libxml2/libxml/xmlexports.h>],
> > +-              [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlexports.h])
> > +-               libxml2_include_dir=`echo
> "$gl_cv_absolute_libxml2_libxml_xmlexports_h" | sed -e
> 's,.libxml.xmlexports\.h$,,'`
> > +-              ])
> > +-            if test -z "$libxml2_include_dir"; then
> > +-              AC_TRY_CPP([#include <libxml2/libxml/xmlversion.h>],
> > +-                [gl_ABSOLUTE_HEADER([libxml2/libxml/xmlversion.h])
> > +-                 libxml2_include_dir=`echo
> "$gl_cv_absolute_libxml2_libxml_xmlversion_h" | sed -e
> 's,.libxml.xmlversion\.h$,,'`
> > +-                ])
> > +-            fi
> > +-            if test -n "$libxml2_include_dir" && test -d
> "$libxml2_include_dir"; then
> > +-              CPPFLAGS="$gl_save_CPPFLAGS -I$libxml2_include_dir"
> > +-              AC_TRY_LINK([#include <libxml/xmlversion.h>
> > +-                           #include <libxml/xmlmemory.h>
> > +-                           #include <libxml/xpath.h>
> > +-                          ],
> > +-                [xmlCheckVersion (0);
> > +-                 xmlFree ((void *) 0);
> > +-                 xmlXPathSetContextNode ((void *)0, (void *)0);
> > +-                ],
> > +-                [gl_cv_libxml=yes
> > +-                 gl_cv_LIBXML="$LIBXML2 $LIBICONV"
> > +-                 gl_cv_LTLIBXML="$LTLIBXML2 $LTLIBICONV"
> > +-                 gl_cv_INCXML="-I$libxml2_include_dir"
> > +-                ])
> > +-            fi
> > +-          fi
> > +-          CPPFLAGS="$gl_save_CPPFLAGS"
> > +-        fi
> > +-        LIBS="$gl_save_LIBS"
> > +-      ])
> > +-      AC_MSG_CHECKING([for libxml])
> > +-      AC_MSG_RESULT([$gl_cv_libxml])
> > +-      if test $gl_cv_libxml = yes; then
> > +-        LIBXML="$gl_cv_LIBXML"
> > +-        LTLIBXML="$gl_cv_LTLIBXML"
> > +-        INCXML="$gl_cv_INCXML"
> > +-      else
> > +-        gl_cv_libxml_use_included=yes
> > +-      fi
> > ++      PKG_CHECK_MODULES([XML], [libxml-2.0])
> > ++      LIBXML=$XML_LIBS
> > ++      LTLIBXML=$XML_LIBS
> > ++      INCXML=$XML_CFLAGS
> > +     fi
> > +   ])
> > +   AC_SUBST([LIBXML])
> > +diff --git a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
> b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
> > +index 2cfd4a8..d42c8b4 100644
> > +--- a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
> > ++++ b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c
> > +@@ -22,15 +22,15 @@
> > +
> > + #include <stdlib.h>
> > +
> > +-#include <cr-om-parser.h>
> > +-#include <cr-sel-eng.h>
> > +-#include <cr-style.h>
> > +-#include <cr-rgb.h>
> > ++#include <libcroco/cr-om-parser.h>
> > ++#include <libcroco/cr-sel-eng.h>
> > ++#include <libcroco/cr-style.h>
> > ++#include <libcroco/cr-rgb.h>
> > + /* <cr-fonts.h> has a broken double-inclusion guard in
> libcroco-0.6.1.  */
> > + #ifndef __CR_FONTS_H__
> > +-# include <cr-fonts.h>
> > ++# include <libcroco/cr-fonts.h>
> > + #endif
> > +-#include <cr-string.h>
> > ++#include <libcroco/cr-string.h>
> > +
> > + #include "term-ostream.h"
> > + #include "hash.h"
> > +diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4
> b/libtextstyle/gnulib-local/m4/libcroco.m4
> > +index bc53cc6..10b2455 100644
> > +--- a/libtextstyle/gnulib-local/m4/libcroco.m4
> > ++++ b/libtextstyle/gnulib-local/m4/libcroco.m4
> > +@@ -1,99 +1,34 @@
> > +-# libcroco.m4 serial 3
> > +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
> > ++# libcroco.m4 serial 2 (gettext-0.17)
> > ++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
> > + dnl This file is free software; the Free Software Foundation
> > + dnl gives unlimited permission to copy and/or distribute it,
> > + dnl with or without modifications, as long as this notice is preserved.
> > +
> > + dnl From Bruno Haible.
> > +
> > +-dnl gl_LIBCROCO
> > +-dnl   gives the user the option to decide whether to use the included
> or
> > +-dnl   an external libcroco.
> > +-dnl gl_LIBCROCO(FORCE-INCLUDED)
> > +-dnl   forces the use of the included or an external libcroco.
> > + AC_DEFUN([gl_LIBCROCO],
> > + [
> > +-  ifelse([$1], [yes], , [
> > +-    dnl libcroco depends on libglib.
> > +-    AC_REQUIRE([gl_LIBGLIB])
> > +-  ])
> > ++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > ++  dnl libcroco depends on libglib.
> > ++  AC_REQUIRE([gl_LIBGLIB])
> > +
> > +-  ifelse([$1], , [
> > +-    AC_MSG_CHECKING([whether included libcroco is requested])
> > +-    AC_ARG_WITH([included-libcroco],
> > +-      [  --with-included-libcroco  use the libcroco included here],
> > +-      [gl_cv_libcroco_force_included=$withval],
> > +-      [gl_cv_libcroco_force_included=no])
> > +-    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
> > +-  ], [gl_cv_libcroco_force_included=$1])
> > ++  AC_MSG_CHECKING([whether included libcroco is requested])
> > ++  AC_ARG_WITH([included-libcroco],
> > ++    [  --with-included-libcroco  use the libcroco included here],
> > ++    [gl_cv_libcroco_force_included=$withval],
> > ++    [gl_cv_libcroco_force_included=no])
> > ++  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
> > +
> > +   gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
> > +   LIBCROCO=
> > +   LTLIBCROCO=
> > +   INCCROCO=
> > +-  ifelse([$1], [yes], , [
> > +-    if test "$gl_cv_libcroco_use_included" != yes; then
> > +-      dnl Figure out whether we can use a preinstalled libcroco-0.6,
> or have to
> > +-      dnl use the included one.
> > +-      AC_CACHE_VAL([gl_cv_libcroco], [
> > +-        gl_cv_libcroco=no
> > +-        gl_cv_LIBCROCO=
> > +-        gl_cv_LTLIBCROCO=
> > +-        gl_cv_INCCROCO=
> > +-        gl_save_LIBS="$LIBS"
> > +-        dnl Search for libcroco and define LIBCROCO_0_6,
> LTLIBCROCO_0_6 and
> > +-        dnl INCCROCO_0_6 accordingly.
> > +-        dnl Don't use croco-0.6-config nor pkg-config, since it
> doesn't work when
> > +-        dnl cross-compiling or when the C compiler in use is different
> from the
> > +-        dnl one that built the library.
> > +-        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
> > +-        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
> > +-        AC_TRY_LINK([#include <libcroco-config.h>],
> > +-          [const char *version = LIBCROCO_VERSION; return !version;],
> > +-          [gl_cv_libcroco=yes
> > +-           gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-          ])
> > +-        if test "$gl_cv_libcroco" != yes; then
> > +-          gl_save_CPPFLAGS="$CPPFLAGS"
> > +-          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
> > +-          AC_TRY_LINK([#include <libcroco-config.h>],
> > +-            [const char *version = LIBCROCO_VERSION; return !version;],
> > +-            [gl_cv_libcroco=yes
> > +-             gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-             gl_cv_INCCROCO="$INCCROCO_0_6"
> > +-            ])
> > +-          if test "$gl_cv_libcroco" != yes; then
> > +-            dnl Often the include files are installed in
> > +-            dnl /usr/include/libcroco-0.6/libcroco.
> > +-            AC_TRY_LINK([#include
> <libcroco-0.6/libcroco/libcroco-config.h>],
> > +-              [const char *version = LIBCROCO_VERSION; return
> !version;],
> > +-
> [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
> > +-               libcroco_include_dir=`echo
> "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e
> 's,.libcroco-config\.h$,,'`
> > +-               if test -d "$libcroco_include_dir"; then
> > +-                 gl_cv_libcroco=yes
> > +-                 gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-                 gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-                 gl_cv_INCCROCO="-I$libcroco_include_dir"
> > +-               fi
> > +-              ])
> > +-          fi
> > +-          CPPFLAGS="$gl_save_CPPFLAGS"
> > +-        fi
> > +-        LIBS="$gl_save_LIBS"
> > +-      ])
> > +-      AC_MSG_CHECKING([for libcroco])
> > +-      AC_MSG_RESULT([$gl_cv_libcroco])
> > +-      if test $gl_cv_libcroco = yes; then
> > +-        LIBCROCO="$gl_cv_LIBCROCO"
> > +-        LTLIBCROCO="$gl_cv_LTLIBCROCO"
> > +-        INCCROCO="$gl_cv_INCCROCO"
> > +-      else
> > +-        gl_cv_libcroco_use_included=yes
> > +-      fi
> > +-    fi
> > +-  ])
> > ++  if test "$gl_cv_libcroco_use_included" != yes; then
> > ++    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
> > ++    LIBCROCO=$CROCO_LIBS
> > ++    LTLIBCROCO=$CROCO_LIBS
> > ++    INCCROCO=$CROCO_CFLAGS
> > ++  fi
> > +   AC_SUBST([LIBCROCO])
> > +   AC_SUBST([LTLIBCROCO])
> > +   AC_SUBST([INCCROCO])
> > +diff --git a/libtextstyle/gnulib-local/m4/libglib.m4
> b/libtextstyle/gnulib-local/m4/libglib.m4
> > +index bef6fa3..8841755 100644
> > +--- a/libtextstyle/gnulib-local/m4/libglib.m4
> > ++++ b/libtextstyle/gnulib-local/m4/libglib.m4
> > +@@ -1,105 +1,31 @@
> > +-# libglib.m4 serial 4
> > +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
> > ++# libglib.m4 serial 3 (gettext-0.17)
> > ++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
> > + dnl This file is free software; the Free Software Foundation
> > + dnl gives unlimited permission to copy and/or distribute it,
> > + dnl with or without modifications, as long as this notice is preserved.
> > +
> > + dnl From Bruno Haible.
> > +
> > +-dnl gl_LIBGLIB
> > +-dnl   gives the user the option to decide whether to use the included
> or
> > +-dnl   an external libglib.
> > +-dnl gl_LIBGLIB(FORCE-INCLUDED)
> > +-dnl   forces the use of the included or an external libglib.
> > + AC_DEFUN([gl_LIBGLIB],
> > + [
> > +-  ifelse([$1], , [
> > +-    AC_MSG_CHECKING([whether included glib is requested])
> > +-    AC_ARG_WITH([included-glib],
> > +-      [  --with-included-glib    use the glib2 included here],
> > +-      [gl_cv_libglib_force_included=$withval],
> > +-      [gl_cv_libglib_force_included=no])
> > +-    AC_MSG_RESULT([$gl_cv_libglib_force_included])
> > +-  ], [gl_cv_libglib_force_included=$1])
> > ++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > ++  AC_MSG_CHECKING([whether included glib is requested])
> > ++  AC_ARG_WITH([included-glib],
> > ++    [  --with-included-glib    use the glib2 included here],
> > ++    [gl_cv_libglib_force_included=$withval],
> > ++    [gl_cv_libglib_force_included=no])
> > ++  AC_MSG_RESULT([$gl_cv_libglib_force_included])
> > +
> > +   gl_cv_libglib_use_included="$gl_cv_libglib_force_included"
> > +   LIBGLIB=
> > +   LTLIBGLIB=
> > +   INCGLIB=
> > +-  ifelse([$1], [yes], , [
> > +-    if test "$gl_cv_libglib_use_included" != yes; then
> > +-      dnl Figure out whether we can use a preinstalled libglib-2.0, or
> have to use
> > +-      dnl the included one.
> > +-      AC_CACHE_VAL([gl_cv_libglib], [
> > +-        gl_cv_libglib=no
> > +-        gl_cv_LIBGLIB=
> > +-        gl_cv_LTLIBGLIB=
> > +-        gl_cv_INCGLIB=
> > +-        gl_save_LIBS="$LIBS"
> > +-        dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0
> and
> > +-        dnl INCGLIB_2_0 accordingly.
> > +-        dnl Don't use glib-config nor pkg-config, since it doesn't
> work when
> > +-        dnl cross-compiling or when the C compiler in use is different
> from the
> > +-        dnl one that built the library.
> > +-        AC_LIB_LINKFLAGS_BODY([glib-2.0])
> > +-        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
> > +-        AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-          [g_string_new ("foo");],
> > +-          [gl_cv_libglib=yes
> > +-           gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-          ])
> > +-        if test "$gl_cv_libglib" != yes; then
> > +-          gl_save_CPPFLAGS="$CPPFLAGS"
> > +-          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
> > +-          AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-            [g_string_new ("foo");],
> > +-            [gl_cv_libglib=yes
> > +-             gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-             gl_cv_INCGLIB="$INCGLIB_2_0"
> > +-            ])
> > +-          if test "$gl_cv_libglib" != yes; then
> > +-            dnl Often the include files are installed in
> /usr/include/glib-2.0
> > +-            dnl and /usr/lib/glib-2.0/include.
> > +-            if test -n "$LIBGLIB_2_0_PREFIX"; then
> > +-              CPPFLAGS="$gl_save_CPPFLAGS
> -I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > +-              AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-                [g_string_new ("foo");],
> > +-                [gl_cv_libglib=yes
> > +-                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-                 gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > +-                ])
> > +-            fi
> > +-          fi
> > +-          CPPFLAGS="$gl_save_CPPFLAGS"
> > +-        fi
> > +-        LIBS="$gl_save_LIBS"
> > +-      ])
> > +-      AC_MSG_CHECKING([for glib])
> > +-      AC_MSG_RESULT([$gl_cv_libglib])
> > +-      if test $gl_cv_libglib = yes; then
> > +-        LIBGLIB="$gl_cv_LIBGLIB"
> > +-        LTLIBGLIB="$gl_cv_LTLIBGLIB"
> > +-        INCGLIB="$gl_cv_INCGLIB"
> > +-      else
> > +-        gl_cv_libglib_use_included=yes
> > +-      fi
> > +-    fi
> > +-  ])
> > ++  if test "$gl_cv_libglib_use_included" != yes; then
> > ++    PKG_CHECK_MODULES([GLIB], [glib-2.0])
> > ++    LIBGLIB="$GLIB_LIBS"
> > ++    LTLIBGLIB="$GLIB_LIBS"
> > ++    INCGLIB="$GLIB_CFLAGS"
> > ++  fi
> > +   AC_SUBST([LIBGLIB])
> > +   AC_SUBST([LTLIBGLIB])
> > +   AC_SUBST([INCGLIB])
> > +diff --git a/libtextstyle/gnulib-m4/libcroco.m4
> b/libtextstyle/gnulib-m4/libcroco.m4
> > +index bc53cc6..10b2455 100644
> > +--- a/libtextstyle/gnulib-m4/libcroco.m4
> > ++++ b/libtextstyle/gnulib-m4/libcroco.m4
> > +@@ -1,99 +1,34 @@
> > +-# libcroco.m4 serial 3
> > +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
> > ++# libcroco.m4 serial 2 (gettext-0.17)
> > ++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.
> > + dnl This file is free software; the Free Software Foundation
> > + dnl gives unlimited permission to copy and/or distribute it,
> > + dnl with or without modifications, as long as this notice is preserved.
> > +
> > + dnl From Bruno Haible.
> > +
> > +-dnl gl_LIBCROCO
> > +-dnl   gives the user the option to decide whether to use the included
> or
> > +-dnl   an external libcroco.
> > +-dnl gl_LIBCROCO(FORCE-INCLUDED)
> > +-dnl   forces the use of the included or an external libcroco.
> > + AC_DEFUN([gl_LIBCROCO],
> > + [
> > +-  ifelse([$1], [yes], , [
> > +-    dnl libcroco depends on libglib.
> > +-    AC_REQUIRE([gl_LIBGLIB])
> > +-  ])
> > ++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > ++  dnl libcroco depends on libglib.
> > ++  AC_REQUIRE([gl_LIBGLIB])
> > +
> > +-  ifelse([$1], , [
> > +-    AC_MSG_CHECKING([whether included libcroco is requested])
> > +-    AC_ARG_WITH([included-libcroco],
> > +-      [  --with-included-libcroco  use the libcroco included here],
> > +-      [gl_cv_libcroco_force_included=$withval],
> > +-      [gl_cv_libcroco_force_included=no])
> > +-    AC_MSG_RESULT([$gl_cv_libcroco_force_included])
> > +-  ], [gl_cv_libcroco_force_included=$1])
> > ++  AC_MSG_CHECKING([whether included libcroco is requested])
> > ++  AC_ARG_WITH([included-libcroco],
> > ++    [  --with-included-libcroco  use the libcroco included here],
> > ++    [gl_cv_libcroco_force_included=$withval],
> > ++    [gl_cv_libcroco_force_included=no])
> > ++  AC_MSG_RESULT([$gl_cv_libcroco_force_included])
> > +
> > +   gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
> > +   LIBCROCO=
> > +   LTLIBCROCO=
> > +   INCCROCO=
> > +-  ifelse([$1], [yes], , [
> > +-    if test "$gl_cv_libcroco_use_included" != yes; then
> > +-      dnl Figure out whether we can use a preinstalled libcroco-0.6,
> or have to
> > +-      dnl use the included one.
> > +-      AC_CACHE_VAL([gl_cv_libcroco], [
> > +-        gl_cv_libcroco=no
> > +-        gl_cv_LIBCROCO=
> > +-        gl_cv_LTLIBCROCO=
> > +-        gl_cv_INCCROCO=
> > +-        gl_save_LIBS="$LIBS"
> > +-        dnl Search for libcroco and define LIBCROCO_0_6,
> LTLIBCROCO_0_6 and
> > +-        dnl INCCROCO_0_6 accordingly.
> > +-        dnl Don't use croco-0.6-config nor pkg-config, since it
> doesn't work when
> > +-        dnl cross-compiling or when the C compiler in use is different
> from the
> > +-        dnl one that built the library.
> > +-        AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])
> > +-        LIBS="$gl_save_LIBS $LIBCROCO_0_6"
> > +-        AC_TRY_LINK([#include <libcroco-config.h>],
> > +-          [const char *version = LIBCROCO_VERSION; return !version;],
> > +-          [gl_cv_libcroco=yes
> > +-           gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-           gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-          ])
> > +-        if test "$gl_cv_libcroco" != yes; then
> > +-          gl_save_CPPFLAGS="$CPPFLAGS"
> > +-          CPPFLAGS="$CPPFLAGS $INCCROCO_0_6"
> > +-          AC_TRY_LINK([#include <libcroco-config.h>],
> > +-            [const char *version = LIBCROCO_VERSION; return !version;],
> > +-            [gl_cv_libcroco=yes
> > +-             gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-             gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-             gl_cv_INCCROCO="$INCCROCO_0_6"
> > +-            ])
> > +-          if test "$gl_cv_libcroco" != yes; then
> > +-            dnl Often the include files are installed in
> > +-            dnl /usr/include/libcroco-0.6/libcroco.
> > +-            AC_TRY_LINK([#include
> <libcroco-0.6/libcroco/libcroco-config.h>],
> > +-              [const char *version = LIBCROCO_VERSION; return
> !version;],
> > +-
> [gl_ABSOLUTE_HEADER([libcroco-0.6/libcroco/libcroco-config.h])
> > +-               libcroco_include_dir=`echo
> "$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h" | sed -e
> 's,.libcroco-config\.h$,,'`
> > +-               if test -d "$libcroco_include_dir"; then
> > +-                 gl_cv_libcroco=yes
> > +-                 gl_cv_LIBCROCO="$LIBCROCO_0_6"
> > +-                 gl_cv_LTLIBCROCO="$LTLIBCROCO_0_6"
> > +-                 gl_cv_INCCROCO="-I$libcroco_include_dir"
> > +-               fi
> > +-              ])
> > +-          fi
> > +-          CPPFLAGS="$gl_save_CPPFLAGS"
> > +-        fi
> > +-        LIBS="$gl_save_LIBS"
> > +-      ])
> > +-      AC_MSG_CHECKING([for libcroco])
> > +-      AC_MSG_RESULT([$gl_cv_libcroco])
> > +-      if test $gl_cv_libcroco = yes; then
> > +-        LIBCROCO="$gl_cv_LIBCROCO"
> > +-        LTLIBCROCO="$gl_cv_LTLIBCROCO"
> > +-        INCCROCO="$gl_cv_INCCROCO"
> > +-      else
> > +-        gl_cv_libcroco_use_included=yes
> > +-      fi
> > +-    fi
> > +-  ])
> > ++  if test "$gl_cv_libcroco_use_included" != yes; then
> > ++    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
> > ++    LIBCROCO=$CROCO_LIBS
> > ++    LTLIBCROCO=$CROCO_LIBS
> > ++    INCCROCO=$CROCO_CFLAGS
> > ++  fi
> > +   AC_SUBST([LIBCROCO])
> > +   AC_SUBST([LTLIBCROCO])
> > +   AC_SUBST([INCCROCO])
> > +diff --git a/libtextstyle/gnulib-m4/libglib.m4
> b/libtextstyle/gnulib-m4/libglib.m4
> > +index bef6fa3..8841755 100644
> > +--- a/libtextstyle/gnulib-m4/libglib.m4
> > ++++ b/libtextstyle/gnulib-m4/libglib.m4
> > +@@ -1,105 +1,31 @@
> > +-# libglib.m4 serial 4
> > +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
> > ++# libglib.m4 serial 3 (gettext-0.17)
> > ++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
> > + dnl This file is free software; the Free Software Foundation
> > + dnl gives unlimited permission to copy and/or distribute it,
> > + dnl with or without modifications, as long as this notice is preserved.
> > +
> > + dnl From Bruno Haible.
> > +
> > +-dnl gl_LIBGLIB
> > +-dnl   gives the user the option to decide whether to use the included
> or
> > +-dnl   an external libglib.
> > +-dnl gl_LIBGLIB(FORCE-INCLUDED)
> > +-dnl   forces the use of the included or an external libglib.
> > + AC_DEFUN([gl_LIBGLIB],
> > + [
> > +-  ifelse([$1], , [
> > +-    AC_MSG_CHECKING([whether included glib is requested])
> > +-    AC_ARG_WITH([included-glib],
> > +-      [  --with-included-glib    use the glib2 included here],
> > +-      [gl_cv_libglib_force_included=$withval],
> > +-      [gl_cv_libglib_force_included=no])
> > +-    AC_MSG_RESULT([$gl_cv_libglib_force_included])
> > +-  ], [gl_cv_libglib_force_included=$1])
> > ++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> > ++  AC_MSG_CHECKING([whether included glib is requested])
> > ++  AC_ARG_WITH([included-glib],
> > ++    [  --with-included-glib    use the glib2 included here],
> > ++    [gl_cv_libglib_force_included=$withval],
> > ++    [gl_cv_libglib_force_included=no])
> > ++  AC_MSG_RESULT([$gl_cv_libglib_force_included])
> > +
> > +   gl_cv_libglib_use_included="$gl_cv_libglib_force_included"
> > +   LIBGLIB=
> > +   LTLIBGLIB=
> > +   INCGLIB=
> > +-  ifelse([$1], [yes], , [
> > +-    if test "$gl_cv_libglib_use_included" != yes; then
> > +-      dnl Figure out whether we can use a preinstalled libglib-2.0, or
> have to use
> > +-      dnl the included one.
> > +-      AC_CACHE_VAL([gl_cv_libglib], [
> > +-        gl_cv_libglib=no
> > +-        gl_cv_LIBGLIB=
> > +-        gl_cv_LTLIBGLIB=
> > +-        gl_cv_INCGLIB=
> > +-        gl_save_LIBS="$LIBS"
> > +-        dnl Search for libglib2 and define LIBGLIB_2_0, LTLIBGLIB_2_0
> and
> > +-        dnl INCGLIB_2_0 accordingly.
> > +-        dnl Don't use glib-config nor pkg-config, since it doesn't
> work when
> > +-        dnl cross-compiling or when the C compiler in use is different
> from the
> > +-        dnl one that built the library.
> > +-        AC_LIB_LINKFLAGS_BODY([glib-2.0])
> > +-        LIBS="$gl_save_LIBS $LIBGLIB_2_0"
> > +-        AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-          [g_string_new ("foo");],
> > +-          [gl_cv_libglib=yes
> > +-           gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-           gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-          ])
> > +-        if test "$gl_cv_libglib" != yes; then
> > +-          gl_save_CPPFLAGS="$CPPFLAGS"
> > +-          CPPFLAGS="$CPPFLAGS $INCGLIB_2_0"
> > +-          AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-            [g_string_new ("foo");],
> > +-            [gl_cv_libglib=yes
> > +-             gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-             gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-             gl_cv_INCGLIB="$INCGLIB_2_0"
> > +-            ])
> > +-          if test "$gl_cv_libglib" != yes; then
> > +-            dnl Often the include files are installed in
> /usr/include/glib-2.0
> > +-            dnl and /usr/lib/glib-2.0/include.
> > +-            if test -n "$LIBGLIB_2_0_PREFIX"; then
> > +-              CPPFLAGS="$gl_save_CPPFLAGS
> -I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > +-              AC_TRY_LINK([#include <glib.h>
> > +-#ifndef G_BEGIN_DECLS
> > +-error this glib.h includes a glibconfig.h from a glib version 1.x
> > +-#endif
> > +-],
> > +-                [g_string_new ("foo");],
> > +-                [gl_cv_libglib=yes
> > +-                 gl_cv_LIBGLIB="$LIBGLIB_2_0"
> > +-                 gl_cv_LTLIBGLIB="$LTLIBGLIB_2_0"
> > +-                 gl_cv_INCGLIB="-I$LIBGLIB_2_0_PREFIX/include/glib-2.0
> -I$LIBGLIB_2_0_PREFIX/$acl_libdirstem/glib-2.0/include"
> > +-                ])
> > +-            fi
> > +-          fi
> > +-          CPPFLAGS="$gl_save_CPPFLAGS"
> > +-        fi
> > +-        LIBS="$gl_save_LIBS"
> > +-      ])
> > +-      AC_MSG_CHECKING([for glib])
> > +-      AC_MSG_RESULT([$gl_cv_libglib])
> > +-      if test $gl_cv_libglib = yes; then
> > +-        LIBGLIB="$gl_cv_LIBGLIB"
> > +-        LTLIBGLIB="$gl_cv_LTLIBGLIB"
> > +-        INCGLIB="$gl_cv_INCGLIB"
> > +-      else
> > +-        gl_cv_libglib_use_included=yes
> > +-      fi
> > +-    fi
> > +-  ])
> > ++  if test "$gl_cv_libglib_use_included" != yes; then
> > ++    PKG_CHECK_MODULES([GLIB], [glib-2.0])
> > ++    LIBGLIB="$GLIB_LIBS"
> > ++    LTLIBGLIB="$GLIB_LIBS"
> > ++    INCGLIB="$GLIB_CFLAGS"
> > ++  fi
> > +   AC_SUBST([LIBGLIB])
> > +   AC_SUBST([LTLIBGLIB])
> > +   AC_SUBST([INCGLIB])
> > +diff --git a/libtextstyle/lib/term-styled-ostream.c
> b/libtextstyle/lib/term-styled-ostream.c
> > +index 3675b5f..811e546 100644
> > +--- a/libtextstyle/lib/term-styled-ostream.c
> > ++++ b/libtextstyle/lib/term-styled-ostream.c
> > +@@ -28,15 +28,15 @@
> > +
> > + #include <stdlib.h>
> > +
> > +-#include <cr-om-parser.h>
> > +-#include <cr-sel-eng.h>
> > +-#include <cr-style.h>
> > +-#include <cr-rgb.h>
> > ++#include <libcroco/cr-om-parser.h>
> > ++#include <libcroco/cr-sel-eng.h>
> > ++#include <libcroco/cr-style.h>
> > ++#include <libcroco/cr-rgb.h>
> > + /* <cr-fonts.h> has a broken double-inclusion guard in
> libcroco-0.6.1.  */
> > + #ifndef __CR_FONTS_H__
> > +-# include <cr-fonts.h>
> > ++# include <libcroco/cr-fonts.h>
> > + #endif
> > +-#include <cr-string.h>
> > ++#include <libcroco/cr-string.h>
> > +
> > + #include "term-ostream.h"
> > + #include "hash.h"
> > +diff --git a/libtextstyle/lib/term-styled-ostream.oo.c
> b/libtextstyle/lib/term-styled-ostream.oo.c
> > +index 2cfd4a8..d42c8b4 100644
> > +--- a/libtextstyle/lib/term-styled-ostream.oo.c
> > ++++ b/libtextstyle/lib/term-styled-ostream.oo.c
> > +@@ -22,15 +22,15 @@
> > +
> > + #include <stdlib.h>
> > +
> > +-#include <cr-om-parser.h>
> > +-#include <cr-sel-eng.h>
> > +-#include <cr-style.h>
> > +-#include <cr-rgb.h>
> > ++#include <libcroco/cr-om-parser.h>
> > ++#include <libcroco/cr-sel-eng.h>
> > ++#include <libcroco/cr-style.h>
> > ++#include <libcroco/cr-rgb.h>
> > + /* <cr-fonts.h> has a broken double-inclusion guard in
> libcroco-0.6.1.  */
> > + #ifndef __CR_FONTS_H__
> > +-# include <cr-fonts.h>
> > ++# include <libcroco/cr-fonts.h>
> > + #endif
> > +-#include <cr-string.h>
> > ++#include <libcroco/cr-string.h>
> > +
> > + #include "term-ostream.h"
> > + #include "hash.h"
> > diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> b/meta/recipes-core/gettext/gettext_0.20.1.bb
> > similarity index 94%
> > rename from meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > rename to meta/recipes-core/gettext/gettext_0.20.1.bb
> > index 30121ad23e1..fc05ef2e0a3 100644
> > --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > +++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
> > @@ -6,7 +6,7 @@ a few stand-alone programs to massage in various ways
> the sets of translatable a
> >  HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
> >  SECTION = "libs"
> >  LICENSE = "GPLv3+ & LGPL-2.1+"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
> >
> >  # Because po-gram-gen.y has been modified by fix-CVE-2018-18751.patch,
> >  # it requires yacc which provided by bison-native
> > @@ -17,17 +17,16 @@ PROVIDES = "virtual/libintl virtual/gettext"
> >  PROVIDES_class-native = "virtual/gettext-native"
> >  RCONFLICTS_${PN} = "proxy-libintl"
> >  SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
> > -        file://parallel.patch \
> > -        file://add-with-bisonlocaledir.patch \
> > -        file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
> > -        file://use-pkgconfig.patch \
> > -        file://fix-CVE-2018-18751.patch \
> > -        file://run-ptest \
> > -        file://serial-tests-config.patch \
> > -"
> > +           file://parallel.patch \
> > +           file://add-with-bisonlocaledir.patch \
> > +           file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
> > +           file://use-pkgconfig.patch \
> > +           file://run-ptest \
> > +           file://serial-tests-config.patch \
> > +           "
> >
> > -SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
> > -SRC_URI[sha256sum] =
> "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
> > +SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
> > +SRC_URI[sha256sum] =
> "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
> >
> >  inherit autotools texinfo pkgconfig ptest
> >
> > @@ -127,7 +126,7 @@ do_install_append_class-native () {
> >       rm ${D}${datadir}/gettext/po/remove-potcdate.sin
> >
> >          create_wrapper ${D}${bindir}/msgfmt \
> > -
> GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
> > +                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.20/"
> >
> >  }
> >
>
>

--000000000000065e4b05986bb464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 28 Nov 2019 at 16:19, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gm=
ail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
<br>
On 11/27/19 8:39 AM, Alexander Kanavin wrote:<br>
&gt; License-Update: URLs changed from http to https<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
This failed on the AB<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/288797/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/288797/</a><br></blockquote><div><br></div><div>Weird this didn&#39;t fail=
 locally for my world builds, I queued a patch to fix this.<br></div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
an for meta-mingw bbappend.<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/284185/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/284185/</a><br></blockquote><div><br></div><div>Patch sent.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 .../gettext-0.19.8.1/fix-CVE-2018-18751.patch | 141 ----<br>
&gt;=C2=A0 .../gettext/gettext-0.19.8.1/parallel.patch=C2=A0 =C2=A0|=C2=A0 =
23 -<br>
&gt;=C2=A0 .../gettext-0.19.8.1/use-pkgconfig.patch=C2=A0 =C2=A0 =C2=A0 | 3=
21 --------<br>
&gt;=C2=A0 .../add-with-bisonlocaledir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...nt.c-timsort.h-fix-formatting-issues.patch |=C2=A0 30 +-<br>
&gt;=C2=A0 .../gettext/gettext-0.20.1/parallel.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 +<br>
&gt;=C2=A0 .../run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 .../serial-tests-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +-<br>
&gt;=C2=A0 .../gettext-0.20.1/use-pkgconfig.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 713 ++++++++++++++++++<br>
&gt;=C2=A0 ...{<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gettext_0.19.8.1.bb</a> =3D&gt; <a href=3D"http://gettext_0=
.20.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a>} |=C2=
=A0 23 +-<br>
&gt;=C2=A0 10 files changed, 775 insertions(+), 534 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fi=
x-CVE-2018-18751.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/pa=
rallel.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/us=
e-pkgconfig.patch<br>
&gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.19.8.1 =3D&gt; gette=
xt-0.20.1}/add-with-bisonlocaledir.patch (100%)<br>
&gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.19.8.1 =3D&gt; gette=
xt-0.20.1}/cr-statement.c-timsort.h-fix-formatting-issues.patch (68%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/para=
llel.patch<br>
&gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.19.8.1 =3D&gt; gette=
xt-0.20.1}/run-ptest (100%)<br>
&gt;=C2=A0 rename meta/recipes-core/gettext/{gettext-0.19.8.1 =3D&gt; gette=
xt-0.20.1}/serial-tests-config.patch (75%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/use-=
pkgconfig.patch<br>
&gt;=C2=A0 rename meta/recipes-core/gettext/{<a href=3D"http://gettext_0.19=
.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a> =3D&g=
t; <a href=3D"http://gettext_0.20.1.bb" rel=3D"noreferrer" target=3D"_blank=
">gettext_0.20.1.bb</a>} (94%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-1=
8751.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.=
patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6dfe200d654..00000000000<br>
&gt; --- a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.pa=
tch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,141 +0,0 @@<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/gi=
tweb/?p=3Dgettext.git;a=3Dcommit;h=3Ddce3a16" rel=3D"noreferrer" target=3D"=
_blank">https://git.savannah.gnu.org/gitweb/?p=3Dgettext.git;a=3Dcommit;h=
=3Ddce3a16</a>]<br>
&gt; -CVE: CVE-2018-18751<br>
&gt; -<br>
&gt; -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -From dce3a16e5e9368245735e29bf498dcd5e3e474a4 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_blank=
">ueno@gnu.org</a>&gt;<br>
&gt; -Date: Thu, 15 Sep 2016 13:57:24 +0200<br>
&gt; -Subject: [PATCH] xgettext: Fix crash with *.po file input<br>
&gt; -<br>
&gt; -When xgettext was given two *.po files with the same msgid_plural, it=
<br>
&gt; -crashed with double-free.=C2=A0 Problem reported by Davlet Panech in:=
<br>
&gt; -<a href=3D"http://lists.gnu.org/archive/html/bug-gettext/2016-09/msg0=
0001.html" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.org/archiv=
e/html/bug-gettext/2016-09/msg00001.html</a><br>
&gt; -* gettext-tools/src/po-gram-gen.y: Don&#39;t free msgid_pluralform af=
ter<br>
&gt; -calling do_callback_message, assuming that it takes ownership.<br>
&gt; -* gettext-tools/src/read-catalog.c (default_add_message): Free<br>
&gt; -msgid_plural after calling message_alloc.<br>
&gt; -* gettext-tools/tests/xgettext-po-2: New file.<br>
&gt; -* gettext-tools/tests/Makefile.am (TESTS): Add new test.<br>
&gt; ----<br>
&gt; - gettext-tools/src/po-gram-gen.y=C2=A0 =C2=A0| 13 ++++-----<br>
&gt; - gettext-tools/src/read-catalog.c=C2=A0 |=C2=A0 2 ++<br>
&gt; - gettext-tools/tests/Makefile.am=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; - gettext-tools/tests/xgettext-po-2 | 55 +++++++++++++++++++++++++++++=
++++++++++<br>
&gt; - 4 files changed, 63 insertions(+), 9 deletions(-)<br>
&gt; - create mode 100755 gettext-tools/tests/xgettext-po-2<br>
&gt; -<br>
&gt; -diff --git a/gettext-tools/src/po-gram-gen.y b/gettext-tools/src/po-g=
ram-gen.y<br>
&gt; -index becf5e6..4428e77 100644<br>
&gt; ---- a/gettext-tools/src/po-gram-gen.y<br>
&gt; -+++ b/gettext-tools/src/po-gram-gen.y<br>
&gt; -@@ -221,14 +221,11 @@ message<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
check_obsolete ($1, $3);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
check_obsolete ($1, $4);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (!$1.obsolete || pass_obsolete_entries)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 do_callback_message ($1.ctxt, string2, &amp;$1.pos, $3.string,<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$4.rhs.msgstr, $4.rhs.msgstr_len, &amp;$4.pos,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$1.prev_ctxt,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$1.prev_id, $1.prev_id_plural,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$1.obsolete);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 free ($3.string);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 do_callback_message ($1.ctxt, string2, &amp;$1.pos, $3.string,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$4.rhs.msgstr, $4.rhs.msgstr_len, &amp;$4.pos,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$1.prev_ctxt,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$1.prev_id, $1.prev_id_plural,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$1.obsolete);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0free_message_intro ($1);<br>
&gt; -diff --git a/gettext-tools/src/read-catalog.c b/gettext-tools/src/rea=
d-catalog.c<br>
&gt; -index 571d18e..6af6d20 100644<br>
&gt; ---- a/gettext-tools/src/read-catalog.c<br>
&gt; -+++ b/gettext-tools/src/read-catalog.c<br>
&gt; -@@ -397,6 +397,8 @@ default_add_message (default_catalog_reader_ty *t=
his,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 appropriate.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mp =3D message_alloc (msgctxt, msgid, msgi=
d_plural, msgstr, msgstr_len,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgstr_pos);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (msgid_plural !=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free (msgid_plural);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mp-&gt;prev_msgctxt =3D prev_msgctxt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mp-&gt;prev_msgid =3D prev_msgid;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mp-&gt;prev_msgid_plural =3D prev_msgid_pl=
ural;<br>
&gt; -diff --git a/gettext-tools/tests/Makefile.am b/gettext-tools/tests/Ma=
kefile.am<br>
&gt; -index 23b09b1..0dfb4d8 100644<br>
&gt; ---- a/gettext-tools/tests/Makefile.am<br>
&gt; -+++ b/gettext-tools/tests/Makefile.am<br>
&gt; -@@ -95,7 +95,7 @@ TESTS =3D gettext-1 gettext-2 gettext-3 gettext-4 g=
ettext-5 gettext-6 gettext-7 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-perl-1 xgettext-perl-2 xgettext-perl-3 x=
gettext-perl-4 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-perl-5 xgettext-perl-6 xgettext-perl-7 x=
gettext-perl-8 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-php-1 xgettext-php-2 xgettext-php-3 xget=
text-php-4 \<br>
&gt; --=C2=A0 =C2=A0 xgettext-po-1 \<br>
&gt; -+=C2=A0 =C2=A0 xgettext-po-1 xgettext-po-2 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-properties-1 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-python-1 xgettext-python-2 xgettext-pyth=
on-3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xgettext-python-4 \<br>
&gt; -diff --git a/gettext-tools/tests/xgettext-po-2 b/gettext-tools/tests/=
xgettext-po-2<br>
&gt; -new file mode 100755<br>
&gt; -index 0000000..c4bd9d0<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/gettext-tools/tests/xgettext-po-2<br>
&gt; -@@ -0,0 +1,55 @@<br>
&gt; -+#! /bin/sh<br>
&gt; -+. &quot;${srcdir=3D.}/init.sh&quot;; path_prepend_ . ../src<br>
&gt; -+<br>
&gt; -+# Test PO extractors with multiple input files.<br>
&gt; -+<br>
&gt; -+cat &lt;&lt;EOF &gt; xg-po-2-1.po<br>
&gt; -+msgid &quot;first msgid&quot;<br>
&gt; -+msgid_plural &quot;first msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+<br>
&gt; -+msgid &quot;second msgid&quot;<br>
&gt; -+msgid_plural &quot;second msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+EOF<br>
&gt; -+<br>
&gt; -+cat &lt;&lt;EOF &gt; xg-po-2-2.po<br>
&gt; -+msgid &quot;third msgid&quot;<br>
&gt; -+msgid_plural &quot;third msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+<br>
&gt; -+msgid &quot;second msgid&quot;<br>
&gt; -+msgid_plural &quot;second msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+EOF<br>
&gt; -+<br>
&gt; -+: ${XGETTEXT=3Dxgettext}<br>
&gt; -+${XGETTEXT} --omit-header xg-po-2-1.po xg-po-2-2.po -o xg-po-2.tmp.p=
o || Exit 1<br>
&gt; -+LC_ALL=3DC tr -d &#39;\r&#39; &lt; xg-po-2.tmp.po &gt; xg-po-2.po ||=
 Exit 1<br>
&gt; -+<br>
&gt; -+cat &lt;&lt;EOF &gt; xg-po-2.ok<br>
&gt; -+msgid &quot;first msgid&quot;<br>
&gt; -+msgid_plural &quot;first msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+<br>
&gt; -+msgid &quot;second msgid&quot;<br>
&gt; -+msgid_plural &quot;second msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+<br>
&gt; -+msgid &quot;third msgid&quot;<br>
&gt; -+msgid_plural &quot;third msgid (plural)&quot;<br>
&gt; -+msgstr[0] &quot;&quot;<br>
&gt; -+msgstr[1] &quot;&quot;<br>
&gt; -+EOF<br>
&gt; -+<br>
&gt; -+: ${DIFF=3Ddiff}<br>
&gt; -+${DIFF} xg-po-2.ok xg-po-2.po<br>
&gt; -+result=3D$?<br>
&gt; -+<br>
&gt; -+exit $result<br>
&gt; --- <br>
&gt; -1.9.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch=
 b/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c8e2c94af0e..00000000000<br>
&gt; --- a/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,23 +0,0 @@<br>
&gt; -instal libgettextlib.a before removing it<br>
&gt; -<br>
&gt; -In a multiple job build, Makefile can simultaneously<br>
&gt; -be installing and removing libgettextlib.a.=C2=A0 We serialize<br>
&gt; -the operations.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com=
" target=3D"_blank">jslater@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ---- a/gettext-tools/gnulib-lib/Makefile.am<br>
&gt; -+++ b/gettext-tools/gnulib-lib/Makefile.am<br>
&gt; -@@ -57,6 +57,10 @@ endif<br>
&gt; - # Rules generated and collected by gnulib-tool.<br>
&gt; - include Makefile.gnulib<br>
&gt; - <br>
&gt; -+# defined in Makefile.gnulib but missing this dependency<br>
&gt; -+#<br>
&gt; -+install-exec-clean: install-libLTLIBRARIES<br>
&gt; -+<br>
&gt; - # Which classes to export from the shared library.<br>
&gt; - MOOPPFLAGS +=3D --dllexport=3Dstyled_ostream<br>
&gt; - <br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.=
patch b/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6156a153f74..00000000000<br>
&gt; --- a/meta/recipes-core/gettext/gettext-0.19.8.1/use-pkgconfig.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,321 +0,0 @@<br>
&gt; -For reasons which I just can&#39;t fathom gnulib doesn&#39;t use the =
expected tools to<br>
&gt; -find libraries but badly reinvents the wheel.=C2=A0 This will trivial=
ly lead to host<br>
&gt; -contamination (explicit searches of /usr/lib) or incorrect RPATHs (ba=
d<br>
&gt; -canonicalisation resulting in relative paths).<br>
&gt; -<br>
&gt; -Simply delete all the crazy, and replace with a single call to pkg-co=
nfig.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate (upstream still refuse to consider pkg=
-config)<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/gnulib-local/m4/libcroco.m4 b/gnulib-local/m4/libcroco.m=
4<br>
&gt; -index f79ea82f1..1f67274db 100644<br>
&gt; ---- a/gettext-tools/gnulib-m4/libcroco.m4<br>
&gt; -+++ b/gettext-tools/gnulib-m4/libcroco.m4<br>
&gt; -@@ -8,6 +8,7 @@ dnl From Bruno Haible.<br>
&gt; - <br>
&gt; - AC_DEFUN([gl_LIBCROCO],<br>
&gt; - [<br>
&gt; -+=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; -=C2=A0 =C2=A0dnl libcroco depends on libglib.<br>
&gt; -=C2=A0 =C2=A0AC_REQUIRE([gl_LIBGLIB])<br>
&gt; - <br>
&gt; -@@ -23,65 +24,10 @@ AC_DEFUN([gl_LIBCROCO],<br>
&gt; -=C2=A0 =C2=A0LTLIBCROCO=3D<br>
&gt; -=C2=A0 =C2=A0INCCROCO=3D<br>
&gt; -=C2=A0 =C2=A0if test &quot;$gl_cv_libcroco_use_included&quot; !=3D ye=
s; then<br>
&gt; --=C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalled libcr=
oco-0.6, or have to<br>
&gt; --=C2=A0 =C2=A0 dnl use the included one.<br>
&gt; --=C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libcroco], [<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco=3Dno<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LIBCROCO=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBCROCO=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_INCCROCO=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Search for libcroco and define LIBCROCO_0_6=
, LTLIBCROCO_0_6 and<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl INCCROCO_0_6 accordingly.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use croco-0.6-config nor pkg-conf=
ig, since it doesn&#39;t work when<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compiler in u=
se is different from the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib-2.0])<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBCROCO_0_6&quot;<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroco-config.h&gt;=
],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D LIBCROCO_VERSIO=
N; return !version;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&quot;$LIBCROCO_0=
_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&quot;$LTLIBCRO=
CO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quot; !=3D yes; t=
hen<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCCROCO_0_6=
&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroco-confi=
g.h&gt;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D LIBCROCO=
_VERSION; return !version;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&quot;$LIB=
CROCO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&quot;$L=
TLIBCROCO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCCROCO=3D&quot;$INC=
CROCO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quot; !=3D=
 yes; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include files are i=
nstalled in<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl /usr/include/libcroco-0.6/lib=
croco.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroc=
o-0.6/libcroco/libcroco-config.h&gt;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D L=
IBCROCO_VERSION; return !version;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER([libcr=
oco-0.6/libcroco/libcroco-config.h])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcroco_include_dir=
=3D`echo &quot;$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config_h&quot=
; | sed -e &#39;s,.libcroco-config\.h$,,&#39;`<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -d &quot;$li=
bcroco_include_dir&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_libcroc=
o=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROC=
O=3D&quot;$LIBCROCO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCR=
OCO=3D&quot;$LTLIBCROCO_0_6&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCCROC=
O=3D&quot;-I$libcroco_include_dir&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_CHECKING([for libcroco])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libcroco])<br>
&gt; --=C2=A0 =C2=A0 if test $gl_cv_libcroco =3D yes; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBCROCO=3D&quot;$gl_cv_LIBCROCO&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LTLIBCROCO=3D&quot;$gl_cv_LTLIBCROCO&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 INCCROCO=3D&quot;$gl_cv_INCCROCO&quot;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco_use_included=3Dyes<br>
&gt; --=C2=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 PKG_CHECK_MODULES([CROCO], [libcroco-0.6])<br>
&gt; -+=C2=A0 =C2=A0 LIBCROCO=3D$CROCO_LIBS<br>
&gt; -+=C2=A0 =C2=A0 LTLIBCROCO=3D$CROCO_LIBS<br>
&gt; -+=C2=A0 =C2=A0 INCCROCO=3D$CROCO_CFLAGS<br>
&gt; -=C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LIBCROCO])<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LTLIBCROCO])<br>
&gt; -diff --git a/gnulib-local/m4/libglib.m4 b/gnulib-local/m4/libglib.m4<=
br>
&gt; -index 42e55e6fd..ab25a5b22 100644<br>
&gt; ---- a/gettext-tools/gnulib-m4/libglib.m4<br>
&gt; -+++ b/gettext-tools/gnulib-m4/libglib.m4<br>
&gt; -@@ -8,6 +8,7 @@ dnl From Bruno Haible.<br>
&gt; - <br>
&gt; - AC_DEFUN([gl_LIBGLIB],<br>
&gt; - [<br>
&gt; -+=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; -=C2=A0 =C2=A0AC_MSG_CHECKING([whether included glib is requested])<br=
>
&gt; -=C2=A0 =C2=A0AC_ARG_WITH([included-glib],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 --with-included-glib=C2=A0 =C2=A0 use the=
 glib2 included here],<br>
&gt; -@@ -20,76 +21,10 @@ AC_DEFUN([gl_LIBGLIB],<br>
&gt; -=C2=A0 =C2=A0LTLIBGLIB=3D<br>
&gt; -=C2=A0 =C2=A0INCGLIB=3D<br>
&gt; -=C2=A0 =C2=A0if test &quot;$gl_cv_libglib_use_included&quot; !=3D yes=
; then<br>
&gt; --=C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalled libgl=
ib-2.0, or have to use<br>
&gt; --=C2=A0 =C2=A0 dnl the included one.<br>
&gt; --=C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libglib], [<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libglib=3Dno<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LIBGLIB=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBGLIB=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_INCGLIB=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Search for libglib2 and define LIBGLIB_2_0,=
 LTLIBGLIB_2_0 and<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl INCGLIB_2_0 accordingly.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use glib-config nor pkg-config, s=
ince it doesn&#39;t work when<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compiler in u=
se is different from the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([glib-2.0])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBGLIB_2_0&quot;<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&gt;<br>
&gt; --#ifndef G_BEGIN_DECLS<br>
&gt; --error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; --#endif<br>
&gt; --],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&quot;);],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quot;$LIBGLIB_2_0=
&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&quot;$LTLIBGLIB=
_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot; !=3D yes; th=
en<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCGLIB_2_0&=
quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&gt;<br>
&gt; --#ifndef G_BEGIN_DECLS<br>
&gt; --error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; --#endif<br>
&gt; --],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&quot;);]=
,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quot;$LIBG=
LIB_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&quot;$LT=
LIBGLIB_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCGLIB=3D&quot;$INCG=
LIB_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot; !=3D =
yes; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include files are i=
nstalled in /usr/include/glib-2.0<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl and /usr/lib/glib-2.0/include=
.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$LIBGLIB_2_0_PRE=
FIX&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_=
CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_=
libdirstem/glib-2.0/include&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;=
glib.h&gt;<br>
&gt; --#ifndef G_BEGIN_DECLS<br>
&gt; --error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; --#endif<br>
&gt; --],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quo=
t;foo&quot;);],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dye=
s<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=
=3D&quot;$LIBGLIB_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGL=
IB=3D&quot;$LTLIBGLIB_2_0&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCGLIB=
=3D&quot;-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFIX/$acl_=
libdirstem/glib-2.0/include&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_CHECKING([for glib])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libglib])<br>
&gt; --=C2=A0 =C2=A0 if test $gl_cv_libglib =3D yes; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBGLIB=3D&quot;$gl_cv_LIBGLIB&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$gl_cv_LTLIBGLIB&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 INCGLIB=3D&quot;$gl_cv_INCGLIB&quot;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libglib_use_included=3Dyes<br>
&gt; --=C2=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 PKG_CHECK_MODULES([GLIB], [glib-2.0])<br>
&gt; -+=C2=A0 =C2=A0 LIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; -+=C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; -+=C2=A0 =C2=A0 INCGLIB=3D&quot;$GLIB_CFLAGS&quot;<br>
&gt; -=C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LIBGLIB])<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LTLIBGLIB])<br>
&gt; -diff --git a/gnulib-local/m4/libxml.m4 b/gnulib-local/m4/libxml.m4<br=
>
&gt; -index 480c700d2..cb39309d5 100644<br>
&gt; ---- a/gettext-tools/gnulib-m4/libxml.m4<br>
&gt; -+++ b/gettext-tools/gnulib-m4/libxml.m4<br>
&gt; -@@ -8,6 +8,7 @@ dnl From Bruno Haible.<br>
&gt; -<br>
&gt; - AC_DEFUN([gl_LIBXML],<br>
&gt; - [<br>
&gt; -+=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; -=C2=A0 =C2=A0AC_REQUIRE([AM_ICONV_LINK])<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0AC_MSG_CHECKING([whether included libxml is requested])<=
br>
&gt; -@@ -22,100 +22,10 @@ AC_DEFUN([gl_LIBXML],<br>
&gt; -=C2=A0 =C2=A0LTLIBXML=3D<br>
&gt; -=C2=A0 =C2=A0INCXML=3D<br>
&gt; -=C2=A0 =C2=A0if test &quot;$gl_cv_libxml_use_included&quot; !=3D yes;=
 then<br>
&gt; --=C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalled libxm=
l2, or have to use<br>
&gt; --=C2=A0 =C2=A0 dnl the included one.<br>
&gt; --=C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libxml], [<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libxml=3Dno<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LIBXML=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBXML=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_INCXML=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $LIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Search for libxml2 and define LIBXML2, LTLI=
BXML2 and INCXML2<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl accordingly.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use xml2-config nor pkg-config, s=
ince it doesn&#39;t work when<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compiler in u=
se is different from the<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl Use a test program that tries to invoke xml=
Free. On Cygwin 1.7.x,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl libxml2 is built in such a way that uses of=
 xmlFree work fine with<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl -Wl,--enable-auto-import but lead to a link=
 error with<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 dnl -Wl,--disable-auto-import.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([xml2])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBXML2 $LIBICONV&q=
uot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libxml/xmlversion.h&g=
t;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVersion (0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree ((void *) 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathSetContextNode ((void *)0,=
 (void *)0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxml=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBXML=3D&quot;$LIBXML2 $LIB=
ICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBXML=3D&quot;$LTLIBXML2 =
$LTLIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libxml&quot; !=3D yes; the=
n<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCXML2&quot=
;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libxml/xmlvers=
ion.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVersion (0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree ((void *) 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathSetContextNode ((vo=
id *)0, (void *)0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxml=3Dyes<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBXML=3D&quot;$LIBXM=
L2 $LIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBXML=3D&quot;$LTL=
IBXML2 $LTLIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCXML=3D&quot;$INCXM=
L2&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libxml&quot; !=3D y=
es; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include files are i=
nstalled in /usr/include/libxml2.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl In libxml2-2.5, &lt;libxml/xm=
lversion.h&gt; is self-contained.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl In libxml2-2.6, it includes &=
lt;libxml/xmlexports.h&gt; which is<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl self-contained.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml2_include_dir=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_CPP([#include &lt;libxml2/=
libxml/xmlexports.h&gt;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER([libxm=
l2/libxml/xmlexports.h])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2_include_dir=
=3D`echo &quot;$gl_cv_absolute_libxml2_libxml_xmlexports_h&quot; | sed -e &=
#39;s,.libxml.xmlexports\.h$,,&#39;`<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$libxml2_include=
_dir&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_CPP([#include &lt;l=
ibxml2/libxml/xmlversion.h&gt;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER=
([libxml2/libxml/xmlversion.h])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2_inclu=
de_dir=3D`echo &quot;$gl_cv_absolute_libxml2_libxml_xmlversion_h&quot; | se=
d -e &#39;s,.libxml.xmlversion\.h$,,&#39;`<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$libxml2_include=
_dir&quot; &amp;&amp; test -d &quot;$libxml2_include_dir&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_=
CPPFLAGS -I$libxml2_include_dir&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;=
libxml/xmlversion.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVersion (0=
);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree ((voi=
d *) 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathSetCo=
ntextNode ((void *)0, (void *)0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxml=3Dyes=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBXML=
=3D&quot;$LIBXML2 $LIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBXM=
L=3D&quot;$LTLIBXML2 $LTLIBICONV&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCXML=
=3D&quot;-I$libxml2_include_dir&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAGS&quot;=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; --=C2=A0 =C2=A0 ])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_CHECKING([for libxml])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libxml])<br>
&gt; --=C2=A0 =C2=A0 if test $gl_cv_libxml =3D yes; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LIBXML=3D&quot;$gl_cv_LIBXML&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 LTLIBXML=3D&quot;$gl_cv_LTLIBXML&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 INCXML=3D&quot;$gl_cv_INCXML&quot;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 gl_cv_libxml_use_included=3Dyes<br>
&gt; --=C2=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 PKG_CHECK_MODULES([XML], [libxml-2.0])<br>
&gt; -+=C2=A0 =C2=A0 LIBXML=3D$XML_LIBS<br>
&gt; -+=C2=A0 =C2=A0 LTLIBXML=3D$XML_LIBS<br>
&gt; -+=C2=A0 =C2=A0 INCXML=3D$XML_CFLAGS<br>
&gt; -=C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LIBXML])<br>
&gt; -=C2=A0 =C2=A0AC_SUBST([LTLIBXML])<br>
&gt; -diff --git a/gnulib-local/lib/term-styled-ostream.oo.c b/gnulib-local=
/lib/term-styled-ostream.oo.c<br>
&gt; -index 81a407467..218565329 100644<br>
&gt; ---- a/gettext-tools/gnulib-lib/term-styled-ostream.oo.c<br>
&gt; -+++ b/gettext-tools/gnulib-lib/term-styled-ostream.oo.c<br>
&gt; -@@ -25,4 +25,4 @@<br>
&gt; --#include &lt;cr-om-parser.h&gt;<br>
&gt; --#include &lt;cr-sel-eng.h&gt;<br>
&gt; --#include &lt;cr-style.h&gt;<br>
&gt; --#include &lt;cr-rgb.h&gt;<br>
&gt; -+#include &lt;libcroco/cr-om-parser.h&gt;<br>
&gt; -+#include &lt;libcroco/cr-sel-eng.h&gt;<br>
&gt; -+#include &lt;libcroco/cr-style.h&gt;<br>
&gt; -+#include &lt;libcroco/cr-rgb.h&gt;<br>
&gt; -@@ -31 +31 @@<br>
&gt; --# include &lt;cr-fonts.h&gt;<br>
&gt; -+# include &lt;libcroco/cr-fonts.h&gt;<br>
&gt; -@@ -33 +33 @@<br>
&gt; --#include &lt;cr-string.h&gt;<br>
&gt; -+#include &lt;libcroco/cr-string.h&gt;<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bison=
localedir.patch b/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlo=
caledir.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonl=
ocaledir.patch<br>
&gt; rename to meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocal=
edir.patch<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c=
-timsort.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-=
0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch<br>
&gt; similarity index 68%<br>
&gt; rename from meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-=
timsort.h-fix-formatting-issues.patch<br>
&gt; rename to meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-tims=
ort.h-fix-formatting-issues.patch<br>
&gt; index 6af16041987..0561ed7d32c 100644<br>
&gt; --- a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsor=
t.h-fix-formatting-issues.patch<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.=
h-fix-formatting-issues.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e546de65a333789e83f5485757967cee29ee3681 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.co=
m" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 19 Feb 2017 23:32:46 -0800<br>
&gt;=C2=A0 Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues=
<br>
&gt; @@ -15,15 +15,15 @@ gettext-tools/gnulib-lib/libxml/timsort.h:326:80: =
warning: format &#39;%lu&#39; expects<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@win=
driver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - gettext-tools/gnulib-lib/libcroco/cr-statement.c | 10 +++++-----<br>
&gt; - gettext-tools/gnulib-lib/libxml/timsort.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 +-<br>
&gt; - 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; + libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----<br>
&gt; + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 <br>
&gt; -diff --git a/gettext-tools/gnulib-lib/libcroco/cr-statement.c b/gette=
xt-tools/gnulib-lib/libcroco/cr-statement.c<br>
&gt; +diff --git a/libtextstyle/lib/libcroco/cr-statement.c b/libtextstyle/=
lib/libcroco/cr-statement.c<br>
&gt;=C2=A0 index 617520f..100104b 100644<br>
&gt; ---- a/gettext-tools/gnulib-lib/libcroco/cr-statement.c<br>
&gt; -+++ b/gettext-tools/gnulib-lib/libcroco/cr-statement.c<br>
&gt; +--- a/libtextstyle/lib/libcroco/cr-statement.c<br>
&gt; ++++ b/libtextstyle/lib/libcroco/cr-statement.c<br>
&gt;=C2=A0 @@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a=
_this, FILE * a_fp, glong a_indent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_return_if_fail (a_fp &amp;&a=
mp; a_this);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_ruleset_t=
o_string (a_this, a_indent);<br>
&gt; @@ -69,19 +69,3 @@ index 617520f..100104b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_=
free (str) ;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
r =3D NULL ;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -diff --git a/gettext-tools/gnulib-lib/libxml/timsort.h b/gettext-tool=
s/gnulib-lib/libxml/timsort.h<br>
&gt; -index 795f272..443918a 100644<br>
&gt; ---- a/gettext-tools/gnulib-lib/libxml/timsort.h<br>
&gt; -+++ b/gettext-tools/gnulib-lib/libxml/timsort.h<br>
&gt; -@@ -323,7 +323,7 @@ static void TIM_SORT_RESIZE(TEMP_STORAGE_T *store=
, const size_t new_size)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SORT_TYPE *tempstore =3D (SORT_TYPE *)realloc(sto=
re-&gt;storage, new_size * sizeof(SORT_TYPE));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (tempstore =3D=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Error allocating temporar=
y storage for tim sort: need %lu bytes&quot;, sizeof(SORT_TYPE) * new_size)=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Error allocating temporar=
y storage for tim sort: need %zu bytes&quot;, sizeof(SORT_TYPE) * new_size)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0store-&gt;storage =3D tempstore;<br>
&gt; --- <br>
&gt; -2.10.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch b=
/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..d96a376b7d1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 4a2a0a93b469093b60ffd0bec55d33d1e03d4713 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com" target=
=3D"_blank">jslater@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 7 Jun 2012 16:37:01 -0700<br>
&gt; +Subject: [PATCH] instal libgettextlib.a before removing it<br>
&gt; +<br>
&gt; +In a multiple job build, Makefile can simultaneously<br>
&gt; +be installing and removing libgettextlib.a.=C2=A0 We serialize<br>
&gt; +the operations.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com=
" target=3D"_blank">jslater@windriver.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + gettext-tools/gnulib-lib/Makefile.am | 4 ++++<br>
&gt; + 1 file changed, 4 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnu=
lib-lib/Makefile.am<br>
&gt; +index 2126699..d2dd7e4 100644<br>
&gt; +--- a/gettext-tools/gnulib-lib/Makefile.am<br>
&gt; ++++ b/gettext-tools/gnulib-lib/Makefile.am<br>
&gt; +@@ -58,6 +58,10 @@ endif<br>
&gt; + # Rules generated and collected by gnulib-tool.<br>
&gt; + include Makefile.gnulib<br>
&gt; + <br>
&gt; ++# defined in Makefile.gnulib but missing this dependency<br>
&gt; ++#<br>
&gt; ++install-exec-clean: install-libLTLIBRARIES<br>
&gt; ++<br>
&gt; + # OS/2 does not support a DLL name longer than 8 characters.<br>
&gt; + if OS2<br>
&gt; + libgettextlib_la_LDFLAGS +=3D -os2dllname gtlib<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest b/me=
ta/recipes-core/gettext/gettext-0.20.1/run-ptest<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest<br>
&gt; rename to meta/recipes-core/gettext/gettext-0.20.1/run-ptest<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-c=
onfig.patch b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.=
patch<br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-co=
nfig.patch<br>
&gt; rename to meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config=
.patch<br>
&gt; index 31ff9138a91..93f7c03334a 100644<br>
&gt; --- a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.p=
atch<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.pat=
ch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c4b1f3a0c7b7c40b343be9b95deb84e0485643be Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ed64a5724ef7d6eb4e9a876f817ea266a536e195 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: &quot;Hongjun.Yang&quot; &lt;<a href=3D"mailto:hongjun.yan=
g@windriver.com" target=3D"_blank">hongjun.yang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 28 Jul 2016 12:36:15 +0800<br>
&gt;=C2=A0 Subject: [PATCH] fix for ptest<br>
&gt; @@ -8,6 +8,7 @@ Add serial-tests support, ptest need it<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [oe specific]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0gettext-runtime/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a> | 2 +-<br>
&gt; @@ -15,24 +16,24 @@ Signed-off-by: Changqing Li &lt;<a href=3D"mailto:=
changqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a=
>&gt;<br>
&gt;=C2=A0 =C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 5e996fa..880581f 100644<br>
&gt; +index 38db6fd..f019ae0 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; -@@ -23,7 +23,7 @@ AC_INIT([gettext],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gnu-gettext@gnu.org" targe=
t=3D"_blank">bug-gnu-gettext@gnu.org</a>])<br>
&gt; +@@ -22,7 +22,7 @@ AC_INIT([gettext],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gettext@gnu.org" target=3D=
"_blank">bug-gettext@gnu.org</a>])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_AUX_DIR([build-aux])<br>
&gt; --AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests dist-xz dist-lzip=
])<br>
&gt; -+AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests dist-xz dist-lzip])=
<br>
&gt; +-AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests tar-ustar])<br>
&gt; ++AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests tar-ustar])<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0dnl Override automake&#39;s tar command used for creating =
distributions.<br>
&gt; - am__tar=3D&#39;${AMTAR} chof - --owner=3Droot --group=3Droot &quot;$=
$tardir&quot;&#39;<br>
&gt; + am__tar=3D&#39;${AMTAR} chf - --format=3Dustar --owner=3Droot --grou=
p=3Droot &quot;$$tardir&quot;&#39;<br>
&gt;=C2=A0 diff --git a/gettext-runtime/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> b/gettext-runtime/<a hre=
f=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac=
</a><br>
&gt; -index e9299b6..d4f5528 100644<br>
&gt; +index de203e7..138a07f 100644<br>
&gt;=C2=A0 --- a/gettext-runtime/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/gettext-runtime/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gnu-gettext@gnu.org" targe=
t=3D"_blank">bug-gnu-gettext@gnu.org</a>])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gettext@gnu.org" target=3D=
"_blank">bug-gettext@gnu.org</a>])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_SRCDIR([intl/dcigettext.c])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_AUX_DIR([../build-aux])<br>
&gt;=C2=A0 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])<br>
&gt; @@ -41,11 +42,11 @@ index e9299b6..d4f5528 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0dnl Installation directories.<br>
&gt;=C2=A0 diff --git a/gettext-tools/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> b/gettext-tools/<a href=
=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac<=
/a><br>
&gt; -index 920eeb6..c507434 100644<br>
&gt; +index cf1dd73..b544d6d 100644<br>
&gt;=C2=A0 --- a/gettext-tools/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/gettext-tools/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gnu-gettext@gnu.org" targe=
t=3D"_blank">bug-gnu-gettext@gnu.org</a>])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bug-gettext@gnu.org" target=3D=
"_blank">bug-gettext@gnu.org</a>])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_SRCDIR([src/msgfmt.c])<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_AUX_DIR([../build-aux])<br>
&gt;=C2=A0 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])<br>
&gt; @@ -53,6 +54,3 @@ index 920eeb6..c507434 100644<br>
&gt;=C2=A0 =C2=A0AC_CONFIG_HEADERS([config.h])<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0dnl Installation directories.<br>
&gt; --- <br>
&gt; -2.1.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.pa=
tch b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..d1b2603779b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch<br>
&gt; @@ -0,0 +1,713 @@<br>
&gt; +From ef414b06be80c6f605731abc9e674e396b80ec9e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; +Date: Tue, 23 Jan 2018 00:54:13 +0000<br>
&gt; +Subject: [PATCH] gettext: beat library detection into shape<br>
&gt; +<br>
&gt; +For reasons which I just can&#39;t fathom gnulib doesn&#39;t use the =
expected tools to<br>
&gt; +find libraries but badly reinvents the wheel.=C2=A0 This will trivial=
ly lead to host<br>
&gt; +contamination (explicit searches of /usr/lib) or incorrect RPATHs (ba=
d<br>
&gt; +canonicalisation resulting in relative paths).<br>
&gt; +<br>
&gt; +Simply delete all the crazy, and replace with a single call to pkg-co=
nfig.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate (upstream still refuse to consider pkg=
-config)<br>
&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + gettext-tools/gnulib-m4/libxml.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 99 +----------------<br>
&gt; + .../gnulib-local/lib/term-styled-ostream.oo.c |=C2=A0 12 +-<br>
&gt; + libtextstyle/gnulib-local/m4/libcroco.m4=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 99 +++--------------<br>
&gt; + libtextstyle/gnulib-local/m4/libglib.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
104 +++---------------<br>
&gt; + libtextstyle/gnulib-m4/libcroco.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 99 +++--------------<br>
&gt; + libtextstyle/gnulib-m4/libglib.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 104 +++---------------<br>
&gt; + libtextstyle/lib/term-styled-ostream.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 12 +-<br>
&gt; + libtextstyle/lib/term-styled-ostream.oo.c=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 12 +-<br>
&gt; + 8 files changed, 87 insertions(+), 454 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib=
-m4/libxml.m4<br>
&gt; +index 05b9550..031ee65 100644<br>
&gt; +--- a/gettext-tools/gnulib-m4/libxml.m4<br>
&gt; ++++ b/gettext-tools/gnulib-m4/libxml.m4<br>
&gt; +@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)<br>
&gt; + dnl=C2=A0 =C2=A0forces the use of the included or an external libxml=
.<br>
&gt; + AC_DEFUN([gl_LIBXML],<br>
&gt; + [<br>
&gt; ++=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; +=C2=A0 =C2=A0AC_REQUIRE([AM_ICONV_LINK])<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0ifelse([$1], , [<br>
&gt; +@@ -30,100 +31,10 @@ AC_DEFUN([gl_LIBXML],<br>
&gt; +=C2=A0 =C2=A0INCXML=3D<br>
&gt; +=C2=A0 =C2=A0ifelse([$1], [yes], , [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if test &quot;$gl_cv_libxml_use_included&quot; !=
=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalle=
d libxml2, or have to use<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl the included one.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libxml], [<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libxml=3Dno<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LIBXML=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBXML=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_INCXML=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $LIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libxml2 and define LIBXML=
2, LTLIBXML2 and INCXML2<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl accordingly.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use xml2-config nor pkg-co=
nfig, since it doesn&#39;t work when<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compil=
er in use is different from the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Use a test program that tries to inv=
oke xmlFree. On Cygwin 1.7.x,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl libxml2 is built in such a way that =
uses of xmlFree work fine with<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl -Wl,--enable-auto-import but lead to=
 a link error with<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl -Wl,--disable-auto-import.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([xml2])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBXML2 $LIB=
ICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libxml/xmlvers=
ion.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVersion (0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree ((void *) 0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathSetContextNode ((vo=
id *)0, (void *)0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxml=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBXML=3D&quot;$LIBXM=
L2 $LIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBXML=3D&quot;$LTL=
IBXML2 $LTLIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libxml&quot; !=3D y=
es; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCXM=
L2&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libxml/=
xmlversion.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVersion (0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree ((void *) 0)=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPathSetContextNo=
de ((void *)0, (void *)0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxml=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBXML=3D&quot=
;$LIBXML2 $LIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBXML=3D&qu=
ot;$LTLIBXML2 $LTLIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCXML=3D&quot=
;$INCXML2&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libxml&quot;=
 !=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include file=
s are installed in /usr/include/libxml2.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl In libxml2-2.5, &lt;li=
bxml/xmlversion.h&gt; is self-contained.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl In libxml2-2.6, it inc=
ludes &lt;libxml/xmlexports.h&gt; which is<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl self-contained.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml2_include_dir=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_CPP([#include &lt;l=
ibxml2/libxml/xmlexports.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER=
([libxml2/libxml/xmlexports.h])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2_inclu=
de_dir=3D`echo &quot;$gl_cv_absolute_libxml2_libxml_xmlexports_h&quot; | se=
d -e &#39;s,.libxml.xmlexports\.h$,,&#39;`<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$libxml2_=
include_dir&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_CPP([#includ=
e &lt;libxml2/libxml/xmlversion.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE=
_HEADER([libxml2/libxml/xmlversion.h])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxml=
2_include_dir=3D`echo &quot;$gl_cv_absolute_libxml2_libxml_xmlversion_h&quo=
t; | sed -e &#39;s,.libxml.xmlversion\.h$,,&#39;`<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$libxml2_=
include_dir&quot; &amp;&amp; test -d &quot;$libxml2_include_dir&quot;; then=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$g=
l_save_CPPFLAGS -I$libxml2_include_dir&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#inclu=
de &lt;libxml/xmlversion.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;libxml/xmlmemory.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;libxml/xpath.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [xmlCheckVer=
sion (0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFre=
e ((void *) 0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlXPa=
thSetContextNode ((void *)0, (void *)0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libxm=
l=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LIBXML=3D&quot;$LIBXML2 $LIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LTLIBXML=3D&quot;$LTLIBXML2 $LTLIBICONV&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
INCXML=3D&quot;-I$libxml2_include_dir&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for libxml])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libxml])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if test $gl_cv_libxml =3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBXML=3D&quot;$gl_cv_LIBXML&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBXML=3D&quot;$gl_cv_LTLIBXML&quot;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCXML=3D&quot;$gl_cv_INCXML&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libxml_use_included=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 PKG_CHECK_MODULES([XML], [libxml-2.0])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 LIBXML=3D$XML_LIBS<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 LTLIBXML=3D$XML_LIBS<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 INCXML=3D$XML_CFLAGS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LIBXML])<br>
&gt; +diff --git a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c b=
/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c<br>
&gt; +index 2cfd4a8..d42c8b4 100644<br>
&gt; +--- a/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c<br>
&gt; ++++ b/libtextstyle/gnulib-local/lib/term-styled-ostream.oo.c<br>
&gt; +@@ -22,15 +22,15 @@<br>
&gt; + <br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + <br>
&gt; +-#include &lt;cr-om-parser.h&gt;<br>
&gt; +-#include &lt;cr-sel-eng.h&gt;<br>
&gt; +-#include &lt;cr-style.h&gt;<br>
&gt; +-#include &lt;cr-rgb.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-om-parser.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-sel-eng.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-style.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-rgb.h&gt;<br>
&gt; + /* &lt;cr-fonts.h&gt; has a broken double-inclusion guard in libcroc=
o-0.6.1.=C2=A0 */<br>
&gt; + #ifndef __CR_FONTS_H__<br>
&gt; +-# include &lt;cr-fonts.h&gt;<br>
&gt; ++# include &lt;libcroco/cr-fonts.h&gt;<br>
&gt; + #endif<br>
&gt; +-#include &lt;cr-string.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-string.h&gt;<br>
&gt; + <br>
&gt; + #include &quot;term-ostream.h&quot;<br>
&gt; + #include &quot;hash.h&quot;<br>
&gt; +diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle/=
gnulib-local/m4/libcroco.m4<br>
&gt; +index bc53cc6..10b2455 100644<br>
&gt; +--- a/libtextstyle/gnulib-local/m4/libcroco.m4<br>
&gt; ++++ b/libtextstyle/gnulib-local/m4/libcroco.m4<br>
&gt; +@@ -1,99 +1,34 @@<br>
&gt; +-# libcroco.m4 serial 3<br>
&gt; +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br>
&gt; ++# libcroco.m4 serial 2 (gettext-0.17)<br>
&gt; ++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.<br>
&gt; + dnl This file is free software; the Free Software Foundation<br>
&gt; + dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; + dnl with or without modifications, as long as this notice is preserv=
ed.<br>
&gt; + <br>
&gt; + dnl From Bruno Haible.<br>
&gt; + <br>
&gt; +-dnl gl_LIBCROCO<br>
&gt; +-dnl=C2=A0 =C2=A0gives the user the option to decide whether to use t=
he included or<br>
&gt; +-dnl=C2=A0 =C2=A0an external libcroco.<br>
&gt; +-dnl gl_LIBCROCO(FORCE-INCLUDED)<br>
&gt; +-dnl=C2=A0 =C2=A0forces the use of the included or an external libcro=
co.<br>
&gt; + AC_DEFUN([gl_LIBCROCO],<br>
&gt; + [<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 dnl libcroco depends on libglib.<br>
&gt; +-=C2=A0 =C2=A0 AC_REQUIRE([gl_LIBGLIB])<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; ++=C2=A0 dnl libcroco depends on libglib.<br>
&gt; ++=C2=A0 AC_REQUIRE([gl_LIBGLIB])<br>
&gt; + <br>
&gt; +-=C2=A0 ifelse([$1], , [<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_CHECKING([whether included libcroco is requeste=
d])<br>
&gt; +-=C2=A0 =C2=A0 AC_ARG_WITH([included-libcroco],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-included-libcroco=C2=A0 use the =
libcroco included here],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3D$withval],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3Dno])<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libcroco_force_included])<br>
&gt; +-=C2=A0 ], [gl_cv_libcroco_force_included=3D$1])<br>
&gt; ++=C2=A0 AC_MSG_CHECKING([whether included libcroco is requested])<br>
&gt; ++=C2=A0 AC_ARG_WITH([included-libcroco],<br>
&gt; ++=C2=A0 =C2=A0 [=C2=A0 --with-included-libcroco=C2=A0 use the libcroc=
o included here],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3D$withval],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3Dno])<br>
&gt; ++=C2=A0 AC_MSG_RESULT([$gl_cv_libcroco_force_included])<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0gl_cv_libcroco_use_included=3D&quot;$gl_cv_libcroco_forc=
e_included&quot;<br>
&gt; +=C2=A0 =C2=A0LIBCROCO=3D<br>
&gt; +=C2=A0 =C2=A0LTLIBCROCO=3D<br>
&gt; +=C2=A0 =C2=A0INCCROCO=3D<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D =
yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalle=
d libcroco-0.6, or have to<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl use the included one.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libcroco], [<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco=3Dno<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LIBCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_INCCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libcroco and define LIBCR=
OCO_0_6, LTLIBCROCO_0_6 and<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl INCCROCO_0_6 accordingly.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use croco-0.6-config nor p=
kg-config, since it doesn&#39;t work when<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compil=
er in use is different from the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib=
-2.0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBCROCO_0_6=
&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroco-confi=
g.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D LIBCROCO=
_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&quot;$LIB=
CROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&quot;$L=
TLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quot; !=3D=
 yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCCR=
OCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroc=
o-config.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D L=
IBCROCO_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&qu=
ot;$LIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&=
quot;$LTLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCCROCO=3D&qu=
ot;$INCCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quo=
t; !=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include file=
s are installed in<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl /usr/include/libcroco-=
0.6/libcroco.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;=
libcroco-0.6/libcroco/libcroco-config.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *versio=
n =3D LIBCROCO_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER=
([libcroco-0.6/libcroco/libcroco-config.h])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcroco_incl=
ude_dir=3D`echo &quot;$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config=
_h&quot; | sed -e &#39;s,.libcroco-config\.h$,,&#39;`<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -d &q=
uot;$libcroco_include_dir&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LIBCROCO=3D&quot;$LIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LTLIBCROCO=3D&quot;$LTLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
INCCROCO=3D&quot;-I$libcroco_include_dir&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for libcroco])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libcroco])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if test $gl_cv_libcroco =3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBCROCO=3D&quot;$gl_cv_LIBCROCO&quot;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBCROCO=3D&quot;$gl_cv_LTLIBCROCO&quo=
t;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCCROCO=3D&quot;$gl_cv_INCCROCO&quot;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco_use_included=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D yes; th=
en<br>
&gt; ++=C2=A0 =C2=A0 PKG_CHECK_MODULES([CROCO], [libcroco-0.6])<br>
&gt; ++=C2=A0 =C2=A0 LIBCROCO=3D$CROCO_LIBS<br>
&gt; ++=C2=A0 =C2=A0 LTLIBCROCO=3D$CROCO_LIBS<br>
&gt; ++=C2=A0 =C2=A0 INCCROCO=3D$CROCO_CFLAGS<br>
&gt; ++=C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LIBCROCO])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LTLIBCROCO])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([INCCROCO])<br>
&gt; +diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/g=
nulib-local/m4/libglib.m4<br>
&gt; +index bef6fa3..8841755 100644<br>
&gt; +--- a/libtextstyle/gnulib-local/m4/libglib.m4<br>
&gt; ++++ b/libtextstyle/gnulib-local/m4/libglib.m4<br>
&gt; +@@ -1,105 +1,31 @@<br>
&gt; +-# libglib.m4 serial 4<br>
&gt; +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br>
&gt; ++# libglib.m4 serial 3 (gettext-0.17)<br>
&gt; ++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc=
.<br>
&gt; + dnl This file is free software; the Free Software Foundation<br>
&gt; + dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; + dnl with or without modifications, as long as this notice is preserv=
ed.<br>
&gt; + <br>
&gt; + dnl From Bruno Haible.<br>
&gt; + <br>
&gt; +-dnl gl_LIBGLIB<br>
&gt; +-dnl=C2=A0 =C2=A0gives the user the option to decide whether to use t=
he included or<br>
&gt; +-dnl=C2=A0 =C2=A0an external libglib.<br>
&gt; +-dnl gl_LIBGLIB(FORCE-INCLUDED)<br>
&gt; +-dnl=C2=A0 =C2=A0forces the use of the included or an external libgli=
b.<br>
&gt; + AC_DEFUN([gl_LIBGLIB],<br>
&gt; + [<br>
&gt; +-=C2=A0 ifelse([$1], , [<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_CHECKING([whether included glib is requested])<=
br>
&gt; +-=C2=A0 =C2=A0 AC_ARG_WITH([included-glib],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-included-glib=C2=A0 =C2=A0 use t=
he glib2 included here],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib_force_included=3D$withval],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib_force_included=3Dno])<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libglib_force_included])<br>
&gt; +-=C2=A0 ], [gl_cv_libglib_force_included=3D$1])<br>
&gt; ++=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; ++=C2=A0 AC_MSG_CHECKING([whether included glib is requested])<br>
&gt; ++=C2=A0 AC_ARG_WITH([included-glib],<br>
&gt; ++=C2=A0 =C2=A0 [=C2=A0 --with-included-glib=C2=A0 =C2=A0 use the glib=
2 included here],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libglib_force_included=3D$withval],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libglib_force_included=3Dno])<br>
&gt; ++=C2=A0 AC_MSG_RESULT([$gl_cv_libglib_force_included])<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0gl_cv_libglib_use_included=3D&quot;$gl_cv_libglib_force_=
included&quot;<br>
&gt; +=C2=A0 =C2=A0LIBGLIB=3D<br>
&gt; +=C2=A0 =C2=A0LTLIBGLIB=3D<br>
&gt; +=C2=A0 =C2=A0INCGLIB=3D<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 if test &quot;$gl_cv_libglib_use_included&quot; !=3D y=
es; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalle=
d libglib-2.0, or have to use<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl the included one.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libglib], [<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libglib=3Dno<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LIBGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_INCGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libglib2 and define LIBGL=
IB_2_0, LTLIBGLIB_2_0 and<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl INCGLIB_2_0 accordingly.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use glib-config nor pkg-co=
nfig, since it doesn&#39;t work when<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compil=
er in use is different from the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([glib-2.0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBGLIB_2_0&=
quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&quot;);]=
,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quot;$LIBG=
LIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&quot;$LT=
LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot; !=3D =
yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCGL=
IB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&=
gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&q=
uot;);],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quo=
t;$LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&q=
uot;$LTLIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCGLIB=3D&quo=
t;$INCGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot=
; !=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include file=
s are installed in /usr/include/glib-2.0<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl and /usr/lib/glib-2.0/=
include.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$LIBGLIB_=
2_0_PREFIX&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$g=
l_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFI=
X/$acl_libdirstem/glib-2.0/include&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#inclu=
de &lt;glib.h&gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_ne=
w (&quot;foo&quot;);],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libgl=
ib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LIBGLIB=3D&quot;$LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LTLIBGLIB=3D&quot;$LTLIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
INCGLIB=3D&quot;-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFI=
X/$acl_libdirstem/glib-2.0/include&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for glib])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libglib])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if test $gl_cv_libglib =3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBGLIB=3D&quot;$gl_cv_LIBGLIB&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$gl_cv_LTLIBGLIB&quot;=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCGLIB=3D&quot;$gl_cv_INCGLIB&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libglib_use_included=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 if test &quot;$gl_cv_libglib_use_included&quot; !=3D yes; the=
n<br>
&gt; ++=C2=A0 =C2=A0 PKG_CHECK_MODULES([GLIB], [glib-2.0])<br>
&gt; ++=C2=A0 =C2=A0 LIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; ++=C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; ++=C2=A0 =C2=A0 INCGLIB=3D&quot;$GLIB_CFLAGS&quot;<br>
&gt; ++=C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LIBGLIB])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LTLIBGLIB])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([INCGLIB])<br>
&gt; +diff --git a/libtextstyle/gnulib-m4/libcroco.m4 b/libtextstyle/gnulib=
-m4/libcroco.m4<br>
&gt; +index bc53cc6..10b2455 100644<br>
&gt; +--- a/libtextstyle/gnulib-m4/libcroco.m4<br>
&gt; ++++ b/libtextstyle/gnulib-m4/libcroco.m4<br>
&gt; +@@ -1,99 +1,34 @@<br>
&gt; +-# libcroco.m4 serial 3<br>
&gt; +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br>
&gt; ++# libcroco.m4 serial 2 (gettext-0.17)<br>
&gt; ++dnl Copyright (C) 2006, 2015-2016 Free Software Foundation, Inc.<br>
&gt; + dnl This file is free software; the Free Software Foundation<br>
&gt; + dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; + dnl with or without modifications, as long as this notice is preserv=
ed.<br>
&gt; + <br>
&gt; + dnl From Bruno Haible.<br>
&gt; + <br>
&gt; +-dnl gl_LIBCROCO<br>
&gt; +-dnl=C2=A0 =C2=A0gives the user the option to decide whether to use t=
he included or<br>
&gt; +-dnl=C2=A0 =C2=A0an external libcroco.<br>
&gt; +-dnl gl_LIBCROCO(FORCE-INCLUDED)<br>
&gt; +-dnl=C2=A0 =C2=A0forces the use of the included or an external libcro=
co.<br>
&gt; + AC_DEFUN([gl_LIBCROCO],<br>
&gt; + [<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 dnl libcroco depends on libglib.<br>
&gt; +-=C2=A0 =C2=A0 AC_REQUIRE([gl_LIBGLIB])<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; ++=C2=A0 dnl libcroco depends on libglib.<br>
&gt; ++=C2=A0 AC_REQUIRE([gl_LIBGLIB])<br>
&gt; + <br>
&gt; +-=C2=A0 ifelse([$1], , [<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_CHECKING([whether included libcroco is requeste=
d])<br>
&gt; +-=C2=A0 =C2=A0 AC_ARG_WITH([included-libcroco],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-included-libcroco=C2=A0 use the =
libcroco included here],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3D$withval],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3Dno])<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libcroco_force_included])<br>
&gt; +-=C2=A0 ], [gl_cv_libcroco_force_included=3D$1])<br>
&gt; ++=C2=A0 AC_MSG_CHECKING([whether included libcroco is requested])<br>
&gt; ++=C2=A0 AC_ARG_WITH([included-libcroco],<br>
&gt; ++=C2=A0 =C2=A0 [=C2=A0 --with-included-libcroco=C2=A0 use the libcroc=
o included here],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3D$withval],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libcroco_force_included=3Dno])<br>
&gt; ++=C2=A0 AC_MSG_RESULT([$gl_cv_libcroco_force_included])<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0gl_cv_libcroco_use_included=3D&quot;$gl_cv_libcroco_forc=
e_included&quot;<br>
&gt; +=C2=A0 =C2=A0LIBCROCO=3D<br>
&gt; +=C2=A0 =C2=A0LTLIBCROCO=3D<br>
&gt; +=C2=A0 =C2=A0INCCROCO=3D<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D =
yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalle=
d libcroco-0.6, or have to<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl use the included one.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libcroco], [<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco=3Dno<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LIBCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_INCCROCO=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libcroco and define LIBCR=
OCO_0_6, LTLIBCROCO_0_6 and<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl INCCROCO_0_6 accordingly.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use croco-0.6-config nor p=
kg-config, since it doesn&#39;t work when<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compil=
er in use is different from the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([croco-0.6], [glib=
-2.0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBCROCO_0_6=
&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroco-confi=
g.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D LIBCROCO=
_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&quot;$LIB=
CROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&quot;$L=
TLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quot; !=3D=
 yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCCR=
OCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;libcroc=
o-config.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *version =3D L=
IBCROCO_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBCROCO=3D&qu=
ot;$LIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBCROCO=3D&=
quot;$LTLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCCROCO=3D&qu=
ot;$INCCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco&quo=
t; !=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include file=
s are installed in<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl /usr/include/libcroco-=
0.6/libcroco.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;=
libcroco-0.6/libcroco/libcroco-config.h&gt;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [const char *versio=
n =3D LIBCROCO_VERSION; return !version;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_ABSOLUTE_HEADER=
([libcroco-0.6/libcroco/libcroco-config.h])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcroco_incl=
ude_dir=3D`echo &quot;$gl_cv_absolute_libcroco_0_6_libcroco_libcroco_config=
_h&quot; | sed -e &#39;s,.libcroco-config\.h$,,&#39;`<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -d &q=
uot;$libcroco_include_dir&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
libcroco=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LIBCROCO=3D&quot;$LIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LTLIBCROCO=3D&quot;$LTLIBCROCO_0_6&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
INCCROCO=3D&quot;-I$libcroco_include_dir&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for libcroco])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libcroco])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if test $gl_cv_libcroco =3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBCROCO=3D&quot;$gl_cv_LIBCROCO&quot;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBCROCO=3D&quot;$gl_cv_LTLIBCROCO&quo=
t;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCCROCO=3D&quot;$gl_cv_INCCROCO&quot;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libcroco_use_included=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D yes; th=
en<br>
&gt; ++=C2=A0 =C2=A0 PKG_CHECK_MODULES([CROCO], [libcroco-0.6])<br>
&gt; ++=C2=A0 =C2=A0 LIBCROCO=3D$CROCO_LIBS<br>
&gt; ++=C2=A0 =C2=A0 LTLIBCROCO=3D$CROCO_LIBS<br>
&gt; ++=C2=A0 =C2=A0 INCCROCO=3D$CROCO_CFLAGS<br>
&gt; ++=C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LIBCROCO])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LTLIBCROCO])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([INCCROCO])<br>
&gt; +diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-=
m4/libglib.m4<br>
&gt; +index bef6fa3..8841755 100644<br>
&gt; +--- a/libtextstyle/gnulib-m4/libglib.m4<br>
&gt; ++++ b/libtextstyle/gnulib-m4/libglib.m4<br>
&gt; +@@ -1,105 +1,31 @@<br>
&gt; +-# libglib.m4 serial 4<br>
&gt; +-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br>
&gt; ++# libglib.m4 serial 3 (gettext-0.17)<br>
&gt; ++dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc=
.<br>
&gt; + dnl This file is free software; the Free Software Foundation<br>
&gt; + dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; + dnl with or without modifications, as long as this notice is preserv=
ed.<br>
&gt; + <br>
&gt; + dnl From Bruno Haible.<br>
&gt; + <br>
&gt; +-dnl gl_LIBGLIB<br>
&gt; +-dnl=C2=A0 =C2=A0gives the user the option to decide whether to use t=
he included or<br>
&gt; +-dnl=C2=A0 =C2=A0an external libglib.<br>
&gt; +-dnl gl_LIBGLIB(FORCE-INCLUDED)<br>
&gt; +-dnl=C2=A0 =C2=A0forces the use of the included or an external libgli=
b.<br>
&gt; + AC_DEFUN([gl_LIBGLIB],<br>
&gt; + [<br>
&gt; +-=C2=A0 ifelse([$1], , [<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_CHECKING([whether included glib is requested])<=
br>
&gt; +-=C2=A0 =C2=A0 AC_ARG_WITH([included-glib],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-included-glib=C2=A0 =C2=A0 use t=
he glib2 included here],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib_force_included=3D$withval],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib_force_included=3Dno])<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libglib_force_included])<br>
&gt; +-=C2=A0 ], [gl_cv_libglib_force_included=3D$1])<br>
&gt; ++=C2=A0 AC_REQUIRE([PKG_PROG_PKG_CONFIG])<br>
&gt; ++=C2=A0 AC_MSG_CHECKING([whether included glib is requested])<br>
&gt; ++=C2=A0 AC_ARG_WITH([included-glib],<br>
&gt; ++=C2=A0 =C2=A0 [=C2=A0 --with-included-glib=C2=A0 =C2=A0 use the glib=
2 included here],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libglib_force_included=3D$withval],<br>
&gt; ++=C2=A0 =C2=A0 [gl_cv_libglib_force_included=3Dno])<br>
&gt; ++=C2=A0 AC_MSG_RESULT([$gl_cv_libglib_force_included])<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0gl_cv_libglib_use_included=3D&quot;$gl_cv_libglib_force_=
included&quot;<br>
&gt; +=C2=A0 =C2=A0LIBGLIB=3D<br>
&gt; +=C2=A0 =C2=A0LTLIBGLIB=3D<br>
&gt; +=C2=A0 =C2=A0INCGLIB=3D<br>
&gt; +-=C2=A0 ifelse([$1], [yes], , [<br>
&gt; +-=C2=A0 =C2=A0 if test &quot;$gl_cv_libglib_use_included&quot; !=3D y=
es; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstalle=
d libglib-2.0, or have to use<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 dnl the included one.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_CACHE_VAL([gl_cv_libglib], [<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libglib=3Dno<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LIBGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_LTLIBGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_INCGLIB=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libglib2 and define LIBGL=
IB_2_0, LTLIBGLIB_2_0 and<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl INCGLIB_2_0 accordingly.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Don&#39;t use glib-config nor pkg-co=
nfig, since it doesn&#39;t work when<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl cross-compiling or when the C compil=
er in use is different from the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl one that built the library.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([glib-2.0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS $LIBGLIB_2_0&=
quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&quot;);]=
,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quot;$LIBG=
LIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&quot;$LT=
LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot; !=3D =
yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_save_CPPFLAGS=3D&quot;$CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $INCGL=
IB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#include &lt;glib.h&=
gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_new (&quot;foo&q=
uot;);],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libglib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LIBGLIB=3D&quo=
t;$LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_LTLIBGLIB=3D&q=
uot;$LTLIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_INCGLIB=3D&quo=
t;$INCGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gl_cv_libglib&quot=
; !=3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Often the include file=
s are installed in /usr/include/glib-2.0<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl and /usr/lib/glib-2.0/=
include.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$LIBGLIB_=
2_0_PREFIX&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$g=
l_save_CPPFLAGS -I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFI=
X/$acl_libdirstem/glib-2.0/include&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_LINK([#inclu=
de &lt;glib.h&gt;<br>
&gt; +-#ifndef G_BEGIN_DECLS<br>
&gt; +-error this glib.h includes a glibconfig.h from a glib version 1.x<br=
>
&gt; +-#endif<br>
&gt; +-],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [g_string_ne=
w (&quot;foo&quot;);],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_libgl=
ib=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LIBGLIB=3D&quot;$LIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
LTLIBGLIB=3D&quot;$LTLIBGLIB_2_0&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_=
INCGLIB=3D&quot;-I$LIBGLIB_2_0_PREFIX/include/glib-2.0 -I$LIBGLIB_2_0_PREFI=
X/$acl_libdirstem/glib-2.0/include&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gl_save_CPPFLAG=
S&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gl_save_LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for glib])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$gl_cv_libglib])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if test $gl_cv_libglib =3D yes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBGLIB=3D&quot;$gl_cv_LIBGLIB&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$gl_cv_LTLIBGLIB&quot;=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCGLIB=3D&quot;$gl_cv_INCGLIB&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_libglib_use_included=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 =C2=A0 fi<br>
&gt; +-=C2=A0 ])<br>
&gt; ++=C2=A0 if test &quot;$gl_cv_libglib_use_included&quot; !=3D yes; the=
n<br>
&gt; ++=C2=A0 =C2=A0 PKG_CHECK_MODULES([GLIB], [glib-2.0])<br>
&gt; ++=C2=A0 =C2=A0 LIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; ++=C2=A0 =C2=A0 LTLIBGLIB=3D&quot;$GLIB_LIBS&quot;<br>
&gt; ++=C2=A0 =C2=A0 INCGLIB=3D&quot;$GLIB_CFLAGS&quot;<br>
&gt; ++=C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LIBGLIB])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([LTLIBGLIB])<br>
&gt; +=C2=A0 =C2=A0AC_SUBST([INCGLIB])<br>
&gt; +diff --git a/libtextstyle/lib/term-styled-ostream.c b/libtextstyle/li=
b/term-styled-ostream.c<br>
&gt; +index 3675b5f..811e546 100644<br>
&gt; +--- a/libtextstyle/lib/term-styled-ostream.c<br>
&gt; ++++ b/libtextstyle/lib/term-styled-ostream.c<br>
&gt; +@@ -28,15 +28,15 @@<br>
&gt; + <br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + <br>
&gt; +-#include &lt;cr-om-parser.h&gt;<br>
&gt; +-#include &lt;cr-sel-eng.h&gt;<br>
&gt; +-#include &lt;cr-style.h&gt;<br>
&gt; +-#include &lt;cr-rgb.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-om-parser.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-sel-eng.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-style.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-rgb.h&gt;<br>
&gt; + /* &lt;cr-fonts.h&gt; has a broken double-inclusion guard in libcroc=
o-0.6.1.=C2=A0 */<br>
&gt; + #ifndef __CR_FONTS_H__<br>
&gt; +-# include &lt;cr-fonts.h&gt;<br>
&gt; ++# include &lt;libcroco/cr-fonts.h&gt;<br>
&gt; + #endif<br>
&gt; +-#include &lt;cr-string.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-string.h&gt;<br>
&gt; + <br>
&gt; + #include &quot;term-ostream.h&quot;<br>
&gt; + #include &quot;hash.h&quot;<br>
&gt; +diff --git a/libtextstyle/lib/term-styled-ostream.oo.c b/libtextstyle=
/lib/term-styled-ostream.oo.c<br>
&gt; +index 2cfd4a8..d42c8b4 100644<br>
&gt; +--- a/libtextstyle/lib/term-styled-ostream.oo.c<br>
&gt; ++++ b/libtextstyle/lib/term-styled-ostream.oo.c<br>
&gt; +@@ -22,15 +22,15 @@<br>
&gt; + <br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + <br>
&gt; +-#include &lt;cr-om-parser.h&gt;<br>
&gt; +-#include &lt;cr-sel-eng.h&gt;<br>
&gt; +-#include &lt;cr-style.h&gt;<br>
&gt; +-#include &lt;cr-rgb.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-om-parser.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-sel-eng.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-style.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-rgb.h&gt;<br>
&gt; + /* &lt;cr-fonts.h&gt; has a broken double-inclusion guard in libcroc=
o-0.6.1.=C2=A0 */<br>
&gt; + #ifndef __CR_FONTS_H__<br>
&gt; +-# include &lt;cr-fonts.h&gt;<br>
&gt; ++# include &lt;libcroco/cr-fonts.h&gt;<br>
&gt; + #endif<br>
&gt; +-#include &lt;cr-string.h&gt;<br>
&gt; ++#include &lt;libcroco/cr-string.h&gt;<br>
&gt; + <br>
&gt; + #include &quot;term-ostream.h&quot;<br>
&gt; + #include &quot;hash.h&quot;<br>
&gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.bb" rel=3D"noreferre=
r" target=3D"_blank">gettext_0.20.1.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8=
.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; rename to meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a><br>
&gt; index 30121ad23e1..fc05ef2e0a3 100644<br>
&gt; --- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; +++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a><br>
&gt; @@ -6,7 +6,7 @@ a few stand-alone programs to massage in various ways =
the sets of translatable a<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/gettex=
t/gettext.html" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/sof=
tware/gettext/gettext.html</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv3+ &amp; LGPL-2.1+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc678957b0c8e964aa6c70=
fd77641a71e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Because po-gram-gen.y has been modified by fix-CVE-2018-18751.=
patch,<br>
&gt;=C2=A0 # it requires yacc which provided by bison-native<br>
&gt; @@ -17,17 +17,16 @@ PROVIDES =3D &quot;virtual/libintl virtual/gettext=
&quot;<br>
&gt;=C2=A0 PROVIDES_class-native =3D &quot;virtual/gettext-native&quot;<br>
&gt;=C2=A0 RCONFLICTS_${PN} =3D &quot;proxy-libintl&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://parallel.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-with-bisonlocaledir.patch \<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cr-statement.c-timsort.h-fix-forma=
tting-issues.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-pkgconfig.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-CVE-2018-18751.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://serial-tests-config.patch \<br>
&gt; -&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://parallel.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-with-bisonlocaled=
ir.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cr-statement.c-timsor=
t.h-fix-formatting-issues.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-pkgconfig.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://serial-tests-config.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[md5sum] =3D &quot;97e034cf8ce5ba73a28ff6c3c0638092&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5=
e2364de57baa279c1c125c43&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;bb5b0c0caa028105f3ca1905ddc306e2&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;66415634c6e8c3fa8b71362879ec7575e27da43d=
a562c798a8a2f223e6e47f5c&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools texinfo pkgconfig ptest<br>
&gt;=C2=A0 <br>
&gt; @@ -127,7 +126,7 @@ do_install_append_class-native () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${datadir}/gettext/po/remove-potcdate=
.sin<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_wrapper ${D}${bindir}/msgfmt =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GETTEXTDATADI=
R=3D&quot;${STAGING_DATADIR_NATIVE}/gettext-0.19.8/&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GETTEXTDATADI=
R=3D&quot;${STAGING_DATADIR_NATIVE}/gettext-0.20/&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
<br>
</blockquote></div></div>

--000000000000065e4b05986bb464--
