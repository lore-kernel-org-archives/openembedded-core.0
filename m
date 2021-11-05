Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5E6C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:37:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.8997.1636133850164526155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OL6JM0kc;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id w1so35886905edd.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JfNpRr21PWEdX4hPCW122l45xVDOulZqqq1HCoztxm4=;
        b=OL6JM0kc3Ci16r6TJ0SaRhzdcvZmUjnSAlOsFWEzE9Q0lHFY+02u3Gg0L9C2JUa28Q
         HbL77mBT12YgeUHuViTf83wjAojyGohJGtEnSzr5AVRIIaC6xh9Mv0IekcgHZMHfPVKL
         QZky8x7d93OqLitxkwBptxRsD4PdktUBYN57uros/KHHB5w75+EHrZZQX+obJXXfWvhK
         mIPeya9DRXDfXFSwCwedV8mqRrGM7Hq/xvksf/PLasE+oSe1UG7sBzf395OI3ymNseqf
         R74QqXcisCGdVbYnFiAVNs0slOtxZu4K1rXyDX+3nbZps4whtVdhcKipFWa8cW8rVcS8
         57Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JfNpRr21PWEdX4hPCW122l45xVDOulZqqq1HCoztxm4=;
        b=GPdvAg+frqWNtVIfGqtoQfGOfXgGQgvIPqNmdGgYedvPnrmZ3cM5n+Wp7ZXequfzPO
         MklDQHDm1VpaeunZvf0gZgH4Sqezbl7v4EZM+KdHvebVAKSgpYuIqxFVSE2mSVn7smmc
         f35ZK+MR9YPFBEV2XwR4MrcFufE3s1O+6KUmDlByM3cSqsZYvmkLMoKL8EkOlC4FK1Wi
         LPwXECq2n5yRijO/Kl8LwvDSO3nWssvlbfpqPx4kn1HNvm+exFcbtcL6XtLDK8SwRlLo
         jCC1p/vYahnp6JlkOit+wRxZyQzltm5FfFuzTZln03q//O+hEeA/J7A3ZFVL7Pvg8UY0
         BKBQ==
X-Gm-Message-State: AOAM531U4hzycNrkROh80Q/aW3AtFE/XWbC05GA6ch6c4ByVBms3cSPR
	2dAtqZPuoDnRopeP21Am6qaBY90LQA50MoWbnno=
X-Google-Smtp-Source: 
 ABdhPJyhhmnLTjvOG2MKUCBsL28sDSuCWFl78cVtDq8YDGQKQ4IIzolMjbHotnhtIwMIOI1F/MFFUk6gqnyzJlQtJiQ=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr9114551eda.354.1636133848577;
 Fri, 05 Nov 2021 10:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
 <CAMKF1soD0m7QB3Yn3dSK1FZRUPiQ=BWQdmMFgjXn-2XgZN=Efw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soD0m7QB3Yn3dSK1FZRUPiQ=BWQdmMFgjXn-2XgZN=Efw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 13:37:17 -0400
Message-ID: 
 <CADkTA4OOUvBoNuwrzzeS0o4xDzf8EqsTujN8uT_FZetk0x=ZBg@mail.gmail.com>
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:37:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157919

On Fri, Nov 5, 2021 at 1:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Couple of failures in meta-openembedded not too bad
>
> https://errors.yoctoproject.org/Errors/Build/135189/

I'll have a look!

Doesn't look ipx related, so another removal perhaps.

Let me know if you are fixing it, just to save duplicated effort.

Bruce

>
> On Fri, Nov 5, 2021 at 5:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Nov 5, 2021 at 7:18 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > No patches needed refreshing or removal, so we just update the
> > > > SRC_URI and pick up the latest uapi / kernel headers.
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  meta/conf/distro/include/tcmode-default.inc                   | 2 +-
> > > >  ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
> > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> > > >
> > > > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > > > index 58f49800c4..86a6b50433 100644
> > > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > > @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> > > >  BINUVERSION ?= "2.37%"
> > > >  GDBVERSION ?= "10.%"
> > > >  GLIBCVERSION ?= "2.34"
> > > > -LINUXLIBCVERSION ?= "5.14%"
> > > > +LINUXLIBCVERSION ?= "5.15%"
> > > >  QEMUVERSION ?= "6.1%"
> > > >  GOVERSION ?= "1.16%"
> > > >  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> > > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > > similarity index 81%
> > > > rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > > > rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > > index 282c04d79c..588cc3acd1 100644
> > > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> > > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> > > > @@ -14,7 +14,7 @@ SRC_URI:append = "\
> > > >
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > > >
> > > > -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
> > > > -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
> > > > +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
> > > > +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
> > > >
> > > >
> > >
> > > Looks like there is a musl issue with the ipx.h header in ppp:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313
> >
> > ahah. Something my a-quick build didn't hit.
> >
> > I'll fire up a build here and see how we work around ipx.h going away.
> >
> > Bruce
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

