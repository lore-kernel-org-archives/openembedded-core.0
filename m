Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 365D17F568
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:59:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id b20so14848117ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mtgLm9hduj1ku+unmhdxkrbb7LMMO+75TFIrFAsUO2c=;
	b=o09asn2qqgvUjB83VTSHUxuCNRp4zNQCqV9H22WkJeudU1T1hoWtloVdYaN07EepvE
	5n57Xa0HGHUYnJIjPvhNzkvgG6BOpblu4iny060KchTLMoEGp1SV50rf2Ny3voH+660f
	xI/LA8BA54NADJvnX42Jh9HKo6u+vhkUjHOtGwxsZ4xoGJgTuUfxFjNbQ6Qr8BUTuEqG
	dDlf+YtZn9rr1ookBrlpFDrRGrh0FXA3GXhS2YvnD3HIqJeiRXeVGczao2EAIXQM5n3T
	MPRwUlwvK3c10r7ANShO2M3ERC5MI7KyxE2IxKsNfodhU83HWN0uQQFOu33OKnr5ASjV
	aoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mtgLm9hduj1ku+unmhdxkrbb7LMMO+75TFIrFAsUO2c=;
	b=IqSeYDCC1batr89OkVZrQfCwD6RB/EBNH3veYjH9pUz0mo9SeOmuu4hqDfXO4SLrAe
	y5CjPm05IW/f3VuifYtcKQZO+WvmMlY21KfpqY0HPFZ30aJ4YjRHxo3XawYPGDX7wYAh
	Bs1jupHT+/+hCJG/v3NG7WODuylCOfxTtQRhBfty94fo9QIpMPY0T+OaD3aQNN6Yg3aR
	VHbLKdxyFlB7YhyScaCjHwO5f3aIehBVbNHE0+okxUmz6sM1oQx6MgsyAQoD4X1/2NeL
	Q2jBdFeKqm9f03kU8XKNx8rAx/kTtwvcOjQMsiSlZ4kwDGdH3CaokCTaXPgVD266PIMa
	dgYw==
X-Gm-Message-State: APjAAAU9ONj2CGHsc0k403oB41fS11vYEY//gwwKaYXr6XVhzdSJJiGI
	PeHGN82rzdZIAWo2lQbsBnU4MtPQ8owqtHNtzMo=
X-Google-Smtp-Source: APXvYqxihfvQ505RlmCROgvD3IKQzXEZiL8mWyTZdPKMoIJnMWz5L422q5IJJNA4GPh2yQ1K27/asFCDhGKLzFLiZ6k=
X-Received: by 2002:a2e:63c7:: with SMTP id s68mr16595873lje.244.1571691580674;
	Mon, 21 Oct 2019 13:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
	<501fbbcc04603d80fb47727bdde64ca5abe14e87.1571688520.git.bruce.ashfield@gmail.com>
	<20191021202303.GA1500@jama>
In-Reply-To: <20191021202303.GA1500@jama>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Oct 2019 16:59:29 -0400
Message-ID: <CADkTA4NO85kP-RxS7CBPTeUAzA=yppwz4kN9qXCHvpgxOv4YvA@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Oct 2019 20:59:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 21, 2019 at 4:23 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 04:16:15PM -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > When building perf for 5.4+, we have some new files that need to
> > be copied (and synchronized) due to structural changes in the
> > kernel source tree.
> >
> > Some of the issues these fixes are warnings, but none the less,
> > they are worth fixing.
> >
> >  - We copy arch/${ARCH}/Makefile, since it is source by some perf
> >    Makefiles
> >
> >  - We copy scripts/, since the perf utilities are looking for files
> >    in that directory stucture.
> >
> >  - We have *three* copies of ctypes.h in the tools/* hierarchy
> >    during the build. If the tools/perf/util/include/linux/ variant
> >    is used, it will trigger build errors since it is not complete.
> >    We copy the kernel's main include/linux/ctype.h to ensure they
> >    are in sync.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > index 8201c0cb60..0f5df74f11 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -113,6 +113,8 @@ PERF_SRC ?= "Makefile \
> >               tools/Makefile \
> >               tools/perf \
> >               tools/scripts \
> > +             scripts/ \
> > +             arch/${ARCH}/Makefile \
> >  "
> >
> >  PERF_EXTRA_LDFLAGS = ""
> > @@ -246,6 +248,11 @@ do_configure_prepend () {
> >
> >      # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> >      [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > +
> > +    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
>
> This one doesn't look right, why are you checking for the destination
> existence instead of source?

It wasn't showing up in all of the versions that I tested, so I added
the check to ensure that the copied util/include even had the file
before copying something into that location. I can double check my
logs to be sure (about it not being everywhere), but I did intend to
test it the way it is written.

Bruce

>
> > +    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > +    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> >  }
> >
> >  python do_package_prepend() {
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

