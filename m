Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D31F7E507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:47:34 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b18so3271698qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=owR+zPbROGjG8PaFuyI4xyMZuEqdUBCo2QpxpvdtRSI=;
	b=gwXYtXN/rWc0JA7YZqQZqXjxVeJlEc7ofUeP2+oDk1g0ZbpeBezHTzW0fzit5GZWfY
	eS2JTH8QeWe1gkVqv/AiQA81njAtzzxB4uZLHoszWwqkaGOJWJUJSPanclHxlEh6YXug
	/9jMimmAmDfvZfou62zW5kncDuRvEfbp4GNIb825wHGGNn8lZbuTLpPBWsQxwuRZ4UX3
	jkzXnevQvUfzChMNDx8duyeofQvVipWX47q9LA42xJfw8fwZN7QBDH573ks2nxJnkJc6
	mOzw8vgneE5DAU1qe++mQj4J1C8WJdWzYsQl3PFUFVP9DmXOkFZWtmJ+6ocu8qL0ElpK
	sKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=owR+zPbROGjG8PaFuyI4xyMZuEqdUBCo2QpxpvdtRSI=;
	b=k1FLElnb8LAhtWuP72NdpcoSWsujOOUUhTfIJpujY1pFJ4gYuTQL5nSqBPuHaft7qt
	Sv+BEeklZ0DDJ95c1iAOo8BO/zMt1McEVLg2nbAf7jgwwH8P+K3CAMV9H3XQjsNyu65o
	zRhS2XEX2r6qeLl/xoZ+AB/VoG9cUBV/5d5S+dlOVS7SwW6NyH0Lnpz7n3Yb9E62OUng
	cQjbibAF4sPXq7p4UYddIANTG2qcQpCZ4Mgb9r8kFauxOAOQvLfEe9/nWM6ciCe679S2
	T94UUsFQincx9VPop+BLsj5r4MJs9hIwB0Zf8U9YqdfMjGPJzTxLeM36HFgD0zhoIRou
	N95A==
X-Gm-Message-State: APjAAAWqjzuJrzV8kJj0zr509+rK48u3sM5dFFbsnKqHz7P4u3j2+Tmi
	pmfe84XlTUDsq9BxL74Dp/MZU1oEEeLMG8nCVco=
X-Google-Smtp-Source: APXvYqxO4qQv0oxvaeru2b1yVgff2qCLT7ARroyE7ubPHfWQLtos8XoZKIoJEqQlmwHs/YIrgOseNHrf97XPy6gz7Zo=
X-Received: by 2002:a0c:b09a:: with SMTP id o26mr83473568qvc.68.1558727254759; 
	Fri, 24 May 2019 12:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
In-Reply-To: <CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 12:47:08 -0700
Message-ID: <CAMKF1soadHcXu2oRbRV8kBAH-pyEUge3cgUkSBGFsKDycWb75Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Fri, 24 May 2019 19:47:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 12:34 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, May 24, 2019 at 11:46 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, May 24, 2019 at 11:04:50AM -0700, Khem Raj wrote:
> > > On Fri, May 24, 2019 at 10:59 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Fri, May 24, 2019 at 10:31:25AM -0700, Khem Raj wrote:
> > > > > On Fri, May 24, 2019 at 10:27 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > > On Fri, May 24, 2019 at 09:13:08AM -0700, Khem Raj wrote:
> > > > > > > On 5/24/19 3:12 AM, Adrian Bunk wrote:
> > > > > > > > On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
> > > > > > > > > ...
> > > > > > > > > but I think dropping
> > > > > > > > > systemd support completely from musl is not an option I would like to go
> > > > > > > > > with, there are cases where this makes sense. Especially when you have to
> > > > > > > > > cater to different set of devices from small to big, userspace remaining
> > > > > > > > > same is big advantage atleast in the world I am in.
> > > > > > > > > ...
> > > > > > > >
> > > > > > > > That's a good point - when arguing against systemd as default init system.
> > > > > > > >
> > > > > > > > systemd is bigger than glibc, therefore on very small systems where the
> > > > > > > > size of the C library matters using systemd is usually not an option.
> > > > > > >
> > > > > > > Yes, design-wise I concur, in practice, desktop distros rule the linux world
> > > > > > > and systemd is quite prevalent there,
> > > > > >
> > > > > > Desktop distros don't use musl - it wouldn't make sense.
> > > > >
> > > > > Yes,  what I was saying is that decisions on init systems and like that are
> > > > > influenced by desktops too. Since the apps are being written for across the
> > > > > board portfolio where some platforms are desktop/server driven some are
> > > > > more embedded
> > > >
> > > > The point is that most of the time using musl doesn't make sense.
> > > >
> > > > Definitely not on a desktop, and also not with systemd as init system.
> > > >
> > > > I haven't done exact measurements and it would also depend on the
> > > > architecture, but the only real-world benefit of using musl instead
> > > > of glibc for an OE user is something like "3 MB smaller in an -Os build".
> > > >
> > > > On many of todays embedded systems such a small size difference is
> > > > irrelevant. In these cases the correct solution that stays compatible
> > > > with everything else is to use glibc.
> > >
> > > No, there is DRAM use difference too.
> >
> > I didn't limit the size difference to the filesystem.
> >
> > (But in practice RAM is usually a smaller problem than the filesystem.)
> >
> > > > And on really tiny systems where every single MB counts,
> > > > all other design choices also have a high emphasis on size.
> > > >
> > > > Using systemd instead of busybox init (or some other small init system)
> > > > would cost you much more space than what the C library choice gave.
> > > >
> > > > And the current sad state of the systemd musl patching that makes it
> > > > compile but creates misbehaving functions and security vulnerabilities
> > > > makes it an even worse idea to use systemd with musl.
> > > >
> > >
> > > I think we should put in plan for 2.8 and define the scope, since we
> > > are switching
> > > poky defaults to systemd,
> >
> > Switching glibc builds to systemd as default is a reasonable decision.
> >
> > Switching musl builds to systemd as default would be very bad.
> >
> > Combining a tiny C library with a huge init system completely misses
> > the configurations where the tiny C library actually makes sense for
> > users.
>
> For new projects yes. However I know of a project (a big project,
> shipping millions of devices) which picked systemd and glibc long ago
> and is now running out of space. They already have various solutions
> to free up Flash (some apps switched to being runtime downloadable,
> etc) but if/when more savings need to be found then switching from
> glibc to musl might be a less invasive change than switching from
> systemd to some other init system. We obviously shouldn't make
> decisions for OE today based on the historical decisions of one
> project, but I just want to make the point that real world projects
> have a lifetime and may end up with a combination of systemd + musl
> due on past decisions that may not make sense for a new project
> starting today.

rightly so, and it can also mean that project moves away from OE if headwind
is too strong.

