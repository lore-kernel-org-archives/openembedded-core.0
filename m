Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SKWSN-0003kA-Ds
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:06:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2012 07:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132417611"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2012 07:56:38 -0700
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1334755569.24091.94.camel@ted>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
	<484d14f90205202e85346dfc53fcc4a273b3087c.1334751924.git.dongxiao.xu@intel.com>
	<9F52A267-E108-405D-BD39-ADA0209B3620@dominion.thruhere.net>
	<1334755569.24091.94.camel@ted>
Date: Wed, 18 Apr 2012 22:53:40 +0800
Message-ID: <1334760820.26744.23.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] packageinfo.bbclass: A workaround for RPM architecture renaming
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
X-List-Received-Date: Wed, 18 Apr 2012 15:06:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 14:26 +0100, Richard Purdie wrote:
> On Wed, 2012-04-18 at 15:11 +0200, Koen Kooi wrote:
> > Op 18 apr. 2012, om 14:48 heeft Dongxiao Xu het volgende geschreven:
> > 
> > > For beagleboard platform, the PACKAGE_ARCH for certain recipes is
> > > "armv7a-vfp-neon", however, the architecture label in RPM file name is
> > > "arm" due to a potential bug in RPM backend.
> > 
> > 'arm' or 'armv7a'? Your commit message doesn't match the comment in the code.
> 
> Since Dongxiao is probably about to go to sleep, he means "armv7a". I'd
> wondered that when I looked at the commit message too.

Sorry for the typo, it is "armv7a". I've fixed it in my branch.

Thanks,
Dongxiao

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




