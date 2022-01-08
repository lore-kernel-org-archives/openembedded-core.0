Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE1C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Jan 2022 15:13:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.6462.1641654786205026088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 07:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gsp7EaLE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so4526681wme.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uinzOrvJibvz2muWvmSpRLfD566iC0UU6aC9vMX4lE4=;
        b=Gsp7EaLE//K7JWB0pirOo5L5nrF+RZGbBdaZ0oLJGK4V39BnZwa4oU+/YqktCP3NkI
         xClqWPooHI45B3HfrJFE83o2SWTSLvj2NQf/jJvkdHBkqfSNqS5A5/lHxhPbXDH482vF
         0g67gHN24XCA2MLxX8+brYocpnJDV8EWfwZXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uinzOrvJibvz2muWvmSpRLfD566iC0UU6aC9vMX4lE4=;
        b=QxAfgUsei6fS3CXqSHKdnp4sJLV0E56/aMkmTYcI8RNRMmUfhGvzpu2b5XELyD81lq
         9KPkXxMo05i33cMe+GHmHVHDGPZ7VMuiYPEiTvYilqJWQ4KtOdOXLBqxLHCr/Fz83iPe
         vFEKso5nNsP/PWmXPHIokSrZYPlwnbeciJGaQNAfYZq0+MR4Jiy5knpncl0iyCL7YfT6
         HJVtTgfar7Cb+rg4ug9276QeV7bTt+K+kdlT58Jg71o+Jlxcq/OqcvUsXLDiKhLWum/v
         9y4b6Qx8tVOm/PhQLhn0tqMEIpALfNUbbwXefKLlrPEkfePoJWZjZdEzkvUNMJodJ3tH
         SIvg==
X-Gm-Message-State: AOAM531wZS+Avop9Ba7QvnQ+FOTbOp/We0slxP3CO21l2XRdDXfj05Uq
	TkwlOvlcVHJuE1fO6OREof4aRA==
X-Google-Smtp-Source: 
 ABdhPJxsd4blXE15cQPX2P05X8viA6e/h2UdvW9FsPe5gI1d55Y9bv99oBkjvWZ5tzROTJfMTK+FQw==
X-Received: by 2002:a05:600c:1e24:: with SMTP id
 ay36mr15257215wmb.84.1641654784574;
        Sat, 08 Jan 2022 07:13:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82?
 ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id
 p13sm1976263wrr.37.2022.01.08.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 07:13:04 -0800 (PST)
Message-ID: 
 <325a814a0aa94ddd4d0ef0d44a62a8e2b62e8e3e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 08 Jan 2022 15:13:03 +0000
In-Reply-To: 
 <CAGgRHJpHEyuwCs1Hbu7QpZWvN6qrDXebL0iFJ8iryWpiYhNFMw@mail.gmail.com>
References: <20211215201615.536707-1-matt@madison.systems>
	 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
	 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
	 <16C7FE06BC92B547.9201@lists.openembedded.org>
	 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
	 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
	 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
	 <CAGgRHJpHEyuwCs1Hbu7QpZWvN6qrDXebL0iFJ8iryWpiYhNFMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jan 2022 15:13:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160277

On Sat, 2022-01-08 at 07:10 -0800, Matt Madison wrote:
> On Sat, Jan 8, 2022 at 6:34 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2022-01-07 at 06:44 -0800, Matt Madison wrote:
> > > On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
> > > > wrote:
> > > > > On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > > > > > On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > > 
> > > > > > > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > > > > > > which is introducing task hash changes for some
> > > > > > > > allarch package builds, and should no longer
> > > > > > > > be needed with recent versions of qemu.
> > > > > > > > 
> > > > > > > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > > > > > > ---
> > > > > > > >  meta/classes/qemu.bbclass | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > > > > > > index 01a7b86ae1..333202b7c4 100644
> > > > > > > > --- a/meta/classes/qemu.bbclass
> > > > > > > > +++ b/meta/classes/qemu.bbclass
> > > > > > > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > > > > > > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > > > > > > >  # qemu-arm default CPU supports all required architecture levels.
> > > > > > > > 
> > > > > > > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > > > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > > > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > > > > > > 
> > > > > > > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > > > > > > 
> > > > > > > I've sent a revert for this since the commit message isn't true, this is causing
> > > > > > > autobuilder failures and there was also a user report of issues with it.
> > > > > > 
> > > > > > Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> > > > > > (3.14.0) is
> > > > > > higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > > > > > 
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > > > > > > (centos7 aarch64 build)
> > > > > > > 
> > > > > > > We'll have to find a different way to fix the allarch issue (more details
> > > > > > > welcome on which package shows the issue).
> > > > > > 
> > > > > > I ran into the issue with cantarell-fonts and wayland-protocols, but
> > > > > > any recipe that inherits both allarch and meson should trigger it.
> > > > > > 
> > > > > > In my case, I have a layer check job for meta-tegra that runs
> > > > > > yocto-check-layer with the --machines option specifying qemux86 and
> > > > > > one of the (aarch64) machines in my layer, and that was reporting the
> > > > > > signature changes between the two architectures.
> > > > > 
> > > > > I wonder why we don't detect that with our standard tests? :/
> > > > > 
> > > > > There may be another fix:
> > > > > 
> > > > > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > > > > index 5bd5c44a276..0aadf7bfba6 100644
> > > > > --- a/meta/classes/allarch.bbclass
> > > > > +++ b/meta/classes/allarch.bbclass
> > > > > @@ -43,6 +43,9 @@ python () {
> > > > >          d.setVar("TARGET_LDFLAGS", "none")
> > > > >          d.setVar("POPULATESYSROOTDEPS", "")
> > > > > 
> > > > > +        if bb.data.inherits_class("meson", d):
> > > > > +            d.setVar("do_write_config", ":")
> > > > > +
> > > > >          # Avoid this being unnecessarily different due to nuances of
> > > > >          # the target machine that aren't important for "all" arch
> > > > >          # packages.
> > > > > 
> > > > > 
> > > > 
> > > > Sorry, that isn't quite right. We want to just remove the append to write_config
> > > > which generates the qemu wrapper which will probably need a little more invasive
> > > > juggling of the code to make it easier...
> > > 
> > > Your patch to disable the qemu wrapper for allarch looks like a good solution.
> > > Hopefully, that will work OK across the board.
> > 
> > It seemed to be so I've merged it. Am hoping this resolves things!
> 
> Drat. Unfortunately, it only works if allarch is inherited after meson
> (which inherits qemu).  So cantarell-fonts checks out OK,
> but wayland-protocols doesn't, since it inherits allarch first.

Probably easy to fix but hard to spot new problems :/

Cheers,

Richard


