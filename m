Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA5057F457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 21:11:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m13so14838019ljj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QaJ2pDPiEk4iUfOU1U0w67W7Hl2BMp5kD+CapMA9HTg=;
	b=cKeqL+HwcAr6x5EEBDtymDNEkWkmHduok9O5QqPVS/YeJ7qifQWfVIntQrplRG/mfU
	JCPLaT/VFzz5ZYGvTSJ2lEVkBnd+fAbGuIX6otfDPuSUF6i89DIlfahA6HyE9VwsLpgJ
	tTeON/4p+FJ8tK2uPd5mJBZdGUw1rda0C6HP1nK+HCcbAwZNJOCmDuPtH51aNrsImgwH
	TqfLsqqWpYJlJ38Np4dFXGGDniQGfFBnA2YDBdHUdkCSKQIQpplwrGmmJ+/keIz3mrUw
	J2OTkDNn/gHbOzC1GfJhfDSRqI4RXElAqf/wLjxHefaDIjbZlInb5OckT/upcssYAJ2g
	7GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QaJ2pDPiEk4iUfOU1U0w67W7Hl2BMp5kD+CapMA9HTg=;
	b=m2oY5U+jWkIvHRUOq3ZSCE8wsR1/ZFw3cKLf+LvdUkBt4i7h/WouGD7lnTVYwX/7QV
	klKAwGQi7bMIIowGrcg8pn59Pt44zkThAw6IgAcWrGPgfRwc5X6tuH95CFjruhiTOQ5f
	g05iN8Pa5Z17sgSpx19SzOansFu9P5Nmb8el/aQphGBuLgqXAanfJT0SvZZQV/0Gs/IH
	vvIqC/arrRetinf1ba+7+eQKa9EIHbYWwlT0N8dmwanbfvp6/lDbjAFXOhcOY8EbvJqZ
	1kkdA/I92XkswkyE9rH9+zYysJxygnoj3oEJwOHkcY6J1bNwIiJERILp4s7S450HrhfH
	rb7w==
X-Gm-Message-State: APjAAAWTRTepjPwQXBB7KNnVNHt13N6t1USPuyH7rQ2XGZxFzl1uUyyR
	VXPoHTOC3Jk/RDkfs0okvpbWUnLPrsJSQhWZ9h0=
X-Google-Smtp-Source: APXvYqwehqBEtgA3x2N4uTOnaZmS+Yu+THqWzhlzlb1TJ9fJGJdWVcSv8A5IlhPveR+oWfrX1Ykints31lOf3Ln5i9s=
X-Received: by 2002:a2e:9693:: with SMTP id q19mr15943943lji.6.1571692276277; 
	Mon, 21 Oct 2019 14:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
	<501fbbcc04603d80fb47727bdde64ca5abe14e87.1571688520.git.bruce.ashfield@gmail.com>
	<20191021202303.GA1500@jama>
	<CADkTA4NO85kP-RxS7CBPTeUAzA=yppwz4kN9qXCHvpgxOv4YvA@mail.gmail.com>
In-Reply-To: <CADkTA4NO85kP-RxS7CBPTeUAzA=yppwz4kN9qXCHvpgxOv4YvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Oct 2019 17:11:05 -0400
Message-ID: <CADkTA4PkfKmNr2BWoziay4RMKgme6tmc=Byj146W40OnZWM1uQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] perf: fix v5.4+ builds
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
X-List-Received-Date: Mon, 21 Oct 2019 21:11:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 21, 2019 at 4:59 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 4:23 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 04:16:15PM -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > When building perf for 5.4+, we have some new files that need to
> > > be copied (and synchronized) due to structural changes in the
> > > kernel source tree.
> > >
> > > Some of the issues these fixes are warnings, but none the less,
> > > they are worth fixing.
> > >
> > >  - We copy arch/${ARCH}/Makefile, since it is source by some perf
> > >    Makefiles
> > >
> > >  - We copy scripts/, since the perf utilities are looking for files
> > >    in that directory stucture.
> > >
> > >  - We have *three* copies of ctypes.h in the tools/* hierarchy
> > >    during the build. If the tools/perf/util/include/linux/ variant
> > >    is used, it will trigger build errors since it is not complete.
> > >    We copy the kernel's main include/linux/ctype.h to ensure they
> > >    are in sync.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/perf/perf.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > > index 8201c0cb60..0f5df74f11 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -113,6 +113,8 @@ PERF_SRC ?= "Makefile \
> > >               tools/Makefile \
> > >               tools/perf \
> > >               tools/scripts \
> > > +             scripts/ \
> > > +             arch/${ARCH}/Makefile \
> > >  "
> > >
> > >  PERF_EXTRA_LDFLAGS = ""
> > > @@ -246,6 +248,11 @@ do_configure_prepend () {
> > >
> > >      # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> > >      [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > > +
> > > +    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> >
> > This one doesn't look right, why are you checking for the destination
> > existence instead of source?
>
> It wasn't showing up in all of the versions that I tested, so I added
> the check to ensure that the copied util/include even had the file
> before copying something into that location. I can double check my
> logs to be sure (about it not being everywhere), but I did intend to
> test it the way it is written.

.... and having another look at this, I could just as easily test for
the destination (or both!), since in practice if one is there, the
other is there. I only added the check as a safety check for kernels
that I can't test against.

So I can easily switch this, or wait to see if master finds any perf
breakage with my "drop include" patch, and none of the tests will
matter at all. I'm ok with any or all of the above (fix and wait, fix,
or wait).

Bruce

>
> Bruce
>
> >
> > > +    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > > +    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> > >  }
> > >
> > >  python do_package_prepend() {
> > > --
> > > 2.19.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
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

