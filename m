Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2DB7FC06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 23:00:46 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n11so3629225iom.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9gBbME0DtyA6BMQJ+Wn1lgk0jEUfUaGHWXnlNoVJFQA=;
	b=C5o4IWzoYwuEXxeCoFr0y1Q+TtvT08tnh8sqlsPBOGTJy2Y594RdWEn0OmPhCvz8j7
	EPzJTfjH4e9YGmbGq62/4erLK9aJWbZ0y+cRWbDKIE1iCv4aAE5QUxrBCx0DYhgGw1y4
	vnjtRgsFnX11ArHGuZFpiEHfTFO6qLqqLY04qalIYL5gDXtfB13U3hQ0eUrvuuQkIKRf
	x6HhgeLgLQSd0hnnCqKqoiSzSCokYMqZzGM6VxxGpOvx6qxCVOQdStwWxPRzlzbXkYKX
	psgtJ3MWrOtWHPEEs9Ivs1FN3+X/DIzvERVxh/f2GLLM/y0yv1ePmJgsr9R2H95byHYT
	BQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9gBbME0DtyA6BMQJ+Wn1lgk0jEUfUaGHWXnlNoVJFQA=;
	b=kWGV0eXCoJcELkOGHVbJbXEL6a4lKt7tECBvkN065/q6tIskoLp6+QushBRne6edjJ
	O9k/s0vwb7eERtNvrh4RvgkKtvXUZ3ylY6Ga7H8PR+BOfiy1AiIF4ooN+sEdP8Zkctre
	312Pu/Lx0khWG8c8pgZqOR3+XKjtRF6iNeQ2s9byENENcYWOHLJpc65xjy1SP4dmW8ir
	PB+SOundgDdz90PK+Wfo3AcyXA51ymEjTRh+2InsthUYGb6CUyqi7BmKfZPsizU61UiH
	Ue6Lk9iqsX+5KvCEvy0fjSvJ9XuajCqwW72+dUnotO4tnD7WQb/cFGol9p6LykEDxTFG
	n6hw==
X-Gm-Message-State: APjAAAXPTCgHm4pgRfNZ3mBYbeRpYb8du8KvkRuo8P6L736oGa8YQi3s
	9O9QM0KAN+QLbpKTYq1wQUOoTg+B+XuGe83LzzIvGQ==
X-Google-Smtp-Source: APXvYqyJjtOx4icuH/ahdmJCaGutKeDS8gr694FxN4LKS1csuC1jTD1pcSik+kKZ6ipFR40P7v9OukUmQvUt9rQ8eP4=
X-Received: by 2002:a6b:e803:: with SMTP id f3mr4246774ioh.49.1579906847470;
	Fri, 24 Jan 2020 15:00:47 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
	<4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
	<20200123221627.GF4735@denix.org>
	<CAPoiz9wzUcQuGoA5Qc0XAZtR1L4Hox3fMqiF1MtVXtHcOemngA@mail.gmail.com>
	<20200124224605.GH4735@denix.org>
In-Reply-To: <20200124224605.GH4735@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 18:00:36 -0500
Message-ID: <CAPoiz9zvTBxr9jGriotn_e5MhgzCfbVLjMA7JztuHEboXQy4Zw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 23:00:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 24, 2020 at 5:46 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jan 24, 2020 at 05:30:04PM -0500, Jon Mason wrote:
> > On Thu, Jan 23, 2020 at 5:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Thu, Jan 23, 2020 at 04:10:33PM -0600, Joshua Watt wrote:
> > > >
> > > > On 1/23/20 4:05 PM, Denys Dmytriyenko wrote:
> > > > >On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> > > > >>On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > > >>>From: Denys Dmytriyenko <denys@ti.com>
> > > > >>>
> > > > >>>Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > > > >>>To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > > > >>>add an upstream reference implementation to openembedded-core, which can be
> > > > >>>customized by BSPs, if needed.
> > > > >>Isn't this one of the things that Jon Mason is trying to
> > > > >>standardize/support in meta-arm ?
> > > > >>
> > > > >>http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > > > >Ah, interesting, somehow I totally missed that one! :)
> > > > >
> > > > >What triggered this submission is that we have our own variant in meta-ti and
> > > > >Joshua Watt was adding a very similar one to meta-rockchip:
> > > > >https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
> > > >
> > > > FWIW, variants of this recipe crop up in pretty much every ARM-based
> > > > BSP layer (e.g. https://github.com/alistair23/meta-pine64/blob/master/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb);
> > > > it seems common enough that a base recipe that each BSP layer can
> > > > bbappend to suite their needs seems like it would be useful?
> > >
> > > Yes, indeed, hence we agreed to submit it to oe-core...
> > >
> > > And meta-arm sounds like a good idea and can be used by all those ARM-based
> > > BSPs as a base, but for some reason I cannot find any announcements for that
> > > new layer... Jon?
> >
> > Sorry, I was unaware that it was common practice to announce this kind
> > of thing.  Also, it was very barebones for the first few weeks.  In
> > fact, I still think it is minimal.  That being said, I'll send email
> > to OE-devel (and/or OE-Core) announcing it properly.
>
> If you want it to be a base for other ARM-based BSP layers, it should be very
> well known, well maintained and Yocto-compliant. I see there are multiple
> sub-layers in meta-arm and there was a recent discussion how to properly
> separate things in those sub-layers - BSP, Distro and Apps w/o mixing them.

Yes, and per that discussion we removed the distro portion from our
layer.  We are currently working on CI.  So this will be heavily
tested and verified on Arm reference platforms (and hopefully others).
Also, it's on my TODO list to get this layer Yocto-complaint for the
3.1 release.  If anything is lacking, let me know and I'll add it to
the list!

> For example, our meta-ti BSP layer has no other dependency besides OE-Core,
> making it very clean. In order for me to make meta-ti also depend on meta-arm
> for ATF, OPTEE, etc., I would like it to be up to the quality standards of
> OE-Core! So, the bar is quite high, but I'm willing to help and work in that
> direction with you and others.

I appreciate this, and agree that this is only useful if it is of the
highest quality.  Otherwise, development will fragment and everyone
will waste resources doing their own thing.

We are in the process of pulling in recipes from meta-linaro (per
their suggestion) for OP-TEE and binary toolchains, and my hope is
that this will be a "one stop shop" for all things Arm related.

Thanks,
Jon


>
> --
> Denys
>
>
> > Thanks,
> > Jon
> >
> >
> > >
> > > --
> > > Denys
> > >
> > >
> > > > >>What's the delta between the two ?
> > > > >Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> > > > >see if it's as adaptable and expandable as our more simplistic variants...
> > > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

