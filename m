Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.701.1602002576243394911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Q98aW/R3;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.65, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f65.google.com with SMTP id dn5so14272687edb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JrthunKszxUJJdFnFX8sd5KUG0V88SYEokyNcIbpEaQ=;
        b=Q98aW/R31eaSB1OTwHSWbzg3C5SQBJEnJFYkxVrrmGLvG7E+Ns1kZHNv4YoYo8xfbx
         sT5wSJJkzCWPs14MIxbA9XiKLfMe73ZxQBSxuVgp+m1lSE82FFalZQK9r6vrGiQLHyyB
         UTUGKVkxCTEkOhC3GD9ri7I6EddEl6jrVn9dBxfmmSH/nA19KuGOXpBPIoLERduAObIh
         5Ksbz+6kq6hKspIJUkskjiaxbjmu8qD4s/CDZBhr+JhKpBdIxNIXXfXJ49/1kCPeVhNR
         z7ltDaANsIlllMpcTJA4GPol33otgIB1qOON1hdIa8HWm729JZtb8Y3hxaLHUYiKamkj
         3Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JrthunKszxUJJdFnFX8sd5KUG0V88SYEokyNcIbpEaQ=;
        b=dLFL1jAUEALVgmP1+zBMSp6LmsiNNLDe0uj3L0at20dMWzRgQQc5M2BRdHJUKAF+fF
         k5/kX9xQJAoR0Zul6ICTeDHCJPBwnrk+DqUqchon8bafM8ekezK/u6a6HjHjfVXw1hnt
         NXrfUCUSEtSlZ1ilTtDVFawh35DucPCD0Md5LG265hHmV2+evOH4pLWKD0ShFAu48CBk
         wUs5zqHO18ORBEJ/PY+1PFX6nThqluT20DY9oMG/8K5kYbzrBmjgQmJNiuOUO3YwWeiu
         kC/cRuzlJX88apBWdr3UWjXUy10rCE4CAG+fgH/f20FwH4uBzNvGCQq5raMAGC5h+kW7
         ohOw==
X-Gm-Message-State: AOAM531Ap1bgoJ16jPUNzjWOTlHO6EW12Cdh202vWzQu4uk72onbirkQ
	Rqh/neXLAYunvi4bHd6yVr5tJ3dFQZftC8iZiT0oEQ==
X-Google-Smtp-Source: ABdhPJwi1OgGg/J8vBI+I0L8okcK7n2Ieq+GSRgE7Ox2eYPNnAGnkQjUJL1SlXiBNswinBYnczP7Z1ewtmKT6yua3SY=
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr6677755edb.197.1602002574584;
 Tue, 06 Oct 2020 09:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de> <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
 <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
In-Reply-To: <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Oct 2020 06:42:43 -1000
Message-ID: <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Marek Vasut <marex@denx.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 6:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
> > >
> > > Update to latest available.
> >
> > Have you tested these patches with kernel versions 5.4.62+ ?
> >
> > IIRC, Bruce said that the 2.11.x tree did not have the necessary
> > patches to build with recent 5.4 kernels.
> >
>
> Since I did that backport to keep us moving, the lttng project has
> added commits to the 2.11.x branch.
>
> I see changes to the right files in the commits, so it should be good
> with this update, but I haven't tested it myself.

Thanks for the quick response.  Given that info I'll pull in these
patches and start testing.

Steve

> > See his patch "lttng-modules: backport writeback.h changes from 2.12.x
> > to fix kernel 5.4.62+"
> >
> > https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=348c666b2dca230308c8462dac2117b04cca6ae7
> >
> > Steve
> >
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  .../{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb}      | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (92%)
> > >
> > > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > similarity index 92%
> > > rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > > rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > index 6fff096a37..a38d8afb7a 100644
> > > --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > @@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> > >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > >             "
> > >
> > > -SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
> > > -SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
> > > +SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
> > > +SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
> > >
> > >  export INSTALL_MOD_DIR="kernel/lttng-modules"
> > >
> > > --
> > > 2.28.0
> > >
> > >
> > >
> > >
> >
> > 
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
