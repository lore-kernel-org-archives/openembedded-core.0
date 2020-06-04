Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.12904.1591274631535856567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bq8W6K2X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x13so5940492wrv.4
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yxLiK/+9QAH8W77rUD1N47WscbopVzdPSZw0+FvU65E=;
        b=bq8W6K2X0jmVj8m9TbtHEotHWtOPfEoenK2+ZkOO526G5Das6uFZslZ6fcZxEJeEQf
         FYyBApze4Bj6AjcOdWT6XWWsv+p8Mq7aJmYC+WQ8wMySSdbAlA5NY5XEcNGXtxVQTomW
         qHjA9Dl7sY2kqW3ZLN4n4W+GqQgeUkypViLXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yxLiK/+9QAH8W77rUD1N47WscbopVzdPSZw0+FvU65E=;
        b=Dr9XyWLq5HLrumXfftN85WwAUpYO8bZeA/3ikU/Dxdkj6jlliMHpoRZsbwljvpsvBj
         a2z2d2to8V/pPrDoY+4VybAOk2+llvCY0Z4FvP45i3s/lGaaKrsI+NWAkfPfMR4TpPYw
         2gACyBbwQFPemCvK+FDTeLptALSQILGdnAh91N528OMhBug0C759o+yKw+XqFSNrI9QI
         lZk1af5GUZJ8Ny3qULLoCYIEO5x5U7Dt2JTgonge+2prtksQJBr/zFyPda0hMOwmnOeM
         sL2Ve/hwup0O1WX60R2EPOWVolAU62LC3IP3cdwnL82/6hxZEwbk0XVLCePfmZOF2L0L
         x6SA==
X-Gm-Message-State: AOAM531J6cbddCZiYbXSzg1BLgzF/s5Rk39MEs6zPL70LvOk/WboVM1L
	QjLCbMgU4c1nXIZ5QidfgSfQ2A==
X-Google-Smtp-Source: ABdhPJya/N7MxWkZUIR4jGWGxX06BoUZFKrr6gz508rJpTDwjgGFhlWi2gyKKO15259WcZBpjA1eBw==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr4169761wrv.321.1591274630010;
        Thu, 04 Jun 2020 05:43:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u4sm7637545wmb.48.2020.06.04.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:43:47 -0700 (PDT)
Message-ID: <5da0a98a98d9b1194ca13315f9986c20b9e5d565.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>
Cc: Phil Blundell <pb@pbcl.net>, OE Core mailing list
 <openembedded-core@lists.openembedded.org>, Martin Jansa
 <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, Andreas Oberritter
 <obi@opendreambox.org>
Date: Thu, 04 Jun 2020 13:43:43 +0100
In-Reply-To: <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
	 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
	 <20200602200008.GB2207@pbcl.net>
	 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
	 <20200602211524.GC2207@pbcl.net>
	 <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
	 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
	 <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-03 at 13:44 -0700, Andre McCurdy wrote:
> On Wed, Jun 3, 2020 at 12:38 AM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> > On 02/06/2020 23.46, Andre McCurdy wrote:
> > > On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
> > > lists.openembedded.org <pb=pbcl.net@lists.openembedded.org>
> > > wrote:
> > > > On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> > > > > I understand the concern, I am a little torn on this as
> > > > > adding in too
> > > > > many different controls and options complicates the test
> > > > > matrix and
> > > > > makes things harder for users.
> > > > > 
> > > > > You're effectively suggesting a new DISTRO_FEATURE to control
> > > > > this? or
> > > > > maybe better, perhaps a glibc PACKAGECONFIG?
> > > > 
> > > > Yes, right.  I don't think it need be a DISTRO_FEATURE because
> > > > nothing
> > > > outside glibc needs to care.
> > > > 
> > > > Here are the scenarios that I think matter, ordered from
> > > > simplest to
> > > > most complex:
> > > > 
> > > > 1. Immutable filesystem, every library installed in the place
> > > > where
> > > > ld.so would first look for it anyway (i.e. everything in
> > > > {/usr}/lib).
> > > > In this case, we don't want ldconfig (because it can never do
> > > > anything
> > > > useful), we don't want ld.so.cache and we don't want ld.so.conf
> > > > because they would cause ld.so to do extra file loads and
> > > > computation
> > > > but end up with the same result that it would anyway.
> > > > 
> > > > 2. Immutable filesystem but some libraries are in places that
> > > > ld.so
> > > > wouldn't automatically know about.  In this case we do want
> > > > ld.so.conf
> > > > and ld.so.cache, but we still don't want ldconfig.
> > > > 
> > > > 3. Mutable filesystem where arbitrary binaries can be installed
> > > > in
> > > > arbitrary places.  It's probably debatable whether ldconfig is
> > > > needed
> > > > in all these cases, but clearly it's needed in some and I think
> > > > at
> > > > this point it can be left to a DISTRO decision how exactly they
> > > > want
> > > > to optimize things.
> > > > 
> > > > I think right now oe-core supports #1 and #3.  The proposed
> > > > patch
> > > > seems to be aimed at #2, which is a completely valid usecase,
> > > 
> > > It seems like a weird corner case to me. Where do these libraries
> > > come
> > > from and why can't they be moved or symlinked into a standard
> > > path?
> > 
> > Pre-compiled proprietary binaries/libraries that go in
> > /opt/<vendor>/..., just as /opt is meant for (and no, we can't just
> > install them to /usr/lib, /usr/bin etc - partly because they
> > contain
> > hard-coded absolute paths, but also due to some not-entirely-
> > techical
> > reasons). So there's an /etc/ld.so.conf.d/<vendor>.conf that needs
> > to be
> > picked up.
> > 
> > > If they are somehow special and only used by special applications
> > > then
> > > setting rpath or using LD_LIBRARY_PATH just for those
> > > applications
> > > would seem to be a better solution than enabling them globally.
> > 
> > We don't control the compilation, so rpath is out. We did consider
> > LD_LIBRARY_PATH, but figured that the ld.conf solution is more
> > robust
> > (no problems with setuid binaries or an application that
> > misguidedly
> > sanitizes the environment for subprocesses).
> 
> Unless the supplier of your binaries is completely unresponsive (if
> so, bad luck) then educating them on the usage of rpath and asking
> for
> a new release is probably the cleanest solution.
> 
> If you start your special application via a wrapper script which sets
> LD_LIBRARY_PATH then it won't be seen by anything else, so the
> concerns about other apps messing with it etc should not apply?
> 
> Relying on /etc/ld.so.conf.d/*.conf will certainly work too, but has
> two disadvantages: it will add the custom library path globally
> instead of just for the special apps and it's not portable (it's not
> supported by musl etc - although if you only care about your
> proprietary binaries pre-compiled for glibc then that won't matter to
> you).
> 
> Anyway, the original patch has been merged, so this now just a side
> discussion.

It hasn't, its still in master-next waiting for us to reach a
conclusion...

Cheers,

Richard

