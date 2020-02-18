Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE5C7606E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 21:33:50 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id w4so5984698vkd.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8L0sw+DNCMPSGQC85M5NvWNt8AQUvM/xGZFYkmVW3w8=;
	b=Cgoryfur5j3MU1wVac2cAcU5L2v/FnnNJMd5BJ3w+4QNoeBVuHjJirvnV91hctM94J
	VHnY8DEgFo4SUIQw4Yl3d+ifQZxVLN9RqJ/9pCvSS08TPDFmEoZEFC/fXVLxUZBYvf75
	94dJ6YB6bydpsvg74AFFPJT36WTKvB4MF3j30eW4Yjau6Y2JO/TWiHXM+idMCFu9ggmv
	8uC1yci3QJ9LfpEigH5Y9YH0QzO7svreGaLdhom5utzGw/gFmMTVps71oqL7hmokqyYX
	s2PnGHPoIunOIVTMumbo//GsNdClYkCUQw6muuG1/J0pR83Oqy0LPOHG/YdxiT/WBnAP
	8LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8L0sw+DNCMPSGQC85M5NvWNt8AQUvM/xGZFYkmVW3w8=;
	b=gYlA2RBi359tvqtO5EjzWnkOu4/jBk+mpEo6wsNhK2UeOVmBOz0rr1AKLyq0BximWf
	lT1crro5AvY/wUoGybq8LBhzlRdsGhRH3VdrXigEBx3GZewHhJiQ8I2yGYbldzSxJFUq
	8U+3aHdozyarzSq1RrUvGIHwHq+lwclMPyUTwzKnVxC1uoN4BkSYi0KL1fNYWmTiiD3A
	4Tcf2tUC4L2MohoKvJJJm2kDBVYL8mf1CKA62/xLZ64jIqzeZIiNj7EFrhFKEha05w6s
	uksKFAN79dOww6Pwj4igsuJbw87j1bc3VKhE977/g13cVz+CP9cxGlZZ10rxZo3nEN8R
	Azgg==
X-Gm-Message-State: APjAAAUAK2KybLnmnQJs9Gz0yxHtVjD3nJeozatLresA6zkhgWG0H4bh
	u/KyWa3GdPJk0nYjKup79HZ4mYeqnJzd1cv4Jhc=
X-Google-Smtp-Source: APXvYqy9bfP3CH2seb2RydvH76RIefHV64AFkTxzpBMSgdfGkGGGvVO5WM+Qsg6/paNP1FZPISTZEtEZFO+lIW2NJxQ=
X-Received: by 2002:a1f:3a8a:: with SMTP id h132mr9755583vka.95.1582061631596; 
	Tue, 18 Feb 2020 13:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20200214154240.2222810-1-raj.khem@gmail.com>
	<CAJ86T=UzY5e5YvSBUATDYk+5WV-_xFdeqdQrWO8c3W1bFxUG_A@mail.gmail.com>
	<CAMKF1sqp_iZRPiaZu5teRswsk2qwrJZoMQvpFvcMeTHptt0YtA@mail.gmail.com>
In-Reply-To: <CAMKF1sqp_iZRPiaZu5teRswsk2qwrJZoMQvpFvcMeTHptt0YtA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Feb 2020 13:33:39 -0800
Message-ID: <CAJ86T=X3BWPQEw_5LeO1wTPPBn1A2TFySPMJ93zxd_oOm+2c2Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] musl: Update to latest tip
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
X-List-Received-Date: Tue, 18 Feb 2020 21:33:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 5:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Feb 14, 2020 at 5:02 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Fri, Feb 14, 2020 at 7:42 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Detailed changelog is here [1]
> > >
> > > [1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6
> >
> > Up to now, musl version updates have basically always just made things
> > better and there's never been a good reason not to switch to a new
> > musl release (in my own forks of oe-core I've updated both OE 2.7 and
> > OE 3.0 to the musl 1.1.24 release, etc).
> >
> > However, after 1.1.24, musl switches 32bit targets to a 64bit time_t
> > (in preparation for 2038) and from my initial testing that seems to be
> > a change which is going to cause a lot of problems (both build time
> > and run time) for proprietary components and BSPs etc which are only
> > ever used on a 32bit target. Anything open source is likely to have
> > been well tested on a 64bit target and so any assumptions about the
> > size of time_t will have been fixed long ago, but even then there's a
> > chance of problems (see recent fixes in oe-core for build time issues
> > in strace, systemd, busybox, etc. I guess that run time issues are
> > likely to emerge too as the latest musl snapshot gets more testing on
> > 32bit targets).
> >
> > Updating musl beyond 1.1.24 in oe-core probably needs some careful
> > consideration, especially just before OE 3.1 LTS.
>
> yes I am well aware of 64bit time_t changes, 1.25 should release well before
> 3.1 cut-off, musl maintainers are aware of it

Yes, I'm sure you're aware and that the musl maintainers are aware too
:-) It's end users of OE who perhaps haven't been given enough
warning.

> and we have been fixing buggy apps which have assumptions about
> the length of time_t, we would like to ship with 1.25 for 3.1
> so please report isssues if you find and we can work along with them

The issues I've seen are in a proprietary BSP, so reporting them here
wouldn't be appropriate. I'm already carrying ~300 patches to build
their code with OE 3.0 and musl 1.1.24 (which the BSP vendor has no
interesting in supporting) but the time_t issues may be pervasive
enough that the safest approach will be to go back to glibc and find
the code size savings elsewhere.

Anyway, my point is just to make it clear that this change in musl may
be a big deal for some end users even if it's a relative non-event for
oe-core.

> > (Note that the version of musl in oe-core master is already beyond
> > 1.1.24, so these comments don't apply specifically to this commit).
> >
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > > index f4853b4f2e..b6ec6fe9af 100644
> > > --- a/meta/recipes-core/musl/musl_git.bb
> > > +++ b/meta/recipes-core/musl/musl_git.bb
> > > @@ -4,7 +4,7 @@
> > >  require musl.inc
> > >  inherit linuxloader
> > >
> > > -SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
> > > +SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
> > >
> > >  BASEVER = "1.1.24"
> > >
> > > --
> > > 2.25.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

