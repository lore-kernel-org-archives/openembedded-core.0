Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA6E7E285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:04:18 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y6so2708804vsb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cm4CtFipMlXqQGxDfRYSswtAEKHc8zMotGTVtmci+YQ=;
	b=lwqhZoUs0+urnSkkepn268y9XgOWHW0X9/rOTru0D6OOvR7i8vw8PZrw9ceF9kbVMu
	kgLsAyBCCV4ZR6Yg9yiMPKXdOKRaGEpi2LrSNLL3a+EQmo/M/ZKByvFRy3tetTyZ9Hbe
	rdakDIbjVrXc/0uu6OLmU2I0+ut6MeXaBnJpW2dD8InKfwrLpHMU9kFIdem+eHf/l+6x
	bNINCw9PLP9roOVOK4yTYXRj2FwJIFddkUvkZNwJulH7U0vu5wHeQxU4A3LUo2Q2l3Jx
	9+Tdju8j7E1s+FHkPVdcLlh5wAs99Pj9DE+agMneOV+36zjoPHpgK6X6fFoZE7LFHVST
	xdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cm4CtFipMlXqQGxDfRYSswtAEKHc8zMotGTVtmci+YQ=;
	b=paV46atUk3z80S8y2rEP7Ms93QkaaMprWNuyRhMZAjmfnGSb1Q8P3AVsXGlDLdsSz6
	pDxccNAJrDf+nn+5QV5mFT/HcmwTkuX+SeF3OiDIjR/vTRTwDO0urp+9tx2srhSzmI+J
	lJUJJF/HxBBhUY5n+4f4cjTpURkxfFhm5Wik1bIYJx1Cp88Yg6C8fYVKUs9xCxxOMhSE
	iYcDJ3Wirby2yRaHAw8KDuM2iXjs137B8nUF7pOS97Bwop66v7wxNHAs7jGKBUAbwL3S
	F7I5W/8YSFLA+CGPPcVXaBnQFIWCb57khbMFVHQabuMqmFlE7eeyMsiSn/1LliKLap7n
	wung==
X-Gm-Message-State: APjAAAXoIXPqiLylS8n1JdgOF4TdmriVqgfRvT6hfjiVDTjr3mMEMg5F
	/a+xPpqw2TH0yJ/EpFqsE9U4PieG48vC2b1t4k8=
X-Google-Smtp-Source: APXvYqzYkBwbSkRFYs9PFxV3LA+JgPpYVhkArD7hVJ/rCcUZ7j3XDVj2kkkWFG8wPP5GczDK5Z3ssHq/yq2n3Qul318=
X-Received: by 2002:a67:ee12:: with SMTP id f18mr67425130vsp.158.1559156654636;
	Wed, 29 May 2019 12:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
	<CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
	<20190525072547.GC12358@localhost>
	<CAJ86T=X9grKeXkZMBL0zh6TeTRoyxg_TL3D=ADYvnH_L-6s3nw@mail.gmail.com>
	<20190529073101.GB23804@localhost>
In-Reply-To: <20190529073101.GB23804@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 May 2019 12:04:02 -0700
Message-ID: <CAJ86T=W1CCgFYYQz8p-gbF2adDg7jtc6FqAE_a34p1mAjGMDSQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Wed, 29 May 2019 19:04:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 12:31 AM Adrian Bunk <bunk@stusta.de> wrote:
> On Tue, May 28, 2019 at 04:10:45PM -0700, Andre McCurdy wrote:
> > On Sat, May 25, 2019 at 12:25 AM Adrian Bunk <bunk@stusta.de> wrote:
> >...
> > > Supporting musl is a real pain across the board,
> > > with new issues all the time.
> >
> > There are always new issues and bugs to be solved in OE as a
> > consequence of trying to keep all packages up to date. Whether the
> > issues arising from musl are a real pain or a fun new set of problems
> > to solve is mostly a matter of perspective.
>
> Usually someone submits a change, and later gets notified that the
> change was dropped from master-next due to a musl issue.
>
> That's not fun.

Maybe that happens sometimes but I'm not sure that's the "usual" case.
Patches to OE get dropped or ignored for many reasons. If your patch
gets as far as master-next and then gets dropped with some feedback
it's already done better than many others :-) If you're going to
contribute to OE you need to listen to the feedback... and be a little
persistent!

> And all these compile errors with musl due to header order are a real WTF,
> every other library (not limited to C libraries) is now doing headers
> properly so that any order works. No fun in supporting a broken design.

The musl header ordering issues (the potential for duplication of
definitions between low level kernel headers and libc headers) is
specific to C libraries. It's actually a perfect example of a problem
created by a hard line stance from upstream musl which could be
completely solved by a small pragmatic patch applied by OE.

> > > For really tiny systems you need both a tiny C library and a tiny init> system, so not properly supporting the combination of both forces users
> > > to use alternative options instead of OE.
> > >
> > > Which minimizes the benefits gained by the pains of supporting musl.
> >
> > A modern tiny init system would be nice to have, but it's not
> > essential or fair to say that musl is useless without one. Many
> > projects, especially tiny ones, manage fine with init scripts and
> > custom process management.
>
> I was not asking for "modern".
>
> If init scripts are not default and CI tested with musl,
> then init scripts will soon become a broken part of OE.

By that definition (ie anything which is not CI tested is broken) then
most of OE is broken. CI testing covers a very narrow set of
configurations and if you configure for a real world project you're
likely to stray away from them. A few releases back, openssh didn't
work for Thumb2 targets because of a conflict between binutils and
openssl but wasn't caught by CI testing because (at the time) CI
testing was ARMv5 only. In OE 2.7, sqlite3 is broken for big-endian
ARM targets (which aren't part of the CI testing). There are many
other examples. If you plan to use OE in a real product you'd better
plan to do your own CI testing and bug fixing. For many (most?) users
that's perfectly acceptable - it's far better to have functionality in
OE which is basically sound but may need some tweaks than to strip out
everything which hasn't been CI tested.

> >...
> > A few pragmatic patches applied by OE would go a long way to bridging
> > the conflicting goals of the two upstream projects. It's basically the
> > approach we've taken already - the question is just one of improving
> > the patches we already have (and maybe patching musl to add missing
> > functionality instead of only trying to patch systemd to not depend on
> > it).
>
> I already tried patching musl in OE.
> The change got reverted.
>
> There are people who think that OE-specific patches to musl are not
> acceptable, and that it is better to force everyone in OE to patch
> individual packages all the time instead of adding a not upstreamable
> patch to musl.

Yes, I saw that. The rules on what is and what is not acceptable in OE
are not particularly well defined (and then not consistently applied).
It's just the way it is...

