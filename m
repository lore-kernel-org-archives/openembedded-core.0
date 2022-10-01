Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C52C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 02:36:25 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.2441.1664591784013205515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 19:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mFOAFRKo;
 spf=pass (domain: gmail.com, ip: 209.85.160.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-131ea99262dso5161293fac.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 19:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FBZEZbBE8Q0NRbnzurziCLSTLGSC9yWf16ePfY5mSBs=;
        b=mFOAFRKoKdY4376oFc3nv4ZD6A99hXg7KjlcVR5c3IYcniTik2MFNbQu8lPrrT1CKs
         DU7ExABZBbalHKyodZ4LN2dAd+mAsMqrYNbFg0SE/9dyu6M6JeJAKPkbcW6tyHmOna9V
         CejJ4PqQxNiQhe4kReIDrSDIUOOnFmxpWcCAhW19I9bbRUSY5uHdxbmQruwQIR734HSu
         UPtiNNyQbWZ2J4Ac5x8e1a5QXwG/xyM3SuZIbCIORgXqhEkNTUKcw4eUXef0jamqP29c
         kRdClo3r0xcmLp6a1stz7OW4vDJxR09zh/F4N19VfS1ixCGxXYzc2L9Mi41gf1f44emp
         oV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FBZEZbBE8Q0NRbnzurziCLSTLGSC9yWf16ePfY5mSBs=;
        b=XOhzKOjbFErCp9JhQcmhNOBg6vvg/+GY2ayzWYFS7P8IoFdnyhIpxsxGZulJLYWtNV
         pXsceK7lsWkZNTHLsLcUzgE7HF7L0lVeAPTd+cdwE35Cgahp4qEzhOuoZXCIjdCji6GY
         AwRtya1xqo2bNC7ZS2S9++LNeR8YuNr4bWxoEN/nVe5YHRp7pJWlm8aoXHuEzCpziXhN
         b9njGnaDcUBOu7gmAEVHma0nWyLlMwtEguuejo693vrKPob99179Ol40LiiPXs3O7xz/
         R+iaLfhugmj9u4upcaJCOiTn6HyWYQYNaOyzWf4FGEN2RaU9G8SOwBphXvkxW/+Bp4+h
         bxHg==
X-Gm-Message-State: ACrzQf2oAoSZ5o3eidr4174Zr5gBP8IsEas0xSJrvJkAvJftOKPb/2c9
	rUY8We5lMgWbU+K9M15y6B4IDX/d1BYMMEGWdTw=
X-Google-Smtp-Source: 
 AMsMyM7LZJ3FXPg3z2e0SV7Y92qXbx88FIoa0aXaRdr0DjgWwmbuRYGlDTM8wtJqjNxcB1k1X2oUXO5HU3YKLvLsyZI=
X-Received: by 2002:a05:6870:c5a4:b0:131:6edd:3955 with SMTP id
 ba36-20020a056870c5a400b001316edd3955mr528231oab.96.1664591783235; Fri, 30
 Sep 2022 19:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220930032339.172935-1-jdmason@kudzu.us>
 <CADkTA4M+ps4QFqL1SDEfFCwF4+_wnxZ67A8KxjvVKZCu2AGwoQ@mail.gmail.com>
 <YzdAQlX4tP2BX0DN@kudzu.us>
In-Reply-To: <YzdAQlX4tP2BX0DN@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Sep 2022 22:36:11 -0400
Message-ID: 
 <CADkTA4OX9GXUFiYE-Md+sEy-pAuEyFG-5F41kNkW1s_-oR8uXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add entries for machine features
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 02:36:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171247

On Fri, Sep 30, 2022 at 3:15 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Sep 30, 2022 at 09:29:24AM -0400, Bruce Ashfield wrote:
> > On Thu, Sep 29, 2022 at 11:23 PM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > Most machine features have corresponding kernel config fragments, but
> > > only a few have an entry in the kernel recipe to be automatically added.
> > > Adding the majority of them here.
> > >
> > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > > index 7ea661e138d9..23ae0b4260c2 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > @@ -33,7 +33,12 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
> > >
> > >  KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
> > >
> > > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'bluetooth', 'features/bluetooth/bluetooth.scc', '', d)}"
> > > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
> > > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'ext2', 'cfg/fs/ext2.scc', '', d)}"
> > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> > > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'features/pci/pci.scc', '', d)}"
> > > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'cfg/timer/rtc.scc', '', d)}"
> > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> >
> > The concept of this is ok, but there are some non-obvious details that
> > need to be considered.
> >
> > There's a really old enhancement in bugzilla about doing a better job
> > of integration between machine, kernel and distro features:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=2267
> >
> > One issue is that this should generate warnings if the config values
> > don't make it into the final .config. otherwise they aren't really a
> > useful mapping of machine -> kernel features (we don't want
> > "just-in-case" configuration). Obviously the linux-yocto config audit
> > can warn on things like this, but the fragments need to be tagged as
> > required (hardware) for that to happen.  Which they won't currently be
> > if specified this way. I'd need to do some tooling work to make that
> > happen.
> >
> > Another detail is that KERNEL_FEATURES are applied last. Which means
> > they can override / enable things that a BSP configuration doesn't
> > want and could have even explicitly disabled, used different values,
> > etc.
> >
> > A proper BSP configuration is already a definition with a curated set
> > of options, and in a linux-yocto flow, that is typically the first and
> > last word on the values. doing a lot of BSP configuration via machine
> > features spreads the logic out to multiple places, which can be a
> > challenge to track down later. The fact that these map to the
> > centralized fragments is really good (since while the enablement might
> > be distributed and spread over recipe space, the actual options are
> > centralized), but it makes jumping off from a kernel-cache BSP or one
> > of the qemu references harder, as these will keep showing up .. when
> > you might not want them.
> >
> > Yes, we can argue that machine's shouldn't set features that they
> > don't want to support, but that doesn't cover all of the complications
> > and potential issues.
> >
> > If we want to start dabbling with this, these should be a little bit
> > more opt-in, and be specific to the qemu machines we define (versus
> > just appending to KERNEL_FEATURES). As for opt-in, I'd suggest
> > something like an image or machine feature in the spirit of
> > "DYNAMIC_CONFIG" or "ENABLE_MACHINE_FEATURES", and when that is set,
> > we do the mapping.
> >
> > Bruce
>
> Perhaps I got a little overzealous. :)
>
> My issue really is EFI.  EFI has some kernel features needed to boot
> and is fairly compartmentalized.  Adding the kernel fragement in the
> edk2 recipe doesn't really make sense.  Also, there a some machines
> that can do u-boot and edk2, and adding it by default for both might not
> be what we want.  Adding this makes it easier to switch between the two
> in CI.
>
> Let me know if that is acceptable and I'll hack the patch down to just
> efi.

That makes sense to me. Let's start with that, and see how the pattern expands!

Bruce

>
> Thanks,
> Jon
>
> >
> >
> > >
> > >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> > > --
> > > 2.30.2
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#171203): https://lists.openembedded.org/g/openembedded-core/message/171203
> > > Mute This Topic: https://lists.openembedded.org/mt/94009766/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

