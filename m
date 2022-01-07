Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE15C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 12:37:14 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.6007.1641559032773740777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=b3WcfT7Q;
 spf=pass (domain: madison.systems, ip: 209.85.167.46,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f46.google.com with SMTP id g26so15031251lfv.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLyKsHKEHbfFNmRwjiH38eXVDJn/hzsNl7Bo4a5m87Y=;
        b=b3WcfT7Q+KNSECrn4bMPDX9bpSCwoYG86f5HpHFN8mk9A3+guiDE8ZGaVR1q8cXarK
         1hGU4g7jxhICxQWaSinf5m/a8cqoc3aS0Kn2/Z345j8vvuJIl9pTpcW3mbuJmdq+l1bp
         Bi2J/G4SpnoJ81g2rKt7+OGjOlwwnpoykSlyFeCCN8mM1fupTEBo/nZgI/26HUGOgNYR
         PE6LuoHnF5cyvaSnOQShpE833smz70QRCjx6aQ+j6v+aqpN3P3OqmC1W98Umq1jlMP34
         G59YLAwqM8L/UW0wsZ9LENdysb9WVzFgbPd9cglRDXUrvCBQOw4Vo6buS5mpGZgfhPKZ
         LdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLyKsHKEHbfFNmRwjiH38eXVDJn/hzsNl7Bo4a5m87Y=;
        b=YrZcIQxwD7575ibd/scha9GfDDn+qDyJPXMuI5y4UglvB+Kkd0ZyS3cC1n8ZzoIKKV
         JlDirjg4AHCzvt6KeMnaiE+tTd9/4X2l1MBhwRq8Lpi9+gU3R7oh1bv9hJ4gc3McVIEM
         o/7hEhWyfZvFUEN38mIJKZlnZC+LV8wE/ryNFnXQuYabhTj1azRohoPJ0riZGRUWl+fg
         lmL8w06oDN1uP2K9FNxnjc72cmm6zSUUXs3krbi9VO/BPKIFGhVwW4cax6Ol8EmcEwX6
         iOoOvix6rv0AsYaD0O2GxiPRFkS6sV38J1SmSMEWFaP/SeqPHjD0FUCHdrfd2VkWYeQs
         DzAA==
X-Gm-Message-State: AOAM531bxaK+BHJJkZSchO0nD+/7hTykkFR2PCdPAbt0uvdnR3I1fZSc
	hTW/+2g+Usr2bWfm3uKICr8rmvFXwv2iatna9zSyfw==
X-Google-Smtp-Source: 
 ABdhPJyaoIGnvPnXRmMcqGyHSVF2dZ+J/YWkKmFSWlunrxGNCqjI1pWZK08u8uKVFU3pnNcy3rZJt9mhxE/a5A3HW7k=
X-Received: by 2002:ac2:4ecb:: with SMTP id
 p11mr53686349lfr.216.1641559030626;
 Fri, 07 Jan 2022 04:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
In-Reply-To: 
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Fri, 7 Jan 2022 04:36:59 -0800
Message-ID: 
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 12:37:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160255

On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > which is introducing task hash changes for some
> > allarch package builds, and should no longer
> > be needed with recent versions of qemu.
> >
> > Signed-off-by: Matt Madison <matt@madison.systems>
> > ---
> >  meta/classes/qemu.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > index 01a7b86ae1..333202b7c4 100644
> > --- a/meta/classes/qemu.bbclass
> > +++ b/meta/classes/qemu.bbclass
> > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> >  # qemu-arm default CPU supports all required architecture levels.
> >
> > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> >
> >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
>
> I've sent a revert for this since the commit message isn't true, this is causing
> autobuilder failures and there was also a user report of issues with it.

Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
(3.14.0) is
higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).

> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> (centos7 aarch64 build)
>
> We'll have to find a different way to fix the allarch issue (more details
> welcome on which package shows the issue).

I ran into the issue with cantarell-fonts and wayland-protocols, but
any recipe that inherits both allarch and meson should trigger it.

In my case, I have a layer check job for meta-tegra that runs
yocto-check-layer with the --machines option specifying qemux86 and
one of the (aarch64) machines in my layer, and that was reporting the
signature changes between the two architectures.

-Matt

>
> Cheers,
>
> Richard
>
>
>

