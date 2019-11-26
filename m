Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 778887FBCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 22:58:09 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x1so3022864qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Iem8AbWFqwgXX0kr5ZGeJ7AmcoAgRK9O8LsjynhtI6A=;
	b=qALhJE+iXqSgc70If4WfmS2Khqse02bw27FdCJIOvKrfH5u2Tkg10SvKF2/8gO8FJd
	Se4BttFCl12coXyLCn7aQq1v3wkBc2SOxG0bAXdgijsAF/bZW1aV9BPmxo24B+jR+8AK
	GUX636oOSGIHccZh/cI/7AuHmL7K44TCSib+1LAnTzPgUaDnt3Xl8ngf1NAvH1kDtWXI
	iVggpDDo3ZMuqNZVHkRs9VMHZN0CImrazEJhJfInjTUdw/42DrJP/T+oZXG2UC9ZG1Wj
	ztsjStPNsKeiBtJKYvDO1vMukIVTpo8B1RvGJY4MGbs44/xY7B3kDPt57T5yXVocAkER
	pl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Iem8AbWFqwgXX0kr5ZGeJ7AmcoAgRK9O8LsjynhtI6A=;
	b=kEaygA6QmC9oCHrxvgfG35lB/SwUflPRRdHT3zUEN72ZOTON7InjOQuXfkAO6g6J5q
	+USM585mBBIGLvC2KodEmBDtiAU1bVopfOG3E1woCxuSItcTO2N33fT2oJkTqzwmJ3eb
	DCk+YN1p/YUDCnb9Bo5HaGT8sGwM2jIEw136pi7GNoRLfNHk9Jd2hOy2vTF2cHpTj1wy
	XcilLkwwjC0uiGCJHJQWOkHpeAJYtCwgx2oK9uzJveJTusX84vuNdeM+THtHnRqzVCp9
	TAVjBpkJxC8+T8TmXiWojx1xhUwnm0NUjSMQDV/O1+DKiQ19PwVZX6Cue+PZc4p3A1MG
	yaQQ==
X-Gm-Message-State: APjAAAUGl4XV+UUTyeZqLtzd262M3yh06ZaKvAuVFw0bqSKGJ0rvXliF
	cBKHOfWRQFYgqanFxdE6q4iJiWqqqX1p4hcwsHM=
X-Google-Smtp-Source: APXvYqyZU2vzzoKFPR7rBzhvIw43eOJvwDYy8Q+5pj59rEFqg1L4KcytA2I+9eu/ISXHcwwC9ise239jqm2+d/CDYnM=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr981117qkf.337.1574809090006; 
	Tue, 26 Nov 2019 14:58:10 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
	<20191126195632.GA27863@localhost>
In-Reply-To: <20191126195632.GA27863@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2019 14:57:43 -0800
Message-ID: <CAMKF1sq6=mY5WbyCE2APxNzBvqurr65vvrdubMvnA7b=fOD0_w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Tue, 26 Nov 2019 22:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 26, 2019 at 11:56 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Nov 26, 2019 at 10:17:09AM -0800, Khem Raj wrote:
> > On Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:
> > > On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > > > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > > > Hi,
> > > > >
> > > > > Based upon "thud" branch, I created core-image-minimal for
> > > > > am335x-evm
> > > > > board and resulting image size is very big(71M)
> > > >
> > > > If disk size is important then a good first step is to use musl
> > > > instead of
> > > > glibc:
> > > >
> > > > TCLIBC = "musl"
> > > > ...
> > >
> > > musl is mainly useful for tiny systems, a 40 MB partition is such a
> > > huge
> > > amount of space that the size of the C library no longer matters
> > > much.
> > >
> > > The size benefit of replacing glibc with musl is around 2 MB.
> >
> > I would refrain from labeling as useful for tiny systems. since
> > static size is one thing, there is DRAM behaviour which is equally
> > important, how malloc and other resource oriented algorithms behave is
> > important as well.
>
> It is not a clear picture once you ignore "glibc is old and bloated"
> claims, and I am not aware of any reliable objective general overview in
> which cases which C library (or a 3rd party memory allocator) is better.
>

Its a good point,  and there are not much benchmarking information openly
reported, but I am sure people have done such benchmarking and analysis
to decide. However, people do refer to such email threads as this.

> > secondly, if I have 40MB partition, one might rather want to use extra
> > space for implementing features in their product than spend it for
> > enabling the system if they can.
>
> If it ain't broken don't fix it.

I dont know if you understood my point above. Its not about being broken or not.

>
> For the case in question there was already the point that two copies
> of libstdc++ were installed, which is a size penalty on the order of
> magnitude of the glibc/musl difference.
>
> And for such huge partitions -Os should bring more benefits than musl,
> so that's a more reasonable first choice for size optimization.
>

As i have said, it does not come free of cost. I can see upfront the cost might
seem to be small.

> > there are many other design considerations where musl might make more
> > sense
>
> Which of these are not covered by linking only your application
> with musl?
>
> It is not clear that all this outweights the constant pains of forcing
> people to fix the steady stream of new musl issues for all recipes.
>
For a moment if you do not assume glibc == linux then
Most of times issues are in application assuming wrong things from system.
in cases where issues are

> > > A partition with an -Os build of Yocto with glibc+systemd (sic)
> > > is around 9 MB, together with bootloader and kernel this all
> > > fits in a 16 MB flash. Use compression for kernel and root
> > > filesystem and everything fits in a 8 MB flash.
> >
> > -Os is not as well tested option as -O2 is. So we should always
> > recommend it with grain of salt, speaking from experience there are
> > bugs that will show up with Os which you wont see with O2 and leave a
> > bad taste for user
>
> Where is the grain of salt when recommending musl?
>

Again, I do not understand, but putting all points in front of user is
best to do
instead of dissing one over another approach, users know their problems
best

> I would consider -Os less risky than musl, especially considering some
> of the OE-only patching for software noone else tries to use with musl.
> But neither is a huge risk as long as you stay away from known-broken
> musl cases like systemd or elfutils.
>

thats more likely the case.

> On a more general note it is weird how much effort is spent on getting
> things to work with musl, but noone seems to care that this builds and
> works with -Os.

I wondered that too, why that is the case. Perhaps in opensource people like
options.

>
> The combinations that are most relevant in practice are:
> - normal: -O2 + glibc + systemd
> - tiny: -Os + musl + busybox init
>

again its two of many combinations  with OE.

> Using musl with -O2 or with systemd is far from the primary usecase
> of using musl for size benefits.
>
> The other advantage of -Os is that it is also useful for non-tiny
> systems since the benefits scale with the size of the filesystem.
> It is a nice knob to fix kernel or userspace space problems that
> does not change the API or ABI.

perhaps, however, reducing code size is a design decision more than
compiler switch problem. Throwing any code at the compiler and expecting
it to optimize for a given vector is never optimal.

>
> cu
> Adrian

