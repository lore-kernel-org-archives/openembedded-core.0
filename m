Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 278F16D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 20:14:55 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id f88so9654589uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qXYUev7R5mI25VTn2B4s0bfcv/HSB45eWF7IRRfpR1Y=;
	b=RUHJPyM9jB0zridaulJvBOZi/e4AVBfQh/uZJudzdlFvJ2ntHcaht3T/rcYbNj6VxP
	qZ0rGHW2HYhmr9JaadZH06M2p7mMQ3ZTgqqFMibF8AslKuePeyMa6aspS2/Ctth2xVRk
	+e1gC2kntvI8EDCgHUI9wrX2xUX0IhdQWrGYZK5cdETYiMBlDpkHYvq3LculVs+vL3Aj
	aVWk0ppdXGVFKkwR7bUBGSTrGXw4m/d7jh30MpbLHBnDW255GI47UEHZKHt1SOfS2o60
	xfeNhRMwfMWsERyKe3aTA/tOc7OMM5txirPVyX2bvQYni1k2jToWrjJIcJh+UEcYL/mN
	I9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qXYUev7R5mI25VTn2B4s0bfcv/HSB45eWF7IRRfpR1Y=;
	b=r6DCmVwzc2PExSZnsl4XM2n5QeQsvR4fxbdvZ1UcICpTg/gLhaMxoFNg6JJP5dg0Dh
	2NveDIh+jio1RI2ojmBTRocrn7Ut4sMLEJmZhCFKkKG0dtcNr8FQPKWfWlDmHWAd9Na6
	/6lN01HDMrXOHuSVhbYIVWWVT9B2QnGn+xXhGv9Y3doqTPhzlWENnosw+BWPwdl1BO6l
	zTxpwvlNV5SrToWmlaH/WM66P0HyAibvDy+CMOzpngbBwcP0Qbft71IStgkDayoF9Tmb
	JupzSZ5ORTHww6Sqfg+K/hFOdksDjUJI1ZzD+udyOjKgx7epQxJsq7EOLdiH4g5gnu6D
	HubA==
X-Gm-Message-State: AHQUAub+KJSTIVXIJgUr1/sHHxfsFqodQ0MacUtcu9g3DPc+aTXMMKvs
	Vegk6kDMJSO5rkkb3zi/IKbMP/ExLFMb5cu39UE=
X-Google-Smtp-Source: AHgI3IZD+I7tUsoYBkQxxFvYAeCzEoohbOzr/K4qE+KwNTxd0qUcliWp3/Sb+0I94AhC8JvsvA2cu3uGbOmZmJ+d/Uo=
X-Received: by 2002:ab0:4222:: with SMTP id i31mr10376460uai.47.1551125696839; 
	Mon, 25 Feb 2019 12:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20190225185954.15628-1-raj.khem@gmail.com>
In-Reply-To: <20190225185954.15628-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 25 Feb 2019 12:14:45 -0800
Message-ID: <CAJ86T=W+9YVOKOQ28x0_Fm1RKocKZf8mPdqN1TvbveHiAN7reA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Mon, 25 Feb 2019 20:14:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 11:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> After eglibc was merged into glibc, Kconfig support was also dropped so
> these libc features therefore are not effective anymore and can be
> removed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 10 +---------
>  meta/conf/local.conf.sample.extended            | 16 ++--------------
>  2 files changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 76edff6480..35da7f10e1 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -11,15 +11,7 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
>  LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
>
>  DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> -DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \

There are a lot of recipes which check the ipv6 distro feature. Those
recipe should probably be updated before this is merged.

> -                                       libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> -                                       libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
> -                                       libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> -                                       libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> -                                       libc-posix-wchar-io"
> -DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
> +DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
>
>  IMAGE_FEATURES ?= ""
>
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> index 010bf6ca6f..91e321047f 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -24,22 +24,10 @@
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example.
>
> -
> -# glibc configurability is used to reduce minimal image's size.
> -# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
> -# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
> -# and DISTRO_FEATURES definitions to local.conf to enable the options.
> -#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> -#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \
> -#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> -#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> -#               libc-posix-wchar-io"
> -
> -#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
>
>  # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
> -#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
>
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
>  # packages at build time using qemu-native. Disabling it (by setting it to 0)
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

