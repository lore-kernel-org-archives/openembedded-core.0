Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.13266.1625608915472360944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 15:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vfNwJzKJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id g8so552338qth.10
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ln/tULHGkbltjNUiRw4W2JsqkFNm74XD/EWurVjP5cQ=;
        b=vfNwJzKJCtOZ9B9PVuwz4ofUiQ2W0YYhBk782PTz/p2hvCciAz/+ptxHM7xA1Rfj4Q
         1qyUol8xjLgYKcwcr8Oz2CE9lRk9oAVRCP/HEPP8Icnjp8mihpzu0sFpkhe0vLzFRRZr
         3lF+ElzKAkf0GHSA0P1q4sxx82HQCWxiJIVscdpIlbjX36hWEWtkWv8ZcgTO74kw30c8
         qksOtV8n1AIdBvbiA7w200v/ERJY43UbSEUd8evvV6jd9FCjRX4p9McDc3zM5OKExFvw
         5F02JE6WHnpuNo5hQlUfDfHj20gsltf6++UCNMJf6Is4h0eBom0KSTh7F6elOIzfje8C
         tjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ln/tULHGkbltjNUiRw4W2JsqkFNm74XD/EWurVjP5cQ=;
        b=dqoLBe+BsJJq+DBuXD1BdFLetlwVHjzGW+c84gFiVtLWbHuA2wnlbSqkQCM8gq2aNn
         dcu/sDMfml2X4DmAU6iAeZyzXcJN+1oKAUqzf8VcXYw81uWNiwtAfpCGXAIqPYOwnpNo
         sInu8n/zBWM0R+4NWmmxsxXJLpdjOsP0sox4OQaqlxvoDEQke6+2ZMhp0AVTgEegbkmW
         qBlZMPHhZgnUAKzXERPJvlQPFtv4E9kI2cx0eaCsxmKATB7GC1ubAmvhRw5oeRdunSWF
         sK/1MJzMYTc/pkQ3eCNZMvMcNHlXrfgMeFnO8sxrgv1LeA4KTbWDdbtrqFS5mf1ZUWhQ
         5Z9w==
X-Gm-Message-State: AOAM5308oq0uu/R8+ExlJDwqTEMNPBo7wp19zQOA6Q3TkYqYdMSgwdVR
	USCNDhToaKp7byoeAVTKNjLTwSnYho6PMLvMEQA=
X-Google-Smtp-Source: ABdhPJx7YxHeeSL6MkqUXED4IxD8dn8I1pDG5Xru9QbkCAjz1Ka0qqvGdNuIv4ETbxuwKkEQ///5cTx2P64D6x8QKNE=
X-Received: by 2002:ac8:544:: with SMTP id c4mr19529360qth.299.1625608914564;
 Tue, 06 Jul 2021 15:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
 <781bf3c1a48245f2a1cfc4ba66bf085c348fa9ae.1625238537.git.bruce.ashfield@gmail.com>
 <CAMKF1sp3+vJCWEJ3EegBhx10RaQGLREP1weFtjqVZr0mOWBBsg@mail.gmail.com> <CADkTA4MAdV_jE9kVkZvdYV2T9R9myPDcx5h8GK4Vd4rSLFdmCA@mail.gmail.com>
In-Reply-To: <CADkTA4MAdV_jE9kVkZvdYV2T9R9myPDcx5h8GK4Vd4rSLFdmCA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 15:01:28 -0700
Message-ID: <CAMKF1sqev2mhPtZx-YF+YXnc3E9ZnOycCr1ptS0FXZe4o-3GpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] linux-libc-headers: update to 5.13
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 11:03 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Jul 6, 2021 at 1:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Bruce
> >
> > On Fri, Jul 2, 2021 at 8:14 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Bumping the libc-headers to match the latest OE core reference
> > > kernel.
> > >
> > > We refresh one of the musl patches to udpate to the 5.12+ context of
> > > the header, but otherwise everything is unchanged.
> > >
> >
> > This is primarily going ok, I see one failure however with keepalived here
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1388
> >
>
> I launched a build for keepalived, I'll see if the issue reproduces here.
>
> Were you going to debug, or did you want me to have a look ? (We've
> both looked at this at the same time in the past, and that's not a
> great use of time).
>
> I'll just start looking at a version bump, since that is the easiest
> place to start.

thats good. If it does not fail for you, it means its due to glibc
2.34 and I can take care of that

>
> Bruce
>
> >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/conf/distro/include/tcmode-default.inc          |  2 +-
> > >  ...3-remove-inclusion-of-sysinfo.h-in-kernel.h.patch | 12 ++++++------
> > >  ...bc-headers_5.10.bb => linux-libc-headers_5.13.bb} |  5 ++---
> > >  3 files changed, 9 insertions(+), 10 deletions(-)
> > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.10.bb => linux-libc-headers_5.13.bb} (80%)
> > >
> > > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > > index c6e5ac61d7..68e5d848ba 100644
> > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> > >  BINUVERSION ?= "2.36%"
> > >  GDBVERSION ?= "10.%"
> > >  GLIBCVERSION ?= "2.33"
> > > -LINUXLIBCVERSION ?= "5.10%"
> > > +LINUXLIBCVERSION ?= "5.13%"
> > >  QEMUVERSION ?= "6.0%"
> > >  GOVERSION ?= "1.16%"
> > >  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > > index b5c4e1750e..b0e7014138 100644
> > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > > @@ -13,17 +13,17 @@ Upstream-Status: Submitted
> > >   include/uapi/linux/kernel.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > -Index: linux-4.8-rc4/include/uapi/linux/kernel.h
> > > +Index: linux-5.12.11/include/uapi/linux/kernel.h
> > >  ===================================================================
> > > ---- linux-4.8-rc4.orig/include/uapi/linux/kernel.h
> > > -+++ linux-4.8-rc4/include/uapi/linux/kernel.h
> > > -@@ -1,7 +1,9 @@
> > > +--- linux-5.12.11.orig/include/uapi/linux/kernel.h
> > > ++++ linux-5.12.11/include/uapi/linux/kernel.h
> > > +@@ -2,7 +2,9 @@
> > >   #ifndef _UAPI_LINUX_KERNEL_H
> > >   #define _UAPI_LINUX_KERNEL_H
> > >
> > >  +#ifdef __GLIBC__
> > >   #include <linux/sysinfo.h>
> > > + #include <linux/const.h>
> > >  +#endif
> > >
> > > - /*
> > > -  * 'kernel.h' contains some often-used function prototypes etc
> > > + #endif /* _UAPI_LINUX_KERNEL_H */
> > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > > similarity index 80%
> > > rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> > > rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > > index d6a4d5aa61..251d00440d 100644
> > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
> > > @@ -14,6 +14,5 @@ SRC_URI_append = "\
> > >
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > >
> > > -SRC_URI[md5sum] = "753adc474bf799d569dec4f165ed92c3"
> > > -SRC_URI[sha256sum] = "dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43"
> > > -
> > > +SRC_URI[md5sum] = "76c60fb304510a7bbd9c838790bc5fe4"
> > > +SRC_URI[sha256sum] = "3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9"
> > > --
> > > 2.19.1
> > >
> > >
> > > 
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
