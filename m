Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id B30007319F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 11:26:39 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160806112638072_0684;
	Sat, 06 Aug 2016 11:26:38 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.114.62.25] (port=54674 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVzmG-0007do-T3; Sat, 06 Aug 2016 07:28:28 -0400
Date: Sat, 6 Aug 2016 07:26:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160805211836.GA3009@haswell>
Message-ID: <alpine.LFD.2.20.1608060722240.30722@localhost.localdomain>
References: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
	<EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
	<alpine.LFD.2.20.1608051710350.7122@localhost.localdomain>
	<20160805211836.GA3009@haswell>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what must i supply WRT UBOOT_CONFIG/UBOOT_MACHINE when u-boot isn't in BSP?
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
X-List-Received-Date: Sat, 06 Aug 2016 11:26:41 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2016, Khem Raj wrote:

> On 16-08-05 17:11:34, Robert P. J. Day wrote:
> > On Fri, 5 Aug 2016, Khem Raj wrote:
> >
> > >
> > > > On Aug 5, 2016, at 11:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > >
> > > >
> > > >  i'm in the situation where i want to add the u-boot-fw-utils package
> > > > to my image, but the corresponding u-boot source for the target is not
> > > > part of the BSP layer; in fact, it's not part of a layer at all (built
> > > > manually elsewhere), so it's unsurprising that, if i add that recipe
> > > > to the image, i get:
> > > >
> > > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > > UBOOT_CONFIG must be set in the ... machine configuration.
> > > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > > UBOOT_CONFIG must be set in the ... machine configuration.
> > > >
> > > > is there a short doc that explains what i minimally need to supply to
> > > > build that package? i've never been in the situation where u-boot
> > > > wasn't part of the BSP.
> > >
> > > perhaps you need to set UBOOT_MACHINE = "config"
> >
> >   i apologize, but i have no idea what that means. does that mean i
> > want to build that package, and it will consult /etc/fw_env.config
> > when the executables are run?
>
> well, the errors you reported above are issued when OE is trying to
> build the u-boot-fw-utils recipe and BSP does not define the
> UBOOT_MACHINE, I was merely pointing to a possible solution. I do
> not know your usecase.

  i'm trying to add the u-boot-fw-utils package to an image for which
i don't have a u-boot recipe available for the target board, so i
can't just set UBOOT_MACHINE. i just want to know what i have to
provide to the u-boot-fw-utils recipe in terms of u-boot config info
manually to get a build.

  i have the relevant info for the /etc/fw_env.config file that
fw_printenv and fw_setenv need to run, i just don't know how to add
that to the build process.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


