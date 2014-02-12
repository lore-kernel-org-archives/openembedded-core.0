Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE91D6CAD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 15:40:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 07:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,832,1384329600"; d="scan'208";a="454250065"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2014 07:40:03 -0800
Date: Wed, 12 Feb 2014 17:40:01 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20140212154001.GG10078@lpalcu-linux>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
	<1392216272.14769.270.camel@phil-desktop.brightsign>
	<20140212145552.GF10078@lpalcu-linux>
	<1392217651.14769.271.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1392217651.14769.271.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Wed, 12 Feb 2014 15:40:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 03:07:31PM +0000, Phil Blundell wrote:
> On Wed, 2014-02-12 at 16:55 +0200, Laurentiu Palcu wrote:
> > * /usr/lib/opkg is where the alternatives go;
> 
> Isn't that a bug?
I'm far from being an expert in opkg or update-alternatives, but,
looking in /usr/bin/update-alternatives I can see:

# admin dir
ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"

Isn't that expected since the u-a provider is opkg-utils recipe?

laurentiu
> 
> p.
> 
> 

