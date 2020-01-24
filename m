Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 36E0E7FDDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D42540BFC;
	Fri, 24 Jan 2020 22:46:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qjthQ5EXn0AV; Fri, 24 Jan 2020 22:46:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9101F400E8;
	Fri, 24 Jan 2020 22:46:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 081FA1743AA; Fri, 24 Jan 2020 17:46:06 -0500 (EST)
Date: Fri, 24 Jan 2020 17:46:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Message-ID: <20200124224605.GH4735@denix.org>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
	<4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
	<20200123221627.GF4735@denix.org>
	<CAPoiz9wzUcQuGoA5Qc0XAZtR1L4Hox3fMqiF1MtVXtHcOemngA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9wzUcQuGoA5Qc0XAZtR1L4Hox3fMqiF1MtVXtHcOemngA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 24 Jan 2020 22:46:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2020 at 05:30:04PM -0500, Jon Mason wrote:
> On Thu, Jan 23, 2020 at 5:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Jan 23, 2020 at 04:10:33PM -0600, Joshua Watt wrote:
> > >
> > > On 1/23/20 4:05 PM, Denys Dmytriyenko wrote:
> > > >On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> > > >>On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > >>>From: Denys Dmytriyenko <denys@ti.com>
> > > >>>
> > > >>>Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > > >>>To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > > >>>add an upstream reference implementation to openembedded-core, which can be
> > > >>>customized by BSPs, if needed.
> > > >>Isn't this one of the things that Jon Mason is trying to
> > > >>standardize/support in meta-arm ?
> > > >>
> > > >>http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > > >Ah, interesting, somehow I totally missed that one! :)
> > > >
> > > >What triggered this submission is that we have our own variant in meta-ti and
> > > >Joshua Watt was adding a very similar one to meta-rockchip:
> > > >https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
> > >
> > > FWIW, variants of this recipe crop up in pretty much every ARM-based
> > > BSP layer (e.g. https://github.com/alistair23/meta-pine64/blob/master/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb);
> > > it seems common enough that a base recipe that each BSP layer can
> > > bbappend to suite their needs seems like it would be useful?
> >
> > Yes, indeed, hence we agreed to submit it to oe-core...
> >
> > And meta-arm sounds like a good idea and can be used by all those ARM-based
> > BSPs as a base, but for some reason I cannot find any announcements for that
> > new layer... Jon?
> 
> Sorry, I was unaware that it was common practice to announce this kind
> of thing.  Also, it was very barebones for the first few weeks.  In
> fact, I still think it is minimal.  That being said, I'll send email
> to OE-devel (and/or OE-Core) announcing it properly.

If you want it to be a base for other ARM-based BSP layers, it should be very 
well known, well maintained and Yocto-compliant. I see there are multiple 
sub-layers in meta-arm and there was a recent discussion how to properly 
separate things in those sub-layers - BSP, Distro and Apps w/o mixing them.

For example, our meta-ti BSP layer has no other dependency besides OE-Core, 
making it very clean. In order for me to make meta-ti also depend on meta-arm 
for ATF, OPTEE, etc., I would like it to be up to the quality standards of 
OE-Core! So, the bar is quite high, but I'm willing to help and work in that 
direction with you and others.

-- 
Denys


> Thanks,
> Jon
> 
> 
> >
> > --
> > Denys
> >
> >
> > > >>What's the delta between the two ?
> > > >Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> > > >see if it's as adaptable and expandable as our more simplistic variants...
> > > >
> > >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

