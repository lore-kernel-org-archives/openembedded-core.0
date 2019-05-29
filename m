Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 24B347E043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 09:02:16 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 14so1654319qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2b0MtW7P55MEc25XS1DXYFHnQh2xYXjbnkI/Z7E24x8=;
	b=aRSdiW7ds03/vcaJIQNfhVaEfcKuwTWjmCxHBwBGeyffVzdDImVIwKX5r1Jz6sV8HG
	d1hQynYx5f7NxugsqJpjLIUPpDbL4A9JZlpQ1GQLsXfq3cEcCwzCZRlvVcIfVo7AqEh6
	1pBf/OC+7lOWb5zQVLAn32q2VFF1A5KIPcGtvH/BX8Pz1VyDWybOrpeA+Ns8eiIS5Jml
	+wSUdaHKoWwI+Rasz6UGk6W0tNCH8uX1AWyI2VcopB8Uq+h19sYT3qrC97uwcQii5xE/
	9YdYBgcmVHLp5BstSBzpCtveTenjHQVsJx6K59I0ItbIxITt6LOq3LScskfVPqLNVoxE
	adKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2b0MtW7P55MEc25XS1DXYFHnQh2xYXjbnkI/Z7E24x8=;
	b=oL8m7KcpysKNm6dwpD4QD/f8DoSJ36fqYTwFxFaRNpK2euz4EKnXhHY5ETOfQyDBKp
	2H62jUuL6IQD/xklB4d4iGLpOUsf1IhwE3ybNKVgHVIT3Dool/jGBWp47NBU36/ra3Rj
	bEUJYXgm8v2BuKvQjbMER5qVUhfsCb3GBIW3lusu0T3pMKHvyV85TU7cLqqeYdaHQkxF
	gmynW5fKFMJoa7P2lpgx96Ls2VXKqoAZggYzyHcL8DabmI/gIZtFyescfkAqKf1gpqWP
	HQzmWIr8u7ODAPWjZk4NAZHLhEDEECpeqszwbgDypLq3jhdou1P18z90KmqvOL5ouGoh
	WEyg==
X-Gm-Message-State: APjAAAXUOaXXEhb+5GMvdJfa4+wnpHjSVJxCO5NhvObW8i5re5I/oeE0
	svaMtanNMj4HGhV4X/mpdAs3mlFZJO3u52oWziU=
X-Google-Smtp-Source: APXvYqzLYEqfBtg7aFn0eiwK83hMStCe5t4ZsO5pWQVRSwamuaj8521UTX+bvDBKXWQCdCpEdPjSNt0hSl3dF/S04EU=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr6265529qtx.194.1559120537754; 
	Wed, 29 May 2019 02:02:17 -0700 (PDT)
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
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:01:51 +0200
Message-ID: <CAMKF1sp8tzV=5y8p=s4A0gwH4NpaW7MDF-Gbbon-QrUJrbgChw@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 May 2019 09:02:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 9:31 AM Adrian Bunk <bunk@stusta.de> wrote:
>
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

I have re-iterated many times that if your patch regresses musl and
you dont want to fix it
when I provide feedback on the patch, say it there. master-next is
merely an integration branch
it does not mean that if a patch shows up on master-next then its any
good or bad for that matter
its for CI purpose only. master-next queue gets re-aligned all the
time. My point to drop the patch
is that submitter would be interested in fixing it which most of the
times submitters are kind enough
but I will respect reluctance to fix musl of for that matter larger OE
interests that a developer might
not care. Many developers have chipped in to fix regressions in past
and I am hopeful they will
chime in future too.

OE is not a distro, its an infrastructure to build custom distros and
thats its USP, if we were to stick with
one distro then there are plenty out there which are far well supported.

>
> And all these compile errors with musl due to header order are a real WTF,
> every other library (not limited to C libraries) is now doing headers
> properly so that any order works. No fun in supporting a broken design.
>

I think these are concerns you must raise in musl community, OE is
downstream where we can experiment but not fix these problems, thy
should
be fixed in repsective upstreams as much as possible
upsttream might have answers or might benefit from this feedback

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

Infact, there are CI system not exposed to community where its testing
sysvinit with musl

>
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

Its costly to change fundamental APIs in libc which are not accepted
upstream, especially in libc which will
go into SDKs and will become default API set solely provided by
OE thats a huge cost in time.  I suggested
you to submit the patch upstream musl, I still encourage you to do so.

> There are people who think that OE-specific patches to musl are not
> acceptable, and that it is better to force everyone in OE to patch
> individual packages all the time instead of adding a not upstreamable
> patch to musl.
>

I think you understanding is a bit different here, more than one
package using a specific non-standard API
does not legitimize it to become part of C library, Ask glibc
developer community they would tell you how much
libraries and functions they want to drop but can not.

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

