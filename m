Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 1408E6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:52:11 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160825105209488_0486;
	Thu, 25 Aug 2016 10:52:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=56927 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bcsIO-0000NJ-LO; Thu, 25 Aug 2016 06:54:04 -0400
Date: Thu, 25 Aug 2016 06:51:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Javier Viguera <javier.viguera@digi.com>
In-Reply-To: <47213dd7-8a1a-23a8-68a9-8e7c7452b9f6@digi.com>
Message-ID: <alpine.LFD.2.20.1608250647580.27611@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
	<20160819201637.GO5342@bill-the-cat>
	<alpine.LFD.2.20.1608210955340.18845@localhost.localdomain>
	<20160821150452.GR5342@bill-the-cat>
	<alpine.LFD.2.20.1608211146290.20716@localhost.localdomain>
	<47213dd7-8a1a-23a8-68a9-8e7c7452b9f6@digi.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how can i add u-boot-fw-utils to my build without u-boot being part of the build?
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
X-List-Received-Date: Thu, 25 Aug 2016 10:52:13 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Aug 2016, Javier Viguera wrote:

> Hi Robert,
>
> On 21/08/16 17:51, Robert P. J. Day wrote:
> >
> >   i apologize for being clueless, but i'm still unclear on what i
> > need to do here, and in my case, i'm going in the opposite
> > direction.
> >
> >   currently, u-boot is being configured and compiled standalone --
> > not as part of OE. and that build works just fine, so i can grab
> > whatever (little?) i need from that build to then add to an actual
> > OE build so i can just add u-boot-fw-utils to an existing image.
> >
> >   as i read it, for an OE build of u-boot, i need to supply either
> > UBOOT_MACHINE or UBOOT_CONFIG. so in this case, what would i do?
> > my assumption until now is that i need to add to the OE build just
> > enough to get the fw utils to build, and i'd do that by setting
> > either of those variables. and i already have the appropriate
> > fw_env.config file ready to go.
> >
> >   so what precisely do i need to do here?
>
> Have you tried to override UBOOT_CONFIG in a u-boot-fw-utils
> bbappend?

  i did figure out a while back that i needed to set at least one of
UBOOT_MACHINE or UBOOT_CONFIG, and since i couldn't set the former,
clearly, i needed to figure out how to set the latter, i just didn't
know what was supposed to go into it. am i just missing it, or is
there an actual example of what would go into a UBOOT_CONFIG variable?

> Have a look at how we do that (using sandbox_defconfig) in
> meta-digi-arm:
>
> https://github.com/digi-embedded/meta-digi/blob/jethro/meta-digi-arm/recipes-bsp/u-boot/u-boot-fw-utils_%25.bbappend
>
> Hope this helps.

  ok, will check that out later today, thanks. is there, in fact, any
OE/YP documentation that shows a detailed example of how to do that?
i'm fairly familiar with the OE/YP manuals, but i don't recall
tripping over anything like that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


