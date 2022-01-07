Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A6C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 12:56:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6150.1641560173190353454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iARm3V2A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id r9so9141478wrg.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Aq6rEGjQDmE49KQbjz0gVF0INTwObpTjgFj+iNAsRIc=;
        b=iARm3V2AM+zzon9a1qaPBQ4aAGc6vq/7ajR4HXsrv6OEYU7eJooN4KXnYJqjiTvw8/
         XzEPASsTaMuPTAiEAx43rFZWlJC+bFeQv28kW+hV+0ispx3IcsMA6PvyEXwYDTEBMrTp
         AvkwUos7jgvx+Jn0l8gHuWQNRYYLeExTHnkas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Aq6rEGjQDmE49KQbjz0gVF0INTwObpTjgFj+iNAsRIc=;
        b=occjfbPY1h8/SbQksYRQtxceJp/h4pmOqZsODgxS8hkoJdJ5KPG+OIHRvScoOWqa1w
         bO6ekTOFIEvKoP7ww3QH7dE9lg6FNlqLt/4GZisueE+IjPNXOHwzHgtJ1vvtD3h+hdpt
         7ph/HVsT9wKDzxaASm7zU3wE2xj3zyp5kvIYgwWhwXyubASEuFvdDd+9oTwEzBq/HlvW
         ygFUCeaXme4srXhrn2QuUaAxzlezxGft9q5F6NtzjmLKO7oRXOgO2GOf87UfVCX4SysE
         7YCy+VrFJtllr/+V1CQaCTxf2PaOrbMsfJXMlHDr+SCYM5dDEisINXk7Ai0Ve2by5wmG
         vw2g==
X-Gm-Message-State: AOAM532GWDe2WVNxvZkGNirPgJ4iZg6grv7eofmUicso0k/bzYT4lhCe
	R9P5CPjUQ7i2RmzHVw55Lq8Lnw==
X-Google-Smtp-Source: 
 ABdhPJxbB/6B93lqk1xJsgBIqveneljDZ9kOXUuB3lyQzWN37uuC/b75Tm52XAfkea9NVVO+xjMROQ==
X-Received: by 2002:a05:6000:1e15:: with SMTP id
 bj21mr9696075wrb.118.1641560171727;
        Fri, 07 Jan 2022 04:56:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:df67:6706:4d53:dd6b?
 ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 i15sm4931155wrf.6.2022.01.07.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 04:56:11 -0800 (PST)
Message-ID: 
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 07 Jan 2022 12:56:10 +0000
In-Reply-To: <16C7FE06BC92B547.9201@lists.openembedded.org>
References: <20211215201615.536707-1-matt@madison.systems>
	 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
	 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
	 <16C7FE06BC92B547.9201@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 12:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160257

On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > > which is introducing task hash changes for some
> > > > allarch package builds, and should no longer
> > > > be needed with recent versions of qemu.
> > > > 
> > > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > > ---
> > > >  meta/classes/qemu.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > > index 01a7b86ae1..333202b7c4 100644
> > > > --- a/meta/classes/qemu.bbclass
> > > > +++ b/meta/classes/qemu.bbclass
> > > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > > >  # qemu-arm default CPU supports all required architecture levels.
> > > > 
> > > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > > 
> > > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > > 
> > > I've sent a revert for this since the commit message isn't true, this is causing
> > > autobuilder failures and there was also a user report of issues with it.
> > 
> > Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> > (3.14.0) is
> > higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > > (centos7 aarch64 build)
> > > 
> > > We'll have to find a different way to fix the allarch issue (more details
> > > welcome on which package shows the issue).
> > 
> > I ran into the issue with cantarell-fonts and wayland-protocols, but
> > any recipe that inherits both allarch and meson should trigger it.
> > 
> > In my case, I have a layer check job for meta-tegra that runs
> > yocto-check-layer with the --machines option specifying qemux86 and
> > one of the (aarch64) machines in my layer, and that was reporting the
> > signature changes between the two architectures.
> 
> I wonder why we don't detect that with our standard tests? :/
> 
> There may be another fix:
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 5bd5c44a276..0aadf7bfba6 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -43,6 +43,9 @@ python () {
>          d.setVar("TARGET_LDFLAGS", "none")
>          d.setVar("POPULATESYSROOTDEPS", "")
>  
> +        if bb.data.inherits_class("meson", d):
> +            d.setVar("do_write_config", ":")
> +
>          # Avoid this being unnecessarily different due to nuances of
>          # the target machine that aren't important for "all" arch
>          # packages.
> 
> 

Sorry, that isn't quite right. We want to just remove the append to write_config
which generates the qemu wrapper which will probably need a little more invasive
juggling of the code to make it easier...

Cheers,

Richard


