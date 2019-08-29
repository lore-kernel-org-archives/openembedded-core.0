Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 249337F316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:24:10 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v16so2323522lfg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MQlA22avWUgRkhdUuX5WpcTJ1MszYdWUZ94Ua0bHefM=;
	b=QKp/9pAaXkOvzspV2yg94ASN1JuOMldCYniQKiu2ExAaWA2wNK7wy5LP0ccynw/Z56
	LqS5c/gQEwAaq+fxh2gINsbmNGzSfDB0nq7lh5Lz3OChpmi8mg54uMC/bC8BXfc2zcof
	SuvZQKjDebSvsxij7Ok2s5ANCg6xCCFrcdrghasdIk5YMnxdOITO+JYhgX6T1VyLaT6M
	Gs8n7tv1phZPwZ8fVW05JjYTW2OqZ/PeREZ2DtShYvYEnIRWT6aLldhQLvY4jKrCKo3c
	e1oaJ5IhC7UFqwd8EB/+U+AiStBazP5cAc4QG15oBHwqhV/otgu7GS1yFnAclz5TpJ6C
	9WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MQlA22avWUgRkhdUuX5WpcTJ1MszYdWUZ94Ua0bHefM=;
	b=MvpjvRWEp7H6iq6ehiCxU1Gpl6n68bvSsSkX5JV98Buw6vNHsiUDOuobcxFcGAMU7r
	COT/h0KjmIzftZi5mqYfKq7LjgjaBgAuIZUUzBLHqRptPuERzYKP8HsC+Y3kdpPDj9yy
	V4kE+p+Wp/+FOHHu2w+jVGpZ8hKo3Dh9DJeYS2gGbaM8G65XMtzs0R41VkKVe0/hdTop
	D1cRFrPShDQHxlqWD7pWB4h2Eh6z5SjQpd/T7ZOaBTDA5rHqVTOjN2l0ChxEAHBQIzgk
	g/peheBvUQXZ9Kw2ZcahyqrK8ATiNOEbYFaXZOCf/BhRj2g+ZL+gveNOGIwlOg4wdsdc
	kLyg==
X-Gm-Message-State: APjAAAXMXltBGJ82HUoJFTOP7r6B6STvgsOwr9Q8/R1xMStjqqkcXel/
	+4258YN/3EmjiHRL8wgG9LDuhNgou6OiGrvsmCHCAQl0
X-Google-Smtp-Source: APXvYqxaq2x2SUMbjdyTQ6jGk5opA6I4JSRbYJRPKRC94xXoKy9eDCb7l1vQ3BDjud2wcRN++wr3pL+X1S7mxS+iyDc=
X-Received: by 2002:ac2:442d:: with SMTP id w13mr6411987lfl.184.1567081450608; 
	Thu, 29 Aug 2019 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
	<20190828215810.GF3044@localhost>
	<CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
	<20190829063158.GG3044@localhost>
In-Reply-To: <20190829063158.GG3044@localhost>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 08:23:58 -0400
Message-ID: <CADkTA4NXYy0jnZg6=S_W=3znH9M1hidYw8MDwqOqQCGESq8p=g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Thu, 29 Aug 2019 12:24:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 2:32 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Aug 28, 2019 at 06:06:04PM -0400, Bruce Ashfield wrote:
> > On Wed, Aug 28, 2019 at 5:58 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Wed, Aug 28, 2019 at 04:11:43PM -0400, Bruce Ashfield wrote:
> > > >...
> > > > There's zero risk to these, and no reason to sit on them.
> > >
> > > What range of LTS kernels is covered by the "zero risk"?
> >
> > It has nothing to do with LTS kernels.
>
> virtual/kernel is special since real products have this provided by
> a BSP layer instead of using the kernels for the reference platforms
> that ship with Yocto.

I'm quite aware of what virtual/kernel is, and how it is used.

>
> How do your changes interact with a BSP layer that provides
> the upstream maintained LTS kernel 4.4?

As mentioned in other parts of the threads, we test against the
reference kernel's in master. Other versions can either bbappend, or
send patches. That's unfortunately how it has to be.

Cheers,

Bruce

>
> > Cheers,
> >
> > Bruce
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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

