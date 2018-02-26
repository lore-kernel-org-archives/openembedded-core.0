Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6966E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 07:19:27 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id v3so8803229plg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 23:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nmo1np9ZtnsBQgMz6IayYAljHqy6e6/rK4v+IgKSjYg=;
	b=dkddHd8lc3PDDJbRk7EW+974Fm4BiU3xO9ZAW/NsrDRQccCcWvYxAZYG7Bq7y+mkvk
	OhzueCAMT2yo585o21Z/toRxevL0IPdPOLPjHHxwFynjGhzayYLq744CA+JGrnExTbH7
	Y0y7Ulmcu/IrqdAzNQHv6fwSpnGZLGAuYe+wMMvrqv3wncCt4yD60Aq21StHkecZY4iy
	UiKZAgBNy2fdLl0d5uYKvkSOa2MpgzG1WmfH8Hxhzga0JYNY+stVdMIbyVS8Yj8etQfo
	AnLI0yRxhy7cgXvVTvGY+C4yTqMIQ76tcfLJD12HWh1thxOP76ZuO54b5K6ycZYa98cI
	AIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nmo1np9ZtnsBQgMz6IayYAljHqy6e6/rK4v+IgKSjYg=;
	b=oC0U/NieCAgOVV3CdjAsqEmUQLN52IZClysjr7nU2bJH4+G0Dr3ROkyJg596lvhjvZ
	6VqyFmItMTVMy+6e6bIUo7LOn0X++b8GqC688TvAiKa8Rc3+FWE7wfcYkuqxzduZjxcq
	xCwZxEYcCCfrdw4WvuSxevbjoHBfHe73oh8mlPe2vYCgvCDUcZFmlu97to6yp/8sCS6P
	xRjezz6l5KGuKavA8Iw5Wp2FMBuvY/9yAmVkusEQ3An5ss9384h3I5Wdg/WHRm1XPKoz
	qPTMSbHGDdoDD02zKTRrzRbPvURH4y75Q+FWxrQtDHxNX+yr+sP49L+rI3xiQ+FneV7k
	14oQ==
X-Gm-Message-State: APf1xPDhl2aCaUSJysBeVxzOo2X//VWMC5waC3/Rkk6hcYB04MYGR23N
	dUl5KmlnbuMZEZYEJkCvLO7UBOklYaZV0TjmDhCKEQ==
X-Google-Smtp-Source: AG47ELtz/GAHXK1u9P6OgFl/pT+2oOHxa/eiXYSaMenoAtv9lsgevGP+YKDgDB4rhvDseHZOAMHQo07rOrAeqbEbjI4=
X-Received: by 2002:a17:902:aa89:: with SMTP id
	d9-v6mr4420891plr.337.1519629569150; 
	Sun, 25 Feb 2018 23:19:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Sun, 25 Feb 2018 23:18:58 -0800 (PST)
In-Reply-To: <1519029438-11092-2-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-2-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Feb 2018 23:18:58 -0800
Message-ID: <CAMKF1spVFhwnV2v4+O0KV-+9+a66HSK9eWyYzdJK142TZ1rXGQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] pkgconf: upgrade to version 1.4.2
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
X-List-Received-Date: Mon, 26 Feb 2018 07:19:28 -0000
Content-Type: text/plain; charset="UTF-8"

This is regressing kmod builds

ERROR: kmod-25+gitAUTOINC+aca4eca103-r0 do_package: QA Issue: kmod:
Files/directories were installed but not shipped in any pack
age:

/mnt/a/oe-build/build/tmp/work/aarch64-bec-linux/kmod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot/usr/share/bash-completion/completions/kmod

as you can see its stll carrying the sysroot prefix into DESTDIR

and this is how kmod is asserting for bash-completion dir

with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir bash-completion)

it was working fine with 1.4.0

On Mon, Feb 19, 2018 at 12:36 AM, Maxin B. John <maxin.john@intel.com> wrote:
> pkgconf improved compatibility with freedesktop.org pkg-config.
> So, we don't need to unset PKG_CONFIG_SYSROOT_DIR in wrappers.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in         | 4 +---
>  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in       | 1 -
>  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper         | 9 ---------
>  .../pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb}               | 4 ++--
>  4 files changed, 3 insertions(+), 15 deletions(-)
>  rename meta/recipes-devtools/pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb} (95%)
>
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
> index 4fc9b0a..d4ac71d 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
> @@ -5,7 +5,6 @@
>  if [ "pkg-config-native" = "`basename $0`" ] ; then
>         PKG_CONFIG_PATH="@PATH_NATIVE@"
>         PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> -       unset PKG_CONFIG_SYSROOT_DIR
>  else
>         # in this case check if we are in the esdk
>         if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
> @@ -16,9 +15,8 @@ else
>                 if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
>                         PKG_CONFIG_PATH="@PATH_NATIVE@"
>                         PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> -                       unset PKG_CONFIG_SYSROOT_DIR
>                 fi
>         fi
>  fi
>
> -pkg-config.real "$@"
> +pkg-config "$@"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> index 9ed30a0..c2e86e5 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
> @@ -1,6 +1,5 @@
>  #! /bin/sh
>
>  PKG_CONFIG_PATH="@PATH_NATIVE@"
> -unset PKG_CONFIG_SYSROOT_DIR
>
>  pkg-config "$@"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> index 695f349..fc9b488 100755
> --- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> +++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
> @@ -4,13 +4,4 @@
>  # Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
>  # License: MIT (see COPYING.MIT at the root of the repository for terms)
>
> -for arg; do
> -    case "$arg" in
> -        --variable|--variable=*)
> -            # pkg-config doesn't sysroot-prefix user variables
> -            unset PKG_CONFIG_SYSROOT_DIR
> -            ;;
> -    esac
> -done
> -
>  exec pkgconf "$@"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
> similarity index 95%
> rename from meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb
> rename to meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
> index 48ba598..ea7b666 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
> @@ -21,8 +21,8 @@ SRC_URI = "\
>      file://pkg-config-native.in \
>      file://pkg-config-esdk.in \
>  "
> -SRC_URI[md5sum] = "c509c0dad5a70aa4bc3210557b7eafce"
> -SRC_URI[sha256sum] = "1d112ff35dad516ffbfbdb013df3a035140618fe7632ec44ffa894a9c713301b"
> +SRC_URI[md5sum] = "678d242b4eef1754bba6a58642af10bb"
> +SRC_URI[sha256sum] = "bab39371d4ab972be1d539a8b10b6cc21f8eafc97f617102e667e82bd32eb234"
>
>  inherit autotools update-alternatives
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

