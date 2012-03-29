Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SD3jT-0008De-RJ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 03:00:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Mar 2012 17:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124561014"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by azsmga001.ch.intel.com with SMTP; 28 Mar 2012 17:51:50 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Thu, 29 Mar 2012 08:54:59 +0800
Date: Thu, 29 Mar 2012 08:54:59 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329005459.GC1450@edwin-gen>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
	<1332934483.28414.200.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332934483.28414.200.camel@ted>
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
X-List-Received-Date: Thu, 29 Mar 2012 01:00:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 12:34:43PM +0100, Richard Purdie wrote:
> On Wed, 2012-03-28 at 12:58 +0200, Martin Jansa wrote:
> > On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > 
> > I don't think I've ever sent something like this.
> > Actually I've sent patch:
> > default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> > * to match default virtual/xserver
> > 
> > And this just reverts it + adds suspicious COMPATIBLE_MACHINE..
> > 
> > Cheers,
> > 
> > > Still need mesa-xlib for emulation of GLX interface on qemuarm/qemumips, where
> > > mesa-dri doesn't work for pure qemu emulator.
> > > 
> I agree this COMPATIBLE_MACHINE is wrong.

I just want to mesa-xlib only for qemumips/qemuppc/qemuarm.

> 
> I'd suggest we need to change both xserver-org to xserver-xorg-lite and
> libgl to meta-xlib and then this might work better and address Martin's
> concerns too.

You mean add "xserver-xorg-lite" as preferred virtual/xserver in 
meta/conf/machine/qemumips.conf?

> 
> I'd like to understand why dri can't work under qemu too though.

I think this requires: emulated graphic HW capability in qemumips/qemuarm, and 
an drm driver to match the emulated HW. With them, we can turn on "enable-dri" 
for mesa-dri and fight the build issue.

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

-- 
best rgds,
edwin


