Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6608CC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 00:07:14 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2028.1647648433331452899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AeUhokNR;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id hu12so7588489qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhFTJWOd2AN2hJTlbw35gcZxcbgM/tc8nIlYICqXYqU=;
        b=AeUhokNRHezAc2tmNtubScj3/IljlBhk7tUyOqejXwZzvTzfgKzZ2zqqZjW9jk0rfe
         raZk/QklpNL+8rFofoUS6Pi1sDQnqd38DKXQ7sKaWaattxpY2OrNNTXAYGQ4K91F2yEi
         wCsZGjr4qPx0KQT6+SDq6pbw/N9ICvZHI9clV3TyD7BQQ2dIdPn4p8a6ndHtJq+p1dyD
         s1heDmbSuEOXGbvk/+k1NHNxNa9pV5hlavv3N6jFZV8nbnK6Et8HjSjKFCmOQg603dCh
         JhDKmWMrxTBB7SxeDoVjmY3QRdf7Dh4Xtp1D09qweSe5NS9/1IJMNor/TUZ5Aq+qSUGN
         ccqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhFTJWOd2AN2hJTlbw35gcZxcbgM/tc8nIlYICqXYqU=;
        b=4pVA94Dc4vCTHYtp/4G+Rv1GvuLspsHlA3mjKgRYR85ZlYqqm4F1ptpyyQUtVeNMBv
         JYpwnpOEDBB/Foun9Pe5n93Y6FVKSCpoLErTs1raIHsDqZGlWuMuyJX/16wzZFhqEXeL
         UdCiEv7LDc52vwjNJv20fOB5xbh47BuRrElTl/AT9g1LZDiXlGn29JkPv1pdmmeWot4N
         dOZWXmkL6JsVzKLc1gSeDap16ml38Yd9pD96cMvXazNZHQ7TLHvwfw6OeHnuyg2HVaF8
         JjkZH2fPxLFq/gPwvZBi/ICSUbniiFczNW88d8ueSSnhfEQdYg8QZ806KI1QoEoEdT95
         RkJQ==
X-Gm-Message-State: AOAM530Gn8I7sdvRzSTRPfEW30HPbAmXfCoLcw8iYPEmzLsamSezD0Na
	uzuKSHmsR5mjVVtLhays91oBD4XslCKLaueg3ZOIhrtckuzOEw==
X-Google-Smtp-Source: 
 ABdhPJzIRuS41+Fn73PaFmulA/F+CMWsNfgQGQKXv2Kam6MOune9yMrWATlDFrupjpmpxjyybbp/CYJoibTTS7AUT0s=
X-Received: by 2002:a05:6214:4017:b0:441:35e:fcbd with SMTP id
 kd23-20020a056214401700b00441035efcbdmr3129780qvb.110.1647648431448; Fri, 18
 Mar 2022 17:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Mar 2022 17:06:43 -0700
Message-ID: 
 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtool: Upgrade 2.4.6 -> 2.4.7
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 00:07:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163454

seeing these 3 failures with new libtool in meta-oe

https://errors.yoctoproject.org/Errors/Build/142979/

On Thu, Mar 17, 2022 at 11:00 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Libtool made a release after many years. Update to it, allowing us to drop two
> backported patches. We also drop a performance optimistion patch since it is
> too invasive to maintain separately.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{libtool-2.4.6.inc => libtool-2.4.7.inc}  |   6 +-
>  ...-cross_2.4.6.bb => libtool-cross_2.4.7.bb} |   0
>  ...ative_2.4.6.bb => libtool-native_2.4.7.bb} |   0
>  ...-trailing-slashes-on-install-command.patch |  10 +-
>  ...in.in-Parse-additional-clang-options.patch |  34 ++--
>  ...e-the-with-sysroot-option-to-avoid-c.patch | 122 +++---------
>  ...-Add-missing-sysroot-to-library-path.patch |   9 +-
>  ...sroot-paths-being-encoded-into-RPATH.patch |  21 +-
>  ...encode-RATHS-which-match-default-lin.patch |  19 +-
>  ...ool.m4-Handle-as-a-sysroot-correctly.patch |  17 +-
>  ...tool-Fix-support-for-NIOS2-processor.patch |  11 +-
>  ...r-static-libs-for-internal-compiler-.patch |   8 +-
>  ...-sure-autoheader-run-before-autoconf.patch |   7 +-
>  ...-sure-autoheader-run-before-automake.patch |   6 +-
>  ...-prefix-map-compiler-options-correct.patch |  25 ++-
>  ...eproducibility-stop-encoding-hostnam.patch |  15 +-
>  ...AGS-use-cr-instead-of-cru-by-default.patch | 133 -------------
>  .../libool.m4-add-ARFLAGS-variable.patch      |  77 --------
>  .../libtool/libtool/unwind-opt-parsing.patch  | 179 ------------------
>  .../{libtool_2.4.6.bb => libtool_2.4.7.bb}    |   0
>  ...ol_2.4.6.bb => nativesdk-libtool_2.4.7.bb} |   0
>  21 files changed, 130 insertions(+), 569 deletions(-)
>  rename meta/recipes-devtools/libtool/{libtool-2.4.6.inc => libtool-2.4.7.inc} (87%)
>  rename meta/recipes-devtools/libtool/{libtool-cross_2.4.6.bb => libtool-cross_2.4.7.bb} (100%)
>  rename meta/recipes-devtools/libtool/{libtool-native_2.4.6.bb => libtool-native_2.4.7.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch
>  rename meta/recipes-devtools/libtool/{libtool_2.4.6.bb => libtool_2.4.7.bb} (100%)
>  rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.6.bb => nativesdk-libtool_2.4.7.bb} (100%)
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.7.inc
> similarity index 87%
> rename from meta/recipes-devtools/libtool/libtool-2.4.6.inc
> rename to meta/recipes-devtools/libtool/libtool-2.4.7.inc
> index ad6f5e6b6eb..a07df720acf 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.7.inc
> @@ -17,20 +17,16 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://dont-depend-on-help2man.patch \
>             file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
>             file://nohardcodepaths.patch \
> -           file://unwind-opt-parsing.patch \
>             file://0007-libtool-Fix-support-for-NIOS2-processor.patch \
>             file://0008-libtool-Check-for-static-libs-for-internal-compiler-.patch \
>             file://0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
>             file://0010-Makefile.am-make-sure-autoheader-run-before-automake.patch \
>             file://0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch \
>             file://0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch \
> -           file://libool.m4-add-ARFLAGS-variable.patch \
> -           file://ARFLAGS-use-cr-instead-of-cru-by-default.patch \
>             file://0001-ltmain.in-Parse-additional-clang-options.patch \
>            "
>
> -SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
> -SRC_URI[sha256sum] = "e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3"
> +SRC_URI[sha256sum] = "04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8"
>
>  do_compile:prepend () {
>         # Sometimes this file doesn't get rebuilt, force the issue
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> rename to meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> rename to meta/recipes-devtools/libtool/libtool-native_2.4.7.bb
> diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
> index eeb5ebf4161..2c5d4cfbf05 100644
> --- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
> @@ -14,10 +14,15 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00010.html]
>
> +---
> + build-aux/ltmain.in | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
>  diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> +index 96b37003..3d5dcd0a 100644
>  --- a/build-aux/ltmain.in
>  +++ b/build-aux/ltmain.in
> -@@ -2356,8 +2356,14 @@ func_mode_install ()
> +@@ -2378,8 +2378,14 @@ func_mode_install ()
>         func_append dir "$objdir"
>
>         if test -n "$relink_command"; then
> @@ -33,3 +38,6 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
>
>           # Don't allow the user to place us outside of our expected
>           # location b/c this prevents finding dependent libraries that
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
> index d59b5a834eb..cf8331fd461 100644
> --- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
> @@ -1,6 +1,4 @@
> -From c3b90d6107a1b638477d5f4dcee48af289647af7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Mar 2022 12:52:51 -0800
>  Subject: [PATCH] ltmain.in: Parse additional clang options
>
>  clang uses -rtlib and --unwindlib to select proper compiler runtime in
> @@ -13,25 +11,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   build-aux/ltmain.in | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> -diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> -index 6a7bb72..c355c0c 100644
> ---- a/build-aux/ltmain.in
> -+++ b/build-aux/ltmain.in
> -@@ -5423,10 +5423,13 @@ func_mode_link ()
> -       # --sysroot=*          for sysroot support
> -       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
> -       # -stdlib=*            select c++ std lib with clang
> +Index: libtool-2.4.7/build-aux/ltmain.in
> +===================================================================
> +--- libtool-2.4.7.orig/build-aux/ltmain.in
> ++++ libtool-2.4.7/build-aux/ltmain.in
> +@@ -5420,10 +5420,12 @@ func_mode_link ()
> +       # -fsanitize=*         Clang/GCC memory and address sanitizer
> +       # -fuse-ld=*           Linker select flags for GCC
> +       # -f*-prefix-map*      needed for lto linking
>  +      # -rtlib=*             select c runtime lib with clang
>  +      # --unwindlib=*        select unwinder library with clang
> -       # -f*-prefix-map*      needed for lto linking
> +       # -Wa,*                Pass flags directly to the assembler
>         -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
>         -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
> --      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
> -+      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
> -+      -rtlib=*|--unwindlib=*|-f*-prefix-map*)
> -         func_quote_for_eval "$arg"
> -       arg=$func_quote_for_eval_result
> -         func_append compile_command " $arg"
> ---
> -2.35.1
> -
> +-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
> ++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-rtlib=*|--unwindlib=*| \
> +       -specs=*|-fsanitize=*|-fuse-ld=*|-f*-prefix-map*|-Wa,*)
> +         func_quote_arg pretty "$arg"
> +       arg=$func_quote_arg_result
> diff --git a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
> index 6da283959ed..285968ca829 100644
> --- a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
> @@ -8,18 +8,23 @@ and this becomes confusing and conflicting otherwise.
>
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> +Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
> +
>  Upstream report:
>  http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
> +---
> + m4/libtool.m4    | 12 ++++++------
> + tests/sysroot.at |  6 +++---
> + 2 files changed, 9 insertions(+), 9 deletions(-)
>
> -Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
> -
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -1215,28 +1215,28 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
> - # ----------------
> +Index: libtool-2.4.7/m4/libtool.m4
> +===================================================================
> +--- libtool-2.4.7.orig/m4/libtool.m4
> ++++ libtool-2.4.7/m4/libtool.m4
> +@@ -1244,28 +1244,28 @@ _LT_DECL([], [ECHO], [1], [An echo progr
>   AC_DEFUN([_LT_WITH_SYSROOT],
> - [AC_MSG_CHECKING([for sysroot])
> + [m4_require([_LT_DECL_SED])dnl
> + AC_MSG_CHECKING([for sysroot])
>  -AC_ARG_WITH([sysroot],
>  -[AS_HELP_STRING([--with-sysroot@<:@=DIR@:>@],
>  +AC_ARG_WITH([libtool-sysroot],
> @@ -40,8 +45,8 @@ diff --git a/m4/libtool.m4 b/m4/libtool.m4
>      fi
>      ;; #(
>    /*)
> --   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
> -+   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +-   lt_sysroot=`echo "$with_sysroot" | $SED -e "$sed_quote_subst"`
> ++   lt_sysroot=`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_subst"`
>      ;; #(
>    no|'')
>      ;; #(
> @@ -51,10 +56,11 @@ diff --git a/m4/libtool.m4 b/m4/libtool.m4
>      AC_MSG_ERROR([The sysroot must be an absolute path.])
>      ;;
>   esac
> -diff --git a/tests/sysroot.at b/tests/sysroot.at
> ---- a/tests/sysroot.at
> -+++ b/tests/sysroot.at
> -@@ -64,7 +64,7 @@ while read file; do
> +Index: libtool-2.4.7/tests/sysroot.at
> +===================================================================
> +--- libtool-2.4.7.orig/tests/sysroot.at
> ++++ libtool-2.4.7/tests/sysroot.at
> +@@ -65,7 +65,7 @@ while read file; do
>   done])
>
>   LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
> @@ -63,7 +69,7 @@ diff --git a/tests/sysroot.at b/tests/sysroot.at
>
>   #???
>   if test PATH = "$shlibpath_var"; then
> -@@ -114,7 +114,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -115,7 +115,7 @@ AM_INIT_AUTOMAKE([foreign])
>   AC_PROG_CC
>   AC_CONFIG_SRCDIR([lib2.c])
>   LT_INIT
> @@ -72,7 +78,7 @@ diff --git a/tests/sysroot.at b/tests/sysroot.at
>   AC_SUBST([sysroot])
>   AC_OUTPUT(Makefile)
>   ]])
> -@@ -155,7 +155,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -156,7 +156,7 @@ AM_INIT_AUTOMAKE([foreign])
>   AC_PROG_CC
>   AC_CONFIG_SRCDIR([prog.c])
>   LT_INIT
> @@ -81,87 +87,3 @@ diff --git a/tests/sysroot.at b/tests/sysroot.at
>   AC_SUBST([sysroot])
>   AC_OUTPUT(Makefile)
>   ]])
> -diff --git a/tests/testsuite b/tests/testsuite
> ---- a/tests/testsuite
> -+++ b/tests/testsuite
> -@@ -48945,7 +48945,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
> --configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
> -+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
> -
> - #???
> - if test PATH = "$shlibpath_var"; then
> -@@ -49154,7 +49154,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -49342,7 +49342,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -49694,7 +49694,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
> --configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
> -+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
> -
> - #???
> - if test PATH = "$shlibpath_var"; then
> -@@ -49903,7 +49903,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50091,7 +50091,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50443,7 +50443,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
> --configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
> -+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
> -
> - #???
> - if test PATH = "$shlibpath_var"; then
> -@@ -50652,7 +50652,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50840,7 +50840,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=$with_sysroot
> -+sysroot=$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> diff --git a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
> index 0103a004513..41b33d0370e 100644
> --- a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
> @@ -9,11 +9,15 @@ i.e. when lt_sysroot is not set, it will still behave the same and add
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
> +---
> + build-aux/ltmain.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> +index 3d5dcd0a..2c994612 100644
>  --- a/build-aux/ltmain.in
>  +++ b/build-aux/ltmain.in
> -@@ -6421,7 +6421,7 @@ func_mode_link ()
> +@@ -6475,7 +6475,7 @@ func_mode_link ()
>               fi
>             else
>               # We cannot seem to hardcode it, guess we'll fake it.
> @@ -22,3 +26,6 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
>               # Try looking first in the location we're being installed to.
>               if test -n "$inst_prefix_dir"; then
>                 case $libdir in
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
> index 21b3dfe306d..289da3f56dc 100644
> --- a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
> @@ -8,25 +8,29 @@ from libdir when building RPATH values to avoid this.
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00009.html]
> +---
> + build-aux/ltmain.in | 14 ++++++++++++--
> + 1 file changed, 12 insertions(+), 2 deletions(-)
>
>  diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> +index 2c994612..96238350 100644
>  --- a/build-aux/ltmain.in
>  +++ b/build-aux/ltmain.in
> -@@ -7569,9 +7569,11 @@ EOF
> +@@ -7654,9 +7654,11 @@ EOF
>           test relink = "$opt_mode" || rpath=$compile_rpath$rpath
>           for libdir in $rpath; do
>             if test -n "$hardcode_libdir_flag_spec"; then
> -+                func_replace_sysroot "$libdir"
> -+                libdir=$func_replace_sysroot_result
> -+                func_stripname '=' '' "$libdir"
> -+                libdir=$func_stripname_result
> ++            func_replace_sysroot "$libdir"
> ++            libdir=$func_replace_sysroot_result
> ++            func_stripname '=' '' "$libdir"
> ++            libdir=$func_stripname_result
>               if test -n "$hardcode_libdir_separator"; then
>  -              func_replace_sysroot "$libdir"
>  -              libdir=$func_replace_sysroot_result
>                 if test -z "$hardcode_libdirs"; then
>                   hardcode_libdirs=$libdir
>                 else
> -@@ -8301,6 +8303,10 @@ EOF
> +@@ -8386,6 +8388,10 @@ EOF
>         hardcode_libdirs=
>         for libdir in $compile_rpath $finalize_rpath; do
>         if test -n "$hardcode_libdir_flag_spec"; then
> @@ -37,7 +41,7 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
>           if test -n "$hardcode_libdir_separator"; then
>             if test -z "$hardcode_libdirs"; then
>               hardcode_libdirs=$libdir
> -@@ -8352,6 +8358,10 @@ EOF
> +@@ -8437,6 +8443,10 @@ EOF
>         hardcode_libdirs=
>         for libdir in $finalize_rpath; do
>         if test -n "$hardcode_libdir_flag_spec"; then
> @@ -48,3 +52,6 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
>           if test -n "$hardcode_libdir_separator"; then
>             if test -z "$hardcode_libdirs"; then
>               hardcode_libdirs=$libdir
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
> index 50d47d9f7a8..302f41d231a 100644
> --- a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
> @@ -11,11 +11,15 @@ the paths before comparision.
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00013.html]
> +---
> + build-aux/ltmain.in | 34 ++++++++++++++++++++++++++++------
> + 1 file changed, 28 insertions(+), 6 deletions(-)
>
> -diff -u b/build-aux/ltmain.in b/build-aux/ltmain.in
> ---- b/build-aux/ltmain.in
> -+++ b/build-aux/ltmain.in      2012-08-22 11:01:34.191345989 -0700
> -@@ -7286,8 +7286,16 @@
> +diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> +index 96238350..6fb58ed2 100644
> +--- a/build-aux/ltmain.in
> ++++ b/build-aux/ltmain.in
> +@@ -7672,8 +7672,16 @@ EOF
>                   esac
>                 fi
>               else
> @@ -34,7 +38,7 @@ diff -u b/build-aux/ltmain.in b/build-aux/ltmain.in
>               fi
>             elif test -n "$runpath_var"; then
>               case "$perm_rpath " in
> -@@ -8019,8 +8027,16 @@
> +@@ -8406,8 +8414,16 @@ EOF
>               esac
>             fi
>           else
> @@ -53,7 +57,7 @@ diff -u b/build-aux/ltmain.in b/build-aux/ltmain.in
>           fi
>         elif test -n "$runpath_var"; then
>           case "$perm_rpath " in
> -@@ -8070,8 +8086,14 @@
> +@@ -8461,8 +8477,14 @@ EOF
>               esac
>             fi
>           else
> @@ -70,3 +74,6 @@ diff -u b/build-aux/ltmain.in b/build-aux/ltmain.in
>           fi
>         elif test -n "$runpath_var"; then
>           case "$finalize_perm_rpath " in
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
> index 999971241fa..992e6ec9d49 100644
> --- a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
> @@ -14,10 +14,14 @@ http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00018.html]
>
>  ---
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -1225,16 +1225,21 @@ dnl lt_sysroot will always be passed unquoted.  We quote it here
> + m4/libtool.m4 | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +Index: libtool-2.4.7/m4/libtool.m4
> +===================================================================
> +--- libtool-2.4.7.orig/m4/libtool.m4
> ++++ libtool-2.4.7/m4/libtool.m4
> +@@ -1254,16 +1254,20 @@ dnl lt_sysroot will always be passed unq
>   dnl in case the user passed a directory name.
>   lt_sysroot=
>   case $with_libtool_sysroot in #(
> @@ -25,8 +29,7 @@ diff --git a/m4/libtool.m4 b/m4/libtool.m4
>  + no)
>      if test yes = "$GCC"; then
>        lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> -+     # Treat "/" the same a an unset sysroot. It seems to be more
> -+     # compatible across host platforms that way!?
> ++     # Treat "/" the same a an unset sysroot.
>  +     if test "$lt_sysroot" = /; then
>  +       lt_sysroot=
>  +     fi
> @@ -35,7 +38,7 @@ diff --git a/m4/libtool.m4 b/m4/libtool.m4
>  + yes|''|/)
>  +   ;; #(
>    /*)
> -    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    lt_sysroot=`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_subst"`
>      ;; #(
>  - no|'')
>  -   ;; #(
> diff --git a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
> index 395464e9084..105f7f4c59d 100644
> --- a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
> @@ -14,16 +14,15 @@ Signed-off-by: Marek Vasut <marex@denx.de>
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00021.html]
> -
>  ---
>   build-aux/ltmain.in | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
>  diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> -index d5cf07a..4164284 100644
> +index 6fb58ed2..606f17be 100644
>  --- a/build-aux/ltmain.in
>  +++ b/build-aux/ltmain.in
> -@@ -504,6 +504,12 @@ libtool_validate_options ()
> +@@ -519,6 +519,12 @@ libtool_validate_options ()
>       test : = "$debug_cmd" || func_append preserve_args " --debug"
>
>       case $host in
> @@ -36,7 +35,7 @@ index d5cf07a..4164284 100644
>         # Solaris2 added to fix http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16452
>         # see also: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=59788
>         *cygwin* | *mingw* | *pw32* | *cegcc* | *solaris2* | *os2*)
> -@@ -6220,6 +6226,15 @@ func_mode_link ()
> +@@ -6246,6 +6252,15 @@ func_mode_link ()
>         if test -n "$library_names" &&
>            { test no = "$use_static_libs" || test -z "$old_library"; }; then
>           case $host in
> @@ -52,7 +51,7 @@ index d5cf07a..4164284 100644
>           *cygwin* | *mingw* | *cegcc* | *os2*)
>               # No point in relinking DLLs because paths are not encoded
>               func_append notinst_deplibs " $lib"
> -@@ -6290,6 +6305,11 @@ func_mode_link ()
> +@@ -6316,6 +6331,11 @@ func_mode_link ()
>             elif test -n "$soname_spec"; then
>               # bleh windows
>               case $host in
> @@ -65,5 +64,5 @@ index d5cf07a..4164284 100644
>                 func_arith $current - $age
>                 major=$func_arith_result
>  --
> -2.5.1
> +2.25.1
>
> diff --git a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
> index afffdb9fd49..484bb388237 100644
> --- a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
> @@ -1,6 +1,4 @@
> -From b9993338080325a6e2b2ec94ca0ece80e7fa3fb6 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 26 Jan 2019 12:54:26 -0800
>  Subject: [PATCH 08/12] libtool: Check for static libs for internal compiler libraries
>
>  Libtool checks only for libraries linked as -l* when trying to
> @@ -21,10 +19,10 @@ Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/m4/libtool.m4 b/m4/libtool.m4
> -index d0389a0..9619c57 100644
> +index 180dd9d1..022c1292 100644
>  --- a/m4/libtool.m4
>  +++ b/m4/libtool.m4
> -@@ -7536,7 +7536,7 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -7560,7 +7560,7 @@ if AC_TRY_EVAL(ac_compile); then
>     for p in `eval "$output_verbose_link_cmd"`; do
>       case $prev$p in
>
> @@ -34,5 +32,5 @@ index d0389a0..9619c57 100644
>          # Remove the space.
>          if test x-L = "$p" ||
>  --
> -2.20.1
> +2.25.1
>
> diff --git a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
> index 348cd3c1ae8..e3c6a52f98e 100644
> --- a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
> @@ -12,16 +12,15 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00015.html]
> -
>  ---
>   Makefile.am | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 4142c90..fe1a9fc 100644
> +index 6b546092..84795d87 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -365,7 +365,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
> +@@ -370,7 +370,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
>   $(lt_aclocal_m4): $(lt_aclocal_m4_deps)
>         $(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(ACLOCAL) -I ../m4
>
> @@ -31,5 +30,5 @@ index 4142c90..fe1a9fc 100644
>
>   $(lt_config_h_in): $(lt_configure_deps)
>  --
> -2.29.2
> +2.25.1
>
> diff --git a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
> index cd963ef1be8..d7438149b07 100644
> --- a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
> @@ -19,10 +19,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 2752ecc..29950db 100644
> +index 84795d87..8c9949ed 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -328,7 +328,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
> +@@ -333,7 +333,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
>                   $(lt_obsolete_m4) \
>                   $(stamp_mk)
>
> @@ -32,5 +32,5 @@ index 2752ecc..29950db 100644
>
>   # Don't let unused scripts leak into the libltdl Makefile
>  --
> -2.29.2
> +2.25.1
>
> diff --git a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
> index b121a3c7509..bd2c0e4b81b 100644
> --- a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
> @@ -7,20 +7,25 @@ Add these to the list of options libtool passes through.
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html]
> +---
> + build-aux/ltmain.in | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
>
> -Index: libtool-2.4.6/build-aux/ltmain.in
> +Index: libtool-2.4.7/build-aux/ltmain.in
>  ===================================================================
> ---- libtool-2.4.6.orig/build-aux/ltmain.in
> -+++ libtool-2.4.6/build-aux/ltmain.in
> -@@ -5424,9 +5424,10 @@ func_mode_link ()
> -       # --sysroot=*          for sysroot support
> -       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
> +--- libtool-2.4.7.orig/build-aux/ltmain.in
> ++++ libtool-2.4.7/build-aux/ltmain.in
> +@@ -5419,11 +5419,12 @@ func_mode_link ()
>         # -stdlib=*            select c++ std lib with clang
> +       # -fsanitize=*         Clang/GCC memory and address sanitizer
> +       # -fuse-ld=*           Linker select flags for GCC
>  +      # -f*-prefix-map*      needed for lto linking
> +       # -Wa,*                Pass flags directly to the assembler
>         -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
>         -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
> --      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*)
> -+      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
> -         func_quote_for_eval "$arg"
> -       arg=$func_quote_for_eval_result
> +       -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
> +-      -specs=*|-fsanitize=*|-fuse-ld=*|-Wa,*)
> ++      -specs=*|-fsanitize=*|-fuse-ld=*|-f*-prefix-map*|-Wa,*)
> +         func_quote_arg pretty "$arg"
> +       arg=$func_quote_arg_result
>           func_append compile_command " $arg"
> diff --git a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
> index 64f911d46c6..c667dd2c204 100644
> --- a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
> +++ b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
> @@ -11,12 +11,14 @@ https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
>          no_hostname.patch
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00011.html]
> -
>  ---
> -Index: libtool-2.4.6/m4/libtool.m4
> -===================================================================
> ---- libtool-2.4.6.orig/m4/libtool.m4
> -+++ libtool-2.4.6/m4/libtool.m4
> + m4/libtool.m4 | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/m4/libtool.m4 b/m4/libtool.m4
> +index 022c1292..1a8a2998 100644
> +--- a/m4/libtool.m4
> ++++ b/m4/libtool.m4
>  @@ -728,7 +728,6 @@ _LT_CONFIG_SAVE_COMMANDS([
>       cat <<_LT_EOF >> "$cfgfile"
>   #! $SHELL
> @@ -25,3 +27,6 @@ Index: libtool-2.4.6/m4/libtool.m4
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>
>   # Provide generalized library-building support services.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch b/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
> deleted file mode 100644
> index 447640cef63..00000000000
> --- a/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 418129bc63afc312701e84cb8afa5ca413df1ab5 Mon Sep 17 00:00:00 2001
> -From: Pavel Raiskup <praiskup@redhat.com>
> -Date: Fri, 17 Apr 2015 16:54:58 +0200
> -Subject: ARFLAGS: use 'cr' instead of 'cru' by default
> -
> -In some GNU/Linux distributions people started to compile 'ar'
> -binary with --enable-deterministic-archives (binutils project).
> -That, however, in combination with our previous long time working
> -default AR_FLAGS=cru causes warnings on such installations:
> -ar: `u' modifier ignored since `D' is the default (see `U')
> -
> -The 'u' option (at least with GNU binutils) did small optimization
> -during repeated builds because it instructed 'ar' to not
> -open/close unchanged *.o files and to rather read their contents
> -from old archive file.  However, its removal should not cause a
> -big performance hit for usual workflows.
> -
> -Distributions started using --enable-deterministic-archives
> -knowing that it would disable the 'u', just to rather have a bit
> -more deterministic builds.
> -
> -Also, to justify this change a bit more, keeping 'u' in ARFLAGS
> -could only result in many per-project changes to override
> -Libtool's ARFLAGS default, just to silent such warnings.
> -
> -Fixes bug#19967.  Reported by Eric Blake.
> -
> -* m4/libtool.m4 (_LT_PROG_AR): Default AR_FLAGS to 'cr'.
> -(_LT_REQUIRED_DARWIN_CHECKS): Use $AR_FLAGS instead 'cru' string.
> -* doc/libtool.texi: Do 's/ar cru/ar cr/' in whole documentation.
> -* NEWS: Document.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=418129bc63afc312701e84cb8afa5ca413df1ab5]
> -
> -Signed-off-by: Li Wang <li.wang@windriver.com>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - NEWS             |  4 ++++
> - doc/libtool.texi | 10 +++++-----
> - m4/libtool.m4    |  6 +++---
> - 3 files changed, 12 insertions(+), 8 deletions(-)
> -
> -diff --git a/NEWS b/NEWS
> -index 71a932d..1518f09 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -13,6 +13,10 @@ NEWS - list of user-visible changes between releases of GNU Libtool
> -     variable, which obsoletes AR_FLAGS.  This is due to naming conventions
> -     among other *FLAGS and to be consistent with Automake's ARFLAGS.
> -
> -+** Important incompatible changes:
> -+
> -+  - Libtool changed ARFLAGS/AR_FLAGS default from 'cru' to 'cr'.
> -+
> - ** Bug fixes:
> -
> -   - Fix a race condition in ltdl dryrun test that would cause spurious
> -diff --git a/doc/libtool.texi b/doc/libtool.texi
> -index 0298627..4c664bb 100644
> ---- a/doc/libtool.texi
> -+++ b/doc/libtool.texi
> -@@ -602,7 +602,7 @@ Without libtool, the programmer would invoke the @command{ar} command to
> - create a static library:
> -
> - @example
> --burger$ @kbd{ar cru libhello.a hello.o foo.o}
> -+burger$ @kbd{ar cr libhello.a hello.o foo.o}
> - burger$
> - @end example
> -
> -@@ -632,7 +632,7 @@ libtool are the same ones you would use to produce an executable named
> - a23$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.o hello.o}
> - *** Warning: Linking the shared library libhello.la against the
> - *** non-libtool objects foo.o hello.o is not portable!
> --ar cru .libs/libhello.a
> -+ar cr .libs/libhello.a
> - ranlib .libs/libhello.a
> - creating libhello.la
> - (cd .libs && rm -f libhello.la && ln -s ../libhello.la libhello.la)
> -@@ -662,7 +662,7 @@ archive, not a shared library (@pxref{Static libraries}).}:
> - @example
> - a23$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.lo hello.lo \
> -                 -rpath /usr/local/lib -lm}
> --ar cru @value{objdir}/libhello.a foo.o hello.o
> -+ar cr @value{objdir}/libhello.a foo.o hello.o
> - ranlib @value{objdir}/libhello.a
> - creating libhello.la
> - (cd @value{objdir} && rm -f libhello.la && ln -s ../libhello.la libhello.la)
> -@@ -676,7 +676,7 @@ burger$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.lo hello.lo \
> -                 -rpath /usr/local/lib -lm}
> - rm -fr  @value{objdir}/libhello.a @value{objdir}/libhello.la
> - ld -Bshareable -o @value{objdir}/libhello.so.0.0 @value{objdir}/foo.o @value{objdir}/hello.o -lm
> --ar cru @value{objdir}/libhello.a foo.o hello.o
> -+ar cr @value{objdir}/libhello.a foo.o hello.o
> - ranlib @value{objdir}/libhello.a
> - creating libhello.la
> - (cd @value{objdir} && rm -f libhello.la && ln -s ../libhello.la libhello.la)
> -@@ -6001,7 +6001,7 @@ in cases where it is necessary.
> - @subsection Archivers
> -
> - On all known systems, building a static library can be accomplished by
> --running @kbd{ar cru lib@var{name}.a @var{obj1}.o @var{obj2}.o @dots{}},
> -+running @kbd{ar cr lib@var{name}.a @var{obj1}.o @var{obj2}.o @dots{}},
> - where the @file{.a} file is the output library, and each @file{.o} file is an
> - object file.
> -
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> -index 6514196..add06ee 100644
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -1041,8 +1041,8 @@ int forced_loaded() { return 2;}
> - _LT_EOF
> -       echo "$LTCC $LTCFLAGS -c -o conftest.o conftest.c" >&AS_MESSAGE_LOG_FD
> -       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&AS_MESSAGE_LOG_FD
> --      echo "$AR cru libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
> --      $AR cru libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
> -+      echo "$AR $AR_FLAGS libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
> -+      $AR $AR_FLAGS libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
> -       echo "$RANLIB libconftest.a" >&AS_MESSAGE_LOG_FD
> -       $RANLIB libconftest.a 2>&AS_MESSAGE_LOG_FD
> -       cat > conftest.c << _LT_EOF
> -@@ -1505,7 +1505,7 @@ _LT_DECL([], [AR], [1], [The archiver])
> - # ARFLAGS for automake and AR_FLAGS for libtool).  FIXME: Make the AR_FLAGS
> - # variable obsoleted/removed.
> -
> --test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cru}
> -+test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cr}
> - lt_ar_flags=$AR_FLAGS
> - _LT_DECL([], [lt_ar_flags], [0], [Flags to create an archive (by configure)])
> -
> ---
> -2.23.0
> -
> diff --git a/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch b/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
> deleted file mode 100644
> index bb11887cda9..00000000000
> --- a/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 4335de1dfb7d2ec728427e07a54136b94a2d40f6 Mon Sep 17 00:00:00 2001
> -From: Pavel Raiskup <praiskup@redhat.com>
> -Date: Fri, 17 Apr 2015 15:05:42 +0200
> -Subject: libool.m4: add ARFLAGS variable
> -
> -Libtool has used $AR_FLAGS since 2000-05-29 commit
> -8300de4c54e6f04f0d, Automake ARFLAGS since 2003-04-06 commit
> -a71b3490639831ca.  Even though ARFLAGS is younger, it sounds like
> -better name according GNU Coding Standards.
> -
> -Related to bug#20082.
> -
> -* m4/libtool.m4 (_LT_PROG_AR): Copy ARFLAGS value into AR_FLAGS
> -variable if AR_FLAGS is not set.  Add new _LT_DECL'ed variable
> -'lt_ar_flags' to keep the configure-time value of AR_FLAGS.  The
> -new 'lt_ar_flags' is to be used as the default value for AR_FLAGS
> -at libtool-runtime.
> -* NEWS: Document.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=4335de1dfb7d2ec728427e07a54136b94a2d40f6]
> -
> -Signed-off-by: Li Wang <li.wang@windriver.com>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - NEWS          |  6 ++++++
> - m4/libtool.m4 | 17 +++++++++++++++--
> - 2 files changed, 21 insertions(+), 2 deletions(-)
> -
> -diff --git a/NEWS b/NEWS
> -index d7ca434..71a932d 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -7,6 +7,12 @@ NEWS - list of user-visible changes between releases of GNU Libtool
> -   - LT_SYS_LIBRARY_PATH can be set in config.site, or at configure time
> -     and persists correctly in the generated libtool script.
> -
> -+** New features:
> -+
> -+  - Libtool script now supports (configure-time and runtime) ARFLAGS
> -+    variable, which obsoletes AR_FLAGS.  This is due to naming conventions
> -+    among other *FLAGS and to be consistent with Automake's ARFLAGS.
> -+
> - ** Bug fixes:
> -
> -   - Fix a race condition in ltdl dryrun test that would cause spurious
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> -index 63acd09..6514196 100644
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -1497,9 +1497,22 @@ need_locks=$enable_libtool_lock
> - m4_defun([_LT_PROG_AR],
> - [AC_CHECK_TOOLS(AR, [ar], false)
> - : ${AR=ar}
> --: ${AR_FLAGS=cru}
> - _LT_DECL([], [AR], [1], [The archiver])
> --_LT_DECL([], [AR_FLAGS], [1], [Flags to create an archive])
> -+
> -+# Use ARFLAGS variable as AR's operation code to sync the variable naming with
> -+# Automake.  If both AR_FLAGS and ARFLAGS are specified, AR_FLAGS should have
> -+# higher priority because thats what people were doing historically (setting
> -+# ARFLAGS for automake and AR_FLAGS for libtool).  FIXME: Make the AR_FLAGS
> -+# variable obsoleted/removed.
> -+
> -+test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cru}
> -+lt_ar_flags=$AR_FLAGS
> -+_LT_DECL([], [lt_ar_flags], [0], [Flags to create an archive (by configure)])
> -+
> -+# Make AR_FLAGS overridable by 'make ARFLAGS='.  Don't try to run-time override
> -+# by AR_FLAGS because that was never working and AR_FLAGS is about to die.
> -+_LT_DECL([], [AR_FLAGS], [\@S|@{ARFLAGS-"\@S|@lt_ar_flags"}],
> -+         [Flags to create an archive])
> -
> - AC_CACHE_CHECK([for archiver @FILE support], [lt_cv_ar_at_file],
> -   [lt_cv_ar_at_file=no
> ---
> -2.23.0
> -
> diff --git a/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch b/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch
> deleted file mode 100644
> index b633bc41bb2..00000000000
> --- a/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch
> +++ /dev/null
> @@ -1,179 +0,0 @@
> -Cut and paste the pieces of build-aux/options-parser inline into the main
> -ltmain.sh code. This removes a performance degradation caused by the
> -repeated calls to func_quote_for_eval, the mechanism funclib uses
> -to construct the functions used for option parsing.
> -
> -Upstream-Status: Submitted [Being discussed on mailing list Feb 2015]
> -
> -diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> -index d5cf07a..0f54303 100644
> ---- a/build-aux/ltmain.in
> -+++ b/build-aux/ltmain.in
> -@@ -342,11 +342,15 @@ _LT_EOF
> - # libtool_options_prep [ARG]...
> - # -----------------------------
> - # Preparation for options parsed by libtool.
> --libtool_options_prep ()
> --{
> -+#libtool_options_prep ()
> -+#{
> -     $debug_mode
> -
> -     # Option defaults:
> -+    opt_verbose=false
> -+    opt_warning_types=
> -+
> -+    # Option defaults:
> -     opt_config=false
> -     opt_dlopen=
> -     opt_dry_run=false
> -@@ -382,19 +386,14 @@ libtool_options_prep ()
> -       shift; set dummy --mode uninstall ${1+"$@"}; shift
> -       ;;
> -     esac
> --
> --    # Pass back the list of options.
> --    func_quote_for_eval ${1+"$@"}
> --    libtool_options_prep_result=$func_quote_for_eval_result
> --}
> --func_add_hook func_options_prep libtool_options_prep
> -+#}
> -
> -
> - # libtool_parse_options [ARG]...
> - # ---------------------------------
> - # Provide handling for libtool specific options.
> --libtool_parse_options ()
> --{
> -+#libtool_parse_options ()
> -+#{
> -     $debug_cmd
> -
> -     # Perform our own loop to consume as many options as possible in
> -@@ -474,29 +473,90 @@ libtool_parse_options ()
> -                         func_append preserve_args " $_G_opt"
> -                         ;;
> -
> --      # An option not handled by this hook function:
> --        *)            set dummy "$_G_opt" ${1+"$@"};  shift; break  ;;
> --      esac
> --    done
> -+        --debug|-x)   debug_cmd='set -x'
> -+                      func_echo "enabling shell trace mode"
> -+                      $debug_cmd
> -+                      ;;
> -
> -+        --no-warnings|--no-warning|--no-warn)
> -+                      set dummy --warnings none ${1+"$@"}
> -+                      shift
> -+                    ;;
> -
> --    # save modified positional parameters for caller
> --    func_quote_for_eval ${1+"$@"}
> --    libtool_parse_options_result=$func_quote_for_eval_result
> --}
> --func_add_hook func_parse_options libtool_parse_options
> -+        --warnings|--warning|-W)
> -+                      test $# = 0 && func_missing_arg $_G_opt && break
> -+                      case " $warning_categories $1" in
> -+                        *" $1 "*)
> -+                          # trailing space prevents matching last $1 above
> -+                          func_append_uniq opt_warning_types " $1"
> -+                          ;;
> -+                        *all)
> -+                          opt_warning_types=$warning_categories
> -+                          ;;
> -+                        *none)
> -+                          opt_warning_types=none
> -+                          warning_func=:
> -+                          ;;
> -+                        *error)
> -+                          opt_warning_types=$warning_categories
> -+                          warning_func=func_fatal_error
> -+                          ;;
> -+                        *)
> -+                          func_fatal_error \
> -+                             "unsupported warning category: '$1'"
> -+                          ;;
> -+                      esac
> -+                      shift
> -+                      ;;
> -+
> -+        --verbose|-v) opt_verbose=: ;;
> -+        --version)    func_version ;;
> -+        -\?|-h)       func_usage ;;
> -+        --help)       func_help ;;
> -+
> -+      # Separate optargs to long options (plugins may need this):
> -+      --*=*)        func_split_equals "$_G_opt"
> -+                    set dummy "$func_split_equals_lhs" \
> -+                          "$func_split_equals_rhs" ${1+"$@"}
> -+                      shift
> -+                      ;;
> -+
> -+       # Separate optargs to short options:
> -+        -W*)
> -+                      func_split_short_opt "$_G_opt"
> -+                      set dummy "$func_split_short_opt_name" \
> -+                          "$func_split_short_opt_arg" ${1+"$@"}
> -+                      shift
> -+                      ;;
> -+
> -+        # Separate non-argument short options:
> -+        -\?*|-h*|-v*|-x*)
> -+                      func_split_short_opt "$_G_opt"
> -+                      set dummy "$func_split_short_opt_name" \
> -+                          "-$func_split_short_opt_arg" ${1+"$@"}
> -+                      shift
> -+                      ;;
> -+
> -+        --)           break ;;
> -+        -*)           func_fatal_help "unrecognised option: '$_G_opt'" ;;
> -+        *)            set dummy "$_G_opt" ${1+"$@"}; shift; break ;;
> -+      esac
> -+    done
> -+#}
> -
> -+# Display all warnings if -W was not given.
> -+test -n "$opt_warning_types" || opt_warning_types=" $warning_categories"
> -
> -
> - # libtool_validate_options [ARG]...
> - # ---------------------------------
> - # Perform any sanity checks on option settings and/or unconsumed
> - # arguments.
> --libtool_validate_options ()
> --{
> -+#libtool_validate_options ()
> -+#{
> -     # save first non-option argument
> -     if test 0 -lt $#; then
> --      nonopt=$1
> -+      nonopt=$_G_opt
> -       shift
> -     fi
> -
> -@@ -537,20 +597,10 @@ libtool_validate_options ()
> -       generic_help=$help
> -       help="Try '$progname --help --mode=$opt_mode' for more information."
> -     }
> -+#}
> -
> --    # Pass back the unparsed argument list
> --    func_quote_for_eval ${1+"$@"}
> --    libtool_validate_options_result=$func_quote_for_eval_result
> --}
> --func_add_hook func_validate_options libtool_validate_options
> --
> --
> --# Process options as early as possible so that --help and --version
> --# can return quickly.
> --func_options ${1+"$@"}
> --eval set dummy "$func_options_result"; shift
> --
> --
> -+# Bail if the options were screwed!
> -+$exit_cmd $EXIT_FAILURE
> -
> - ## ----------- ##
> - ##    Main.    ##
> diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/libtool/libtool_2.4.6.bb
> rename to meta/recipes-devtools/libtool/libtool_2.4.7.bb
> diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163431): https://lists.openembedded.org/g/openembedded-core/message/163431
> Mute This Topic: https://lists.openembedded.org/mt/89851467/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

