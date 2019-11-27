Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5107F9B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:37:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47NB0C2XvSz4D;
	Wed, 27 Nov 2019 07:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574836652;
	bh=8ULds8A4+b4x9k/7/4aNKxNZGV1YOXH7hgkdrnq8rpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldgelEOPXF/pUKIqMqCbHrf5tJu6L4mIxy7tSXvgIiq+Sgm2Gv5xBeHg2KA3GD+4W
	ott+vSu5fx0dNBoDlxUG4Z3L+CCGKBnYEWZV6UbBjAb1gClZ49O+Skm/uIWEwuTFh2
	TDCpJTUrexeWnOc/xoYoGboWreoJiwGALTJadD2MNFwY4XWpgdOndwsluQ5Zxzu9jK
	Of9O1+RIYg6b8uizcrtPp/IiKc2eX9DfUgaat/vn/HGagc1J5tJvZ8mFpx0YaRo9nO
	6dTexkLFw17TYaHmxDX1x1ZOkFQ1izxCrACZicMkmfBn4jsco4NEfRR7N/XL8NUuDl
	hQvmjmF+dcxTOixIELhi3hh8SIUSiljo7uq/no7g8EIm1Iaxwq6HB5yR3pKBcGnW0j
	1kBtIixyTvV7S3QdIYkB1V+L0WXv+eWWZQNWZve1eokVQEcgxijPvCDQyqx7syyCLj
	JrP2Vpzt98pzrn+vQ47v+tvt63k8ehx3/YRTct+bXQe1Hpk+tXzd+PmVlGzaOZw4C0
	qJOKY6UsoDSgRrxjt3c+wjDycEzMie4T5CW2ezYN7oqWCVO/W5b25JfaBfNDMZSvjs
	auvfaNqD1FyrDgciVrVhYQzSDUqjhqnEWkxQGyyHdBMx4dKPmnpZ/0Brgm65YqG9fB
	Bm7GUM1v7Wc5e4iORo1haZ5A=
Date: Wed, 27 Nov 2019 08:37:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191127063729.GA31353@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
	<20191126195632.GA27863@localhost>
	<CAMKF1sq6=mY5WbyCE2APxNzBvqurr65vvrdubMvnA7b=fOD0_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq6=mY5WbyCE2APxNzBvqurr65vvrdubMvnA7b=fOD0_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Wed, 27 Nov 2019 06:37:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 26, 2019 at 02:57:43PM -0800, Khem Raj wrote:
> On Tue, Nov 26, 2019 at 11:56 AM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > > there are many other design considerations where musl might make more
> > > sense
> >
> > Which of these are not covered by linking only your application
> > with musl?
> >
> > It is not clear that all this outweights the constant pains of forcing
> > people to fix the steady stream of new musl issues for all recipes.
> >
> For a moment if you do not assume glibc == linux then
> Most of times issues are in application assuming wrong things from system.
> in cases where issues are

In general I consider portability a positive thing, but it is also 
legitimate when an upstream makes the decision to use everything
provided by glibc.

But this is not really relevant when discussing what kind of effort 
should be required from people contributing to OE - many build failures 
and work are a price OE pays for musl compatibility, and it can be 
questioned whether it is really worth spending scarce resources on that.

The effort is smaller and the benefits are clearer when supporting musl
only in a limited amount of recipes relevant for tiny systems.

>...
> > The combinations that are most relevant in practice are:
> > - normal: -O2 + glibc + systemd
> > - tiny: -Os + musl + busybox init
> 
> again its two of many combinations  with OE.

There are combinations that match common usecases, and there are 
combinations that don't match common usecases.

Development and testing effort is best spent on combinations that
match common usecases.

poky-tiny building with -O2 is weird.

> > Using musl with -O2 or with systemd is far from the primary usecase
> > of using musl for size benefits.
> >
> > The other advantage of -Os is that it is also useful for non-tiny
> > systems since the benefits scale with the size of the filesystem.
> > It is a nice knob to fix kernel or userspace space problems that
> > does not change the API or ABI.
> 
> perhaps, however, reducing code size is a design decision more than
> compiler switch problem. Throwing any code at the compiler and expecting
> it to optimize for a given vector is never optimal.

The compiler switch is part of the design decision, and on a tiny system 
you do often not have the luxury of picking only some size 
optimizations.

Tiny is when you have to squeeze bootloader, kernel and userspace 
together on 4 MB flash.

cu
Adrian

