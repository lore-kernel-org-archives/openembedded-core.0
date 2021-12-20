Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE85C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 13:40:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.5394.1640007652261394217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=PGMPz1pJ;
 spf=pass (domain: madison.systems, ip: 209.85.167.45,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f45.google.com with SMTP id u13so14479110lff.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jUrA4xlsejWzwWdcQqci200gIA+BqdOoJA/wiCqIWU=;
        b=PGMPz1pJjvIkq5WnZcwhlJAuOyPy+wRgNznWk1uLXJN3Lt4u2TSsXdhpVJZ1NtiPAf
         1+r8Z1d0ZN1NDuJwnNA1Do5e5N+A6QqRoAxPTedRdcfCXc68W3udN+40BzTFNrwzz1YD
         b6bTtZbBa7B3tBmn2fi+Wm7cOvnGOjYAK2Mbevhh3nXuuVyFMZhTMVWyfrVVXGBWfhO9
         52cbqEuol8Q76TKL6w96czb//YcKguqficBgR6e7tofk3q+EER/Lz49mReOu0JXnvILl
         jP8FesWSGB9W3Hxh0x9enepbud0qG6dB0JWKe5gkdsiBK6aUOV6qh2zFNc/icQO6B3jE
         pRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jUrA4xlsejWzwWdcQqci200gIA+BqdOoJA/wiCqIWU=;
        b=ejBTU1iaRRjSErINXq1gO6BgPrK+e8btWGWqZCYAksvq623YAmfUOcZtRExTLRrZJU
         ordn4Z9UyGIB2Lc6Y7dcVnqwou3nyOUaVSVQFs5DNGv7opZfF0CMHfM4iaf1N9NCeDdZ
         6F2IJ7Kgg4X8KLdrWT4SQ+ObRmM9vPFt6SO2qNAX6H+8XF7Xp2pqXhj3VWCmjjoz4eHk
         HcLddiIDoUS58HWArvDUNICLRbCaSE9toTh6LUr4aS7YtYsB9hCi9ntIIxHVnpe6pULL
         zGuWN5YhbT86pjX7zekBdJN9S2n2b9B6VuQaBh9x8g6b7YJXj5apLzAq3HqWMMODAyiC
         pc1w==
X-Gm-Message-State: AOAM5311vPI/fxYP2dxdCQRENJKuSwGPVPGBjmVHuhFUForwLbkJoOrZ
	AjKvHJOEi6voRAaHaQmVY5HcgbxfFqWO8CRYZD8r5Q==
X-Google-Smtp-Source: 
 ABdhPJxA8pwUKxiKwILTD/Yt75Jdi+xk81hOwhXezGl8bW1rOlL+aE0bvZElbMWW0prubOW7QtQc+TK2ZROvADiiiRw=
X-Received: by 2002:a05:6512:228c:: with SMTP id
 f12mr1318843lfu.550.1640007650200;
 Mon, 20 Dec 2021 05:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <18b96677545b176fec83b55c65cc90c5f1cfffcf.camel@linuxfoundation.org>
In-Reply-To: 
 <18b96677545b176fec83b55c65cc90c5f1cfffcf.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Mon, 20 Dec 2021 05:40:39 -0800
Message-ID: 
 <CAGgRHJoy4y=4NROCCNNHBER6psqexmNt0keosGqzcMUwd-RjuQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 13:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159866

On Sun, Dec 19, 2021 at 3:36 PM Richard Purdie
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
> Rather worryingly this breaks a few docs packages for reproducibility:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211219-6kkv1f8k/packages/diff-html/
>
> which raises a number of questions in my mind. Investigation is needed as the
> hashes clearly aren't encoding everything they should :(.

I think the problem is in manpages.bbclass - the ":append" for adding
to the pkg_postinst/pkg_postrm functions is in the wrong place.
Fixing them so the ":append" is at the end, rather than before
"${MAN_PKG}", causes the function text and dependencies to show up in
dumpsig output again.

-Matt

>
> Cheers,
>
> Richard
>

