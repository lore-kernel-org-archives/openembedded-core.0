Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8924560767
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 19:56:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2016 11:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,749,1477983600"; d="scan'208";a="37303702"
Received: from achong2-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.113])
	by orsmga004.jf.intel.com with ESMTP; 05 Dec 2016 11:56:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 06 Dec 2016 08:56:22 +1300
Message-ID: <1602179.NQvUR1FKDG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAP9ODKpVhncn-aZ=mJRef8WM5495nGafBaOmByXtUL_aOBQfkg@mail.gmail.com>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
	<1956643.Hk647jXyjn@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKpVhncn-aZ=mJRef8WM5495nGafBaOmByXtUL_aOBQfkg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Mon, 05 Dec 2016 19:56:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 05 Dec 2016 17:45:40 Otavio Salvador wrote:
> On Mon, Dec 5, 2016 at 5:31 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Fri, 02 Dec 2016 11:59:52 Fabio Berton wrote:
> >> This change allow to install u-boot in /boot partition using
> >> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
> >> 
> >> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
> >> 
> >> This is usefull when system has only one partition and u-boot,
> >> kernel and device tree need to be installed in /boot.
> > 
> > If the intention is that other packages also have "bootloader" in
> > RPROVIDES, I thought that these kinds of "virtual provides" weren't
> > supported well by all of the package managers. (We might get away with it
> > here since they probably will all be in their own separate
> > machine-specific feeds, though).
>
> The point in having the bootloader is because different bootloaders
> may provide the functionality for the board. This is especially keen
> for commercial distributions where a U-Boot fork may include fixes and
> this should be used on top of the BSP default and without many changes
> on the layer.
> 
> As you pointed out, the U-Boot usually has a single provider as it is
> a MACHINE_ARCH package. I think it is a safe addition, isn't it?

If we can guarantee that there will only be one runtime provider of 
"bootloader", then I would assume so, yes.

One question - at OEDEM (based on the minutes, I wasn't there) the 
proliferation of u-boot recipes across BSPs was discussed and there was at 
least a desire to try to move to a single recipe where practically possible. 
Do you have any opinions on that? I bring it up because if there was only 
"u-boot" presumably we wouldn't need the "bootloader" RPROVIDES at all.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

