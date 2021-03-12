Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9013.1615559528847411827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ItjU4cgH;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id b18so4921037wrn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 06:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0HBOFWYwxwONxU7qPCL1fr2jdeUz8w4mSao+PaTdFo=;
        b=ItjU4cgHbpkTuX+YU3Hu9c7a8yuvjUr0oBGn3v9KpdXQBoVxueqFaEumO1N4vccvDN
         DIlLYgW5AVGlCN+lKVocdYxQq1OSUAAVaqZlEJuz3hMWWjKZCdra68la+u9tJDy9Hm58
         ktoBG6BF0RUQ2eSnAP5fJgStM7VI6tk9bM122fo5wIQtIYqm2AGL+dWaR1xaEV5UXqvE
         T52aoWOqepsZfCa3yfrtHHHqKcYTEkcm8DiRncEWxjKAT+OyujuzXFzZ1uY96V1QBVxq
         9MR4bXzy8yTF46l+bK/ib8qf3NTeDwAKIUyJzc7N8/0FKIK1kqH4UkAZDUoWr2VTrOuz
         9+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0HBOFWYwxwONxU7qPCL1fr2jdeUz8w4mSao+PaTdFo=;
        b=iPI4RjN12BdFiOziAPJbzl8mZf6/WEgJjDCIjwi5flzwoyOClO7lTb27vXfple0uLH
         kTddVuJZycMUP2yN2tFQj6HbYg/AUiTrnC9Acvi13KWw6pzep4yZJfE+9uVrSSdQt1bw
         zhJ4eF9y3/EkRJMvvXK/Y1Dh4h87LO7yHNsYRkA4B9xMsQXbulazAUXNbqLgoJQg+70y
         QygtUZslmhg0qG0AYvJeHJzUO7aW51lU+iTA72hJ+ws8l+27FPvb1Nd450kPxKrKUzXm
         TaHC2xE3FBfpgKwocN/zZm3o1W9380Cp46PPn8lKTZ32xZJfxMwtAY6fqa9GxLhK5peV
         hTFg==
X-Gm-Message-State: AOAM533Cm0RcPcURdh5BAJNU345ZHRqSzqT39opR0lrEmzbeNwBCviiE
	6k9TI5ve5TVMN0QMuLPS9k5HSfqEJhFfcsVObqcYqA==
X-Google-Smtp-Source: ABdhPJzBcCco2B/RwJ67460s9jf2m0hGtn79RmeSBIgeuY8Emf2V/8vvtsyHuXhMuYTqERKLylVLOGbOdhAyfCgFdIg=
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr14121452wrv.329.1615559527246;
 Fri, 12 Mar 2021 06:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
 <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
 <20210311091428.2a3nissv6eebjpzq@jama> <20210311153601.ootfsyrek7lmebu5@jama>
 <CAOSpxdahY=mG1A2Bx_cfm5FT6iiCJLmH9igiHPnHGy+fCER1kQ@mail.gmail.com> <20210312132537.uiu3kayoezu5wgo5@jama>
In-Reply-To: <20210312132537.uiu3kayoezu5wgo5@jama>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 12 Mar 2021 04:31:56 -1000
Message-ID: <CAOSpxdbOJnbTdZyjUOXEvYrRkq7AtuBtPY-+TFe25qAb_e6U6w@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>, Richard Leitner <richard.leitner@skidata.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 12, 2021 at 3:25 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 07:50:45AM -1000, Steve Sakoman wrote:
> > On Thu, Mar 11, 2021 at 5:36 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > >
> > > On Thu, Mar 11, 2021 at 10:14:28AM +0100, Martin Jansa wrote:
> > > > On Wed, Mar 10, 2021 at 04:33:02AM -1000, Steve Sakoman wrote:
> > > > > On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > > > >
> > > > > > From: Richard Leitner <richard.leitner@skidata.com>
> > > > > >
> > > > > > This fixes [1] the following build error for nativesdk on Fedora 33
> > > > > > which is caused by the removal of fractions.gcd() in favor of math.gcd()
> > > > > > in python 3.9 [2]:
> > > > > >
> > > > > > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)
> > > > > >
> > > > > > Furthermore the SRC_URI is adapted as the old one doesn't provide the
> > > > > > 1.14.1 archive.
> > > > > >
> > > > > > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
> > > > > > [2] https://bugs.python.org/issue39350
> > > > > >
> > > > > > It's needed in gatesgarth and possibly dunfell as well to support
> > > > > > distributions with python-3.9 as we build libxcb-native, which is
> > > > > > failing with xcb-proto-1.14.
> > > > > >
> > > > > > 1.14.1 is a bug fix release:
> > > > > > https://lists.x.org/archives/xorg-announce/2020-October/003061.html
> > > > >
> > > > > Dunfell is still at version 1.13, so this wouldn't be a bug fix version bump.
> > > >
> > > > I see, well luckily 1.14 doesn't look too scary as well:
> > > > https://lists.x.org/archives/xorg-announce/2020-February/003038.html
> > > > https://git.openembedded.org/openembedded-core/commit/?h=gatesgarth&id=bf4ef2e3b376744b16c2f57725104207d23c28c6
> > > >
> > > > If this is the only issue for building dunfell with host distro with
> > > > python-3.9 then I think it should be considered.
> > > > Isn't autobuilder using some new host distro with python-3.9 already?
> > > >
> > > > FYI: I was seeing this with ubuntu 21.04, I'll trigger dunfell build on
> > > > it now.
> > >
> > > At least for LuneOS images this was the only build issue I've seen with 21.04.
> >
> > I'll add the version bump to my next set of patches for testing.
>
> Steve: I'm sorry, please forget what I said about upgrade, 1.13 version in dunfell already
> has this fix for python-3.9 backported in:
> https://git.openembedded.org/openembedded-core/commit/?h=0f688c1419b1e2dfddff3c985f89a3f1949fc9fb

Ah, yes, I remember that now!  Good catch.

> so only 1.14 version in gatesgarth is affected.
>
> If you already have those updates in queue, then they shouldn't harm,
> but aren't so necessary thanks to this backport.

I haven't started testing with them yet, so I'll drop them.

Steve

> > > Together with an warning about glibc:
> > > WARNING: Your host glibc version (2.33) is newer than that in uninative (2.32). Disabling uninative so that sstate is not corrupted.
> > >
> > > which I see you're going to address in new PR with uninative upgrade.
> > >
> > > Cheers,
> > >
> > > 
> > >
