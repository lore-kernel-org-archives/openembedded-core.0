Return-Path: <jacob.kroon@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id B1AF27C60D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:41:37 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r136so8504797iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NvME39mI+G5pQAEXwBlScKjSphg2Z2fMmmjXn7GDXSU=;
	b=jP2gX+5e8tWndqikve2MJ6wUsKdsc+6Fwwi/fIVfyU3pp7iZr+ZsjzWildUpBOdsm8
	IMnsohm3v023lFN3YsYHj/XuAToigb3Lf/mRy0tbWvKCEqy1qtRr7iLzPKiUkiF3TvYz
	jjOzqL96bu0v0wC0cfoZ+G8RfogMkvP0mAgEvcqKcZipZ7OU6d/pa45KOkWLfC5ejgMm
	43aDeGpUZTv8sWWCLHVHrNsut4XNyIJlTIm63lBN0uEk1QAtCC7veG7gQZHr6RYPhviW
	iI1lLdZ9Eey7w9gk7HqIeRmk3GcyodFPkP3Hwf4FaDtCyV6wNzU1PJfHUAe9cXFle3ED
	fjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NvME39mI+G5pQAEXwBlScKjSphg2Z2fMmmjXn7GDXSU=;
	b=osu0GzY8h786xEpyp4HYfwWIPmHooVrZO+FRqF+W+hxkLyd6nQ3wrWQYT+AmJrD8dc
	+WkMXSIHV/VHkx3XzsJGoC/mcO7sAZFJHjkE7hYvFoXV4q2MfUQ7mVauiBv6tQc2bZc3
	lxwJZIrv92284DVq5u0lPKZfKyhIotEyMCgpjkiT2VIVBukZHG4f4pH1ILnYBeF1uxey
	N6HMnN24pH0frnxK6mUMM8/SOfMIvGucilR2LU73baQe+X1hwFmaLpgbZiUKJs89YpTK
	UldA286w8lh1laWeYV7NY30YMWJbCnXEHIBJ20F3tBcqV8XgjWUkoNe7U3tsRz1gOkZV
	v1ww==
X-Gm-Message-State: APjAAAW/sdAbd36y8mRVBsD+lrQqAdU+pg9rjCcwET8VovapLYUde/ua
	AcgIUhp0CCGZ1ASP3z8yv/mVLl6PKod6jflovy8=
X-Google-Smtp-Source: APXvYqxhP9CS193Oct8YRrYssL2si6P8ucwFccM4mHsH0ZKqeKOdf6srwaH868M6tNh7r+90TIiIpVAnFMOIbOQQ4Z8=
X-Received: by 2002:a5e:d917:: with SMTP id n23mr5978748iop.182.1551123698608; 
	Mon, 25 Feb 2019 11:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20190225185954.15628-1-raj.khem@gmail.com>
In-Reply-To: <20190225185954.15628-1-raj.khem@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 25 Feb 2019 20:39:45 +0100
Message-ID: <CAPbeDC=NPHN6RYjOOi2-YabvmbCN6UJHGAm2TZskr_ZgzkNDSg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 25 Feb 2019 19:41:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 8:00 PM Khem Raj <raj.khem@gmail.com> wrote:
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

Maybe remove DISTRO_FEATURES_DEFAULT too ?

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

