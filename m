Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.23365.1591301139744961862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 13:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VB4khbiN;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id w20so2508250uaa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QuIg8y68xkqgQ0J+Ku7GeWSYB2bWiYC4dgAP49A5+n4=;
        b=VB4khbiNZb+nh8ZU4DYtkEV3mNsIsMLy3jPJr7d3Nf+FchrARjPxjREt9b47DovNRS
         SYEKU6SJXLD3tXPEpb+g7UEt/fDntqnZYiLkuCDHvu7Z0djvnyIZunXpEygRzVHr07ln
         H9I2UqhPWL6L7chdVaLzpQ+AfAxA+LotqVzcCwkAzNTVdLXDs8rSO056c6LzJP0PfalM
         DEA6XN4Nf5HDlWbaT0+xPWzR123a4TZLhJwakdQHC80PVYP7CWKjtwX0xBtWCHOqnYBd
         6Rx+5lAUUFn7BrTH3UKTnQdAsq9NvBgeXI+6m2MneAQXcHKxlJdNzdNwzTZ9bQNuHdr1
         84lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QuIg8y68xkqgQ0J+Ku7GeWSYB2bWiYC4dgAP49A5+n4=;
        b=cYC7BvKOpfSuRnMGp2hiFzrvYH3XQDKSK9UxqjB9k2D/6w/rsrIvV8wemhPhWlCi1K
         NqJtPTD3AqWX84KXUJdx6uKAi9XJYVi3A5P3EX+NBY/jWFSPK37n+Vo5AU4jb/s4vJFc
         2lk0MFGttTej/YmntE4yxnMZaYpqz5hlqVy5D3KBtL1oz6rbRuAR+anmVW1VTcC5fyV1
         8GKUPOgIAh+DK2U2YSuRey43gCat55kYrBSAM/lFQGo7JS8ujqn/wNMnIfet97u9oNcp
         fKZ4HJ0VeldnFV50Z5sBOQnX++9b7b46NXJt5fX/lioRPcPwt2tVaZ1zEFL+sn0Vuhaz
         43Ew==
X-Gm-Message-State: AOAM5329DT/81NHZunaQld9C0FMAlJlaBGeGiNe9UzVf0Dsx72QtPe0q
	VfVHNhP8YAOunVB/0udlJiCJDLDwPO909DJlc7g=
X-Google-Smtp-Source: ABdhPJxkdUmSOudWh+xVmFebQUJnbb1D7vCe8ffGBviABA2E66OPt5uIzyJND7elM9LGWkTT94iRrZJ9ZojPyYrnN/I=
X-Received: by 2002:a9f:2788:: with SMTP id b8mr4939516uab.81.1591301138598;
 Thu, 04 Jun 2020 13:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk> <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net> <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk> <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
 <5da0a98a98d9b1194ca13315f9986c20b9e5d565.camel@linuxfoundation.org>
In-Reply-To: <5da0a98a98d9b1194ca13315f9986c20b9e5d565.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 4 Jun 2020 13:05:30 -0700
Message-ID: <CAJ86T=Xu+mjNER1D=R4110uN-8oK-s3xk6ij1hChESNVY2U2Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Phil Blundell <pb@pbcl.net>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Andreas Oberritter <obi@opendreambox.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 4, 2020 at 5:43 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2020-06-03 at 13:44 -0700, Andre McCurdy wrote:
> > On Wed, Jun 3, 2020 at 12:38 AM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> > > On 02/06/2020 23.46, Andre McCurdy wrote:
> > > > On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
> > > > lists.openembedded.org <pb=pbcl.net@lists.openembedded.org>
> > > > wrote:
> > > > > On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> > > > > > I understand the concern, I am a little torn on this as
> > > > > > adding in too
> > > > > > many different controls and options complicates the test
> > > > > > matrix and
> > > > > > makes things harder for users.
> > > > > >
> > > > > > You're effectively suggesting a new DISTRO_FEATURE to control
> > > > > > this? or
> > > > > > maybe better, perhaps a glibc PACKAGECONFIG?
> > > > >
> > > > > Yes, right.  I don't think it need be a DISTRO_FEATURE because
> > > > > nothing
> > > > > outside glibc needs to care.
> > > > >
> > > > > Here are the scenarios that I think matter, ordered from
> > > > > simplest to
> > > > > most complex:
> > > > >
> > > > > 1. Immutable filesystem, every library installed in the place
> > > > > where
> > > > > ld.so would first look for it anyway (i.e. everything in
> > > > > {/usr}/lib).
> > > > > In this case, we don't want ldconfig (because it can never do
> > > > > anything
> > > > > useful), we don't want ld.so.cache and we don't want ld.so.conf
> > > > > because they would cause ld.so to do extra file loads and
> > > > > computation
> > > > > but end up with the same result that it would anyway.
> > > > >
> > > > > 2. Immutable filesystem but some libraries are in places that
> > > > > ld.so
> > > > > wouldn't automatically know about.  In this case we do want
> > > > > ld.so.conf
> > > > > and ld.so.cache, but we still don't want ldconfig.
> > > > >
> > > > > 3. Mutable filesystem where arbitrary binaries can be installed
> > > > > in
> > > > > arbitrary places.  It's probably debatable whether ldconfig is
> > > > > needed
> > > > > in all these cases, but clearly it's needed in some and I think
> > > > > at
> > > > > this point it can be left to a DISTRO decision how exactly they
> > > > > want
> > > > > to optimize things.
> > > > >
> > > > > I think right now oe-core supports #1 and #3.  The proposed
> > > > > patch
> > > > > seems to be aimed at #2, which is a completely valid usecase,
> > > >
> > > > It seems like a weird corner case to me. Where do these libraries
> > > > come
> > > > from and why can't they be moved or symlinked into a standard
> > > > path?
> > >
> > > Pre-compiled proprietary binaries/libraries that go in
> > > /opt/<vendor>/..., just as /opt is meant for (and no, we can't just
> > > install them to /usr/lib, /usr/bin etc - partly because they
> > > contain
> > > hard-coded absolute paths, but also due to some not-entirely-
> > > techical
> > > reasons). So there's an /etc/ld.so.conf.d/<vendor>.conf that needs
> > > to be
> > > picked up.
> > >
> > > > If they are somehow special and only used by special applications
> > > > then
> > > > setting rpath or using LD_LIBRARY_PATH just for those
> > > > applications
> > > > would seem to be a better solution than enabling them globally.
> > >
> > > We don't control the compilation, so rpath is out. We did consider
> > > LD_LIBRARY_PATH, but figured that the ld.conf solution is more
> > > robust
> > > (no problems with setuid binaries or an application that
> > > misguidedly
> > > sanitizes the environment for subprocesses).
> >
> > Unless the supplier of your binaries is completely unresponsive (if
> > so, bad luck) then educating them on the usage of rpath and asking
> > for
> > a new release is probably the cleanest solution.
> >
> > If you start your special application via a wrapper script which sets
> > LD_LIBRARY_PATH then it won't be seen by anything else, so the
> > concerns about other apps messing with it etc should not apply?
> >
> > Relying on /etc/ld.so.conf.d/*.conf will certainly work too, but has
> > two disadvantages: it will add the custom library path globally
> > instead of just for the special apps and it's not portable (it's not
> > supported by musl etc - although if you only care about your
> > proprietary binaries pre-compiled for glibc then that won't matter to
> > you).
> >
> > Anyway, the original patch has been merged, so this now just a side
> > discussion.
>
> It hasn't, its still in master-next waiting for us to reach a
> conclusion...

OK. The discussion has moved on to the details of Rasmus's use case,
but I can try to summarise the details related to the actual patch...

The patch fixes the problem that if the ldconfig distro feature is
disabled, then the config file needed by ldconfig will not be present
in the rootfs when ldconfig is run at build time (and so ld.so.cache
may not be correctly generated). The change to move ldconfig and its
config file into a separate package didn't account for the fact that
the config file is used at build time, but the underlying problem was
there before that too (before the separate package, the config file
was simply deleted).

The risk of an incorrectly generated ld.so.cache is a bug, so it
should be fixing unconditionally (ie it should not be tied to any
PACKAGECONFIG or new distro config option).

The fix being proposed is simply to always leave the config file in
the rootfs, so it's always there when ldconfig is run at build time.
Doing so seems safe enough. Since the config file is only parsed by
ldconfig, there's no run time performance penalty of leaving it around
- it will just be ignored if there's no ldconfig in the rootfs to use
it.

There's a genuine bug and I don't see an obviously better fix, so I
think the patch should be merged.
