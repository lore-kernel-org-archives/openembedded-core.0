Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26372C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 13:44:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.5335.1640007854597001137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f0N8q7S9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s1so20281584wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5cw9wb4k+Ms6mWFVq5fKilAj+Xz9IPuVcPQOVLmKkdk=;
        b=f0N8q7S9fle1WtpkaNLd3ZE9DsSgwar6gE7tSPBhX4Its/juWUJNC0QfKQeu0Qlrg/
         1yrne8gmieKc+Cf1dEa5g3Ve1qtgJEMhdvk9ulr7B5Y+q4L5uyi2BwmXmmbhjh2mkXT7
         neJ8wvACiYCzVqLnAglVixPsCXsTkiw20i5pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5cw9wb4k+Ms6mWFVq5fKilAj+Xz9IPuVcPQOVLmKkdk=;
        b=736yNMs5hizaUzemEFIEY9OT+qbV+cW5a3x+q+bWVQrf4TzyCqbdmWxibyd0cfS6pc
         kA3tggW1+cxwsA/VG1uTiVbIzzrlGpGDZJf6DqiqmCwXG2uJNQIaSQedrJYnIh07Fhlw
         kyXvKhQCZZktNnbIJb7jWdkXenwsMiuwh0iQlh+hn94PvwSzVGpfsRh4LEMajGGyCKvi
         BeiaDW2wWkYfZaW2BGmBwXJSPfNcVUbVAC/LXKs7YwLsq1CTZO2sBuUmMIt5XQ/p8Rp/
         VMgglqMUlLoAhJQJaQfL/OSiRYmE2Nz86KsF0NETCPnY0zv+R/5ky07vhMyC5J8p2luZ
         8jYQ==
X-Gm-Message-State: AOAM531FOMyaYF7aB9kq7dUBEnPNMsCQhI79r2Oq1nkE//1m4aOX2csV
	SywUton9PwJNTYh4CF6QwtLvSQ==
X-Google-Smtp-Source: 
 ABdhPJxciEcctkHko4XLkLoNbZxl8+Ezsbl0pxpT1A4sWLHC9dAZl7XuTzrnKAVVxNcuEZc13IoLSA==
X-Received: by 2002:adf:f20f:: with SMTP id
 p15mr13212617wro.536.1640007853161;
        Mon, 20 Dec 2021 05:44:13 -0800 (PST)
Received: from [192.168.1.5] (dan.rpsys.net. [217.169.23.60])
        by smtp.gmail.com with ESMTPSA id
 z17sm11750143wmi.22.2021.12.20.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 05:44:12 -0800 (PST)
Message-ID: 
 <65741b61fd9ac1ce30b91e80ad11ac5c4bd2c9bc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Dec 2021 13:44:12 +0000
In-Reply-To: 
 <CAGgRHJoy4y=4NROCCNNHBER6psqexmNt0keosGqzcMUwd-RjuQ@mail.gmail.com>
References: <20211215201615.536707-1-matt@madison.systems>
	 <18b96677545b176fec83b55c65cc90c5f1cfffcf.camel@linuxfoundation.org>
	 <CAGgRHJoy4y=4NROCCNNHBER6psqexmNt0keosGqzcMUwd-RjuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 13:44:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159867

On Mon, 2021-12-20 at 05:40 -0800, Matt Madison wrote:
> On Sun, Dec 19, 2021 at 3:36 PM Richard Purdie
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
> > Rather worryingly this breaks a few docs packages for reproducibility:
> > 
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211219-6kkv1f8k/packages/diff-html/
> > 
> > which raises a number of questions in my mind. Investigation is needed as the
> > hashes clearly aren't encoding everything they should :(.
> 
> I think the problem is in manpages.bbclass - the ":append" for adding
> to the pkg_postinst/pkg_postrm functions is in the wrong place.
> Fixing them so the ":append" is at the end, rather than before
> "${MAN_PKG}", causes the function text and dependencies to show up in
> dumpsig output again.

I agree, I'd come to the same conclusion and there is a patch in master-next
testing on the autobuilder to see if that does resolve the issue. I've not sent
it out yet as invalidating the data from a reproducibility perspective is
tricky.

Cheers,

Richard


