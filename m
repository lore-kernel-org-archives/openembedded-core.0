Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8XDB-0006T3-TD
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 16:01:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Sep 2012 06:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="140985628"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Sep 2012 06:48:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Sep 2012 14:47:56 +0100
Message-ID: <8068324.QSSVEOGDPm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1345653628.3907.124.camel@ted>
	<CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] zeroconf: remove - RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 14:01:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 August 2012 17:44:14 Burton, Ross wrote:
> > I'm not sure that is enough to warrant it staying in OE-Core. meta-oe
> > might be a better fit? Can avahi be cut down for "tiny" usage though
> > configuration?
> 
> Agreed.
> 
> I don't think Avahi can be cut down enough, zerconf only supports
> exposing the machine name which is a pretty tiny subset of mDNS in
> total.

So, where does that leave us with this patch then?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


