Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E844DC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 07:03:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.16604.1716879781318581607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 00:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FAsVS85i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BB44240002;
	Tue, 28 May 2024 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716879779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CPnNwYrAHMJjKK7IgS39tp9ryYn2zWqx5qkFsSIe/Ck=;
	b=FAsVS85ionPFvbNpOJjD8nurOi1pgTkGs+DxdAKEdTalGuXpvjrPY7FXRa5oCXVOta+uSb
	vtfEJScbu+IvMKFwOHG1gXHWqprn16klycA8IrBCCXK4tEpvRaxAlW4GVaH1yi9ML9cPyI
	NqjWcDYqzsQcR+DRk23nIKps3rWVvTnbgBRWLvxCZ5cj+e0yUhAL5DVjEt13ya/jEy2vag
	V40s5n3VHWvqkIaQhdAUqQ59sBzegrVXnc6hdxW1hLkOkCvP5vEeo6jX5DqC7XoA6xsGHy
	6MUIW9RShvfyPmQpeBpMiaY8yvqCxLOO+5GCsZBD0mQprRLnSTje7vJnR08ErA==
Date: Tue, 28 May 2024 09:02:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 03/13] pinentry: update 1.2.1 -> 1.3.0
Message-ID: <202405280702532ddc15a8@mail.local>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
 <20240527181214.1778037-3-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527181214.1778037-3-alex.kanavin@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 07:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199952

I fixed it up in my branch but you forgot to update
oescripts.OEListPackageconfigTests.test_packageconfig_flags_option_all
Maybe it would be nice to have a comment in the recipe.

On 27/05/2024 20:12:04+0200, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> License-update: formatting, FSF address
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../gpg-error_pkconf.patch                    | 56 ++++++++++++++-----
>  .../libassuan_pkgconf.patch                   | 24 ++++----
>  .../{pinentry_1.2.1.bb => pinentry_1.3.0.bb}  |  4 +-
>  3 files changed, 56 insertions(+), 28 deletions(-)
>  rename meta/recipes-support/pinentry/{pinentry-1.2.1 => pinentry-1.3.0}/gpg-error_pkconf.patch (82%)
>  rename meta/recipes-support/pinentry/{pinentry-1.2.1 => pinentry-1.3.0}/libassuan_pkgconf.patch (88%)
>  rename meta/recipes-support/pinentry/{pinentry_1.2.1.bb => pinentry_1.3.0.bb} (88%)
> 
> diff --git a/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
> similarity index 82%
> rename from meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
> rename to meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
> index bb7e43b1e75..863ba9e34b4 100644
> --- a/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
> +++ b/meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
> @@ -1,4 +1,4 @@
> -From 785777dc0bc6b69ff68c91547ec6b6634049662f Mon Sep 17 00:00:00 2001
> +From ccc3c6a8d469bbfa6717b970cfe70816c1fd545e Mon Sep 17 00:00:00 2001
>  From: Armin Kuster <akuster@mvista.com>
>  Date: Fri, 2 Sep 2005 11:50:01 +0000
>  Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
> @@ -9,20 +9,20 @@ the gpg-error recipe for gpg-error.pc  generation.
>  Upstream-Status: Inappropriate [OE specific]
>  
>  Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
>  ---
> - m4/gpg-error.m4 | 160 ++----------------------------------------------
> - 1 file changed, 4 insertions(+), 156 deletions(-)
> + m4/gpg-error.m4 | 184 ++----------------------------------------------
> + 1 file changed, 5 insertions(+), 179 deletions(-)
>  
>  diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
> -index 4b5cd40..7dfbb83 100644
> +index 7fa52b1..c0784ed 100644
>  --- a/m4/gpg-error.m4
>  +++ b/m4/gpg-error.m4
> -@@ -26,160 +26,12 @@ dnl config script does not match the host specification the script
> - dnl is added to the gpg_config_script_warn variable.
> +@@ -15,188 +15,18 @@
> + dnl
> + dnl Find gpg-error-config, for backward compatibility
>   dnl
> - AC_DEFUN([AM_PATH_GPG_ERROR],
> --[ AC_REQUIRE([AC_CANONICAL_HOST])
> +-dnl _AM_PATH_POSSIBLE_GPG_ERROR_CONFIG
> +-AC_DEFUN([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG],[dnl
>  -  gpg_error_config_prefix=""
>  -  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
>  -  dnl since that is consistent with how our three siblings use the directory/
> @@ -58,9 +58,14 @@ index 4b5cd40..7dfbb83 100644
>  -  fi
>  -
>  -  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
> --  min_gpg_error_version=ifelse([$1], ,1.33,$1)
> --  ok=no
> +-])
>  -
> +-dnl
> +-dnl Find gpgrt-config, which uses .pc file
> +-dnl (minimum pkg-config functionality, supporting cross build)
> +-dnl
> +-dnl _AM_PATH_GPGRT_CONFIG
> +-AC_DEFUN([_AM_PATH_GPGRT_CONFIG],[dnl
>  -  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
>  -  if test "$GPGRT_CONFIG" != "no"; then
>  -    # Determine gpgrt_libdir
> @@ -116,8 +121,9 @@ index 4b5cd40..7dfbb83 100644
>  -        fi
>  -        if test -n "$gpgrt_libdir"; then break; fi
>  -      done
> --    else
> --      # When we cannot determine system libdir-format, use this:
> +-    fi
> +-    if test -z "$gpgrt_libdir"; then
> +-      # No valid pkgconfig dir in any of the system directories, fallback
>  -      gpgrt_libdir=${possible_libdir1}
>  -    fi
>  -  else
> @@ -131,12 +137,33 @@ index 4b5cd40..7dfbb83 100644
>  -      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
>  -      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
>  -    else
> +-      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
>  -      unset GPGRT_CONFIG
>  -    fi
>  -  elif test "$GPG_ERROR_CONFIG" != "no"; then
>  -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
>  -    unset GPGRT_CONFIG
>  -  fi
> +-])
> +-
> +-dnl AM_PATH_GPG_ERROR([MINIMUM-VERSION,
> +-dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
> +-dnl
> +-dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
> +-dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
> +-dnl used for programs requireing real multi thread support.
> +-dnl
> + dnl If a prefix option is not used, the config script is first
> + dnl searched in $SYSROOT/bin and then along $PATH.  If the used
> + dnl config script does not match the host specification the script
> + dnl is added to the gpg_config_script_warn variable.
> + dnl
> +-AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
> +-AC_REQUIRE([AC_CANONICAL_HOST])dnl
> +-AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
> +-AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
> +-  min_gpg_error_version=ifelse([$1], ,1.33,$1)
> +-  ok=no
>  -  if test "$GPG_ERROR_CONFIG" != "no"; then
>  -    req_major=`echo $min_gpg_error_version | \
>  -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
> @@ -157,6 +184,7 @@ index 4b5cd40..7dfbb83 100644
>  -    fi
>  -  fi
>  -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
> ++AC_DEFUN([AM_PATH_GPG_ERROR],
>  +[
>  +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
>  +  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
> @@ -183,7 +211,7 @@ index 4b5cd40..7dfbb83 100644
>       if test x"$gpg_error_config_host" != xnone ; then
>         if test x"$gpg_error_config_host" != x"$host" ; then
>     AC_MSG_WARN([[
> -@@ -194,10 +46,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
> +@@ -211,10 +41,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
>         fi
>       fi
>     else
> diff --git a/meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
> similarity index 88%
> rename from meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
> rename to meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
> index f4aec2d1c39..bee9acd081c 100644
> --- a/meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
> +++ b/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
> @@ -1,4 +1,4 @@
> -From 26fb6c3faa27180c8ed9ada1728c3d8683a65f3a Mon Sep 17 00:00:00 2001
> +From fb6179fabb5e793a83cbb0d0d45814d99b97807a Mon Sep 17 00:00:00 2001
>  From: Armin Kuster <akuster@mvista.com>
>  Date: Thu, 22 May 2014 10:50:00 +0100
>  Subject: [PATCH] libassuan: Improve pkgconfig support
> @@ -9,17 +9,16 @@ the libassuan recipe for libassuan.pc generation.
>  Upstream-Status: Inappropriate [OE specific]
>  
>  Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
>  ---
>   configure.ac    |  4 +--
> - m4/libassuan.m4 | 93 ++++---------------------------------------------
> - 2 files changed, 9 insertions(+), 88 deletions(-)
> + m4/libassuan.m4 | 94 ++++---------------------------------------------
> + 2 files changed, 9 insertions(+), 89 deletions(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index d8dcc0c..ca51766 100644
> +index f04c00d..8e6da5c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -267,8 +267,8 @@ if test "$have_libassuan" = "yes"; then
> +@@ -263,8 +263,8 @@ if test "$have_libassuan" = "yes"; then
>                        [version of the libassuan library])
>   fi
>   
> @@ -31,7 +30,7 @@ index d8dcc0c..ca51766 100644
>   
>   dnl Checks for libsecmem.
>  diff --git a/m4/libassuan.m4 b/m4/libassuan.m4
> -index df50484..2057412 100644
> +index a2eb5d9..897f407 100644
>  --- a/m4/libassuan.m4
>  +++ b/m4/libassuan.m4
>  @@ -15,30 +15,8 @@ dnl
> @@ -51,7 +50,7 @@ index df50484..2057412 100644
>  -  fi
>  -
>  -  use_gpgrt_config=""
> --  if test x"${LIBASSUAN_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
> +-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
>  -    if $GPGRT_CONFIG libassuan --exists; then
>  -      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
>  -      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
> @@ -67,7 +66,7 @@ index df50484..2057412 100644
>     tmp=ifelse([$1], ,1:0.9.2,$1)
>     if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
>       req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
> -@@ -48,58 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
> +@@ -48,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
>       min_libassuan_version="$tmp"
>     fi
>   
> @@ -112,6 +111,7 @@ index df50484..2057412 100644
>  -
>  -  if test $ok = yes; then
>  -    AC_MSG_RESULT([yes ($libassuan_config_version)])
> +-    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
>  -  else
>  -    AC_MSG_RESULT(no)
>  -  fi
> @@ -128,7 +128,7 @@ index df50484..2057412 100644
>         if test "$tmp" -gt 0 ; then
>           AC_MSG_CHECKING([LIBASSUAN API version])
>           if test "$req_libassuan_api" -eq "$tmp" ; then
> -@@ -114,11 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
> +@@ -117,11 +47,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
>   
>     if test $ok = yes; then
>       if test x"$host" != x ; then
> @@ -141,7 +141,7 @@ index df50484..2057412 100644
>         if test x"$libassuan_config_host" != xnone ; then
>           if test x"$libassuan_config_host" != x"$host" ; then
>     AC_MSG_WARN([[
> -@@ -141,7 +68,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
> +@@ -144,7 +70,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
>   dnl used to test for features only available in newer versions.
>   dnl
>   AC_DEFUN([AM_CHECK_LIBASSUAN],
> @@ -150,7 +150,7 @@ index df50484..2057412 100644
>     if test $ok = yes; then
>       ifelse([$2], , :, [$2])
>     else
> -@@ -157,16 +84,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
> +@@ -160,16 +86,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
>   dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
>   dnl
>   AC_DEFUN([AM_PATH_LIBASSUAN],
> diff --git a/meta/recipes-support/pinentry/pinentry_1.2.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.0.bb
> similarity index 88%
> rename from meta/recipes-support/pinentry/pinentry_1.2.1.bb
> rename to meta/recipes-support/pinentry/pinentry_1.3.0.bb
> index 7daf80f36eb..6ce873871b1 100644
> --- a/meta/recipes-support/pinentry/pinentry_1.2.1.bb
> +++ b/meta/recipes-support/pinentry/pinentry_1.3.0.bb
> @@ -6,7 +6,7 @@ DESCRIPTION = "\
>  
>  HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
>  LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  DEPENDS = "gettext-native libassuan libgpg-error"
>  
> @@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://gpg-error_pkconf.patch \
>  "
>  
> -SRC_URI[sha256sum] = "457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067"
> +SRC_URI[sha256sum] = "9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de"
>  
>  inherit autotools pkgconfig
>  
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199920): https://lists.openembedded.org/g/openembedded-core/message/199920
> Mute This Topic: https://lists.openembedded.org/mt/106334727/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

