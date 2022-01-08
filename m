Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE6FC433EF
	for <webhook@archiver.kernel.org>; Sat,  8 Jan 2022 14:34:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6125.1641652448047933226
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 06:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D3uh/MKW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v6so16956934wra.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 06:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xPX8k6tyT/GcGWgov/t79Zso3Qx7howFPrNQjmt1+Mg=;
        b=D3uh/MKWI/IkmH6DltobHg/lVuMTQQrtWzeNtLgOI4Sf4n+pvcxsWr3jLp+4f6ievU
         FmOg1uZiQT6MQwtS19zKM00PsOVfhrc8TV07D5uoY5sJ985Ah1vYvT/3sLzGaA1ZQeV/
         i+gYjotuPKCPtTaNDcVDLSlZjbS5mbjR8TKX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xPX8k6tyT/GcGWgov/t79Zso3Qx7howFPrNQjmt1+Mg=;
        b=rr3OVFWY85YKfQHvjxRbwODkzQeU/DcxmrbYET0kb1JRk01Q9Sy3OrnP7oJo9E/U1w
         8KUogHccF0C72uP4/+ztZhFiYhK8TK5tMejtfoR72ogOcuNAa9hMEyAH/93X0djixcWf
         lrS7aHH09MExgYPR/IotF/YbkWIEcLtifW9sPEAc35s2u9S9BGLMFw1Cs7dKqIHdWkp5
         v+CSW8If5ugnVZzogAs28FqfThV0dQZMTsvnfQahutoenC9nqOSIZgIxOZizAUAabpfb
         ToZx3vrd3T3FLw3K58jZjGKgtrYYVVO12VC4zFXlJ6qyT6xubUhJ3+y3C2UST3OL6GUD
         mvPw==
X-Gm-Message-State: AOAM532e9HQLM0oXuHT9iQKxN8jsTbwrk0IBTYoRyTMEtUovxsmy3rYN
	coWU1GfyCLFTvYcwBpG2WRJqmQ==
X-Google-Smtp-Source: 
 ABdhPJweagjpoq2BXMOBAWAHPeQ5Bizur9qu0ReRXkS3e48tH1xakMSJ1VbT6SnFlbB+i37jodNThA==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr1971173wrq.229.1641652446531;
        Sat, 08 Jan 2022 06:34:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82?
 ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id
 j3sm1719731wrt.14.2022.01.08.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 06:34:06 -0800 (PST)
Message-ID: 
 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 08 Jan 2022 14:34:03 +0000
In-Reply-To: 
 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
References: <20211215201615.536707-1-matt@madison.systems>
	 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
	 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
	 <16C7FE06BC92B547.9201@lists.openembedded.org>
	 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
	 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jan 2022 14:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160275

On Fri, 2022-01-07 at 06:44 -0800, Matt Madison wrote:
> On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
> > wrote:
> > > On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > > > On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > > > > which is introducing task hash changes for some
> > > > > > allarch package builds, and should no longer
> > > > > > be needed with recent versions of qemu.
> > > > > > 
> > > > > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > > > > ---
> > > > > >  meta/classes/qemu.bbclass | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > > > > index 01a7b86ae1..333202b7c4 100644
> > > > > > --- a/meta/classes/qemu.bbclass
> > > > > > +++ b/meta/classes/qemu.bbclass
> > > > > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > > > > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > > > > >  # qemu-arm default CPU supports all required architecture levels.
> > > > > > 
> > > > > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > > > > 
> > > > > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > > > > 
> > > > > I've sent a revert for this since the commit message isn't true, this is causing
> > > > > autobuilder failures and there was also a user report of issues with it.
> > > > 
> > > > Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> > > > (3.14.0) is
> > > > higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > > > > (centos7 aarch64 build)
> > > > > 
> > > > > We'll have to find a different way to fix the allarch issue (more details
> > > > > welcome on which package shows the issue).
> > > > 
> > > > I ran into the issue with cantarell-fonts and wayland-protocols, but
> > > > any recipe that inherits both allarch and meson should trigger it.
> > > > 
> > > > In my case, I have a layer check job for meta-tegra that runs
> > > > yocto-check-layer with the --machines option specifying qemux86 and
> > > > one of the (aarch64) machines in my layer, and that was reporting the
> > > > signature changes between the two architectures.
> > > 
> > > I wonder why we don't detect that with our standard tests? :/
> > > 
> > > There may be another fix:
> > > 
> > > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > > index 5bd5c44a276..0aadf7bfba6 100644
> > > --- a/meta/classes/allarch.bbclass
> > > +++ b/meta/classes/allarch.bbclass
> > > @@ -43,6 +43,9 @@ python () {
> > >          d.setVar("TARGET_LDFLAGS", "none")
> > >          d.setVar("POPULATESYSROOTDEPS", "")
> > > 
> > > +        if bb.data.inherits_class("meson", d):
> > > +            d.setVar("do_write_config", ":")
> > > +
> > >          # Avoid this being unnecessarily different due to nuances of
> > >          # the target machine that aren't important for "all" arch
> > >          # packages.
> > > 
> > > 
> > 
> > Sorry, that isn't quite right. We want to just remove the append to write_config
> > which generates the qemu wrapper which will probably need a little more invasive
> > juggling of the code to make it easier...
> 
> Your patch to disable the qemu wrapper for allarch looks like a good solution.
> Hopefully, that will work OK across the board.

It seemed to be so I've merged it. Am hoping this resolves things!

Cheers,

Richard


