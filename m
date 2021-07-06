Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.9772.1625593400018246075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 10:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=POKxn745;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id g4so20996038qkl.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gB7rSNDBXeRTyK9b/mpci4PKcaDGpTzbZrEERJSDf2A=;
        b=POKxn745N83caAM/XqcmkbYBQ/YFTJBSZuTr9kfd5AN3wiEiYFLoIETYdbf+6/A4Kc
         afFwdlNuR3voO55Pr47b7CdaJIUpZMNGiEBsqANRS6SyjVU7F1wPJczbEI16Me2XRoQ3
         1ogEIOodl749hL+MhKYrS0MC+35d+ZWJrDJ15oCUx2q1awx+3OgvIcSPrMGlasqXN8W0
         z7wnIdga+nMyFiiES+onkhFOrDj/dtlyj3wxtuWej9D8x9QqWcBhCBknly9xnVzrBPDw
         qh1A6ZDKiJulZLNKWt2z0d8WbwUWeg5luNU35YOCD6Kafu2sStEB+kvM8Gu80ZrDV9lg
         qw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gB7rSNDBXeRTyK9b/mpci4PKcaDGpTzbZrEERJSDf2A=;
        b=ts2GkP8d1+UMmNO2mwpk5pDE+wF5UuSbnNW3z8RRYB1oF5eSNt5TWJgRTu2vbiF/mj
         d+4J6+Sz9wbfnbz2WY9i4s7zFCAs2qzvMjtxjuEGhTlS+gcRyPcgdGMvIW3XrLjwXdHq
         vTQCrcMg1uyCYFW8zJ2UaoOuzG86wu4G5BX2mXLsDJkFdyL2IGRFiimDVmcIJxDEVALd
         n1RAZ1ui7EgATZHH+jthGpykigELFHLFc9YA05hvU7n6MYzYX+O25CJCwie8hQzoS2z8
         N3DKsKnHwxsqZ0cAEtsb9NjyLIAbfFlfuXoiCa3p43PiWvcIsFJH3T4jh2OfMKpwHhs1
         cfzQ==
X-Gm-Message-State: AOAM533PjiGqhInNhEm2nm4e21/GVjTilqhrDmlOKpkQP7VCQAxpLs+1
	troPuANqeGP9c4H58YJQ6ggsXBBypNyF3gWDCjk=
X-Google-Smtp-Source: ABdhPJyDWGR8Fa22c+nhXvX9Dw7P80ovvaPp3RiTagxCLWdSjaBMAfC8CDpU+tqrx4uVIlag675h9ouv1ECvsIkSBK8=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr20985431qkb.146.1625593399161;
 Tue, 06 Jul 2021 10:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625238537.git.bruce.ashfield@gmail.com> <781bf3c1a48245f2a1cfc4ba66bf085c348fa9ae.1625238537.git.bruce.ashfield@gmail.com>
In-Reply-To: <781bf3c1a48245f2a1cfc4ba66bf085c348fa9ae.1625238537.git.bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 10:42:53 -0700
Message-ID: <CAMKF1sp3+vJCWEJ3EegBhx10RaQGLREP1weFtjqVZr0mOWBBsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] linux-libc-headers: update to 5.13
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bruce

On Fri, Jul 2, 2021 at 8:14 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Bumping the libc-headers to match the latest OE core reference
> kernel.
>
> We refresh one of the musl patches to udpate to the 5.12+ context of
> the header, but otherwise everything is unchanged.
>

This is primarily going ok, I see one failure however with keepalived here

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1388


> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc          |  2 +-
>  ...3-remove-inclusion-of-sysinfo.h-in-kernel.h.patch | 12 ++++++------
>  ...bc-headers_5.10.bb => linux-libc-headers_5.13.bb} |  5 ++---
>  3 files changed, 9 insertions(+), 10 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.10.bb => linux-libc-headers_5.13.bb} (80%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index c6e5ac61d7..68e5d848ba 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.36%"
>  GDBVERSION ?= "10.%"
>  GLIBCVERSION ?= "2.33"
> -LINUXLIBCVERSION ?= "5.10%"
> +LINUXLIBCVERSION ?= "5.13%"
>  QEMUVERSION ?= "6.0%"
>  GOVERSION ?= "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> index b5c4e1750e..b0e7014138 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> @@ -13,17 +13,17 @@ Upstream-Status: Submitted
>   include/uapi/linux/kernel.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> -Index: linux-4.8-rc4/include/uapi/linux/kernel.h
> +Index: linux-5.12.11/include/uapi/linux/kernel.h
>  ===================================================================
> ---- linux-4.8-rc4.orig/include/uapi/linux/kernel.h
> -+++ linux-4.8-rc4/include/uapi/linux/kernel.h
> -@@ -1,7 +1,9 @@
> +--- linux-5.12.11.orig/include/uapi/linux/kernel.h
> ++++ linux-5.12.11/include/uapi/linux/kernel.h
> +@@ -2,7 +2,9 @@
>   #ifndef _UAPI_LINUX_KERNEL_H
>   #define _UAPI_LINUX_KERNEL_H
>
>  +#ifdef __GLIBC__
>   #include <linux/sysinfo.h>
> + #include <linux/const.h>
>  +#endif
>
> - /*
> -  * 'kernel.h' contains some often-used function prototypes etc
> + #endif /* _UAPI_LINUX_KERNEL_H */
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> similarity index 80%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> index d6a4d5aa61..251d00440d 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> @@ -14,6 +14,5 @@ SRC_URI_append = "\
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>
> -SRC_URI[md5sum] = "753adc474bf799d569dec4f165ed92c3"
> -SRC_URI[sha256sum] = "dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43"
> -
> +SRC_URI[md5sum] = "76c60fb304510a7bbd9c838790bc5fe4"
> +SRC_URI[sha256sum] = "3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9"
> --
> 2.19.1
>
>
> 
>
