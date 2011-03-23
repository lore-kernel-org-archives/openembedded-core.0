Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Q2Bod-0002c3-2p
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 01:20:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2011 17:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,228,1299484800"; d="scan'208";a="406804265"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by azsmga001.ch.intel.com with ESMTP; 22 Mar 2011 17:17:41 -0700
Message-ID: <4D893C24.5060002@intel.com>
Date: Wed, 23 Mar 2011 08:17:40 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1300387701.git.raj.khem@gmail.com>
	<1300730833.30423.3993.camel@rex>
In-Reply-To: <1300730833.30423.3993.camel@rex>
Subject: Re: [PATCH 0/5] Upgrade qemu to 0.14.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2011 00:20:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Richard Purdie wrote:
>
> On Thu, 2011-03-17 at 11:52 -0700, Khem Raj wrote:
> > This patchset upgrades qemu in oe-core to 0.14.0
> > The script fixes are done to cope for a bug in 0.14.0
> > as well as to get past a console spawning problem for non-nfs image
> > boots
> >
> >
> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> >   Branch: kraj/qemu-update
> >   Browse: 
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update 
>
> >
> > Thanks,
> >     Khem Raj <raj.khem@gmail.com>
> > ---
> >
> >
> > Khem Raj (5):
> >   qemu: Upgrade 0.13.0 -> 0.14.0
>
> With this change, I'm just doing some checks that certain things work,
> its still in my pending queue.
>

Khem,
Thanks for your works on qemu upgrade!
Following patches are dropped. 2&3 exist for a pretty long time, I'm not 
sure. But any reason to drop ppc-hack.patch?
qemu-ppc-hack.patch
fix-dirent.patch
workaround_bad_futex_headers.patch

For new added patches, it's better to have a simple description 
including upstream commit log if have.
larger_default_ram_size.patch: Why pick up 384? 256 or 512 seems to be 
more reasonable.

I assume simple tests across all platform(x86/x86-64/arm/ppc/mips) was 
done, right:)


> >   qemu.inc: Add sh4,sh4eb,mips64,mips64el targets
>
> For this, I'd like to make the list of targets a separate variable. I'm
> happy with your default for OECore, I might take out some of the arches
> for Yocto/Poky.
>
> >   lib/oe/patch.py: Cosmetic change to avoid bitbake warning
> >   scripts/poky-qemu-internal: Pass -m <mem_size> always on commandline
> >   scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs boots
>
> I merged these, thanks.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


