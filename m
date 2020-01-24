Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3525C7FD77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 23:14:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m13so4365002edb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m04jYHCAaImyQxeCvz6/CyVw2p/emRuLH4KUPyBrTeE=;
	b=pseCGBDbkchlEptx3acz5n1CQVi1wE1TQBrnMWjXEx5zMzGaDAMfZfbCknu/lcSQoA
	VVpZZr+KWq5S0s4lOvodJ7FL1JfAvd5MVupmFQtEiFC/TP6wn2OhIt6kQ6mqGB0phVea
	Zt2pa2d9BGEo1FCZI6Fe79XV71kfPXqx1PZXh6qEw0KJnYKrP5OfnuhHsciEe9Xmc7pV
	Meslj7FSjJnxzAty4rflP1j7vqTsljaMfqFm66dGbSqUMbMudsk1bKQXIesV5ylfVjV+
	kVALNUAXOgRLi9t4yLdiXQAo2ts0tADibvFRB9NRnimq1MDwiiXAiW5zmGD4Ua4nd9TA
	5YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m04jYHCAaImyQxeCvz6/CyVw2p/emRuLH4KUPyBrTeE=;
	b=fDdAHDbToLWIcjIzTDZ4Yv3joSWylROLQj3ID6G2xSwpaDdxs9g7KW4B4+6VKquOgd
	zma1XPtuMpvlLwLnIOBp0AiD7oyYvuZ7FEnye7/idheE+HAQAvJ2N0lR9yFrIBpxGz38
	pFY3oeUCXGBwzde/VeIPcr4Bcl69rLKLO370MTAIgADweFSbKi3aohnlZJ0IZ6/luz+m
	gLyELBgBl52Sz2Fr6USqfMfGaAc1HfbcF7dVJkgRhAjpy2o5tRVGd/izGKsYcYArUarU
	PN7OIsv/oJu5D/FdpdqMJXqgDgQMlFRQQikT6p/IwJKFk15MbqgJXHNfQVLsjRw7So9E
	z52Q==
X-Gm-Message-State: APjAAAUIUjfIZxTBUNUsT2XDGR/I0KKXe5YorR51ed2zQpZA9zvjfggq
	gMtwYNejKzl/MOgLf7FYpVKTDGCCGlVm8dumjIE=
X-Google-Smtp-Source: APXvYqz7DNR8CkSZst0QSGsPV2DThLQ8AQaZpcHwMq4QLfX4CDr/WzdOcbh+yQajDoajfu0Zc9xrhJh08hITyzwIcnY=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr4915882ejj.6.1579907672554; 
	Fri, 24 Jan 2020 15:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20200115180828.17399-1-pbarker@konsulko.com>
	<CADkTA4MSwdq_JjofhfyCJvQ=dY45G9tYhGtAp2Vv+7M-EB46Rw@mail.gmail.com>
	<CADkTA4OLsihtvEfMOsVjF1vqj-1=ogXywQij0dA6RHLo0CJTkQ@mail.gmail.com>
In-Reply-To: <CADkTA4OLsihtvEfMOsVjF1vqj-1=ogXywQij0dA6RHLo0CJTkQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Jan 2020 18:14:21 -0500
Message-ID: <CADkTA4NukAL7DRF6xeeXxxO+N36fv69ySipb3w1brLiaupzYvA@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Jan 2020 23:14:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 1:46 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jan 15, 2020 at 1:36 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > I already have an entire queue in development for this.
> >
> > So hold onto this series. I'll publish my branch later this week, or early next.
>
> Actually, I'll see how it stacks on top of my changes and send a
> unified branch to try out. That's probably the easiest way to get them
> all working together.
>
> Patches 2/3 look good, but I'd rather wait until we have the whole
> series ready to go before Acking.

I haven't forgotten about this, but the issues with 5.4 as the
reference/LTS kernel popped back up and I didn't get a chance to stack
this and test with my other kernel-yocto changes.  I will get to it
shortly though.

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > Bruce
> >
> > On Wed, Jan 15, 2020 at 1:08 PM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > Patch 1 allows the kernel-yocto bbclass to be inherited directly in a recipe
> > > without needing to use linux-yocto.inc. I can then use kconfig fragments in
> > > my kernel recipe without pulling in the whole of linux-yocto.inc (which
> > > includes some things I don't want like KERNEL_FEATURES changes and the
> > > LINUX_VERSION_EXTENSION default).
> > >
> > > Patches 2 & 3 fix some minor issues I spotted while working on this.
> > >
> > > I've tested that linux-yocto can still be built for qemux86 after these
> > > changes.
> > >
> > > Paul Barker (3):
> > >   kernel-yocto: Move defaults and tasks from linux-yocto.inc into
> > >     bbclass
> > >   kernel-yocto: Drop setting of unused variables in do_kernel_metadata
> > >   kernel-yocto: Only override CONFIG_LOCALVERSION if
> > >     LINUX_VERSION_EXTENSION is set
> > >
> > >  meta/classes/kernel-yocto.bbclass         | 34 +++++++++++++++++------
> > >  meta/recipes-kernel/linux/linux-yocto.inc | 21 --------------
> > >  2 files changed, 25 insertions(+), 30 deletions(-)
> > >
> > > --
> > > 2.20.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
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

