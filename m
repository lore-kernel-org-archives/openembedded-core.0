Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuO2k-0008Sz-3S
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:23:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 06:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173467648"
Received: from unknown (HELO helios.localnet) ([10.252.121.37])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 06:12:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Jul 2012 14:12:20 +0100
Message-ID: <1428646.vB6tdydMPR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <C722676A-6FBA-4987-9B97-849BF27AEDA4@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<6492036.bctPLCmjO3@helios>
	<C722676A-6FBA-4987-9B97-849BF27AEDA4@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:23:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 July 2012 15:07:42 Koen Kooi wrote:
> > Without being too concerned with implementation details, I think it's as
> > simple as this: if recipe A has foo in RDEPENDS_${PN} and recipe B has foo
> > in RPROVIDES_${PN} then the runtime dependency is considered satisfied
> > and things will work. You don't have to specify foo in PROVIDES unless
> > something else has foo in DEPENDS.
> 
> If that's so, great, but please check :)

I did, prior to sending that... :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


