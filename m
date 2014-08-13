Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 18F4970BA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:47:38 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so3280536igd.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6eguJOY0kHuolx7tgZCKTLg71o11barXN6bOobZ/y4E=;
	b=x8yvcR9nzJl6Ta5P2k2ZyHUbxWos5iqG95n73MCg5FkwNv0YWi1JoJx2xcPkUiFJ5x
	eIGPykcwPCVYJQbiOJwYDq6AtV1J0PMFxSxiqLIPVxr2D19T2AtaCHKu1QOCGcS0Rowv
	UTdS7LJTZFaAXhe0ZIi0vRnG361kdXSO/xZITrfG1jV7n7avgE9zO8Lk3TAquHHdcnrg
	tybNsY5azZH4C+zY5nomAhk7wyCwJ7WTrup4RIw8heE97eqwSzH3EoECjZ/vBUB+NhnD
	HvVyB4yzNibGcEcuq1SvbqeYSuwqZ5c5SPXqEIopTaNmfLnF1GSPIZ/+xA0vib1pCPFr
	2BWA==
X-Received: by 10.50.119.105 with SMTP id kt9mr12005822igb.20.1407970059811;
	Wed, 13 Aug 2014 15:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:47:09 -0700 (PDT)
In-Reply-To: <1407963825-20257-5-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
	<1407963825-20257-5-git-send-email-pab@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:47:09 -0700
Message-ID: <CAMKF1sodR=UnQi8+eZ7Bk+J45E2_bZ3nZ7Hoytq1eHyYtwiWtg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gcc: remove outdated configuration option
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
X-List-Received-Date: Wed, 13 Aug 2014 22:47:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:03 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> --enable-libunwind-exceptions was removed from gcc at release 3.4.3
> about ten years ago.
>

This is ok

> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 -
>  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 -
>  meta/recipes-devtools/gcc/gcc-runtime.inc        | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 7da5058..d8868bb 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -161,7 +161,6 @@ SYSTEMLIBS1 = "${target_libdir}/"
>  EXTRA_OECONF += "--enable-poison-system-directories"
>
>  EXTRA_OECONF += "\
> -    --disable-libunwind-exceptions \
>      --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
>      --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
>  "
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 64d0652..4cdb55f 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -20,7 +20,6 @@ EXTRA_OECONF_append_sh4 = " \
>  "
>
>  EXTRA_OECONF += "\
> -    --disable-libunwind-exceptions \
>      --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
>      --with-system-zlib \
>  "
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index e7d938d..7ce84f1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -8,7 +8,6 @@ EXTRA_OECONF_PATHS = "\
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
>
> -EXTRA_OECONF += "--disable-libunwind-exceptions"
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
> --
> 1.8.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

