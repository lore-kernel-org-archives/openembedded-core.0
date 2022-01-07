Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D99C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 12:51:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.5917.1641559893517178673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ecdbycFS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so2809029wme.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 04:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=o1PQ9Fao5+fhZSCfZfFGRqMKMOrHr53dKgBNdHur/Lw=;
        b=ecdbycFSapZoweLmtw+zwhnkr74q6MnPAWu29y5/WXPERHiIG8JjTZpcWK6Um6OaMI
         Ixqc69lM9iICffkBRxd7YZMagk5TDlpfgOwztt9L1Yx22GSFE/u64SfmnT2im964EKAU
         wc+ICcMP2L0d4g8djiPkwUdaTlaOADYKnyP9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=o1PQ9Fao5+fhZSCfZfFGRqMKMOrHr53dKgBNdHur/Lw=;
        b=woEbuiFWJrVy/Ii1c8yTiBv2EEOaVbN9aOBLE7PN1MkMeaLeJEJ06rX9JfAtjWHlW1
         3FZVsIOejjbexHHWSXp/JOaFOUX17USDP8d4jdzRnIHiJZmZEKxvopmqvaFPJKUG22vb
         KJZ93l0YDNNvAUBOhXMT7Q4ACp+e5jIA3HvcS3LOskSldhb24D0vnE/KX1XhU8JI9PIc
         OCuaUM7TqCiFC3AgiPOfT+sshGraJZSv+DjtQxLB1XlAaHH6fZHk6xNhzYadYH8X4J+p
         SQYkhg0hgIOjC4YxxYKSDefjUgsGaY1k+QT5NB3JuSQ5Xkyv30XB/LAQoZGxM4D7pZo3
         TYdg==
X-Gm-Message-State: AOAM530CMUR/yHTh76DpfnUD7I14c7KG8H6tejiB19bAkA3rFBJFptdn
	wAI/djfWaF8+6zRT0JaCo+ODdw==
X-Google-Smtp-Source: 
 ABdhPJx4A+7zaS6TdQhEn0vBFTZKiGqZZ8I0XM+SMxwmQ0schfNzRTPJ6tLtGqhyRK+A+3StBMIQvQ==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr9489689wmi.132.1641559891944;
        Fri, 07 Jan 2022 04:51:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:df67:6706:4d53:dd6b?
 ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 y8sm5061602wrd.10.2022.01.07.04.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 04:51:31 -0800 (PST)
Message-ID: 
 <6bb11c0629074ba4c50fb54a27aa41b2bf8b162b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 07 Jan 2022 12:51:29 +0000
In-Reply-To: 
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
References: <20211215201615.536707-1-matt@madison.systems>
	 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
	 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 12:51:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160256

On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > which is introducing task hash changes for some
> > > allarch package builds, and should no longer
> > > be needed with recent versions of qemu.
> > > 
> > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > ---
> > >  meta/classes/qemu.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > index 01a7b86ae1..333202b7c4 100644
> > > --- a/meta/classes/qemu.bbclass
> > > +++ b/meta/classes/qemu.bbclass
> > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > >  # qemu-arm default CPU supports all required architecture levels.
> > > 
> > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > 
> > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > 
> > I've sent a revert for this since the commit message isn't true, this is causing
> > autobuilder failures and there was also a user report of issues with it.
> 
> Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> (3.14.0) is
> higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > (centos7 aarch64 build)
> > 
> > We'll have to find a different way to fix the allarch issue (more details
> > welcome on which package shows the issue).
> 
> I ran into the issue with cantarell-fonts and wayland-protocols, but
> any recipe that inherits both allarch and meson should trigger it.
> 
> In my case, I have a layer check job for meta-tegra that runs
> yocto-check-layer with the --machines option specifying qemux86 and
> one of the (aarch64) machines in my layer, and that was reporting the
> signature changes between the two architectures.

I wonder why we don't detect that with our standard tests? :/

There may be another fix:

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 5bd5c44a276..0aadf7bfba6 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -43,6 +43,9 @@ python () {
         d.setVar("TARGET_LDFLAGS", "none")
         d.setVar("POPULATESYSROOTDEPS", "")
 
+        if bb.data.inherits_class("meson", d):
+            d.setVar("do_write_config", ":")
+
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
         # packages.


Cheers,

Richard




