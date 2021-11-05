Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF195C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:08:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.8565.1636132118978145104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eu055lYs;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id bm28so9327606qkb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vX7N7QC0cuZHba5j/rnBjIZ+23Kz8Remvg8LsnOX3Ec=;
        b=eu055lYsxzav/EZ0pbOfFvKZldWo7sSobi6qeb4+otgRST8jOE4wBg6v28cjGCPKhf
         nL7kZymviANRRlZ/wEc1YYUu4sRMD1IkndPzsUFTd0l1Y3KLEbvvo75qQ3Jg/Hi8nnEy
         aBmLqytfI2TRn/OSoSjR5Hcjtr5eunA988FjN1l7vxQTs99vmpWlxBLraxFwT6LySfQ7
         Mk+psC0Si3hSAiggtCugosYs1ylXisVNXSF8veBJmt/jhydqNs8XnnKeiSYqRrMPSOaW
         UTSA78EyO7DkrekeAtZhlvkZUoqMePWbuXx9dmhTsxSm6lt0HFaRDE0NNvjElz/1VW0t
         n9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vX7N7QC0cuZHba5j/rnBjIZ+23Kz8Remvg8LsnOX3Ec=;
        b=uLjz7Nqkhv/pNQnKMp2vX/a8MwDkxazwjgYzMCOrPJSQ27i4yxxbFMDE5yRdbfoqf0
         2xoAlgCLUmqg59yezOWWnoS0zARgK7ETUfQb6888BPMoR8kz1JhZRTeMEuQRqFZipp4s
         ggNhgrDHTZ1/fp0yUhRrKgMQeO3ZOM84Pp3W2w6NaZJUdNLN5ZyPcAKnNd1oQ2QvP9OR
         tbFZ3bTIRt5L/nx0tPwgUEwsLqYXOaC/pljoRv6TXjNWjEXxw1YDxoTrLIzd/0QuGEd6
         /HDGlw4erxwwZ7MBSDEkQ3BaCasu1iLHP1jZobU3Zij0YXQgloc4FPo5lr5BcurxuCQ2
         0Ijg==
X-Gm-Message-State: AOAM531i+y+KpkL5/r6iOLEXkZ2Pq3YZLOO7RvIoaGf9RMgWvUc4uJs1
	8FuCLytb031tZf5iHHcqewL/94AHL3Xov8Cz/L4=
X-Google-Smtp-Source: 
 ABdhPJwy06WlMoWrfubGJ9YpXdrxsimhjA6zzt+Hv9CNjJLw9x2hGntTY+DigQnIMkCYIxaYXSYH6A0HDCkS/VfMKkU=
X-Received: by 2002:a37:6107:: with SMTP id v7mr16860265qkb.105.1636132118073;
 Fri, 05 Nov 2021 10:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2021 10:08:12 -0700
Message-ID: 
 <CAMKF1soD0m7QB3Yn3dSK1FZRUPiQ=BWQdmMFgjXn-2XgZN=Efw@mail.gmail.com>
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157914

Couple of failures in meta-openembedded not too bad

https://errors.yoctoproject.org/Errors/Build/135189/

On Fri, Nov 5, 2021 at 5:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Nov 5, 2021 at 7:18 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > No patches needed refreshing or removal, so we just update the
> > > SRC_URI and pick up the latest uapi / kernel headers.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/conf/distro/include/tcmode-default.inc                   | 2 +-
> > >  ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> > >
> > > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > > index 58f49800c4..86a6b50433 100644
> > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> > >  BINUVERSION ?= "2.37%"
> > >  GDBVERSION ?= "10.%"
> > >  GLIBCVERSION ?= "2.34"
> > > -LINUXLIBCVERSION ?= "5.14%"
> > > +LINUXLIBCVERSION ?= "5.15%"
> > >  QEMUVERSION ?= "6.1%"
> > >  GOVERSION ?= "1.16%"
> > >  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > similarity index 81%
> > > rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > > rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > index 282c04d79c..588cc3acd1 100644
> > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > @@ -14,7 +14,7 @@ SRC_URI:append = "\
> > >
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > >
> > > -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
> > > -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
> > > +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
> > > +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
> > >
> > >
> >
> > Looks like there is a musl issue with the ipx.h header in ppp:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313
>
> ahah. Something my a-quick build didn't hit.
>
> I'll fire up a build here and see how we work around ipx.h going away.
>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

