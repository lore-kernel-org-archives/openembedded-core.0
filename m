Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc38v-0000E2-C9
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 00:21:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2011 15:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="20568461"
Received: from unknown (HELO [10.255.13.240]) ([10.255.13.240])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 15:18:13 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 15:18:08 -0700
In-Reply-To: <B63D1FE8-267F-4551-BF49-0149E6A929AE@dominion.thruhere.net>
References: <1309292092.16722.3.camel@scimitar>
	<B63D1FE8-267F-4551-BF49-0149E6A929AE@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309385893.24735.5.camel@scimitar>
Mime-Version: 1.0
Subject: Re: Building behind a firewall/proxy
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
X-List-Received-Date: Wed, 29 Jun 2011 22:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 22:20 +0200, Koen Kooi wrote:
> Op 28 jun 2011, om 22:14 heeft Joshua Lock het volgende geschreven:
> 
> > All,
> > 
> > For the Yocto 1.1 release we want to ease the pain of getting set up to
> > build behind a firewall.
> > 
> > I have a series of patches under development to run a one hit sanity
> > test which tries to verify the user can fetch and in the case of failure
> > point the user to a wiki page where we'd document common causes of fetch
> > failures.
> > 
> > We're also going to look at the site.conf file, which can be used to
> > specify proxy settings and other site specific settings such MIRRORS,
> > and ensure that it can easily be edited to help people get set up.
> > 
> > It'd be great if people who operate behind a proxy/firewall can help us
> > document the steps they had to take to work around this.
> > 
> > Further if you have other ideas as to how we can help make this process
> > less painful please let us know.
> 
> This is what I'm using inside TI: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/tree/oebb.sh?h=oe-core
> 
> It grew organically, so grepping for 'proxy' is your best bet :)

Thanks Koen, a useful reference.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



