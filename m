Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q7Qcb-0003Sn-Ic
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 13:10:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Apr 2011 04:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,309,1299484800"; d="scan'208";a="414700481"
Received: from unknown (HELO [10.255.12.213]) ([10.255.12.213])
	by azsmga001.ch.intel.com with ESMTP; 06 Apr 2011 04:07:53 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 06 Apr 2011 12:07:52 +0100
In-Reply-To: <52BC8856-1494-4AC6-B04F-0A9DC5A8AB2B@dominion.thruhere.net>
References: <cover.1301923706.git.josh@linux.intel.com>
	<52BC8856-1494-4AC6-B04F-0A9DC5A8AB2B@dominion.thruhere.net>
X-Mailer: Evolution 2.91.92 (2.91.92-2.fc15) 
Message-ID: <1302088073.2355.3.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] Clutter-1.6 fix
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
X-List-Received-Date: Wed, 06 Apr 2011 11:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-04 at 15:39 +0200, Koen Kooi wrote:
> Op 4 apr 2011, om 15:31 heeft Joshua Lock het volgende geschreven:
> 
> > From: Joshua Lock <josh@linux.intel.com>
> > 
> > I found a couple of issues with the Clutter 1.6 recipes I submitted recently
> > which I've addressed in the attached patch.
> > 
> > As an aside I've noticed that we have a COMPATIBLE_MACHINE line in
> > clutter.inc, I think we're going to need to find a more suitable mechanism
> > for specifying compatible machines for this recipe set going forwards.
> > 
> > Any ideas? Perhaps some MACHINE_FEATURE which must exist for Clutter (and
> > other GL dependent recipes) to build?
> 
> What we did in OE .dev was:
> 
> 1) introduce SOC_FAMILY to group, well, SOC families (e.g. OMAP3)
> 2) Extend base.bbclass to allow COMPATIBLE_MACHINE = $SOC_FAMILY.
> 3) Add COMPATIBLE_MACHINE = omap3 to the GLES recipes
> 4) DEPENDS_omap3 = libgles-omap3 in clutter.inc
> 
> So for machines in the omap3 class it will build libgles-omap3 and not
> for others. So the compatibility is defined at the GL level instead of
> the clutter level.

Thanks for sharing Koen. This sounds like a reasonable approach. I'd be
curious to hear if there are any objections before I try and work up a
patch series.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



