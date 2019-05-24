Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D5AEA7E4D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:31:50 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b18so2712601qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=npJx7uf/Bri+LAtHDYbLOWVXOOfm78H3UrmPKWKvGl0=;
	b=EPHmzOIE6WuuLHSaUIBx7ibk6skdo6VVUByRQSxeXxDNx4HTdrEZ0L4APV65sQuwjt
	YT5kL1Bx16ExhgBSvPX9k35Q8Rf8E/6gyO4zMuz9u+wFASsiUoCmoX+Tr27hUaex7Jmk
	RjQHP6HEA4K82MtW/awsrP3ry9+XZ8PLpF4oezzK7p9bPxUwch7uB9Rffp2EAemfAlCv
	6Mc3XIiQqHQLTGgadBUZ3Kb54z/7BIzwjXQGCMmI6f2oujchEpqSFJ68Nx7xc6bN+ilD
	oSwtLAB/PA9HWeMeS2wQdGFOXoyc7ZimTgqhhWtlE0dw2fV5hqD0GQZVh99/zVvafyPr
	cYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=npJx7uf/Bri+LAtHDYbLOWVXOOfm78H3UrmPKWKvGl0=;
	b=lTdpcDP08qWhNJdCHi9CtjwVCj6bYmLShXSOiAvZruy2zR4pjwfy73iyYQDt+RTKtt
	aGLbELZci82DfY7vHvXEewNG9prPXhOuGKCZsmYMfXao2A1gjaKZnCeRQEbd/t/zU+Ey
	fFQIIZMCdvW6Fu1P8z1dF63O1ot8ylY1r99F1FBpyBLxbRdyfjQROlj8tZ+59WFAIf2p
	DAQYc/SKTFVqbHLTcvX14gG/O1EjbrHO7bsbrvdtUaha6KUB9axV1Qnj+Eba586eG1cF
	yzcLMV47Drm5KBcya3G6K7nQDN1qAQI2bLqb5WeyF9cG25sxBN0aDTvtk+nEFjtnBX6k
	fypQ==
X-Gm-Message-State: APjAAAXFTrVlrtglZL6hTIMlr6Kq/rwYN/q0v1AvBgIBnHhOtipHuOKC
	p+s5I4k5zFFjSixxH5jZGIAkvPZycmpgwrKOEn/qj1Ir
X-Google-Smtp-Source: APXvYqyols8E7m3G4lZQXSsfV6nQc97cy9dt9pj9Xk8Ybeo7pPWzFxM4U7TURXVOIUaJROgF1vKzEDbVoLAEiRsEm8w=
X-Received: by 2002:a0c:d251:: with SMTP id o17mr81880753qvh.181.1558719111509;
	Fri, 24 May 2019 10:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
In-Reply-To: <20190524172737.GA6813@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 10:31:25 -0700
Message-ID: <CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 May 2019 17:31:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 10:27 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, May 24, 2019 at 09:13:08AM -0700, Khem Raj wrote:
> >
> >
> > On 5/24/19 3:12 AM, Adrian Bunk wrote:
> > > On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
> > > > ...
> > > > but I think dropping
> > > > systemd support completely from musl is not an option I would like to go
> > > > with, there are cases where this makes sense. Especially when you have to
> > > > cater to different set of devices from small to big, userspace remaining
> > > > same is big advantage atleast in the world I am in.
> > > > ...
> > >
> > > That's a good point - when arguing against systemd as default init system.
> > >
> > > systemd is bigger than glibc, therefore on very small systems where the
> > > size of the C library matters using systemd is usually not an option.
> >
> > Yes, design-wise I concur, in practice, desktop distros rule the linux world
> > and systemd is quite prevalent there,
>
> Desktop distros don't use musl - it wouldn't make sense.
>

Yes,  what I was saying is that decisions on init systems and like that are
influenced by desktops too. Since the apps are being written for across the
board portfolio where some platforms are desktop/server driven some are
more embedded

> > so sometimes you have to wear the
> > shoes of same color, atleast thats what I see.
>
> Is any musl-using distribution supporting it with systemd?
>
> After a cursory look around it doesn't seem that trying to support the
> weird combination of systemd and musl brings compatibility with anyone
> else.
>
> > apps want to run uniformly on both OE and non-OE systems
>
> This implies using glibc, which is the correct choice in most cases.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

