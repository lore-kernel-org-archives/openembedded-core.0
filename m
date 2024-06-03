Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516FAC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:59:58 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.87482.1717430391787337523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OdVJCYWE;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: kergoth@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25074a27485so2180859fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717430391; x=1718035191; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyBWimic2fiUBF9515X4VTM+LTgiXZyvixLESqeF6JE=;
        b=OdVJCYWED7ORlf8rTpo2CUq9HXt6DlIjf4p4ZK3kutNK6LyP+v7/to8YAi6WwnOGMV
         zAlvfEvYJB4I2usRVE5+D4kHH5cbi3NVEDWmzavdzTPm/v+VykE0ZSHI43WLEvqDDI6w
         vGXsaZ01Sx4cGHeJYkGp1qUKH6yBAvLcwFv9lvBob5giL5bPqtkfq1mxlVPjJ1PPosmf
         /ZGPWb7Zb0tTNFRSW1iruG7x0COSfwPnH4niOIMzaEEoTrlRUFB3BJikGQarGQ5UgZD6
         Ya4uHHZ1V1LGNlGgyiRWygM73CwYzuqjzFi4vqV5wNXGc4Bd7iOJN17Totls7yBfd3Z8
         OHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717430391; x=1718035191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyBWimic2fiUBF9515X4VTM+LTgiXZyvixLESqeF6JE=;
        b=Kgi+K+5fGaNlSHopuLdLHVTz5XUQJOp0vubmBJr9fT0O6NNNBpLuCq0gqwHMFNdCzL
         xK6URDfyUAjBBE2iawE0vV8h/scyepJ2JSBTExD+hQ+3E2VntSTDbwnNsakwNDFDq9Yj
         P0RP7Jyu2kSsLSQj5nGbdADGR/NyQtJhbAU09oyXQp8mEPHhxMb3N66hpESIDFhYeOUy
         XSKkGv4YqDgPEKOVr3dLWe4JS9zmcIGrtcnXgRe12GhTXb2NGKSs0LxxeRMkyMDUx+hO
         aVAH+eBWFGIdYSHYp2M21rJuXjVO0X3WkrkO6o8oXcudS10XohzOaKNOy5vsZZP0ikdF
         VKeg==
X-Gm-Message-State: AOJu0Yzp/E+X5q9qTBv74xRJZqIfFW4RVxK/Zb36Wm5KZe1ko8Xgvkn7
	a9nffdUnqzMzRbdKjW05SGei0Ni/zRsFH8AXMFk/LjPyD9HZ8DLEVuK03rm97JcX4DICIi4bgdX
	KQ5zjC46NK2Kk5D5cqOsAJegRd8w=
X-Google-Smtp-Source: AGHT+IGi1SWjV9+73Fo4mFHuRL5HsyeJCuR8g4LwiWPtS7zSWG6YRMaHbZezFWEqB1uPsheR1NLsEoQr1TDgMaNpeNg=
X-Received: by 2002:a05:6870:1656:b0:24e:6d33:9e26 with SMTP id
 586e51a60fabf-2508b7e43f5mr11102093fac.15.1717430390653; Mon, 03 Jun 2024
 08:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240603133938.3552266-1-richard.purdie@linuxfoundation.org> <20240603133938.3552266-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240603133938.3552266-2-richard.purdie@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 3 Jun 2024 15:59:39 +0000
Message-ID: <CABcZAN=hTMHq4DWisLSf6_i1QtOFUZQvxkvCTF5MGeD1DnctUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] autotools/libtool: Drop libtool sysroot
 patch as not needed
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c8bb90619fe6ce8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200268

--0000000000005c8bb90619fe6ce8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Always lovely to see a libtool patch go away, nice!

On Mon, Jun 3, 2024 at 1:39=E2=80=AFPM Richard Purdie via lists.openembedde=
d.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/insane.bbclass            |   2 +-
>  meta/classes-recipe/autotools.bbclass         |   9 +-
>  .../libtool/libtool-2.5.0.inc                 |   1 -
>  .../libtool/libtool-native_2.5.0.bb           |   2 +-
>  ...e-the-with-sysroot-option-to-avoid-c.patch | 171 ------------------
>  ...ool.m4-Handle-as-a-sysroot-correctly.patch |   6 +-
>  6 files changed, 6 insertions(+), 185 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sys=
root-option-to-avoid-c.patch
>
> diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> index 151cf0c4eac..822d190a304 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -58,7 +58,7 @@ enabled tests are listed here, the do_package_qa task
> will run under fakeroot."
>
>  ALL_QA =3D "${WARN_QA} ${ERROR_QA}"
>
> -UNKNOWN_CONFIGURE_OPT_IGNORE ?=3D "--enable-nls --disable-nls
> --disable-silent-rules --disable-dependency-tracking --with-libtool-sysro=
ot
> --disable-static"
> +UNKNOWN_CONFIGURE_OPT_IGNORE ?=3D "--enable-nls --disable-nls
> --disable-silent-rules --disable-dependency-tracking --disable-static"
>
>  # This is a list of directories that are expected to be empty.
>  QA_EMPTY_DIRS ?=3D " \
> diff --git a/meta/classes-recipe/autotools.bbclass
> b/meta/classes-recipe/autotools.bbclass
> index 7ee1b0d9c74..9ebdca47680 100644
> --- a/meta/classes-recipe/autotools.bbclass
> +++ b/meta/classes-recipe/autotools.bbclass
> @@ -57,12 +57,6 @@ export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLAGS}"
>  export LD_FOR_BUILD =3D "${BUILD_LD}"
>  export LDFLAGS_FOR_BUILD =3D "${BUILD_LDFLAGS}"
>
> -def append_libtool_sysroot(d):
> -    # Only supply libtool sysroot option for non-native packages
> -    if not bb.data.inherits_class('native', d):
> -        return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
> -    return ""
> -
>  CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
>                   --host=3D${HOST_SYS} \
>                   --target=3D${TARGET_SYS} \
> @@ -81,8 +75,7 @@ CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
>                   --infodir=3D${infodir} \
>                   --mandir=3D${mandir} \
>                   --disable-silent-rules \
> -                 ${CONFIGUREOPT_DEPTRACK} \
> -                 ${@append_libtool_sysroot(d)}"
> +                 ${CONFIGUREOPT_DEPTRACK}"
>  CONFIGUREOPT_DEPTRACK ?=3D "--disable-dependency-tracking"
>
>  CACHED_CONFIGUREVARS ?=3D ""
> diff --git a/meta/recipes-devtools/libtool/libtool-2.5.0.inc
> b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
> index dd6215476e8..a609de6369b 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.5.0.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>
>  SRC_URI =3D "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
>
> file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
> -
>  file://0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch \
>
> file://0003-ltmain.in-Add-missing-sysroot-to-library-path.patch \
>
> file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
>
> file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
> b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
> index 19024f7830c..90c06f0ec3f 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
> @@ -4,7 +4,7 @@ DEPENDS =3D ""
>
>  inherit native
>
> -EXTRA_OECONF =3D " --with-libtool-sysroot=3D${STAGING_DIR_NATIVE}"
> +EXTRA_OECONF =3D " --with-sysroot=3D${STAGING_DIR_NATIVE}"
>
>  do_configure:prepend () {
>         # Remove any existing libtool m4 since old stale versions would
> break
> diff --git
> a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-s=
ysroot-option-to-avoid-c.patch
> b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-s=
ysroot-option-to-avoid-c.patch
> deleted file mode 100644
> index 156622bb54b..00000000000
> ---
> a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-s=
ysroot-option-to-avoid-c.patch
> +++ /dev/null
> @@ -1,171 +0,0 @@
> -From: Khem Raj <raj.khem@gmail.com>
> -Subject: [PATCH 02/12] libtool.m4: Rename the --with-sysroot option to
> avoid conflict with gcc/binutils
> -
> -This patch renames the --with-sysroot option to --with-libtool-sysroot
> -to avoid namespace conflict with binutils, gcc and other toolchain
> -components since these componets also add that option to configure
> -and this becomes confusing and conflicting otherwise.
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Upstream report:
> -http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
> -
> -Upstream-Status: Submitted [
> https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
> -
> -Index: libtool-2.5.0/m4/libtool.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.5.0.orig/m4/libtool.m4
> -+++ libtool-2.5.0/m4/libtool.m4
> -@@ -1243,16 +1243,16 @@ _LT_DECL([], [ECHO], [1], [An echo progr
> - AC_DEFUN([_LT_WITH_SYSROOT],
> - [m4_require([_LT_DECL_SED])dnl
> - AC_MSG_CHECKING([for sysroot])
> --AC_ARG_WITH([sysroot],
> --[AS_HELP_STRING([--with-sysroot@<:@=3DDIR@:>@],
> -+AC_ARG_WITH([libtool-sysroot],
> -+[AS_HELP_STRING([--with-libtool-sysroot@<:@=3DDIR@:>@],
> -   [Search for dependent libraries within DIR (or the compiler's sysroot
> -    if not specified).])],
> --[], [with_sysroot=3Dno])
> -+[], [with_libtool_sysroot=3Dno])
> -
> - dnl lt_sysroot will always be passed unquoted.  We quote it here
> - dnl in case the user passed a directory name.
> - lt_sysroot=3D
> --case $with_sysroot in #(
> -+case $with_libtool_sysroot in #(
> -  yes)
> -    if test yes =3D "$GCC"; then
> -      # Trim trailing / since we'll always append absolute paths and we
> want
> -@@ -1261,12 +1261,12 @@ case $with_sysroot in #(
> -    fi
> -    ;; #(
> -  /*)
> --   lt_sysroot=3D`echo "$with_sysroot" | $SED -e "$sed_quote_subst"`
> -+   lt_sysroot=3D`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_sub=
st"`
> -    ;; #(
> -  no|'')
> -    ;; #(
> -  *)
> --   AC_MSG_RESULT([$with_sysroot])
> -+   AC_MSG_RESULT([$with_libtool_sysroot])
> -    AC_MSG_ERROR([The sysroot must be an absolute path.])
> -    ;;
> - esac
> -Index: libtool-2.5.0/tests/sysroot.at
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.5.0.orig/tests/sysroot.at
> -+++ libtool-2.5.0/tests/sysroot.at
> -@@ -65,7 +65,7 @@ while read file; do
> - done])
> -
> - LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> --configure_options=3D"$configure_options --with-sysroot=3D$sysroot
> --prefix=3D$prefix"
> -+configure_options=3D"$configure_options --with-libtool-sysroot=3D$sysro=
ot
> --prefix=3D$prefix"
> -
> - #???
> - if test PATH =3D "$shlibpath_var"; then
> -@@ -115,7 +115,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - ]])
> -@@ -156,7 +156,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - ]])
> -Index: libtool-2.5.0/tests/testsuite
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.5.0.orig/tests/testsuite
> -+++ libtool-2.5.0/tests/testsuite
> -@@ -49054,7 +49054,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> --configure_options=3D"$configure_options --with-sysroot=3D$sysroot
> --prefix=3D$prefix"
> -+configure_options=3D"$configure_options --with-libtool-sysroot=3D$sysro=
ot
> --prefix=3D$prefix"
> -
> - #???
> - if test PATH =3D "$shlibpath_var"; then
> -@@ -49269,7 +49269,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -49463,7 +49463,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -49821,7 +49821,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> --configure_options=3D"$configure_options --with-sysroot=3D$sysroot
> --prefix=3D$prefix"
> -+configure_options=3D"$configure_options --with-libtool-sysroot=3D$sysro=
ot
> --prefix=3D$prefix"
> -
> - #???
> - if test PATH =3D "$shlibpath_var"; then
> -@@ -50036,7 +50036,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50230,7 +50230,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50588,7 +50588,7 @@ $at_traceon; }
> -
> -
> - LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> --configure_options=3D"$configure_options --with-sysroot=3D$sysroot
> --prefix=3D$prefix"
> -+configure_options=3D"$configure_options --with-libtool-sysroot=3D$sysro=
ot
> --prefix=3D$prefix"
> -
> - #???
> - if test PATH =3D "$shlibpath_var"; then
> -@@ -50803,7 +50803,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([lib2.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> -@@ -50997,7 +50997,7 @@ AM_INIT_AUTOMAKE([foreign])
> - AC_PROG_CC
> - AC_CONFIG_SRCDIR([prog.c])
> - LT_INIT
> --sysroot=3D$with_sysroot
> -+sysroot=3D$with_libtool_sysroot
> - AC_SUBST([sysroot])
> - AC_OUTPUT(Makefile)
> - _ATEOF
> diff --git
> a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysro=
ot-correctly.patch
> b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysro=
ot-correctly.patch
> index 435c52c7301..feb1048b554 100644
> ---
> a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysro=
ot-correctly.patch
> +++
> b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysro=
ot-correctly.patch
> @@ -17,7 +17,7 @@ Index: libtool-2.5.0/m4/libtool.m4
>  @@ -1253,18 +1253,18 @@ dnl lt_sysroot will always be passed unq
>   dnl in case the user passed a directory name.
>   lt_sysroot=3D
> - case $with_libtool_sysroot in #(
> + case $with_sysroot in #(
>  - yes)
>  + no)
>      if test yes =3D "$GCC"; then
> @@ -29,10 +29,10 @@ Index: libtool-2.5.0/m4/libtool.m4
>  + yes|''|/)
>  +   ;; #(
>    /*)
> -    lt_sysroot=3D`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_sub=
st"`
> +    lt_sysroot=3D`echo "$with_sysroot" | $SED -e "$sed_quote_subst"`
>      ;; #(
>  - no|'')
>  -   ;; #(
>    *)
> -    AC_MSG_RESULT([$with_libtool_sysroot])
> +    AC_MSG_RESULT([$with_sysroot])
>      AC_MSG_ERROR([The sysroot must be an absolute path.])
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200250):
> https://lists.openembedded.org/g/openembedded-core/message/200250
> Mute This Topic: https://lists.openembedded.org/mt/106461688/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--0000000000005c8bb90619fe6ce8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Always lovely to see a libtool patch go away, nice!<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Jun 3, 2024 at 1:39=E2=80=AFPM Richard Purdie via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a hr=
ef=3D"mailto:linuxfoundation.org@lists.openembedded.org">linuxfoundation.or=
g@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Signed-off-by: Richard Purdie &lt;<a href=3D"mailto=
:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linux=
foundation.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes-recipe/autotools.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../libtool/libtool-2.5.0.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0.../libtool/<a href=3D"http://libtool-native_2.5.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libtool-native_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...e-the-with-sysroot-option-to-avoid-c.patch | 171 -----------------=
-<br>
=C2=A0...ool.m4-Handle-as-a-sysroot-correctly.patch |=C2=A0 =C2=A06 +-<br>
=C2=A06 files changed, 6 insertions(+), 185 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/libtool/libtool/0002-libtool=
.m4-Rename-the-with-sysroot-option-to-avoid-c.patch<br>
<br>
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass<br>
index 151cf0c4eac..822d190a304 100644<br>
--- a/meta/classes-global/insane.bbclass<br>
+++ b/meta/classes-global/insane.bbclass<br>
@@ -58,7 +58,7 @@ enabled tests are listed here, the do_package_qa task wil=
l run under fakeroot.&quot;<br>
<br>
=C2=A0ALL_QA =3D &quot;${WARN_QA} ${ERROR_QA}&quot;<br>
<br>
-UNKNOWN_CONFIGURE_OPT_IGNORE ?=3D &quot;--enable-nls --disable-nls --disab=
le-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disa=
ble-static&quot;<br>
+UNKNOWN_CONFIGURE_OPT_IGNORE ?=3D &quot;--enable-nls --disable-nls --disab=
le-silent-rules --disable-dependency-tracking --disable-static&quot;<br>
<br>
=C2=A0# This is a list of directories that are expected to be empty.<br>
=C2=A0QA_EMPTY_DIRS ?=3D &quot; \<br>
diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/au=
totools.bbclass<br>
index 7ee1b0d9c74..9ebdca47680 100644<br>
--- a/meta/classes-recipe/autotools.bbclass<br>
+++ b/meta/classes-recipe/autotools.bbclass<br>
@@ -57,12 +57,6 @@ export CXXFLAGS_FOR_BUILD=3D&quot;${BUILD_CXXFLAGS}&quot=
;<br>
=C2=A0export LD_FOR_BUILD =3D &quot;${BUILD_LD}&quot;<br>
=C2=A0export LDFLAGS_FOR_BUILD =3D &quot;${BUILD_LDFLAGS}&quot;<br>
<br>
-def append_libtool_sysroot(d):<br>
-=C2=A0 =C2=A0 # Only supply libtool sysroot option for non-native packages=
<br>
-=C2=A0 =C2=A0 if not bb.data.inherits_class(&#39;native&#39;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;--with-libtool-sysroot=3D${STAGING=
_DIR_HOST}&#39;<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
=C2=A0CONFIGUREOPTS =3D &quot; --build=3D${BUILD_SYS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --host=3D${H=
OST_SYS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=3D$=
{TARGET_SYS} \<br>
@@ -81,8 +75,7 @@ CONFIGUREOPTS =3D &quot; --build=3D${BUILD_SYS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --infodir=3D=
${infodir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mandir=3D$=
{mandir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-si=
lent-rules \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CONFIGUREO=
PT_DEPTRACK} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@append_li=
btool_sysroot(d)}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CONFIGUREO=
PT_DEPTRACK}&quot;<br>
=C2=A0CONFIGUREOPT_DEPTRACK ?=3D &quot;--disable-dependency-tracking&quot;<=
br>
<br>
=C2=A0CACHED_CONFIGUREVARS ?=3D &quot;&quot;<br>
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.0.inc b/meta/recipes=
-devtools/libtool/libtool-2.5.0.inc<br>
index dd6215476e8..a609de6369b 100644<br>
--- a/meta/recipes-devtools/libtool/libtool-2.5.0.inc<br>
+++ b/meta/recipes-devtools/libtool/libtool-2.5.0.inc<br>
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://alpha.gnu.org/gnu/libtool/libtoo=
l-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://alpha.gnu.=
org/gnu/libtool/libtool-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ltmain.in-Handle-trai=
ling-slashes-on-install-command.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-libtool.m4-Rename-the=
-with-sysroot-option-to-avoid-c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-ltmain.in-Add-missing=
-sysroot-to-library-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-ltmain.sh-Fix-sysroot=
-paths-being-encoded-into-RPATH.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-ltmain.in-Don-t-encod=
e-RATHS-which-match-default-lin.patch \<br>
diff --git a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native=
_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.5.0.bb</a>=
 b/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libtool-native_2.5.0.bb</a><br>
index 19024f7830c..90c06f0ec3f 100644<br>
--- a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.5.0.bb</a><br>
+++ b/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.5.0.bb</a><br>
@@ -4,7 +4,7 @@ DEPENDS =3D &quot;&quot;<br>
<br>
=C2=A0inherit native<br>
<br>
-EXTRA_OECONF =3D &quot; --with-libtool-sysroot=3D${STAGING_DIR_NATIVE}&quo=
t;<br>
+EXTRA_OECONF =3D &quot; --with-sysroot=3D${STAGING_DIR_NATIVE}&quot;<br>
<br>
=C2=A0do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove any existing libtool m4 since old stal=
e versions would break<br>
diff --git a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-t=
he-with-sysroot-option-to-avoid-c.patch b/meta/recipes-devtools/libtool/lib=
tool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch<br>
deleted file mode 100644<br>
index 156622bb54b..00000000000<br>
--- a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with=
-sysroot-option-to-avoid-c.patch<br>
+++ /dev/null<br>
@@ -1,171 +0,0 @@<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Subject: [PATCH 02/12] libtool.m4: Rename the --with-sysroot option to avo=
id conflict with gcc/binutils<br>
-<br>
-This patch renames the --with-sysroot option to --with-libtool-sysroot<br>
-to avoid namespace conflict with binutils, gcc and other toolchain<br>
-components since these componets also add that option to configure<br>
-and this becomes confusing and conflicting otherwise.<br>
-<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
-<br>
-Upstream report:<br>
-<a href=3D"http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html=
" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.org/archive/html/li=
btool/2010-10/msg00048.html</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lists.gnu.org/archive/html/=
libtool-patches/2021-10/msg00014.html" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html</=
a>]<br>
-<br>
-Index: libtool-2.5.0/m4/libtool.m4<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libtool-2.5.0.orig/m4/libtool.m4<br>
-+++ libtool-2.5.0/m4/libtool.m4<br>
-@@ -1243,16 +1243,16 @@ _LT_DECL([], [ECHO], [1], [An echo progr<br>
- AC_DEFUN([_LT_WITH_SYSROOT],<br>
- [m4_require([_LT_DECL_SED])dnl<br>
- AC_MSG_CHECKING([for sysroot])<br>
--AC_ARG_WITH([sysroot],<br>
--[AS_HELP_STRING([--with-sysroot@&lt;:@=3DDIR@:&gt;@],<br>
-+AC_ARG_WITH([libtool-sysroot],<br>
-+[AS_HELP_STRING([--with-libtool-sysroot@&lt;:@=3DDIR@:&gt;@],<br>
-=C2=A0 =C2=A0[Search for dependent libraries within DIR (or the compiler&#=
39;s sysroot<br>
-=C2=A0 =C2=A0 if not specified).])],<br>
--[], [with_sysroot=3Dno])<br>
-+[], [with_libtool_sysroot=3Dno])<br>
- <br>
- dnl lt_sysroot will always be passed unquoted.=C2=A0 We quote it here<br>
- dnl in case the user passed a directory name.<br>
- lt_sysroot=3D<br>
--case $with_sysroot in #(<br>
-+case $with_libtool_sysroot in #(<br>
-=C2=A0 yes)<br>
-=C2=A0 =C2=A0 if test yes =3D &quot;$GCC&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 # Trim trailing / since we&#39;ll always append absol=
ute paths and we want<br>
-@@ -1261,12 +1261,12 @@ case $with_sysroot in #(<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;; #(<br>
-=C2=A0 /*)<br>
--=C2=A0 =C2=A0lt_sysroot=3D`echo &quot;$with_sysroot&quot; | $SED -e &quot=
;$sed_quote_subst&quot;`<br>
-+=C2=A0 =C2=A0lt_sysroot=3D`echo &quot;$with_libtool_sysroot&quot; | $SED =
-e &quot;$sed_quote_subst&quot;`<br>
-=C2=A0 =C2=A0 ;; #(<br>
-=C2=A0 no|&#39;&#39;)<br>
-=C2=A0 =C2=A0 ;; #(<br>
-=C2=A0 *)<br>
--=C2=A0 =C2=A0AC_MSG_RESULT([$with_sysroot])<br>
-+=C2=A0 =C2=A0AC_MSG_RESULT([$with_libtool_sysroot])<br>
-=C2=A0 =C2=A0 AC_MSG_ERROR([The sysroot must be an absolute path.])<br>
-=C2=A0 =C2=A0 ;;<br>
- esac<br>
-Index: libtool-2.5.0/tests/<a href=3D"http://sysroot.at" rel=3D"noreferrer=
" target=3D"_blank">sysroot.at</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libtool-2.5.0.orig/tests/<a href=3D"http://sysroot.at" rel=3D"noreferr=
er" target=3D"_blank">sysroot.at</a><br>
-+++ libtool-2.5.0/tests/<a href=3D"http://sysroot.at" rel=3D"noreferrer" t=
arget=3D"_blank">sysroot.at</a><br>
-@@ -65,7 +65,7 @@ while read file; do<br>
- done])<br>
- <br>
- LDFLAGS=3D&quot;$LDFLAGS --sysroot=3D$sysroot -no-undefined&quot;<br>
--configure_options=3D&quot;$configure_options --with-sysroot=3D$sysroot --=
prefix=3D$prefix&quot;<br>
-+configure_options=3D&quot;$configure_options --with-libtool-sysroot=3D$sy=
sroot --prefix=3D$prefix&quot;<br>
- <br>
- #???<br>
- if test PATH =3D &quot;$shlibpath_var&quot;; then<br>
-@@ -115,7 +115,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([lib2.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- ]])<br>
-@@ -156,7 +156,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([prog.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- ]])<br>
-Index: libtool-2.5.0/tests/testsuite<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libtool-2.5.0.orig/tests/testsuite<br>
-+++ libtool-2.5.0/tests/testsuite<br>
-@@ -49054,7 +49054,7 @@ $at_traceon; }<br>
- <br>
- <br>
- LDFLAGS=3D&quot;$LDFLAGS --sysroot=3D$sysroot -no-undefined&quot;<br>
--configure_options=3D&quot;$configure_options --with-sysroot=3D$sysroot --=
prefix=3D$prefix&quot;<br>
-+configure_options=3D&quot;$configure_options --with-libtool-sysroot=3D$sy=
sroot --prefix=3D$prefix&quot;<br>
- <br>
- #???<br>
- if test PATH =3D &quot;$shlibpath_var&quot;; then<br>
-@@ -49269,7 +49269,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([lib2.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
-@@ -49463,7 +49463,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([prog.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
-@@ -49821,7 +49821,7 @@ $at_traceon; }<br>
- <br>
- <br>
- LDFLAGS=3D&quot;$LDFLAGS --sysroot=3D$sysroot -no-undefined&quot;<br>
--configure_options=3D&quot;$configure_options --with-sysroot=3D$sysroot --=
prefix=3D$prefix&quot;<br>
-+configure_options=3D&quot;$configure_options --with-libtool-sysroot=3D$sy=
sroot --prefix=3D$prefix&quot;<br>
- <br>
- #???<br>
- if test PATH =3D &quot;$shlibpath_var&quot;; then<br>
-@@ -50036,7 +50036,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([lib2.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
-@@ -50230,7 +50230,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([prog.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
-@@ -50588,7 +50588,7 @@ $at_traceon; }<br>
- <br>
- <br>
- LDFLAGS=3D&quot;$LDFLAGS --sysroot=3D$sysroot -no-undefined&quot;<br>
--configure_options=3D&quot;$configure_options --with-sysroot=3D$sysroot --=
prefix=3D$prefix&quot;<br>
-+configure_options=3D&quot;$configure_options --with-libtool-sysroot=3D$sy=
sroot --prefix=3D$prefix&quot;<br>
- <br>
- #???<br>
- if test PATH =3D &quot;$shlibpath_var&quot;; then<br>
-@@ -50803,7 +50803,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([lib2.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
-@@ -50997,7 +50997,7 @@ AM_INIT_AUTOMAKE([foreign])<br>
- AC_PROG_CC<br>
- AC_CONFIG_SRCDIR([prog.c])<br>
- LT_INIT<br>
--sysroot=3D$with_sysroot<br>
-+sysroot=3D$with_libtool_sysroot<br>
- AC_SUBST([sysroot])<br>
- AC_OUTPUT(Makefile)<br>
- _ATEOF<br>
diff --git a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-a=
s-a-sysroot-correctly.patch b/meta/recipes-devtools/libtool/libtool/0006-li=
btool.m4-Handle-as-a-sysroot-correctly.patch<br>
index 435c52c7301..feb1048b554 100644<br>
--- a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sys=
root-correctly.patch<br>
+++ b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sys=
root-correctly.patch<br>
@@ -17,7 +17,7 @@ Index: libtool-2.5.0/m4/libtool.m4<br>
=C2=A0@@ -1253,18 +1253,18 @@ dnl lt_sysroot will always be passed unq<br>
=C2=A0 dnl in case the user passed a directory name.<br>
=C2=A0 lt_sysroot=3D<br>
- case $with_libtool_sysroot in #(<br>
+ case $with_sysroot in #(<br>
=C2=A0- yes)<br>
=C2=A0+ no)<br>
=C2=A0 =C2=A0 =C2=A0if test yes =3D &quot;$GCC&quot;; then<br>
@@ -29,10 +29,10 @@ Index: libtool-2.5.0/m4/libtool.m4<br>
=C2=A0+ yes|&#39;&#39;|/)<br>
=C2=A0+=C2=A0 =C2=A0;; #(<br>
=C2=A0 =C2=A0/*)<br>
-=C2=A0 =C2=A0 lt_sysroot=3D`echo &quot;$with_libtool_sysroot&quot; | $SED =
-e &quot;$sed_quote_subst&quot;`<br>
+=C2=A0 =C2=A0 lt_sysroot=3D`echo &quot;$with_sysroot&quot; | $SED -e &quot=
;$sed_quote_subst&quot;`<br>
=C2=A0 =C2=A0 =C2=A0;; #(<br>
=C2=A0- no|&#39;&#39;)<br>
=C2=A0-=C2=A0 =C2=A0;; #(<br>
=C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 AC_MSG_RESULT([$with_libtool_sysroot])<br>
+=C2=A0 =C2=A0 AC_MSG_RESULT([$with_sysroot])<br>
=C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([The sysroot must be an absolute path.])<b=
r>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200250): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200250" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200250</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106461688/361=
7123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106461688/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div dir=3D"ltr"><font color=3D"#333333">Christopher Larson<br><a>chris=
_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.com</a>,=C2=A0<a>kergo=
th@gmail.com</a><br>Principal Software Engineer,=C2=A0Embedded Linux Soluti=
ons,=C2=A0Siemens Digital Industries Software</font><br></div></div></div>

--0000000000005c8bb90619fe6ce8--

