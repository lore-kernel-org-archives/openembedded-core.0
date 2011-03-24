Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Q2Ydy-0003QV-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 01:43:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2011 17:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,234,1299484800"; d="scan'208";a="723707713"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2011 17:41:24 -0700
Message-ID: <4D8A9331.5020902@intel.com>
Date: Thu, 24 Mar 2011 08:41:21 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
	<1300730833.30423.3993.camel@rex> <4D893C24.5060002@intel.com>
	<AANLkTi=BbD-3bwqxf1CHj3UZP0USyWAf625gKBz6CJjn@mail.gmail.com>
In-Reply-To: <AANLkTi=BbD-3bwqxf1CHj3UZP0USyWAf625gKBz6CJjn@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 24 Mar 2011 00:43:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked.

Let's keep larger_default_ram_size.patch, and fix it if any issue in 
future:)

Thanks,
edwin



Khem Raj wrote:
>
> On Tue, Mar 22, 2011 at 5:17 PM, Zhai, Edwin <edwin.zhai@intel.com> 
> wrote:
> >
> >
> > Richard Purdie wrote:
> >>
> >> On Thu, 2011-03-17 at 11:52 -0700, Khem Raj wrote:
> >> > This patchset upgrades qemu in oe-core to 0.14.0
> >> > The script fixes are done to cope for a bug in 0.14.0
> >> > as well as to get past a console spawning problem for non-nfs image
> >> > boots
> >> >
> >> >
> >> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> >> >   Branch: kraj/qemu-update
> >> >   Browse:
> >> > 
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update 
>
> >> >
> >> > Thanks,
> >> >     Khem Raj <raj.khem@gmail.com>
> >> > ---
> >> >
> >> >
> >> > Khem Raj (5):
> >> >   qemu: Upgrade 0.13.0 -> 0.14.0
> >>
> >> With this change, I'm just doing some checks that certain things work,
> >> its still in my pending queue.
> >>
> >
> > Khem,
> > Thanks for your works on qemu upgrade!
> > Following patches are dropped. 2&3 exist for a pretty long time, I'm 
> not
> > sure. But any reason to drop ppc-hack.patch?
> > qemu-ppc-hack.patch
>
> This has been fixed upstream a bit differently.
>
> > fix-dirent.patch
>
> Its already applied upstream
>
> > workaround_bad_futex_headers.patch
>
> this is already applied upstream if you see then currently we apply it
> so we have the values defined twice
>
> >
> > For new added patches, it's better to have a simple description 
> including
> > upstream commit log if have.
> > larger_default_ram_size.patch: Why pick up 384? 256 or 512 seems to 
> be more
> > reasonable.
> >
>
> these are patches I took from debian/ubuntu only 
> larger_default_ram_size.patch
> does not have description others have references. Probably we can drop
> this patch
> Its there if we want to boot fully blown images like desktop distros
> do 128M is little
> less. 384 is still minimum since people might not have that much ram 
> to spare
> on host machines I guess.
>
> > I assume simple tests across all platform(x86/x86-64/arm/ppc/mips) 
> was done,
> > right:)
>
> yes I booted all qemu  images.
>
> >
> >
> >> >   qemu.inc: Add sh4,sh4eb,mips64,mips64el targets
> >>
> >> For this, I'd like to make the list of targets a separate variable. 
> I'm
> >> happy with your default for OECore, I might take out some of the 
> arches
> >> for Yocto/Poky.
> >>
> >> >   lib/oe/patch.py: Cosmetic change to avoid bitbake warning
> >> >   scripts/poky-qemu-internal: Pass -m <mem_size> always on 
> commandline
> >> >   scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs 
> boots
> >>
> >> I merged these, thanks.
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>


