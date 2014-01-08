Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9D46D0A0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:52:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 05:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,624,1384329600"; d="scan'208";a="463506568"
Received: from unknown (HELO helios.localnet) ([10.252.122.128])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2014 05:52:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sipke Vriend <sipke.vriend@xilinx.com>
Date: Wed, 08 Jan 2014 13:52:34 +0000
Message-ID: <3240985.EsWr8javTQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1389186761.6899.99.camel@ted>
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
	<1389186761.6899.99.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC OE-core/meta/lib] BSP Specific Qemurunner
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
X-List-Received-Date: Wed, 08 Jan 2014 13:52:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 January 2014 13:12:41 Richard Purdie wrote:
> On Tue, 2014-01-07 at 22:59 +0000, Sipke Vriend wrote:
> > Hi Richard,
> > 
> > >-----Original Message-----
> > >On Wednesday, 8 January 2014 12:00 AM, Richard Purdie wrote:
> > >
> > >On Tue, 2014-01-07 at 03:09 +0000, Sipke Vriend wrote:
> > >> Hi,
> > >> 
> > >> This RFC is a proposal to allow BSP layers to setup qemu with their
> > >> specific requirements for the testimage oe-core functionality.
> > >> The suggested changes will be exercised by the
> > >> bitbake -c testimage <image>
> > >> command.
> > >> Similarly to the oeqa test cases this proposal extends the
> > >> meta/lib/oeqa
> > >> python modules to allow inclusion of python utility scripts in the BSP
> > >> layers.
> > >> Any BSP layer wishing to supply their own qemu setup would need to
> > >> create
> > >> an appropriate meta-bsplayer/lib/oeqa/utils/<machine>starter.py
> > >> The effect is that the lib/oeqa/utils/qemurunner will either allow the
> > >> bsp layer provided <machine>starter to spawn qemu or if not provided,
> > >> spawn qemu via runqemu as currently.
> > >> An example bsp layer is available here:
> > >> https://github.com/sipke/meta-xilinx/tree/sipke/qemurunner
> > >> with all required additions in the meta-xilinx/lib directory.
> > >> 
> > >> This RFC is triggered by and indirectly related to
> > >> Bugzilla report "runqemu shouldn't hard-code machine knowledge"
> > >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4827
> > >
> > >Why would we do this rather than improve runqemu to be extendable from
> > >BSP layers?
> > 
> > Proposing as an additional way to launch qemu for oeqa testimage
> > functionality, Improving runqemu can and probably should still happen.
> > 
> > To consider:
> > * it keeps testimage functionality (for bsp layers specific things) in
> > the lib directly (similar to test cases) and as python.
> > * testing (via testimage) may have a different requirement to that of
> > running runqemu on the command line, so an alternate way to launch qemu
> > could be useful.
> > * should this approach of extending the oeqa testimage functionality
> > into bsp layers be accepted, this could allow also for bsp specific
> > hardware setup for testimage functionality in bsp layers.
> > 
> > Primary aim is a solution which allows the bsp layer to control the
> > setup of qemu (and eventually hardware) for testimage functionality. This
> > is a proposal towards that goal.
> 
> I thought Stefan was already also working on something towards this
> goal. I'd like to ensure we don't end up with two things doing the same
> thing.
> 
> Stefan?
> 
> To be clear, I would like to see runqemu enhanced so BSP layers can
> extend it, I think that would be useful for everyone. Once we've done
> that, I'd like to revisit the qemu abstraction in testimage and figure
> out what changes it needs. Some may be required, some may not if we fix
> runqemu first, I'm unclear from these commits what those would be
> though.

FWIW I agree, we need to have the BSP-specific functionality in runqemu and 
then what we do with QemuRunner will follow on from that. I think the other 
patches in the series to do with setting user/port should be OK to consider 
independently of this, though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

