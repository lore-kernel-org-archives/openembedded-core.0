Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 933AF7D084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 23:10:56 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id b10so460651vsp.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 16:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fiU7ufseGMcOCCKwpKy0e4ro4fMGGCHLw36eKsOqZig=;
	b=CV0VsRCVNuguw28Jd6m2g7FFQYgUaq8D+g7Aa+RFraCqaB4m067an+ziSATZOmMHTb
	7ZMAdk124/m5HuAenCJUbIyWuATJxLV+7Q49bsOw2ZtQrPUHp6qmVeEO1WXJEcWa67np
	1IoY2G1m1dfs7jNVs71VjsQtvSxzssw7yO9c9f7T2Wq7II/BPKPZjTstRDxZPWNIK0bz
	aViNl5a7QUJ7iJGTz/MzrwSBV+3bs2JaMCINL83Ckj5cuxWhBbu0cAZXT5gnfhB/aEoi
	NYoVcK0kemkCDWvgNuCoze23vcyfLrHFEgzIvh1MSo8r3V/aspXawUpRmY+Vpm0dwCnR
	OSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fiU7ufseGMcOCCKwpKy0e4ro4fMGGCHLw36eKsOqZig=;
	b=hTTmk/VdsWfhbDbQrV7JWk0w8o492MOzrIgAkeETDQA03k7wN/ayiLI56deERIDarb
	W/LE3Xz7YMKbKR9mcZRx/lFRbq/Tg75VAXrCfsXdm8lSBcuMLoSXUpP9HdU3fY9C+ui5
	BWFds5G8xm2gUONIT6dG3ts8bYthjBS+a2axs+xLb5myWcXYcHDU7ateYS7InuH7YuQp
	+5U7jJcTpRoAkQyRjs6JTJ8iOcDGe9rbSYN5Gxg5/4UCEbsiUaq29WOleFa74RzjhcSu
	54+jajc7jwcZKlUWq6r4iRR/Q7N6z01qdpD4YC0VS7MNo4GweIssJ174EEJr5loAQpl8
	+Oug==
X-Gm-Message-State: APjAAAX74gt1pYmZsEwtdwKhR7A8RLWxWKpFiI7qhyIF8Dbvf9iHo9rB
	MrRueWXK6071Xs2USsKESXjWc3t6TIDU10K7/+s=
X-Google-Smtp-Source: APXvYqwCXNz08DBwK8UqKfMPahlhcKkoQKleglCFGfAjvV7gmFw24r1VKTx3fcJkS8HdYmr71eR30cVbleMVcO/bDhA=
X-Received: by 2002:a67:2686:: with SMTP id
	m128mr23632170vsm.130.1559085057413; 
	Tue, 28 May 2019 16:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
	<CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
	<20190525072547.GC12358@localhost>
In-Reply-To: <20190525072547.GC12358@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 May 2019 16:10:45 -0700
Message-ID: <CAJ86T=X9grKeXkZMBL0zh6TeTRoyxg_TL3D=ADYvnH_L-6s3nw@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 May 2019 23:10:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 25, 2019 at 12:25 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Is there development capacity to support musl?

It would be shame if there wasn't enough developer capacity to support
musl but in the end it comes down to what contributors to OE want to
work on.

There's a danger that the areas which OE contributors want to work on
don't exactly match what the overall Embedded Linux community wants
and we alienate potential users (for example we ditched uClibc support
not because no one wants to use uClibc any more but because no
contributors to OE wanted to spend time on uClibc) but overall the
model seems to work OK. I think right now we have enough interest in
musl to keep it alive.

> Supporting musl is a real pain across the board,
> with new issues all the time.

There are always new issues and bugs to be solved in OE as a
consequence of trying to keep all packages up to date. Whether the
issues arising from musl are a real pain or a fun new set of problems
to solve is mostly a matter of perspective.

> For really tiny systems you need both a tiny C library and a tiny init> system, so not properly supporting the combination of both forces users
> to use alternative options instead of OE.
>
> Which minimizes the benefits gained by the pains of supporting musl.

A modern tiny init system would be nice to have, but it's not
essential or fair to say that musl is useless without one. Many
projects, especially tiny ones, manage fine with init scripts and
custom process management.

> > It's certainly a problem and we should try to fix it. It's not at all
> > uncommon that patches to fix build issues with musl, clang, a new
> > version of gcc, etc have a life cycle... a first pass just to fix the
> > build and then updates as issues are found or better solutions get
> > merged upstream. It's the normal process. You could argue that we are
> > sometimes too quick to merge the first pass hacks and too slow to
> > review and update them, but unfortunately that's just a consequence of
> > limited developer resources (and it's always more fun to try to get
> > the latest version of something working than review and cleanup old
> > patches...).
>
> If upstreaming is possible at all.
>
> With systemd on musl there is also the fundamental problem that
> neither of the upstreams is interested in compromising their
> software for the other.
>
> Not to blame either of them, there is simply a fundamental conflict
> between the systemd "use all functionality available" and the musl
> "be a tiny C library" and "follow standards and provide only some
> GNU extensions".
>
> One example:
>
> systemd uses qsort_r.
> musl upstream doesn't want to add qsort_r since it is nonstandard
> and BSD and glibc ended up providing incompatible versions.
> Most C libraries for Linux just follow glibc on that,
> but musl upstream is not doing this with a reasonable
> technical justification.
>
> For 0002-don-t-use-glibc-specific-qsort_r.patch (which looks as if it
> does cause data corruption) upstream is therefore in practice POSIX,
> unless you manage to convince systemd upstream to use something like
> gnulib to provide all the functionality they use that is not provided
> by musl. Which would also be a constant effort you have to makes since
> systemd upstream would not care about musl when making changes to
> their code.
>
> Even harder are cases like on_exit(3) (not currently hit by systemd but
> by other Linux-only software), which might not be implementable as an
> external function outside the C library.

Upstreamable solutions should always be preferred but if you can
accept that OE may need to carry patches which will never be
upstreamed (which isn't too much of a stretch given the age of some of
the patches we carry for gcc, busybox, etc) then none of the currently
known issues with systemd and musl seem like fundamental problems. A
few pragmatic patches applied by OE would go a long way to bridging
the conflicting goals of the two upstream projects. It's basically the
approach we've taken already - the question is just one of improving
the patches we already have (and maybe patching musl to add missing
functionality instead of only trying to patch systemd to not depend on
it).

