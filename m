Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF2767C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:06:51 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g18so32871453qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QK7WjgEWyDgoVZcCtqD1A5KukYs5LUOfSO7dbKuoW3w=;
	b=gbhSUYHfmuHYHTXRujkmNKqrbLPUAanymyMGxguMqi7WUVTNGnNd1P/hA/j/6TJWrR
	aJ6Wybf4JNL+GHQde9JNJ+DyKhz40ZVVE+U2lxHBUdTK9KauYK/A+tVQa46s3Tq6hGnf
	h/TWsmamt8AlL7XPzjhwp/UgefYNWDj6AmqRRdmdfzrdfaittGezhmxPl9CoKHBFKoRZ
	cota4kzf2wvFZQuFWfHnRfRUfzoZh4m/J+OgLVbg3s6FzE2csAvvc/i19MbBDkApHkDx
	8bR5l9uED6GrcSF0Jq6urFLDCgIBXBgWaSPxu8Hp8unnt0CIlz4ASXZY/5wDezBQGbSp
	mqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QK7WjgEWyDgoVZcCtqD1A5KukYs5LUOfSO7dbKuoW3w=;
	b=Pfxyy3ZrJhw9MP+z+dTDmeT49KNQLU6hpQxqmzdyVPBqeNfueakZ3oETc7gVh+Ulav
	CtRD0x1NhGXChcwV3Y4iho4iZ32OOTwUmEuwJczjDlTpKHz7cDuK+O0Yv715Vh/1urkv
	bIG5dsYxslmCDpAg2qTiLyTRYUUr2xHvttzlQkFuZf2BgfturUZWIBpy6IQL5LtJjErt
	+Q2LG2S4bKcSfOld0KDx1c6BESdshFtucyGcRxjIZhNwmc9mcOZx7zd+eMycodtNQndg
	unmLU34smtzwI9QRvccgyEF23vXTLkHXIGQEjE7x13YRTvQmZSMmh/PeRA3m7w6rOjYz
	4bOQ==
X-Gm-Message-State: APjAAAUjxtBdrd/zVlMnCE44b2LDjDEeaUnjvPrGYBGpwXdOrtmVYEwX
	L5rw9ZsypdmO3it4OML+97yf2AFKnEhzLxvhsDA=
X-Google-Smtp-Source: APXvYqxbGImvLu3v0dLmOgCdQ5zk2Mv8uZYuFKuHXa20IK4owxtNV3RlJ3ZBpNAFSSwKXF1unEgyEbPc3HR04bOOPBs=
X-Received: by 2002:a37:7083:: with SMTP id l125mr50892312qkc.71.1563944812404;
	Tue, 23 Jul 2019 22:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
	<CADkTA4Og9UDHziXHSdN2VFvziRXm=dxtpFvMJvueAJrniOB-pA@mail.gmail.com>
In-Reply-To: <CADkTA4Og9UDHziXHSdN2VFvziRXm=dxtpFvMJvueAJrniOB-pA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 22:06:35 -0700
Message-ID: <CAMKF1srTkebjpsQTYM0_VBZAF1zsF7BuowpiSCYL7M341tkZ8w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 05:06:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 8:03 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Jul 23, 2019 at 10:39 PM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > Add a small busybox based container image.
>
> This really isn't a great container reference image. It isn't
> manipulating many of
> the things that you should be in a container image (linux-dummy, etc).
>
> Have you seen the reference images that have either been presented at the
> various ELC conferences and/or the ones that are in meta-virtualization ?
> Or the ones from Togan labs, meta-overc, etc ?
>
> IMHO, It would be better to collaborate on this in a non-core layer
> for this release and
> then consolidate things with the OCI image types, and when we sort out
> if/what/when
> makes sense from meta-virt into oe-core.

I think this is very much suitable for OE-Core, and I would like us to
have container reference image
in core, however, I agree there is prework that should be includes
from prior work in other layers and
we should consolidate all that into a reference usable image in oe-core.

>
> This is a topic of many opinions and different implementations and deserves some
> cycles spent on documenting the choices, what we expect the base image to
> do, etc.
>
> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 meta/recipes-core/images/container-image-busybox.bb
> >
> > diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
> > new file mode 100644
> > index 0000000000..a4d63b0eea
> > --- /dev/null
> > +++ b/meta/recipes-core/images/container-image-busybox.bb
> > @@ -0,0 +1,8 @@
> > +SUMMARY = "A small busybox based container image."
> > +LICENSE = "MIT"
> > +
> > +IMAGE_INSTALL = "busybox"
> > +IMAGE_LINGUAS = ""
> > +IMAGE_FSTYPES = "container"
> > +
> > +inherit core-image
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

