Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.2527.1590053777105843414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 02:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AG+85qLP;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id 1so3631313vsl.9
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PMpWwg4MdII/DS15wUOPPAYZ9pzBd+4UBScLUFznz3w=;
        b=AG+85qLPQ2IOOzhr80qhNFV77FTi7cmqMmgO8EODH6R7vHBy4ISyju/mlEwNVLYNTU
         hYkGHFhR7c27KK1b/asSBJ3DaE5DQecXK7ih4as3e6giqKUHSFWnuV9t/k1KivmH1nhU
         NMz0DAHOidHFT0S6kJqVxKMh4Ozf3JeiM71WSLG661ALm6tvFvWHGZXPCq9O/ExabEnF
         v57Ms47KbWF3eFg2XaKlFr5U0LdPLL1EcWW60yQmoDA4DpG2cCUWI3+7+FJ568qQwCJe
         1+W/0RDl53bUSVORWP9Iw12B0mJ18Bn7nQsyXf93rb4Bn8uwp+X0M/VP6ijhFB50Mfh+
         2TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PMpWwg4MdII/DS15wUOPPAYZ9pzBd+4UBScLUFznz3w=;
        b=UIqQE7RPcchqwFu69LaC1yiULQRMsWXDifLqLZ+DBJNi03iwYogRpdLBQ4yJqQcIw3
         5wmM93/Z+8DjXfhXQjP2CMjM0kFg66UqoQJmPa4l0TpUBiAQ8da8Us0vTrtIDExNldbV
         FMYw0nnjwXtmuLNnwWI2LZ/zlawgWv422Wo4LyRvOTvlMfhR+vDUKjXmgw0+iZH12vgz
         6P1DKvgsgLCiaBYeVeeL6Mdw4+GVvuk1lNiEeLHt3jaFizbV21DZI66acFwcozHyHSDf
         VXK+Df8x4Fla+cgLWYZ/Z6dxK1FcxfRDGPPqaTqGTn/p7XusLmrP2oZtfGWhou/MDl+6
         N1Yg==
X-Gm-Message-State: AOAM533X17wbK9m6skH6sgSrCVDTX46Ft/6UcfiiMqP0mwD082eHAIzX
	EZNQCZs9xNcYM94R1Wop7PsOmAr8hvRI/UDanH4=
X-Google-Smtp-Source: ABdhPJyqWwb/G684VtcjdkFswnGnQnr7fr5GLIRFzr0z9+JPCoPhZZbfMcEU6RHPRA+yAAGWODmhyRZOv84Du2av7j4=
X-Received: by 2002:a67:be05:: with SMTP id x5mr6220839vsq.35.1590053776136;
 Thu, 21 May 2020 02:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <1590056901-40755-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1590056901-40755-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 21 May 2020 11:36:04 +0200
Message-ID: <CANNYZj-P=fGrbCr5hX9-tpYL=1PnCfFtMb6qWE+mwgsfApSr8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gettext: upgrade 0.20.1 -> 0.20.2
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000801cc705a6253e78"

--000000000000801cc705a6253e78
Content-Type: text/plain; charset="UTF-8"

Files supplied by gettext-minimal-native should be refreshed as well (and
that recipe bumped to the new version). You can simply copy them from the
full 0.20.2 installation.

Alex

On Thu, 21 May 2020 at 03:29, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> rename gettext-0.20.1 to gettext-0.20.2
>
> 0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
> cr-statement.c-timsort.h-fix-formatting-issues.patch
> removed since they are included in 0.20.2
>
> refresh use-pkgconfig.patch
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...aviour-of-for-msgfmt-on-PO-files-wit.patch | 87 -------------------
>  ...nt.c-timsort.h-fix-formatting-issues.patch | 71 ---------------
>  ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
>  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
>  .../add-with-bisonlocaledir.patch             |  0
>  .../parallel.patch                            |  0
>  .../run-ptest                                 |  0
>  .../serial-tests-config.patch                 |  0
>  .../use-pkgconfig.patch                       | 36 +++++---
>  .../{gettext_0.20.1.bb => gettext_0.20.2.bb}  |  6 +-
>  10 files changed, 24 insertions(+), 176 deletions(-)
>  delete mode 100644
> meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
>  delete mode 100644
> meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/add-with-bisonlocaledir.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/parallel.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/run-ptest (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/serial-tests-config.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.20.1 =>
> gettext-0.20.2}/use-pkgconfig.patch (98%)
>  rename meta/recipes-core/gettext/{gettext_0.20.1.bb => gettext_0.20.2.bb}
> (96%)
>
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
> deleted file mode 100644
> index 2245889386..0000000000
> ---
> a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From 75e315fdec82d1a17ebcd9e0712d109323578d68 Mon Sep 17 00:00:00 2001
> -From: Bruno Haible <bruno@clisp.org>
> -Date: Sun, 19 May 2019 11:10:06 +0200
> -Subject: [PATCH] msgmerge: Fix behaviour of --for-msgfmt on PO files with
> no
> - translations.
> -
> -msgmerge: Fix behaviour of --for-msgfmt on PO files with no translations.
> -
> -Reported by Don Lawrence <dlawrence@iecok.com>
> -in <https://lists.freedesktop.org/archives/p11-glue/2019-May/000700.html>
> -via Daiki Ueno
> -in <https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00124.html
> >.
> -
> -* gettext-tools/src/msgmerge.c (main): Treat force_po like true if
> for_msgfmt
> -is true.
> -* gettext-tools/tests/msgmerge-26: Add test of PO file with no
> translations.
> -
> -Upstream-Status: Backport [
> https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=2336451ed68d91ff4b5ae1acbc1eca30e47a86a9
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gettext-tools/src/msgmerge.c    |  4 ++--
> - gettext-tools/tests/msgmerge-26 | 36 ++++++++++++++++++++++++++++++---
> - 2 files changed, 35 insertions(+), 5 deletions(-)
> -
> -diff --git a/gettext-tools/src/msgmerge.c b/gettext-tools/src/msgmerge.c
> -index cd762c0..92c9b7a 100644
> ---- a/gettext-tools/src/msgmerge.c
> -+++ b/gettext-tools/src/msgmerge.c
> -@@ -520,8 +520,8 @@ There is NO WARRANTY, to the extent permitted by
> law.\n\
> -   else
> -     {
> -       /* Write the merged message list out.  */
> --      msgdomain_list_print (result, output_file, output_syntax, force_po,
> --                            false);
> -+      msgdomain_list_print (result, output_file, output_syntax,
> -+                            for_msgfmt || force_po, false);
> -     }
> -
> -   exit (EXIT_SUCCESS);
> -diff --git a/gettext-tools/tests/msgmerge-26
> b/gettext-tools/tests/msgmerge-26
> -index cd3862e..b86f7a0 100755
> ---- a/gettext-tools/tests/msgmerge-26
> -+++ b/gettext-tools/tests/msgmerge-26
> -@@ -73,7 +73,37 @@ msgstr "Papaya"
> - EOF
> -
> - : ${DIFF=diff}
> --${DIFF} mm-test26.ok mm-test26.out
> --result=$?
> -+${DIFF} mm-test26.ok mm-test26.out || Exit 1
> -
> --exit $result
> -+# Test with a PO file that has no translated messages.
> -+
> -+cat <<\EOF > mm-test26a.in1
> -+msgid ""
> -+msgstr ""
> -+"Content-Type: text/plain; charset=UTF-8\n"
> -+
> -+msgid "Hello world"
> -+msgstr "Hallo Welt"
> -+EOF
> -+
> -+cat <<\EOF > mm-test26a.in2
> -+msgid ""
> -+msgstr ""
> -+"Content-Type: text/plain; charset=ASCII\n"
> -+
> -+msgid "Hello, world!"
> -+msgstr ""
> -+EOF
> -+
> -+: ${MSGMERGE=msgmerge}
> -+${MSGMERGE} --for-msgfmt -o mm-test26a.tmp mm-test26a.in1 mm-test26a.in2
> \
> -+    || Exit 1
> -+LC_ALL=C tr -d '\r' < mm-test26a.tmp > mm-test26a.out || Exit 1
> -+
> -+cat <<\EOF > mm-test26a.ok
> -+msgid ""
> -+msgstr "Content-Type: text/plain; charset=UTF-8\n"
> -+EOF
> -+
> -+: ${DIFF=diff}
> -+${DIFF} mm-test26a.ok mm-test26a.out || Exit 1
> ---
> -2.24.1
> -
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> b/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> deleted file mode 100644
> index 0561ed7d32..0000000000
> ---
> a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Sun, 19 Feb 2017 23:32:46 -0800
> -Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
> -
> -Fixed when compile with "-Wformat -Wformat-security
> -Werror=format-security":
> -| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function
> 'cr_statement_dump_charset':
> -| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format
> not a string literal and no format arguments [-Werror=format-security]
> -|                  fprintf (a_fp, str) ;
> -
> -And:
> -gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu'
> expects argument of type 'long unsigned int', but argument 3 has type
> 'unsigned int' [-Wformat=]
> -       fprintf(stderr, "Error allocating temporary storage for tim sort:
> need %lu bytes", sizeof(SORT_TYPE) * new_size);
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> ----
> - libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/libtextstyle/lib/libcroco/cr-statement.c
> b/libtextstyle/lib/libcroco/cr-statement.c
> -index 617520f..100104b 100644
> ---- a/libtextstyle/lib/libcroco/cr-statement.c
> -+++ b/libtextstyle/lib/libcroco/cr-statement.c
> -@@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this,
> FILE * a_fp, glong a_indent)
> -         g_return_if_fail (a_fp && a_this);
> -         str = cr_statement_ruleset_to_string (a_this, a_indent);
> -         if (str) {
> --                fprintf (a_fp, str);
> -+                fprintf (a_fp, "%s", str);
> -                 g_free (str);
> -                 str = NULL;
> -         }
> -@@ -2658,7 +2658,7 @@ cr_statement_dump_charset (CRStatement * a_this,
> FILE * a_fp, gulong a_indent)
> -         str = cr_statement_charset_to_string (a_this,
> -                                               a_indent) ;
> -         if (str) {
> --                fprintf (a_fp, str) ;
> -+                fprintf (a_fp, "%s", str) ;
> -                 g_free (str) ;
> -                 str = NULL ;
> -         }
> -@@ -2685,7 +2685,7 @@ cr_statement_dump_page (CRStatement * a_this, FILE
> * a_fp, gulong a_indent)
> -
> -         str = cr_statement_at_page_rule_to_string (a_this, a_indent) ;
> -         if (str) {
> --                fprintf (a_fp, str);
> -+                fprintf (a_fp, "%s", str);
> -                 g_free (str) ;
> -                 str = NULL ;
> -         }
> -@@ -2711,7 +2711,7 @@ cr_statement_dump_media_rule (CRStatement * a_this,
> -
> -         str = cr_statement_media_rule_to_string (a_this, a_indent) ;
> -         if (str) {
> --                fprintf (a_fp, str) ;
> -+                fprintf (a_fp, "%s", str) ;
> -                 g_free (str) ;
> -                 str = NULL ;
> -         }
> -@@ -2737,7 +2737,7 @@ cr_statement_dump_import_rule (CRStatement *
> a_this, FILE * a_fp,
> -
> -         str = cr_statement_import_rule_to_string (a_this, a_indent) ;
> -         if (str) {
> --                fprintf (a_fp, str) ;
> -+                fprintf (a_fp, "%s", str) ;
> -                 g_free (str) ;
> -                 str = NULL ;
> -         }
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
> similarity index 100%
> rename from
> meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
> rename to
> meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not-add-C-CXX-parameters.patch
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> similarity index 100%
> rename from
> meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> rename to
> meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
> similarity index 100%
> rename from
> meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaledir.patch
> rename to
> meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.20.1/parallel.patch
> rename to meta/recipes-core/gettext/gettext-0.20.2/parallel.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.20.1/run-ptest
> b/meta/recipes-core/gettext/gettext-0.20.2/run-ptest
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.20.1/run-ptest
> rename to meta/recipes-core/gettext/gettext-0.20.2/run-ptest
> diff --git
> a/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
> similarity index 100%
> rename from
> meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.patch
> rename to
> meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
> similarity index 98%
> rename from meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> rename to meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
> index d3f3fe8e2f..64e680cb89 100644
> --- a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch
> +++ b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch
> @@ -3,26 +3,30 @@ From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 23 Jan 2018 00:54:13 +0000
>  Subject: [PATCH] gettext: beat library detection into shape
>
> -For reasons which I just can't fathom gnulib doesn't use the expected
> tools to
> -find libraries but badly reinvents the wheel.  This will trivially lead
> to host
> +For reasons which I just can't fathom gnulib doesn't use the expected
> +tools to
> +find libraries but badly reinvents the wheel.  This will trivially lead
> +to host
>  contamination (explicit searches of /usr/lib) or incorrect RPATHs (bad
>  canonicalisation resulting in relative paths).
>
> -Simply delete all the crazy, and replace with a single call to pkg-config.
> +Simply delete all the crazy, and replace with a single call to
> +pkg-config.
>
> -Upstream-Status: Inappropriate [upstream still refuse to consider
> pkg-config]
> +Upstream-Status: Inappropriate [upstream still refuse to consider
> +pkg-config]
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>
>  ---
>   gettext-tools/gnulib-m4/libxml.m4             |  99 +----------------
>   .../gnulib-local/lib/term-styled-ostream.oo.c |  12 +-
> - libtextstyle/gnulib-local/m4/libcroco.m4      |  99 +++--------------
> + libtextstyle/gnulib-local/m4/libcroco.m4      | 101 +++--------------
>   libtextstyle/gnulib-local/m4/libglib.m4       | 104 +++---------------
>   libtextstyle/gnulib-m4/libcroco.m4            |  99 +++--------------
>   libtextstyle/gnulib-m4/libglib.m4             | 104 +++---------------
>   libtextstyle/lib/term-styled-ostream.c        |  12 +-
>   libtextstyle/lib/term-styled-ostream.oo.c     |  12 +-
> - 8 files changed, 87 insertions(+), 454 deletions(-)
> + 8 files changed, 87 insertions(+), 456 deletions(-)
>
>  diff --git a/gettext-tools/gnulib-m4/libxml.m4
> b/gettext-tools/gnulib-m4/libxml.m4
>  index 05b9550..031ee65 100644
> @@ -168,10 +172,10 @@ index 2cfd4a8..d42c8b4 100644
>   #include "term-ostream.h"
>   #include "hash.h"
>  diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4
> b/libtextstyle/gnulib-local/m4/libcroco.m4
> -index bc53cc6..10b2455 100644
> +index bc53cc6..b3580ff 100644
>  --- a/libtextstyle/gnulib-local/m4/libcroco.m4
>  +++ b/libtextstyle/gnulib-local/m4/libcroco.m4
> -@@ -1,99 +1,34 @@
> +@@ -1,100 +1,33 @@
>  -# libcroco.m4 serial 3
>  -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
>  +# libcroco.m4 serial 2 (gettext-0.17)
> @@ -215,7 +219,7 @@ index bc53cc6..10b2455 100644
>     gl_cv_libcroco_use_included="$gl_cv_libcroco_force_included"
>     LIBCROCO=
>     LTLIBCROCO=
> -   INCCROCO=
> +-  INCCROCO=
>  -  ifelse([$1], [yes], , [
>  -    if test "$gl_cv_libcroco_use_included" != yes; then
>  -      dnl Figure out whether we can use a preinstalled libcroco-0.6, or
> have to
> @@ -279,21 +283,22 @@ index bc53cc6..10b2455 100644
>  -      fi
>  -    fi
>  -  ])
> +-  AC_SUBST([LIBCROCO])
>  +  if test "$gl_cv_libcroco_use_included" != yes; then
>  +    PKG_CHECK_MODULES([CROCO], [libcroco-0.6])
>  +    LIBCROCO=$CROCO_LIBS
>  +    LTLIBCROCO=$CROCO_LIBS
>  +    INCCROCO=$CROCO_CFLAGS
>  +  fi
> -   AC_SUBST([LIBCROCO])
>     AC_SUBST([LTLIBCROCO])
>     AC_SUBST([INCCROCO])
> +   AC_MSG_CHECKING([whether to use the included libcroco])
>  diff --git a/libtextstyle/gnulib-local/m4/libglib.m4
> b/libtextstyle/gnulib-local/m4/libglib.m4
> -index bef6fa3..8841755 100644
> +index 5853772..b360bdf 100644
>  --- a/libtextstyle/gnulib-local/m4/libglib.m4
>  +++ b/libtextstyle/gnulib-local/m4/libglib.m4
>  @@ -1,105 +1,31 @@
> --# libglib.m4 serial 4
> +-# libglib.m4 serial 5
>  -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
>  +# libglib.m4 serial 3 (gettext-0.17)
>  +dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
> @@ -535,11 +540,11 @@ index bc53cc6..10b2455 100644
>     AC_SUBST([LTLIBCROCO])
>     AC_SUBST([INCCROCO])
>  diff --git a/libtextstyle/gnulib-m4/libglib.m4
> b/libtextstyle/gnulib-m4/libglib.m4
> -index bef6fa3..8841755 100644
> +index 5853772..b360bdf 100644
>  --- a/libtextstyle/gnulib-m4/libglib.m4
>  +++ b/libtextstyle/gnulib-m4/libglib.m4
>  @@ -1,105 +1,31 @@
> --# libglib.m4 serial 4
> +-# libglib.m4 serial 5
>  -dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.
>  +# libglib.m4 serial 3 (gettext-0.17)
>  +dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, Inc.
> @@ -711,3 +716,6 @@ index 2cfd4a8..d42c8b4 100644
>
>   #include "term-ostream.h"
>   #include "hash.h"
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb
> b/meta/recipes-core/gettext/gettext_0.20.2.bb
> similarity index 96%
> rename from meta/recipes-core/gettext/gettext_0.20.1.bb
> rename to meta/recipes-core/gettext/gettext_0.20.2.bb
> index 85493e7595..85c50d43e2 100644
> --- a/meta/recipes-core/gettext/gettext_0.20.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.20.2.bb
> @@ -19,16 +19,14 @@ RCONFLICTS_${PN} = "proxy-libintl"
>  SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>             file://parallel.patch \
>             file://add-with-bisonlocaledir.patch \
> -           file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
>             file://use-pkgconfig.patch \
>             file://run-ptest \
>             file://serial-tests-config.patch \
> -
>  file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
>             "
> -SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
> -SRC_URI[sha256sum] =
> "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
> +SRC_URI[md5sum] = "30fec34a895fab4c02584449c500aac2"
> +SRC_URI[sha256sum] =
> "ecb9d0908ca41d5ca5fef974323b3bba6bec19eebba0b44f396de98cfcc089f1"
>
>  inherit autotools texinfo pkgconfig ptest
>
> --
> 2.17.1
>
>
>
> 
>

--000000000000801cc705a6253e78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Files supplied by gettext-minimal-native should be re=
freshed as well (and that recipe bumped to the new version). You can simply=
 copy them from the full 0.20.2 installation.</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, 21 May 2020 at 03:29, Wang Mingyu &lt;<a href=3D"mailto:w=
angmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">rename gettext-0.20.1 to gettext=
-0.20.2<br>
<br>
0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch<br>
cr-statement.c-timsort.h-fix-formatting-issues.patch<br>
removed since they are included in 0.20.2<br>
<br>
refresh use-pkgconfig.patch<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...aviour-of-for-msgfmt-on-PO-files-wit.patch | 87 -----------------=
--<br>
=C2=A0...nt.c-timsort.h-fix-formatting-issues.patch | 71 ---------------<b=
r>
=C2=A0...t-env.in-do-not-add-C-CXX-parameters.patch |=C2=A0 0<br>
=C2=A0...01-tests-autopoint-3-unset-MAKEFLAGS.patch |=C2=A0 0<br>
=C2=A0.../add-with-bisonlocaledir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../parallel.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br=
>
=C2=A0.../serial-tests-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../use-pkgconfig.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 +++++---<br>
=C2=A0.../{<a href=3D"http://gettext_0.20.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gettext_0.20.1.bb</a> =3D&gt; <a href=3D"http://gettext_0.20.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.20.2.bb</a>}=C2=A0 |=C2=
=
=A0 6 +-<br>
=C2=A010 files changed, 24 insertions(+), 176 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-msg=
merge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/cr-state=
ment.c-timsort.h-fix-formatting-issues.patch<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/add-with-bisonlocaledir.patch (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/parallel.patch (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/run-ptest (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/serial-tests-config.patch (100%)<br>
=C2=A0rename meta/recipes-core/gettext/{gettext-0.20.1 =3D&gt; gettext-0.2=
0.2}/use-pkgconfig.patch (98%)<br>
=C2=A0rename meta/recipes-core/gettext/{<a href=3D"http://gettext_0.20.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a> =3D&gt; <a hr=
ef=3D"http://gettext_0.20.2.bb" rel=3D"noreferrer" target=3D"_blank">gettex=
t_0.20.2.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-be=
haviour-of-for-msgfmt-on-PO-files-wit.patch b/meta/recipes-core/gettext/get=
text-0.20.1/0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch=
<br>
deleted file mode 100644<br>
index 2245889386..0000000000<br>
--- a/meta/recipes-core/gettext/gettext-0.20.1/0001-msgmerge-Fix-behaviour=
-of-for-msgfmt-on-PO-files-wit.patch<br>
+++ /dev/null<br>
@@ -1,87 +0,0 @@<br>
-From 75e315fdec82d1a17ebcd9e0712d109323578d68 Mon Sep 17 00:00:00 2001<br=
>
-From: Bruno Haible &lt;<a href=3D"mailto:bruno@clisp.org" target=3D"_blan=
k">bruno@clisp.org</a>&gt;<br>
-Date: Sun, 19 May 2019 11:10:06 +0200<br>
-Subject: [PATCH] msgmerge: Fix behaviour of --for-msgfmt on PO files with=
 no<br>
- translations.<br>
-<br>
-msgmerge: Fix behaviour of --for-msgfmt on PO files with no translations.=
<br>
-<br>
-Reported by Don Lawrence &lt;<a href=3D"mailto:dlawrence@iecok.com" targe=
t=3D"_blank">dlawrence@iecok.com</a>&gt;<br>
-in &lt;<a href=3D"https://lists.freedesktop.org/archives/p11-glue/2019-Ma=
y/000700.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskt=
op.org/archives/p11-glue/2019-May/000700.html</a>&gt;<br>
-via Daiki Ueno<br>
-in &lt;<a href=3D"https://lists.gnu.org/archive/html/bug-gettext/2019-05/=
msg00124.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/a=
rchive/html/bug-gettext/2019-05/msg00124.html</a>&gt;.<br>
-<br>
-* gettext-tools/src/msgmerge.c (main): Treat force_po like true if for_ms=
gfmt<br>
-is true.<br>
-* gettext-tools/tests/msgmerge-26: Add test of PO file with no translatio=
ns.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/gitweb=
/?p=3Dgettext.git;a=3Dcommitdiff;h=3D2336451ed68d91ff4b5ae1acbc1eca30e47a86=
a9" rel=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/gitwe=
b/?p=3Dgettext.git;a=3Dcommitdiff;h=3D2336451ed68d91ff4b5ae1acbc1eca30e47a8=
6a9</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- gettext-tools/src/msgmerge.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- gettext-tools/tests/msgmerge-26 | 36 ++++++++++++++++++++++++++++++---<b=
r>
- 2 files changed, 35 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/gettext-tools/src/msgmerge.c b/gettext-tools/src/msgmerge.c<=
br>
-index cd762c0..92c9b7a 100644<br>
---- a/gettext-tools/src/msgmerge.c<br>
-+++ b/gettext-tools/src/msgmerge.c<br>
-@@ -520,8 +520,8 @@ There is NO WARRANTY, to the extent permitted by law.=
\n\<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write the merged message list out.=C2=A0 */=
<br>
--=C2=A0 =C2=A0 =C2=A0 msgdomain_list_print (result, output_file, output_s=
yntax, force_po,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 false);<br>
-+=C2=A0 =C2=A0 =C2=A0 msgdomain_list_print (result, output_file, output_s=
yntax,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for_msgfmt || force_po, false);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0exit (EXIT_SUCCESS);<br>
-diff --git a/gettext-tools/tests/msgmerge-26 b/gettext-tools/tests/msgmer=
ge-26<br>
-index cd3862e..b86f7a0 100755<br>
---- a/gettext-tools/tests/msgmerge-26<br>
-+++ b/gettext-tools/tests/msgmerge-26<br>
-@@ -73,7 +73,37 @@ msgstr &quot;Papaya&quot;<br>
- EOF<br>
- <br>
- : ${DIFF=3Ddiff}<br>
--${DIFF} mm-test26.ok mm-test26.out<br>
--result=3D$?<br>
-+${DIFF} mm-test26.ok mm-test26.out || Exit 1<br>
- <br>
--exit $result<br>
-+# Test with a PO file that has no translated messages.<br>
-+<br>
-+cat &lt;&lt;\EOF &gt; mm-test26a.in1<br>
-+msgid &quot;&quot;<br>
-+msgstr &quot;&quot;<br>
-+&quot;Content-Type: text/plain; charset=3DUTF-8\n&quot;<br>
-+<br>
-+msgid &quot;Hello world&quot;<br>
-+msgstr &quot;Hallo Welt&quot;<br>
-+EOF<br>
-+<br>
-+cat &lt;&lt;\EOF &gt; mm-test26a.in2<br>
-+msgid &quot;&quot;<br>
-+msgstr &quot;&quot;<br>
-+&quot;Content-Type: text/plain; charset=3DASCII\n&quot;<br>
-+<br>
-+msgid &quot;Hello, world!&quot;<br>
-+msgstr &quot;&quot;<br>
-+EOF<br>
-+<br>
-+: ${MSGMERGE=3Dmsgmerge}<br>
-+${MSGMERGE} --for-msgfmt -o mm-test26a.tmp mm-test26a.in1 mm-test26a.in2=
 \<br>
-+=C2=A0 =C2=A0 || Exit 1<br>
-+LC_ALL=3DC tr -d &#39;\r&#39; &lt; mm-test26a.tmp &gt; mm-test26a.out ||=
 Exit 1<br>
-+<br>
-+cat &lt;&lt;\EOF &gt; mm-test26a.ok<br>
-+msgid &quot;&quot;<br>
-+msgstr &quot;Content-Type: text/plain; charset=3DUTF-8\n&quot;<br>
-+EOF<br>
-+<br>
-+: ${DIFF=3Ddiff}<br>
-+${DIFF} mm-test26a.ok mm-test26a.out || Exit 1<br>
--- <br>
-2.24.1<br>
-<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timso=
rt.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-0.20.1=
/cr-statement.c-timsort.h-fix-formatting-issues.patch<br>
deleted file mode 100644<br>
index 0561ed7d32..0000000000<br>
--- a/meta/recipes-core/gettext/gettext-0.20.1/cr-statement.c-timsort.h-fi=
x-formatting-issues.patch<br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-From f6245ef5530fc37a6243e798df34162fbbeab6f0 Mon Sep 17 00:00:00 2001<br=
>
-From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=
=
=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-Date: Sun, 19 Feb 2017 23:32:46 -0800<br>
-Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues<br>
-<br>
-Fixed when compile with &quot;-Wformat -Wformat-security -Werror=3Dformat=
-security&quot;:<br>
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function &#39;cr_s=
tatement_dump_charset&#39;:<br>
-| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format=
 not a string literal and no format arguments [-Werror=3Dformat-security]<b=
r>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (=
a_fp, str) ;<br>
-<br>
-And:<br>
-gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format &#39;%l=
u&#39; expects argument of type &#39;long unsigned int&#39;, but argument 3=
 has type &#39;unsigned int&#39; [-Wformat=3D]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Error allocating tempora=
ry storage for tim sort: need %lu bytes&quot;, sizeof(SORT_TYPE) * new_size=
);<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.co=
m" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-<br>
----<br>
- libtextstyle/lib/libcroco/cr-statement.c | 10 +++++-----<br>
- 1 file changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/libtextstyle/lib/libcroco/cr-statement.c b/libtextstyle/lib/=
libcroco/cr-statement.c<br>
-index 617520f..100104b 100644<br>
---- a/libtextstyle/lib/libcroco/cr-statement.c<br>
-+++ b/libtextstyle/lib/libcroco/cr-statement.c<br>
-@@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this, FI=
LE * a_fp, glong a_indent)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_return_if_fail (a_fp &amp;&amp; a_thi=
s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_ruleset_to_string =
(a_this, a_indent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, s=
tr);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, &=
quot;%s&quot;, str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (str=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D NUL=
L;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2658,7 +2658,7 @@ cr_statement_dump_charset (CRStatement * a_this, FI=
LE * a_fp, gulong a_indent)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_charset_to_string =
(a_this,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0a_indent) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, s=
tr) ;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, &=
quot;%s&quot;, str) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (str=
) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D NUL=
L ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2685,7 +2685,7 @@ cr_statement_dump_page (CRStatement * a_this, FILE =
* a_fp, gulong a_indent)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_at_page_rule_to_st=
ring (a_this, a_indent) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, s=
tr);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, &=
quot;%s&quot;, str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (str=
) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D NUL=
L ; <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2711,7 +2711,7 @@ cr_statement_dump_media_rule (CRStatement * a_this,=
<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_media_rule_to_stri=
ng (a_this, a_indent) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, s=
tr) ;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, &=
quot;%s&quot;, str) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (str=
) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D NUL=
L ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2737,7 +2737,7 @@ cr_statement_dump_import_rule (CRStatement * a_this=
, FILE * a_fp,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D cr_statement_import_rule_to_str=
ing (a_this, a_indent) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, s=
tr) ;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (a_fp, &=
quot;%s&quot;, str) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (str=
) ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D NUL=
L ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-=
not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.20.2/0=
001-init-env.in-do-not-add-C-CXX-parameters.patch<br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-n=
ot-add-C-CXX-parameters.patch<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-init-env.in-do-not=
-add-C-CXX-parameters.patch<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint=
-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.20.2/0001-te=
sts-autopoint-3-unset-MAKEFLAGS.patch<br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-=
3-unset-MAKEFLAGS.patch<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/0001-tests-autopoint-3-=
unset-MAKEFLAGS.patch<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocale=
dir.patch b/meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledi=
r.patch<br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/add-with-bisonlocaled=
ir.patch<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/add-with-bisonlocaledir=
.patch<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/parallel.patch b/met=
a/recipes-core/gettext/gettext-0.20.2/parallel.patch<br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/parallel.patch<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/parallel.patch<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/run-ptest b/meta/rec=
ipes-core/gettext/gettext-0.20.2/run-ptest<br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/run-ptest<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/run-ptest<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.=
patch b/meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.patch<=
br>
similarity index 100%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/serial-tests-config.p=
atch<br>
rename to meta/recipes-core/gettext/gettext-0.20.2/serial-tests-config.pat=
ch<br>
diff --git a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch =
b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch<br>
similarity index 98%<br>
rename from meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch<b=
r>
rename to meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch<br>
index d3f3fe8e2f..64e680cb89 100644<br>
--- a/meta/recipes-core/gettext/gettext-0.20.1/use-pkgconfig.patch<br>
+++ b/meta/recipes-core/gettext/gettext-0.20.2/use-pkgconfig.patch<br>
@@ -3,26 +3,30 @@ From: Ross Burton &lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
=C2=A0Date: Tue, 23 Jan 2018 00:54:13 +0000<br>
=C2=A0Subject: [PATCH] gettext: beat library detection into shape<br>
<br>
-For reasons which I just can&#39;t fathom gnulib doesn&#39;t use the expe=
cted tools to<br>
-find libraries but badly reinvents the wheel.=C2=A0 This will trivially l=
ead to host<br>
+For reasons which I just can&#39;t fathom gnulib doesn&#39;t use the expe=
cted<br>
+tools to<br>
+find libraries but badly reinvents the wheel.=C2=A0 This will trivially l=
ead<br>
+to host<br>
=C2=A0contamination (explicit searches of /usr/lib) or incorrect RPATHs (b=
ad<br>
=C2=A0canonicalisation resulting in relative paths).<br>
<br>
-Simply delete all the crazy, and replace with a single call to pkg-config=
.<br>
+Simply delete all the crazy, and replace with a single call to<br>
+pkg-config.<br>
<br>
-Upstream-Status: Inappropriate [upstream still refuse to consider pkg-con=
fig]<br>
+Upstream-Status: Inappropriate [upstream still refuse to consider<br>
+pkg-config]<br>
=C2=A0Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
<br>
=C2=A0---<br>
=C2=A0 gettext-tools/gnulib-m4/libxml.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 99 +----------------<br>
=C2=A0 .../gnulib-local/lib/term-styled-ostream.oo.c |=C2=A0 12 +-<br>
- libtextstyle/gnulib-local/m4/libcroco.m4=C2=A0 =C2=A0 =C2=A0 |=C2=A0 99 =
+++--------------<br>
+ libtextstyle/gnulib-local/m4/libcroco.m4=C2=A0 =C2=A0 =C2=A0 | 101 +++--=
------------<br>
=C2=A0 libtextstyle/gnulib-local/m4/libglib.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 104 +++---------------<br>
=C2=A0 libtextstyle/gnulib-m4/libcroco.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 99 +++--------------<br>
=C2=A0 libtextstyle/gnulib-m4/libglib.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 104 +++---------------<br>
=C2=A0 libtextstyle/lib/term-styled-ostream.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=
=C2=A0 12 +-<br>
=C2=A0 libtextstyle/lib/term-styled-ostream.oo.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 12 +-<br>
- 8 files changed, 87 insertions(+), 454 deletions(-)<br>
+ 8 files changed, 87 insertions(+), 456 deletions(-)<br>
<br>
=C2=A0diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnuli=
b-m4/libxml.m4<br>
=C2=A0index 05b9550..031ee65 100644<br>
@@ -168,10 +172,10 @@ index 2cfd4a8..d42c8b4 100644<br>
=C2=A0 #include &quot;term-ostream.h&quot;<br>
=C2=A0 #include &quot;hash.h&quot;<br>
=C2=A0diff --git a/libtextstyle/gnulib-local/m4/libcroco.m4 b/libtextstyle=
/gnulib-local/m4/libcroco.m4<br>
-index bc53cc6..10b2455 100644<br>
+index bc53cc6..b3580ff 100644<br>
=C2=A0--- a/libtextstyle/gnulib-local/m4/libcroco.m4<br>
=C2=A0+++ b/libtextstyle/gnulib-local/m4/libcroco.m4<br>
-@@ -1,99 +1,34 @@<br>
+@@ -1,100 +1,33 @@<br>
=C2=A0-# libcroco.m4 serial 3<br>
=C2=A0-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br=
>
=C2=A0+# libcroco.m4 serial 2 (gettext-0.17)<br>
@@ -215,7 +219,7 @@ index bc53cc6..10b2455 100644<br>
=C2=A0 =C2=A0 gl_cv_libcroco_use_included=3D&quot;$gl_cv_libcroco_force_in=
cluded&quot;<br>
=C2=A0 =C2=A0 LIBCROCO=3D<br>
=C2=A0 =C2=A0 LTLIBCROCO=3D<br>
-=C2=A0 =C2=A0INCCROCO=3D<br>
+-=C2=A0 INCCROCO=3D<br>
=C2=A0-=C2=A0 ifelse([$1], [yes], , [<br>
=C2=A0-=C2=A0 =C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D=
 yes; then<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 dnl Figure out whether we can use a preinstall=
ed libcroco-0.6, or have to<br>
@@ -279,21 +283,22 @@ index bc53cc6..10b2455 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0-=C2=A0 =C2=A0 fi<br>
=C2=A0-=C2=A0 ])<br>
+-=C2=A0 AC_SUBST([LIBCROCO])<br>
=C2=A0+=C2=A0 if test &quot;$gl_cv_libcroco_use_included&quot; !=3D yes; t=
hen<br>
=C2=A0+=C2=A0 =C2=A0 PKG_CHECK_MODULES([CROCO], [libcroco-0.6])<br>
=C2=A0+=C2=A0 =C2=A0 LIBCROCO=3D$CROCO_LIBS<br>
=C2=A0+=C2=A0 =C2=A0 LTLIBCROCO=3D$CROCO_LIBS<br>
=C2=A0+=C2=A0 =C2=A0 INCCROCO=3D$CROCO_CFLAGS<br>
=C2=A0+=C2=A0 fi<br>
-=C2=A0 =C2=A0AC_SUBST([LIBCROCO])<br>
=C2=A0 =C2=A0 AC_SUBST([LTLIBCROCO])<br>
=C2=A0 =C2=A0 AC_SUBST([INCCROCO])<br>
+=C2=A0 =C2=A0AC_MSG_CHECKING([whether to use the included libcroco])<br>
=C2=A0diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/=
gnulib-local/m4/libglib.m4<br>
-index bef6fa3..8841755 100644<br>
+index 5853772..b360bdf 100644<br>
=C2=A0--- a/libtextstyle/gnulib-local/m4/libglib.m4<br>
=C2=A0+++ b/libtextstyle/gnulib-local/m4/libglib.m4<br>
=C2=A0@@ -1,105 +1,31 @@<br>
--# libglib.m4 serial 4<br>
+-# libglib.m4 serial 5<br>
=C2=A0-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br=
>
=C2=A0+# libglib.m4 serial 3 (gettext-0.17)<br>
=C2=A0+dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, In=
c.<br>
@@ -535,11 +540,11 @@ index bc53cc6..10b2455 100644<br>
=C2=A0 =C2=A0 AC_SUBST([LTLIBCROCO])<br>
=C2=A0 =C2=A0 AC_SUBST([INCCROCO])<br>
=C2=A0diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib=
-m4/libglib.m4<br>
-index bef6fa3..8841755 100644<br>
+index 5853772..b360bdf 100644<br>
=C2=A0--- a/libtextstyle/gnulib-m4/libglib.m4<br>
=C2=A0+++ b/libtextstyle/gnulib-m4/libglib.m4<br>
=C2=A0@@ -1,105 +1,31 @@<br>
--# libglib.m4 serial 4<br>
+-# libglib.m4 serial 5<br>
=C2=A0-dnl Copyright (C) 2006-2007, 2019 Free Software Foundation, Inc.<br=
>
=C2=A0+# libglib.m4 serial 3 (gettext-0.17)<br>
=C2=A0+dnl Copyright (C) 2006-2007, 2015-2016 Free Software Foundation, In=
c.<br>
@@ -711,3 +716,6 @@ index 2cfd4a8..d42c8b4 100644<br>
<br>
=C2=A0 #include &quot;term-ostream.h&quot;<br>
=C2=A0 #include &quot;hash.h&quot;<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a> b/meta/recipes=
-core/gettext/<a href=3D"http://gettext_0.20.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gettext_0.20.2.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a><br>
rename to meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gettext_0.20.2.bb</a><br>
index 85493e7595..85c50d43e2 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.20.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.20.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.20.2.bb</a><br>
@@ -19,16 +19,14 @@ RCONFLICTS_${PN} =3D &quot;proxy-libintl&quot;<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://parallel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-with-bisonlocaledir.p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cr-statement.c-timsort.h-=
fix-formatting-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-pkgconfig.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://serial-tests-config.patch=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-msgmerge-Fix-behavio=
ur-of-for-msgfmt-on-PO-files-wit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-autopoint-3-un=
set-MAKEFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-init-env.in-do-not-a=
dd-C-CXX-parameters.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;bb5b0c0caa028105f3ca1905ddc306e2&quot;<br>
-SRC_URI[sha256sum] =3D &quot;66415634c6e8c3fa8b71362879ec7575e27da43da562=
c798a8a2f223e6e47f5c&quot;<br>
+SRC_URI[md5sum] =3D &quot;30fec34a895fab4c02584449c500aac2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ecb9d0908ca41d5ca5fef974323b3bba6bec19eebba0=
b44f396de98cfcc089f1&quot;<br>
<br>
=C2=A0inherit autotools texinfo pkgconfig ptest<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000801cc705a6253e78--
