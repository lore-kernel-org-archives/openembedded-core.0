Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SDPU5-0003kK-1V
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 02:14:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2012 17:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125031272"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by azsmga001.ch.intel.com with SMTP; 29 Mar 2012 17:05:22 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Fri, 30 Mar 2012 08:08:44 +0800
Date: Fri, 30 Mar 2012 08:08:44 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120330000843.GF1450@edwin-gen>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
	<1332934483.28414.200.camel@ted> <20120329005459.GC1450@edwin-gen>
MIME-Version: 1.0
In-Reply-To: <20120329005459.GC1450@edwin-gen>
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
X-List-Received-Date: Fri, 30 Mar 2012 00:14:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 29, 2012 at 08:54:59AM +0800, Zhai, Edwin wrote:
> On Wed, Mar 28, 2012 at 12:34:43PM +0100, Richard Purdie wrote:
> 
> > 
> > I'd like to understand why dri can't work under qemu too though.
> 
> I think this requires: emulated graphic HW capability in qemumips/qemuarm, and 
> an drm driver to match the emulated HW. With them, we can turn on "enable-dri" 
> for mesa-dri and fight the build issue.

Sorry, I mean Xfbdev.

> 
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> -- 
> best rgds,
> edwin
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


