Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.5351.1591217065210692156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dv4q4Ysg;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id y123so2229066vsb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8e+bCIqgtNWdiX25vaFnP58uGsbx6vP2bfkFnlbvqg=;
        b=dv4q4YsgiIQfmZjbOYHgU17yGFvg2wTTWXFHRFKtNykzhyC6xydQ9f5QBnlbjWXdwC
         ScUYmFs7ag1LPpcgoir3iAV0GANy224Msip9ZGusaVR/A6m/y5mo3PrrM8tarPQQ9vL3
         yi3RwIKuKkcYpnhUMkap3znvFGvaogGpGvki/6Tp5DKynPJpaluBwfx/xjjRyKrCTgmM
         KuuIDimR7G7miE1pQiBkcTMUuJP7VcH2B32gWrUAqBNHogp6bKkjnlD0NsC5ZDXtcvDo
         JAS73GyVqJmE8OssZdlUf3MJ8LyA7X6mxLpCP0b2kr+U3eux2E7a9L3Pzl6Jpp5JRv0t
         +Wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8e+bCIqgtNWdiX25vaFnP58uGsbx6vP2bfkFnlbvqg=;
        b=mTnJNFB16XDBfEpW/cjIUb6hZhVWGRLtdU2Nz5KjG0oEETJkxRaKGqOVDg6MU99TJ4
         tYtUvEjEPQqq16yZlHtOi3pCJ2+vylcUv38KQfjHmc5ns2qiD7up26DS63JO59r0epzh
         LjitQ8W2DaYxudVIuhlApVKRxGvjZQCqgnRwPhiJPeyfTWPvLakMI7w1x5XIAH7yWa5f
         6jU1TYAAxJbRi1exh68NK0L4Xc++tJ0duYta4Dg/z0rVbzfM1JXNtSoh08EQ+2cZeD5W
         r1Dib/PbKrSypSiMJvjR5Wtbah5IxXEV4yk4r8e/8Hd15FnlxxDFyCUIXkO2AvqzPSwf
         xtwA==
X-Gm-Message-State: AOAM530dRGe3WQxIfyPe6WI9C1YpoW1qZI/IBhJgv6Msjl0VoFFv1Tcg
	BK9T+hyTdZTm/kAJiJ5wxblRaX6Q4+5UfQhvvlE=
X-Google-Smtp-Source: ABdhPJyGJ9I2vA5B23VbLQFi96wGJ+GjON3EvSEJ0D/QLNWhqWOdacIEUUOXEtyN/eihPllwwbCJyJ8B+gMHVRXOr54=
X-Received: by 2002:a67:ed02:: with SMTP id l2mr1003446vsp.137.1591217064182;
 Wed, 03 Jun 2020 13:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk> <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net> <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
In-Reply-To: <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 3 Jun 2020 13:44:16 -0700
Message-ID: <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Phil Blundell <pb@pbcl.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Andreas Oberritter <obi@opendreambox.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 3, 2020 at 12:38 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> On 02/06/2020 23.46, Andre McCurdy wrote:
> > On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
> > lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> >>
> >> On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> >>> I understand the concern, I am a little torn on this as adding in too
> >>> many different controls and options complicates the test matrix and
> >>> makes things harder for users.
> >>>
> >>> You're effectively suggesting a new DISTRO_FEATURE to control this? or
> >>> maybe better, perhaps a glibc PACKAGECONFIG?
> >>
> >> Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
> >> outside glibc needs to care.
> >>
> >> Here are the scenarios that I think matter, ordered from simplest to
> >> most complex:
> >>
> >> 1. Immutable filesystem, every library installed in the place where
> >> ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
> >> In this case, we don't want ldconfig (because it can never do anything
> >> useful), we don't want ld.so.cache and we don't want ld.so.conf
> >> because they would cause ld.so to do extra file loads and computation
> >> but end up with the same result that it would anyway.
> >>
> >> 2. Immutable filesystem but some libraries are in places that ld.so
> >> wouldn't automatically know about.  In this case we do want ld.so.conf
> >> and ld.so.cache, but we still don't want ldconfig.
> >>
> >> 3. Mutable filesystem where arbitrary binaries can be installed in
> >> arbitrary places.  It's probably debatable whether ldconfig is needed
> >> in all these cases, but clearly it's needed in some and I think at
> >> this point it can be left to a DISTRO decision how exactly they want
> >> to optimize things.
> >>
> >> I think right now oe-core supports #1 and #3.  The proposed patch
> >> seems to be aimed at #2, which is a completely valid usecase,
> >
> > It seems like a weird corner case to me. Where do these libraries come
> > from and why can't they be moved or symlinked into a standard path?
>
> Pre-compiled proprietary binaries/libraries that go in
> /opt/<vendor>/..., just as /opt is meant for (and no, we can't just
> install them to /usr/lib, /usr/bin etc - partly because they contain
> hard-coded absolute paths, but also due to some not-entirely-techical
> reasons). So there's an /etc/ld.so.conf.d/<vendor>.conf that needs to be
> picked up.
>
> > If they are somehow special and only used by special applications then
> > setting rpath or using LD_LIBRARY_PATH just for those applications
> > would seem to be a better solution than enabling them globally.
>
> We don't control the compilation, so rpath is out. We did consider
> LD_LIBRARY_PATH, but figured that the ld.conf solution is more robust
> (no problems with setuid binaries or an application that misguidedly
> sanitizes the environment for subprocesses).

Unless the supplier of your binaries is completely unresponsive (if
so, bad luck) then educating them on the usage of rpath and asking for
a new release is probably the cleanest solution.

If you start your special application via a wrapper script which sets
LD_LIBRARY_PATH then it won't be seen by anything else, so the
concerns about other apps messing with it etc should not apply?

Relying on /etc/ld.so.conf.d/*.conf will certainly work too, but has
two disadvantages: it will add the custom library path globally
instead of just for the special apps and it's not portable (it's not
supported by musl etc - although if you only care about your
proprietary binaries pre-compiled for glibc then that won't matter to
you).

Anyway, the original patch has been merged, so this now just a side discussion.
