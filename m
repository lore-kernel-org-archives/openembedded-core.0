Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 36CC06E902
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 14:56:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Feb 2014 06:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,832,1384329600"; d="scan'208";a="474020663"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2014 06:55:53 -0800
Date: Wed, 12 Feb 2014 16:55:52 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20140212145552.GF10078@lpalcu-linux>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
	<1392216272.14769.270.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1392216272.14769.270.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Wed, 12 Feb 2014 14:56:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 02:44:32PM +0000, Phil Blundell wrote:
> On Wed, 2014-02-12 at 16:33 +0200, Laurentiu Palcu wrote:
> > diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> > index 6d4f9fa..1887dd3 100644
> > --- a/meta/classes/rootfs_ipk.bbclass
> > +++ b/meta/classes/rootfs_ipk.bbclass
> > @@ -21,7 +21,7 @@ OPKG_POSTPROCESS_COMMANDS = ""
> >  
> >  OPKGLIBDIR = "${localstatedir}/lib"
> >  
> > -MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg"
> > +MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
> 
> Why is that change needed?  Doesn't this imply that ${OPKGLIBDIR} is
> wrong?
It's needed for the multilib sanity checks. I managed to make these
checks actually work in the new code and I had to adjust the directory
whitelist.

* ${OPKGLIBDIR}/opkg is for opkg's metadata and stuff;
* /usr/lib/opkg is where the alternatives go;

laurentiu
> 
> p.
> 
> 

