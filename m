Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 97E137DE8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 22:26:08 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id w124so6882829vsb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KOEyiCyq4VvCIZRoeFgIqZhwYwLZtpyHZnmEWZgUSBo=;
	b=jP3cv5QisCWDQirB+zUN4EPIn3FFdnt87O3ZejDJfcwslJuCuaTvoByftmQneJYw04
	VOSA+jHiLBXdydKjORzG67N1q+TOaIWyWIPxOmIzCgvGlA8d6wlBlyX56PJtqX7nxFJi
	lUDwACM+YntSAUoVTgNUO6FDgNKq2zoHuwOSuWZ6GcXcwMgJOUaPsVnsI0JlDZN2I5BD
	f2C6YGH6HWVapRJ5HA9AhnSapUwOu/Mi62mzhGd6C7Rgzn7bIStzZbBF6sROElo2MwW/
	uYCDE6lADNaxxAKdkv4vhzgfaQiBq0hNgMS5ZEzgECiydUyk+EnjFGWq62TJlNViu0yZ
	glDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KOEyiCyq4VvCIZRoeFgIqZhwYwLZtpyHZnmEWZgUSBo=;
	b=N4qSnzwQbQYFsbIulXnZWRppeFQpZXEZq6HSJbjcaW4T5nZiWEs5+xX6qhP4ua/99k
	suQksQhMeP4uYiB+GFeFXkoeLOeS9n69ojupRz2T9txShZr7clqqM6nA1zHxnbJuXxC3
	5pIiBmRdHtxgCdGlYjA7PAiijHBiO/QxADx6lGPjYD2v+RgtrgOUJ2ghUd9vtCNGFIUo
	cxZbscGmpweZi4IeueQTrg/kT0UdfbA1V7baAlpxr2+V8uJlFoRyFgcZf3ZmPrRzNcEO
	Wq0p7ldIvKifKPDkwkJuffJQoZZX6tcX6b84FkMLWZ4aOC/DnsqNL6xkwtR7jsZgQJWj
	rYPw==
X-Gm-Message-State: APjAAAWFtTa4GTwbF/J82h4YZQdTKpgVYpxH19+oVHjwR5logOElhNqJ
	E71nx+y7uBNl4CWChB1UqKr4ETSeKiu6H4SN6bw=
X-Google-Smtp-Source: APXvYqzSrbjP4Hw/5J3gqaSkk7mwolyEiS43cvhCXbFZiW1Oz2L3MBjJsUqKXl4hwI6kFt6lZfCaT5EoBQgf5ItYGI0=
X-Received: by 2002:a67:f108:: with SMTP id n8mr41993808vsk.222.1558736769238; 
	Fri, 24 May 2019 15:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
In-Reply-To: <20190524202842.GB12358@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 24 May 2019 15:25:57 -0700
Message-ID: <CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 May 2019 22:26:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 1:28 PM Adrian Bunk <bunk@stusta.de> wrote:
> On Fri, May 24, 2019 at 12:34:23PM -0700, Andre McCurdy wrote:
> > On Fri, May 24, 2019 at 11:46 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Fri, May 24, 2019 at 11:04:50AM -0700, Khem Raj wrote:
> >...
> > > > I think we should put in plan for 2.8 and define the scope, since we
> > > > are switching
> > > > poky defaults to systemd,
> > >
> > > Switching glibc builds to systemd as default is a reasonable decision.
> > >
> > > Switching musl builds to systemd as default would be very bad.
> > >
> > > Combining a tiny C library with a huge init system completely misses
> > > the configurations where the tiny C library actually makes sense for
> > > users.
> >
> > For new projects yes. However I know of a project (a big project,
> > shipping millions of devices) which picked systemd and glibc long ago
> > and is now running out of space. They already have various solutions
> > to free up Flash (some apps switched to being runtime downloadable,
> > etc) but if/when more savings need to be found then switching from
> > glibc to musl might be a less invasive change than switching from
> > systemd to some other init system. We obviously shouldn't make
> > decisions for OE today based on the historical decisions of one
> > project, but I just want to make the point that real world projects
> > have a lifetime and may end up with a combination of systemd + musl
> > due on past decisions that may not make sense for a new project
> > starting today.
>
> I am feeling guilty that there are two only partially related
> topics mixed in this discussion.
>
> In this part of the discussion the topic was what the default
> (and CI-tested) init system for musl should be - it seems obvious
> to me that systemd is not what users will usually want to use with musl.

It would be great to have an alternative init system option for
smaller devices in oe-core. I don't think collectively we have the
development capacity to support it though (it's probably far more work
than properly fixing all the currently known issues with systemd on
musl...).

> But there is also the topic whether systemd on musl is
> in a state that it should be made available at all.

I think it's wrong to remove stuff from oe-core just because it isn't
perfect or isn't CI tested. Having something in oe-core means there's
a common version to collaborate on. If it gets kicked out then
development efforts inevitably fragment. Users are generally smart
enough to understand the concept of an experimental feature - although
we could perhaps do a better job of identifying them. Maybe one day
when users can create a custom distro config by running "make
menuconfig" there will be an option to enable experimental features
and the combination of musl and systemd would be hidden behind that.
Until then, perhaps we could add a sanity check warning if musl and
systemd are enabled together?

> Does any of these millions of devices have untrusted
> users or an internet connection?

No local users (if I remember right, everything runs as root) but they
do all have broadband internet connections.

> At that point my email that started this thread becomes relevant,
> the fact that the systemd/musl patches in OE add new security
> vulnerabilities and other bugs - and none of the systemd-on-musl
> proponents seems to consider this a problem they have to fix ASAP.

It's certainly a problem and we should try to fix it. It's not at all
uncommon that patches to fix build issues with musl, clang, a new
version of gcc, etc have a life cycle... a first pass just to fix the
build and then updates as issues are found or better solutions get
merged upstream. It's the normal process. You could argue that we are
sometimes too quick to merge the first pass hacks and too slow to
review and update them, but unfortunately that's just a consequence of
limited developer resources (and it's always more fun to try to get
the latest version of something working than review and cleanup old
patches...).

