Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB0FC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 12:46:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.4929.1636116417576513385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 05:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JbV4CvSr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id r12so32637949edt.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+dD53iYHx3ther44sNKaalVKgE8nezhFiTuJGaeaXY=;
        b=JbV4CvSrQ/ryBexc9DeTvroEZNscrvkA79JW03hmcHUhObHByu6iVGedv3VXq2PIOI
         oEnD+zuabTQA+pOEGQEnw76s/lnAZVjDJOr4GKSE3ia1zC1Ex7H5Of16MTfLvsNkEaPA
         u/RxPFWhHtDkQwq+ra6xFWsSJAgg9q6C/dpdR7uOLl8+kSAvy0UGiE+qs5T3ngbTvXkv
         XjttDb025gXoxsLz6/jB3rJTQw7jGrrOGWdkL/PXnAsyfCGKXu4p7Xm+SjJJRXpVvyro
         mxBXuxI4jnG1jyL84lNWS9wmJUa8NfJU+qctJrR/72N6PrHxSV8DsX8vbKa7plGV4h61
         2eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+dD53iYHx3ther44sNKaalVKgE8nezhFiTuJGaeaXY=;
        b=TXh5WIJxlwm/vbIjObyUApgI825aqSwqnUpPHZ49ObZr/RMkI3PZtU/Y5iLRDalDqS
         KST24OvMNPzIRkhUg5E1BjldcCPdgXMMpaRXkJPuMYW1Ux5dthxLRxnxYOejuXz5OaGE
         Ciwpx7mQpfWvVjxhdbx34unPzJl67zOLM/oNs+wL9aGPUOiABU+FxEwGeLekqAR6AQ/+
         vM2bQ7dRNpyW54EBfGEGYVFEPh7Nh8uI71aTd6QWe5tVpDhv6+0rx+NqsaNaAUvrJSgu
         YR4qhoPvxtfwXqi2T/Wa20OrncnouGAvZ2/FupiUz3L2PVVpXdlhbUJzyc7AwXxWoFqH
         rRYA==
X-Gm-Message-State: AOAM532T8Y7gPxJ0sVh3yst5TihsHOw7e8GnvC3cnHZ6PWQoI5Rvdrbk
	7IS4GkI/+w872vwbzTVtNliTgI6/TyZ6oafFohM=
X-Google-Smtp-Source: 
 ABdhPJx6ggtjGiOXn+JUkMAng5wHH6qcI9y7XCGOK/dDJcDO4ASoYp4d14Zfm6SGKigNIuBxakh2WSv1ZLoiGWNSl6A=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr7220202ejt.35.1636116415857;
 Fri, 05 Nov 2021 05:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
In-Reply-To: 
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 08:46:44 -0400
Message-ID: 
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 12:46:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157891

On Fri, Nov 5, 2021 at 7:18 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > No patches needed refreshing or removal, so we just update the
> > SRC_URI and pick up the latest uapi / kernel headers.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc                   | 2 +-
> >  ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > index 58f49800c4..86a6b50433 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> >  BINUVERSION ?= "2.37%"
> >  GDBVERSION ?= "10.%"
> >  GLIBCVERSION ?= "2.34"
> > -LINUXLIBCVERSION ?= "5.14%"
> > +LINUXLIBCVERSION ?= "5.15%"
> >  QEMUVERSION ?= "6.1%"
> >  GOVERSION ?= "1.16%"
> >  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > similarity index 81%
> > rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > index 282c04d79c..588cc3acd1 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > @@ -14,7 +14,7 @@ SRC_URI:append = "\
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> > -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
> > -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
> > +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
> > +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
> >
> >
>
> Looks like there is a musl issue with the ipx.h header in ppp:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313

ahah. Something my a-quick build didn't hit.

I'll fire up a build here and see how we work around ipx.h going away.

Bruce

>
> Cheers,
>
> Richard
>
>
>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

