Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.10035.1625594592016963694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 11:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EKUSyABf;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id l24so29212032edr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmgIIc7xodztNsUFprGx0QYRLsmxuBu73Z6zX02jqTc=;
        b=EKUSyABfmtHS0yvao25wg+h/MOOOh1gSme25OUA+Lai4o47dgwAsvA0+8f3jmxpmP7
         0XelWWxHhVR36cfsfVOV3OAgvHIHT/DWu9OEwWK3jJfyumIkejFrBq9Wga2FSiZnLx1q
         M6eMr5Gy3idHCxzxiD4Bska4jzwCurqHvKjc/Eqq5f3pGWKyN2UDTSFjiwoU25U07U8x
         p4hpiCwh85Bn9U77gzN5dUe9atq5IZCqFeZdS2xI4tUUFULqVzx+EmEV6YTcB2FtItaj
         7mVIJc8rLJwYzMbZZTVEF9RmSn/YrqB8JB013y32frq/WEXKlpXluR4hTU13gs/AMOT0
         vS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmgIIc7xodztNsUFprGx0QYRLsmxuBu73Z6zX02jqTc=;
        b=Ab2oLuGSNfhNIo7oE3cjCAjBUn6i837CqHVrdvUAt62WBdMWUYYWk/5OeMGOXqXEgE
         47MYIjtynzA+6Axx7+jm19rHDt6hxLI8aeYhH7ZA2uErgsSgEhfsXFZLRNfnMbcwAjUd
         CyPW8q+ob897TDqXMNh7kkXXqgqiPANrw2W5E3KdMV2qrFU6EcFGfhjFAsuYUCxJn6xz
         fij+untevTul9QcpIQoyWfny5O7r8QLFCZA70aMMV1Ny0OAf9D2dMpCCHVmRmfwj4aUW
         Am0U9EIc8jYQtSZ8CF/WMDnmzV6ua+Mqo360oo6GG5d9GnEVxetA+AR8HEdAJX19NBsb
         spaQ==
X-Gm-Message-State: AOAM533gpelyxHxIaU1hB8qcqq19JlJKf5N9z/5r4JXK7NUKmIWu0zo9
	Xi+XVgkHLr6uDDgjbBoN0+Gf35hT/44isGBtL9w=
X-Google-Smtp-Source: ABdhPJxr/0Kg2iW0Qc7bq/V9TvW076vVwQ3GLcRNN5Onq0KL+tyE7te7NMXDpwlIqMA96VYK3AsNVhDJvuEmctsNrmU=
X-Received: by 2002:a05:6402:1d25:: with SMTP id dh5mr25214047edb.355.1625594590435;
 Tue, 06 Jul 2021 11:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
 <781bf3c1a48245f2a1cfc4ba66bf085c348fa9ae.1625238537.git.bruce.ashfield@gmail.com>
 <CAMKF1sp3+vJCWEJ3EegBhx10RaQGLREP1weFtjqVZr0mOWBBsg@mail.gmail.com>
In-Reply-To: <CAMKF1sp3+vJCWEJ3EegBhx10RaQGLREP1weFtjqVZr0mOWBBsg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Jul 2021 14:02:58 -0400
Message-ID: <CADkTA4MAdV_jE9kVkZvdYV2T9R9myPDcx5h8GK4Vd4rSLFdmCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] linux-libc-headers: update to 5.13
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 1:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Bruce
>
> On Fri, Jul 2, 2021 at 8:14 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Bumping the libc-headers to match the latest OE core reference
> > kernel.
> >
> > We refresh one of the musl patches to udpate to the 5.12+ context of
> > the header, but otherwise everything is unchanged.
> >
>
> This is primarily going ok, I see one failure however with keepalived here
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1388
>

I launched a build for keepalived, I'll see if the issue reproduces here.

Were you going to debug, or did you want me to have a look ? (We've
both looked at this at the same time in the past, and that's not a
great use of time).

I'll just start looking at a version bump, since that is the easiest
place to start.

Bruce

>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc          |  2 +-
> >  ...3-remove-inclusion-of-sysinfo.h-in-kernel.h.patch | 12 ++++++------
> >  ...bc-headers_5.10.bb => linux-libc-headers_5.13.bb} |  5 ++---
> >  3 files changed, 9 insertions(+), 10 deletions(-)
> >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.10.bb => linux-libc-headers_5.13.bb} (80%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > index c6e5ac61d7..68e5d848ba 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> >  BINUVERSION ?= "2.36%"
> >  GDBVERSION ?= "10.%"
> >  GLIBCVERSION ?= "2.33"
> > -LINUXLIBCVERSION ?= "5.10%"
> > +LINUXLIBCVERSION ?= "5.13%"
> >  QEMUVERSION ?= "6.0%"
> >  GOVERSION ?= "1.16%"
> >  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > index b5c4e1750e..b0e7014138 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > @@ -13,17 +13,17 @@ Upstream-Status: Submitted
> >   include/uapi/linux/kernel.h | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > -Index: linux-4.8-rc4/include/uapi/linux/kernel.h
> > +Index: linux-5.12.11/include/uapi/linux/kernel.h
> >  ===================================================================
> > ---- linux-4.8-rc4.orig/include/uapi/linux/kernel.h
> > -+++ linux-4.8-rc4/include/uapi/linux/kernel.h
> > -@@ -1,7 +1,9 @@
> > +--- linux-5.12.11.orig/include/uapi/linux/kernel.h
> > ++++ linux-5.12.11/include/uapi/linux/kernel.h
> > +@@ -2,7 +2,9 @@
> >   #ifndef _UAPI_LINUX_KERNEL_H
> >   #define _UAPI_LINUX_KERNEL_H
> >
> >  +#ifdef __GLIBC__
> >   #include <linux/sysinfo.h>
> > + #include <linux/const.h>
> >  +#endif
> >
> > - /*
> > -  * 'kernel.h' contains some often-used function prototypes etc
> > + #endif /* _UAPI_LINUX_KERNEL_H */
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > similarity index 80%
> > rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> > rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > index d6a4d5aa61..251d00440d 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > @@ -14,6 +14,5 @@ SRC_URI_append = "\
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> > -SRC_URI[md5sum] = "753adc474bf799d569dec4f165ed92c3"
> > -SRC_URI[sha256sum] = "dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43"
> > -
> > +SRC_URI[md5sum] = "76c60fb304510a7bbd9c838790bc5fe4"
> > +SRC_URI[sha256sum] = "3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9"
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
