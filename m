Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 350BB7E4B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459Yyy3MR2z40;
	Fri, 24 May 2019 19:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558720748;
	bh=emT8BjyKKhs//K5WPLnlUPtzBjiDJrVVjRBhV3+tuFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAn8ucK4h5NVKiKsmTbGdwz+kLJRIYcl6CAh7zqF/i63tjPNtri5jn8DmyK2OS3s7
	+4dM59nmH5C9DdEXVgKjaPncbGz/lM+vkrOmjIOt3yhuCvrwxL3zojCDjw6UTVaRyI
	g97TXsuJQyAW/ww23FKl2rTaNpXSx8GT9dW7fjSvEOEwKREHBt6N7AVLUfveifo/gv
	0xRhGaXZCJSyBCt+L3xl9x7PREhDzrB3PSln5FZF2DvFuxb+LrQvtbREIYTAapkacD
	d4GBOq78hVwwkPisqslxv/XmSKf+Rd7m3WKi1bQ847e3/rEy91cxJFwvUToM29HwzX
	jvwim1IWzr6w8O13DyrN2YUrgpPCwH7vlqfaf+yru0iLgbjsNUrEGx6Dvu2G8pH7dh
	uKgWBEo7kWGFnF8CuB0aHIgkQB4UCoRZ+gEyUZ9lcqHFlQWj859P1E5/QURJ3yI916
	CM6Kn4VRhZ1ZONQnFeQNBCgHJOq5cGvr9cRSrANm3kqomO3Tz/9syfIX9i40cPrFUl
	vJ62tm+AVrl33F/INntl/meYwcgfFH2myCVgBjwIKPBqm0DCXlNFqWqU8bBYRl5/14
	XUeCWtk5epnoDJkH/Oi9HOnok9vFfOay9t/K6wwv5fq/QpgvCZmFh5GB51aEvaGVXM
	LfmVBHt0EnQBBaHjUbWDizuE=
Date: Fri, 24 May 2019 20:58:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190524175859.GB6813@localhost>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Fri, 24 May 2019 17:59:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 24, 2019 at 10:31:25AM -0700, Khem Raj wrote:
> On Fri, May 24, 2019 at 10:27 AM Adrian Bunk <bunk@stusta.de> wrote:
> > On Fri, May 24, 2019 at 09:13:08AM -0700, Khem Raj wrote:
> > > On 5/24/19 3:12 AM, Adrian Bunk wrote:
> > > > On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
> > > > > ...
> > > > > but I think dropping
> > > > > systemd support completely from musl is not an option I would like to go
> > > > > with, there are cases where this makes sense. Especially when you have to
> > > > > cater to different set of devices from small to big, userspace remaining
> > > > > same is big advantage atleast in the world I am in.
> > > > > ...
> > > >
> > > > That's a good point - when arguing against systemd as default init system.
> > > >
> > > > systemd is bigger than glibc, therefore on very small systems where the
> > > > size of the C library matters using systemd is usually not an option.
> > >
> > > Yes, design-wise I concur, in practice, desktop distros rule the linux world
> > > and systemd is quite prevalent there,
> >
> > Desktop distros don't use musl - it wouldn't make sense.
> 
> Yes,  what I was saying is that decisions on init systems and like that are
> influenced by desktops too. Since the apps are being written for across the
> board portfolio where some platforms are desktop/server driven some are
> more embedded

The point is that most of the time using musl doesn't make sense.

Definitely not on a desktop, and also not with systemd as init system.

I haven't done exact measurements and it would also depend on the 
architecture, but the only real-world benefit of using musl instead
of glibc for an OE user is something like "3 MB smaller in an -Os build".

On many of todays embedded systems such a small size difference is 
irrelevant. In these cases the correct solution that stays compatible
with everything else is to use glibc.

And on really tiny systems where every single MB counts,
all other design choices also have a high emphasis on size.

Using systemd instead of busybox init (or some other small init system) 
would cost you much more space than what the C library choice gave.

And the current sad state of the systemd musl patching that makes it
compile but creates misbehaving functions and security vulnerabilities
makes it an even worse idea to use systemd with musl.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


