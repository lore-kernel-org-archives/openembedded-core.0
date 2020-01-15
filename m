Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4681F7E797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:46:57 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so16454954eds.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RtOoHtAu8B0i83LOjxxWIQhUVNFbsiL6KShNm0NnQx0=;
	b=SkxINVYFXQU8NzY48Xpn1cp+bnHKR+8xCc59jX1uAoK6bAQaQxdB1x0bG2hzjchOVs
	6nBlhyeLBEwUlS65d+M3eaSwrkMtMw0b9jDmOsmtKA5Ox6DE7BiZsulZOCuLPFwxtBBp
	nQCQlU4KDmMs9EZ+6uaNmH3kefCnYnHpHv5yC/QRnol51hBl11l4HFvjmyjj7YPUQlv9
	OaqpVFYe9zeFAb1y5TzI4f5oMa9avoPlR0yJA3I96GB/rCGTZs9AwqkxUt5fRVM7Q0De
	lswSaxzkUsFGdrOQY0U51algka8AK06IzUIJOxSQnoKxPp6FnvKXHnGZQA8YWtBa5y8C
	d2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RtOoHtAu8B0i83LOjxxWIQhUVNFbsiL6KShNm0NnQx0=;
	b=h6N5VSUHcz9Sm1G+FT3HruwzIoN9fs10NsdWoZMhZNX5dxtpmbunTgKZPdfHc5d8mg
	Mh1tdlACokngGJBP1/Lhxhy0CdeGHxy9NDd7bXU0e+6p56T3JxcJmB9F8map95Wnm4i9
	/BHXAMkrGYa91ZbCCDF79YJbiHrFykN1aapgeTM/Cd8zJDzuVnVYru12UGI653QX/GEJ
	vCJSZ6Al3eP1A7X59qmrf2Y/FMbQpa77J1krfypyMkhPMvXgDgCxJv5sNtQp4pAfJnrX
	OHQbUnnlLPRV3CW5TpLo8wKEoUXU2a07N04QPYTLL5lQCa+opnykEOvJUxal4dzfsPTz
	0IuA==
X-Gm-Message-State: APjAAAVXVWumQkGxE7XfzyVoEWZ914NxT52rM+Em2X0qniJEtZ2f6WuJ
	uS/zsaR4JiQxAqR9kQCt040zNEl8NPQVew4KTpe0gZtL
X-Google-Smtp-Source: APXvYqxm1fZCesjnKsLe+25zI3amDOUeFIvvrHUisSgMENXh+OX4slwQnHDWlVjeIIilZAsN+s402K1pnrYyEeMZ5xE=
X-Received: by 2002:a17:906:c28b:: with SMTP id
	r11mr29257095ejz.291.1579114017744; 
	Wed, 15 Jan 2020 10:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20200115180828.17399-1-pbarker@konsulko.com>
	<CADkTA4MSwdq_JjofhfyCJvQ=dY45G9tYhGtAp2Vv+7M-EB46Rw@mail.gmail.com>
In-Reply-To: <CADkTA4MSwdq_JjofhfyCJvQ=dY45G9tYhGtAp2Vv+7M-EB46Rw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2020 13:46:46 -0500
Message-ID: <CADkTA4OLsihtvEfMOsVjF1vqj-1=ogXywQij0dA6RHLo0CJTkQ@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make kernel-yocto bbclass usable without linux-yocto.inc
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
X-List-Received-Date: Wed, 15 Jan 2020 18:46:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 1:36 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I already have an entire queue in development for this.
>
> So hold onto this series. I'll publish my branch later this week, or early next.

Actually, I'll see how it stacks on top of my changes and send a
unified branch to try out. That's probably the easiest way to get them
all working together.

Patches 2/3 look good, but I'd rather wait until we have the whole
series ready to go before Acking.

Cheers,

Bruce

>
> Bruce
>
> On Wed, Jan 15, 2020 at 1:08 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > Patch 1 allows the kernel-yocto bbclass to be inherited directly in a recipe
> > without needing to use linux-yocto.inc. I can then use kconfig fragments in
> > my kernel recipe without pulling in the whole of linux-yocto.inc (which
> > includes some things I don't want like KERNEL_FEATURES changes and the
> > LINUX_VERSION_EXTENSION default).
> >
> > Patches 2 & 3 fix some minor issues I spotted while working on this.
> >
> > I've tested that linux-yocto can still be built for qemux86 after these
> > changes.
> >
> > Paul Barker (3):
> >   kernel-yocto: Move defaults and tasks from linux-yocto.inc into
> >     bbclass
> >   kernel-yocto: Drop setting of unused variables in do_kernel_metadata
> >   kernel-yocto: Only override CONFIG_LOCALVERSION if
> >     LINUX_VERSION_EXTENSION is set
> >
> >  meta/classes/kernel-yocto.bbclass         | 34 +++++++++++++++++------
> >  meta/recipes-kernel/linux/linux-yocto.inc | 21 --------------
> >  2 files changed, 25 insertions(+), 30 deletions(-)
> >
> > --
> > 2.20.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

