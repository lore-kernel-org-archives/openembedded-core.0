Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id CDD8E75C60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 21:11:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160805211147342_0486;
	Fri, 05 Aug 2016 21:11:47 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.114.62.25] (port=41842 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVmQz-0002tm-Q4; Fri, 05 Aug 2016 17:13:37 -0400
Date: Fri, 5 Aug 2016 17:11:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
Message-ID: <alpine.LFD.2.20.1608051710350.7122@localhost.localdomain>
References: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
	<EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
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
X-List-Received-Date: Fri, 05 Aug 2016 21:11:52 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2016, Khem Raj wrote:

>
> > On Aug 5, 2016, at 11:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >  i'm in the situation where i want to add the u-boot-fw-utils package
> > to my image, but the corresponding u-boot source for the target is not
> > part of the BSP layer; in fact, it's not part of a layer at all (built
> > manually elsewhere), so it's unsurprising that, if i add that recipe
> > to the image, i get:
> >
> > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > UBOOT_CONFIG must be set in the ... machine configuration.
> > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > UBOOT_CONFIG must be set in the ... machine configuration.
> >
> > is there a short doc that explains what i minimally need to supply to
> > build that package? i've never been in the situation where u-boot
> > wasn't part of the BSP.
>
> perhaps you need to set UBOOT_MACHINE = "config"

  i apologize, but i have no idea what that means. does that mean i
want to build that package, and it will consult /etc/fw_env.config
when the executables are run?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


