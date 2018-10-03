Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id E47FD74592
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 13:33:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j68-v6so4499220oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z4Ty1r7V/dpaOfSBm0WK30rU9UabEvw25DHgD+xbruo=;
	b=j+oRHZljttFsl9MJupDsBJUPV1i+jfyEGnS2075gP4jHWz7kfLrpud5s/kH44IUt8r
	ifZx0wk+fFIt2Sw8cg2H1vEutW7Tr77tysJY7DOLnhn54gs/g1POLTFng8E1LCo7LeA1
	kcql4QgpER7x0/N6ugp73OMUR2McZ3xgNTyv03eRTd2YeQYQLp1d+pog52Y+lbfKyhCB
	+Q4ioWe8YwRW6g6Nlmqa5mMotm+6nn4qQ5LrHG0X3d5gbHbUknSLBcgBeTy8ZzbvfPP1
	N0lU9SxN3mAGDpX8ZG3v8tDtGV0H/3AJazjZO7IlMJPG4ygqfU6n7fEhzQcfRdK/TgFW
	sDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z4Ty1r7V/dpaOfSBm0WK30rU9UabEvw25DHgD+xbruo=;
	b=S8q/P1tlCPIL33/GGChmvSiuJh8Q0gSVq9ARbflj34cDzdAndFPrtgys1rd098PW6Y
	6NlDooQEwqGxOvZb7eziLDaUe1DWrpdf/0NauMEu+MXnatjyxn67rm+V6YOw0QdlvkwP
	o4ck61PrZWTT2R8oI6zIVLGdJ+KYVrwGQP5TddC0AUOQ9j1vBS6x8GZWl3dMpztHt01s
	gYXyqb/5w/PWG4SlytyEnM5B/ZBLX7BSVsivjOuv+ebvE/poFfcV8Hy9pGwQ5duynOJY
	0GbMPiKkD7vc4xH10ivuz22cB9iqz9c9mYRmH/gGupicJ+L+JFH9aeoi4dohw5JVNwsr
	jl+A==
X-Gm-Message-State: ABuFfohQwxrI4Ry8FosqyGoSaVUYU9XURW3CmJQCK5s+RFC7mu3RKT3g
	zlNpul45pZFjxsjHfu4tOn3vKzHLL25zE7A4T10aRw==
X-Google-Smtp-Source: ACcGV626va2lWL6xn7dsfayeZv5BPZ5cotRIKWIoQAhpfrR7Pn+imngJnJnWIDdnKEqyG9JWI5ipRECM/KC3R0mMaqA=
X-Received: by 2002:aca:1e08:: with SMTP id m8-v6mr641990oic.91.1538573582511; 
	Wed, 03 Oct 2018 06:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20181003004405.34524-1-raj.khem@gmail.com>
	<CAJTo0LYvEHqmG35+NQAkts=0w7NkZa5iZJ6zwYb5FSfBe=xEdA@mail.gmail.com>
In-Reply-To: <CAJTo0LYvEHqmG35+NQAkts=0w7NkZa5iZJ6zwYb5FSfBe=xEdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Oct 2018 06:32:34 -0700
Message-ID: <CAMKF1spJL+ooZ7bvruVVbLZWO=KYGB-M0sBQiN5msDwAqfsCOA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] mesa: Disable asm on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2018 13:33:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 3, 2018 at 2:12 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Perfect. :)  Did you file a bug upstream, or shall I copy/paste that
> into a bug now?

i did not. thanks in advance if you can
>
> Ross
> On Wed, 3 Oct 2018 at 01:49, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Musl started blocking dlopen of libs with initial-exec references into
> > dynamic TLS area, via
> >
> > https://github.com/kraj/musl/commit/5c2f46a214fceeee3c3e41700c51415e0a4f1acd
> >
> > prior to that commit, musl was loading it and silently letting
> > subsequent TLS accesses via the miscompiled code clobber memory that
> > didn't belong to them
> >
> > This was wrong behavior and it relied on additional space reserved by
> > libc in TLS space to adjust fo such broken libs, but it also fails
> > with glibc if the reserved space was already used up
> >
> > Right fix is that  mesa should be patched to remove all the
> > initial-exec hacks and use real TLS, and -mtls-dialect=gnu2 (TLSDESC)
> > should be used on archs it's supported on (i386, x86_64, and aarch64)
> > to make up for the lost performance, but mesa hardcodes the initial-exec,
> > so there must be a reason that probably is better known to mesa devs.
> >
> > but we 'fixed' it for musl by adding --disable-glx-tls for mesa in OE,
> > which uses pthread_getspecific instead and makes is lot slower.
> >
> > this caused additional problems with security flags on, it get textrels
> > in .text segment. Therefore this is 'second fix' to get us through this
> > warning.
> >
> > Cause is some unknown part of mesa's x86 assembly code is broken by
> > readonly text segments
> >
> > [ YOCTO #12918 ]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > V3: Disable asm just on x86, since it works well elsewhere
> >
> >  meta/recipes-graphics/mesa/mesa.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index 8d0e2cb67c..0dfdfbd5b4 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -108,6 +108,8 @@ PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
> >
> >  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
> >  EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> > +EXTRA_OECONF_append_libc-musl_x86 = " --disable-asm"
> > +
> >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> >
> > --
> > 2.19.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

