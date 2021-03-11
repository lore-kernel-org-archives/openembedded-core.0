Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.991.1615485058579516520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 09:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OkfnxLyc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id g25so1931771wmh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 09:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQ3U+RZNEsHbpYaXsSdUsxMrDS7kfBBrl/vyiFEIVm4=;
        b=OkfnxLycC+B2Twrzs0+srkx0Rm6UmXRCaHOGKo2EbkXRwywFypF6UvYryf3y4vIs+i
         Ij7CD3QV7tUhjV4kIzDsrzY+OQeO6X1R+YpuEiAqWg4rDKxtjVqnFukmRdEs8MSdbrfi
         6QQ/75WRB7enS6nO9pp3Apq3dbDc9AZVBNZ5LDQFjfvmHR+ihQVQJ3Zi2CTOCfwLgtKK
         saX6+qwLB3AVyI9CV0Aw0vXXnDfTQnDePkCjdFqtj00PDxfVwPU4bDIyzwrc/ysmr5GQ
         eaG3GpQOG3hhEH92MFGdPx+UI4DejaTN+vwk5UYmGkclKFks7PAl62NN4DwvUTYql3cR
         OgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQ3U+RZNEsHbpYaXsSdUsxMrDS7kfBBrl/vyiFEIVm4=;
        b=ge/QpVhNrM65cEO41hPnWLYAWhNjaFCvVwogEdVrFLo9cECgRMXXeGq14/xjTctJMB
         6pZVGj23JsIx2Sb6uLYGR8Pn7AOm1FAEM4Du5xszsZN4s63P/NLbA8ASfTyB9uwaZLgy
         cjB2hpv+NjcgSdPrN+YA8N5wAwaanCV3G9eBY1ZcgJztHXxaHuR3YHv2IFQhtRnqjoom
         WineG7b5DAyqWVCe9voLeUZaQuY88oYaRAvxYtNg1cLDOYyhIHI+taHAVuoOZsNM7Fj1
         h64BfqXfk54UkXmeI0wO5KSjWFkU/Jo9b2ZYeM03xHtUVeDp4vBgPxQQH4tzAysq39RT
         8Okg==
X-Gm-Message-State: AOAM533/82vbo8vQ1Hx99iIO+f1/8HZwPDi4FGfBoMOW75qeOxe5JUMH
	QnBBk+sqKWqpr+pt8AizKyX5jvTDwTgYeB6nBLJGMA==
X-Google-Smtp-Source: ABdhPJxAKRuUfPth3xZdFAKFWyGjTig3oloNYkxhM78OQvbt9bcMHJricCXtUBawhtektPwUjY+voLZUm7XS87jMgXw=
X-Received: by 2002:a7b:c083:: with SMTP id r3mr9315095wmh.177.1615485057004;
 Thu, 11 Mar 2021 09:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
 <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
 <20210311091428.2a3nissv6eebjpzq@jama> <20210311153601.ootfsyrek7lmebu5@jama>
In-Reply-To: <20210311153601.ootfsyrek7lmebu5@jama>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 11 Mar 2021 07:50:45 -1000
Message-ID: <CAOSpxdahY=mG1A2Bx_cfm5FT6iiCJLmH9igiHPnHGy+fCER1kQ@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>, Richard Leitner <richard.leitner@skidata.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 5:36 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 10:14:28AM +0100, Martin Jansa wrote:
> > On Wed, Mar 10, 2021 at 04:33:02AM -1000, Steve Sakoman wrote:
> > > On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > >
> > > > From: Richard Leitner <richard.leitner@skidata.com>
> > > >
> > > > This fixes [1] the following build error for nativesdk on Fedora 33
> > > > which is caused by the removal of fractions.gcd() in favor of math.gcd()
> > > > in python 3.9 [2]:
> > > >
> > > > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)
> > > >
> > > > Furthermore the SRC_URI is adapted as the old one doesn't provide the
> > > > 1.14.1 archive.
> > > >
> > > > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
> > > > [2] https://bugs.python.org/issue39350
> > > >
> > > > It's needed in gatesgarth and possibly dunfell as well to support
> > > > distributions with python-3.9 as we build libxcb-native, which is
> > > > failing with xcb-proto-1.14.
> > > >
> > > > 1.14.1 is a bug fix release:
> > > > https://lists.x.org/archives/xorg-announce/2020-October/003061.html
> > >
> > > Dunfell is still at version 1.13, so this wouldn't be a bug fix version bump.
> >
> > I see, well luckily 1.14 doesn't look too scary as well:
> > https://lists.x.org/archives/xorg-announce/2020-February/003038.html
> > https://git.openembedded.org/openembedded-core/commit/?h=gatesgarth&id=bf4ef2e3b376744b16c2f57725104207d23c28c6
> >
> > If this is the only issue for building dunfell with host distro with
> > python-3.9 then I think it should be considered.
> > Isn't autobuilder using some new host distro with python-3.9 already?
> >
> > FYI: I was seeing this with ubuntu 21.04, I'll trigger dunfell build on
> > it now.
>
> At least for LuneOS images this was the only build issue I've seen with 21.04.

I'll add the version bump to my next set of patches for testing.

Steve

> Together with an warning about glibc:
> WARNING: Your host glibc version (2.33) is newer than that in uninative (2.32). Disabling uninative so that sstate is not corrupted.
>
> which I see you're going to address in new PR with uninative upgrade.
>
> Cheers,
>
> 
>
