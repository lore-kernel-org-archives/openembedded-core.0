Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SD9k6-0001Vw-7S
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:25:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Mar 2012 00:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126429585"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by orsmga002.jf.intel.com with SMTP; 29 Mar 2012 00:15:47 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Thu, 29 Mar 2012 15:19:00 +0800
Date: Thu, 29 Mar 2012 15:19:00 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329071900.GE1450@edwin-gen>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
	<20120329013128.GD1450@edwin-gen>
	<20120329033735.GH4004@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120329033735.GH4004@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips
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
X-List-Received-Date: Thu, 29 Mar 2012 07:25:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 29, 2012 at 05:37:35AM +0200, Martin Jansa wrote:
> On Thu, Mar 29, 2012 at 09:31:28AM +0800, Zhai, Edwin wrote:
> > On Wed, Mar 28, 2012 at 12:58:37PM +0200, Martin Jansa wrote:
> > > On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> > > > From: Martin Jansa <martin.jansa@gmail.com>
> > > 
> > > I don't think I've ever sent something like this.
> > > Actually I've sent patch:
> > > default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> > > * to match default virtual/xserver
> > 
> > Yes, this is just a revert to fix the GL failure. Sorry, I don't notice that git 
> > keep the original author when you revert:(
> 
> FWIW: It doesn't keep the original author here, but maybe you have
> different git..
> 
> > Could you pls. explain why mesa-xlib doesn't match xserver-xorg?
> 
> see:
> http://patches.openembedded.org/patch/13631/

I see. But this build failure should occur on qemux86 or other BSP, not 
qemuarm/qemumips/qemuppc, right? qemuarm/mips/ppc use xorg-kdrive instead.

So can we add following to avoid wrong COMPATIBLE_MACHINE:
"PREFERRED_PROVIDER_virtual/libgl ?= mesa-xlib"
in meta/conf/machine/include/qemu.inc and

"PEFERRED_PROVIDER_virtual/libgl ?= mesa-dri"
in meta/conf/machine/qemux86.conf/qemux86-64.conf 

Thanks,
Edwin


> 
> > 
> > Thanks,
> > Edwin
> > 


