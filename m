Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1272AC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 19:15:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.1266.1664565319437924440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 12:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=xZ2BKdlC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id u9so2399204qvo.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=nNMMHsLC9q50F3HFQp8xhVnate0re8quTGmYEjVwtmI=;
        b=xZ2BKdlCS66mU0UiSvN2S4jv0kTznMgLhf3CwCf9IsOwV+cvowFYJCq2YT9gY+paWp
         IZgym0sc7mOyMX+DssTEH5WaUVpQ1Ypd5qkDaDNH69n8HgImUI2psjioEtfb5oJMNukR
         AHDH0PqoGXsw1aO0HfLA3KVsvcN0rRJtAbBlX+gdsRSqyR/5bFy7DVa2DlKx7+OBshxg
         xKdC2IMwqk9PAcjPQOKlKoTHTXOZ9LGWpxeBSZRarflZf0fP5LEMR08mzsNR0s6u1Ids
         M9DpXY1eKPYgcXdUAa2aJA9dBYEDhN9BgIdnlyfdYdV6/6VJnT4t+8b3Dpx6HZV24Iy0
         TAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nNMMHsLC9q50F3HFQp8xhVnate0re8quTGmYEjVwtmI=;
        b=vOvLCrWUs/hOTtCgkGiceOJx+JCYX2vI9bVOWsDOOu3xf+o/c5uWd4JZqHiWO8T3zn
         oh7MfRclyNhr8u1wX4oRdxNIncbNxoFLN51vycHzHKwIvJC6StudxpJQurCTUyGvn16h
         HbrAp0OMPFD5tb4vLa6o7KBpC6M+HBr7IWn4E8ZLvPAScgVm90tgP9vkwn5b1wZ5J0zq
         NCexDA986EFtqMzQRQZR7lfoM2gwmDSP70QYyShREJSAXyXkOutCMELSeK4d2UwBJ/GA
         IVwqe4vVqzZRbH4l/QHdz8fdjCR1GPgRAY7/E47ARrGyaawed6Cqz248wQaxT6IlBybs
         86tQ==
X-Gm-Message-State: ACrzQf1+wmyCX1BaXQ2a42WygqlftS2UvtZxV128ZygSAYQuRnArZ+3s
	/E8zXq3+UUTq4JFXsg09RJL1Sg==
X-Google-Smtp-Source: 
 AMsMyM4wEWYPM/TobwTF2qyma089FLIS491BAQm50lTOlOriQ+1l+NKFOgp0xJHUBhue6ZJ+cUuMqA==
X-Received: by 2002:ad4:4ee1:0:b0:4b1:25f6:b9b8 with SMTP id
 dv1-20020ad44ee1000000b004b125f6b9b8mr3034214qvb.48.1664565318329;
        Fri, 30 Sep 2022 12:15:18 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x17-20020a05620a259100b006ce5ba64e30sm3120058qko.136.2022.09.30.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:15:16 -0700 (PDT)
Date: Fri, 30 Sep 2022 15:15:14 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-yocto: add entries for machine features
Message-ID: <YzdAQlX4tP2BX0DN@kudzu.us>
References: <20220930032339.172935-1-jdmason@kudzu.us>
 <CADkTA4M+ps4QFqL1SDEfFCwF4+_wnxZ67A8KxjvVKZCu2AGwoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4M+ps4QFqL1SDEfFCwF4+_wnxZ67A8KxjvVKZCu2AGwoQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 19:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171243

On Fri, Sep 30, 2022 at 09:29:24AM -0400, Bruce Ashfield wrote:
> On Thu, Sep 29, 2022 at 11:23 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Most machine features have corresponding kernel config fragments, but
> > only a few have an entry in the kernel recipe to be automatically added.
> > Adding the majority of them here.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > index 7ea661e138d9..23ae0b4260c2 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -33,7 +33,12 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
> >
> >  KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
> >
> > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'bluetooth', 'features/bluetooth/bluetooth.scc', '', d)}"
> > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
> > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'ext2', 'cfg/fs/ext2.scc', '', d)}"
> >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'features/pci/pci.scc', '', d)}"
> > +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'cfg/timer/rtc.scc', '', d)}"
> >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> 
> The concept of this is ok, but there are some non-obvious details that
> need to be considered.
> 
> There's a really old enhancement in bugzilla about doing a better job
> of integration between machine, kernel and distro features:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2267
> 
> One issue is that this should generate warnings if the config values
> don't make it into the final .config. otherwise they aren't really a
> useful mapping of machine -> kernel features (we don't want
> "just-in-case" configuration). Obviously the linux-yocto config audit
> can warn on things like this, but the fragments need to be tagged as
> required (hardware) for that to happen.  Which they won't currently be
> if specified this way. I'd need to do some tooling work to make that
> happen.
> 
> Another detail is that KERNEL_FEATURES are applied last. Which means
> they can override / enable things that a BSP configuration doesn't
> want and could have even explicitly disabled, used different values,
> etc.
> 
> A proper BSP configuration is already a definition with a curated set
> of options, and in a linux-yocto flow, that is typically the first and
> last word on the values. doing a lot of BSP configuration via machine
> features spreads the logic out to multiple places, which can be a
> challenge to track down later. The fact that these map to the
> centralized fragments is really good (since while the enablement might
> be distributed and spread over recipe space, the actual options are
> centralized), but it makes jumping off from a kernel-cache BSP or one
> of the qemu references harder, as these will keep showing up .. when
> you might not want them.
> 
> Yes, we can argue that machine's shouldn't set features that they
> don't want to support, but that doesn't cover all of the complications
> and potential issues.
> 
> If we want to start dabbling with this, these should be a little bit
> more opt-in, and be specific to the qemu machines we define (versus
> just appending to KERNEL_FEATURES). As for opt-in, I'd suggest
> something like an image or machine feature in the spirit of
> "DYNAMIC_CONFIG" or "ENABLE_MACHINE_FEATURES", and when that is set,
> we do the mapping.
> 
> Bruce

Perhaps I got a little overzealous. :)

My issue really is EFI.  EFI has some kernel features needed to boot
and is fairly compartmentalized.  Adding the kernel fragement in the
edk2 recipe doesn't really make sense.  Also, there a some machines
that can do u-boot and edk2, and adding it by default for both might not
be what we want.  Adding this makes it easier to switch between the two
in CI.

Let me know if that is acceptable and I'll hack the patch down to just
efi.

Thanks,
Jon

> 
> 
> >
> >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171203): https://lists.openembedded.org/g/openembedded-core/message/171203
> > Mute This Topic: https://lists.openembedded.org/mt/94009766/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

