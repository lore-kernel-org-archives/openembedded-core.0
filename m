Return-Path: <jdmason@kudzu.us>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 69BBC7FDC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:30:15 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id x5so2853541ila.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+EH568lr6Udl28Pxwud1atj6R3jOf34+B2TU1O9jaok=;
	b=ZaZotmNK+QfifGfhmsrui8PvzDI7rTOkptsMKnEu4Yl14xCoj1EVqUtYk3gQXK3o0r
	3ZQhl/uaylwbGZaHsSZA50gLhbrxLeHsBr1df5Zv/5MKeS3aDYy8UvQci+zfuP57ESQN
	rhI26lK4/2G4dnoh+Oo5Mj2w4U4+IKL11MPJaWkGYgAXPFlUbPPtxCiQel5Zcj2Gdrlb
	tMN/iGTR54zhZ9/BMu8HjFqAPxitFRKkOse8CkZVJD/sPu42vnOST8eVC3OydpFWs9YZ
	xgTHa+iPk7330nqVYRz/Y7AbWSFqVzhsMI3GhyGe82A694Y7jkDIQZkU05AGGUaSkZQK
	+OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+EH568lr6Udl28Pxwud1atj6R3jOf34+B2TU1O9jaok=;
	b=UMnZrAm19m28A/CF36OXwwEGEBkLYQQJvflt4l8iNFAC6MIc9jiMzn6fwnGy3RBgz+
	JOTD4ApaQWlxyH43dKvJNPRHgwMuI6T6frCnB0RT+LeFBBp+bFNH3h/IPANVFASUOBCy
	PUgB1Br7UHrJqgoNzBY1thnRcZ4aM9Jj6VveQdfXwfg/6JmFTXT3eLRw8RzlZ41SyGhQ
	hgD4S/oMsrIl3A/HpH+EDNOYLH8teSCsIZCnkXqva5sBVFi+Am3pPTRi7PxUKyl6XLY3
	3kwya5yw3iVePpBz0gEXh7sA8qy/zm+N8NKlbClK9GkRlOKuYS8deDABy+hHWTcB6lwv
	khfw==
X-Gm-Message-State: APjAAAVSUBZqaCHf1E34eit3Q+WAlDjj0a6BgNBAd1k+ilPr1DV7fnsJ
	dHsRTeZXM4SlR3LpoWpc77LA11ImCXfKMALV+lQUHg==
X-Google-Smtp-Source: APXvYqy/ljKUqD1aGGszaA4xG6Kg47eGA1V92U59xamy5Gz55sopopIcLHlwNW+6COPHVxBLpecBfcpudwF9D8eZ7ag=
X-Received: by 2002:a92:c942:: with SMTP id i2mr4825467ilq.97.1579905016216;
	Fri, 24 Jan 2020 14:30:16 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
	<4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
	<20200123221627.GF4735@denix.org>
In-Reply-To: <20200123221627.GF4735@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 17:30:04 -0500
Message-ID: <CAPoiz9wzUcQuGoA5Qc0XAZtR1L4Hox3fMqiF1MtVXtHcOemngA@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Jan 2020 22:30:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Jan 23, 2020 at 04:10:33PM -0600, Joshua Watt wrote:
> >
> > On 1/23/20 4:05 PM, Denys Dmytriyenko wrote:
> > >On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> > >>On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >>>From: Denys Dmytriyenko <denys@ti.com>
> > >>>
> > >>>Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > >>>To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > >>>add an upstream reference implementation to openembedded-core, which can be
> > >>>customized by BSPs, if needed.
> > >>Isn't this one of the things that Jon Mason is trying to
> > >>standardize/support in meta-arm ?
> > >>
> > >>http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > >Ah, interesting, somehow I totally missed that one! :)
> > >
> > >What triggered this submission is that we have our own variant in meta-ti and
> > >Joshua Watt was adding a very similar one to meta-rockchip:
> > >https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
> >
> > FWIW, variants of this recipe crop up in pretty much every ARM-based
> > BSP layer (e.g. https://github.com/alistair23/meta-pine64/blob/master/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb);
> > it seems common enough that a base recipe that each BSP layer can
> > bbappend to suite their needs seems like it would be useful?
>
> Yes, indeed, hence we agreed to submit it to oe-core...
>
> And meta-arm sounds like a good idea and can be used by all those ARM-based
> BSPs as a base, but for some reason I cannot find any announcements for that
> new layer... Jon?

Sorry, I was unaware that it was common practice to announce this kind
of thing.  Also, it was very barebones for the first few weeks.  In
fact, I still think it is minimal.  That being said, I'll send email
to OE-devel (and/or OE-Core) announcing it properly.

Thanks,
Jon


>
> --
> Denys
>
>
> > >>What's the delta between the two ?
> > >Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> > >see if it's as adaptable and expandable as our more simplistic variants...
> > >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

