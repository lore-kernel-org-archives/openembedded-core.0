Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su8NI-00040t-Oo
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 22:40:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2012 13:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171414045"
Received: from unknown (HELO helios.localnet) ([10.252.121.21])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2012 13:28:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 21:28:31 +0100
Message-ID: <3595842.eNluVg3LR5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <3CF857B7-AE49-4B03-9535-B97EDC1F880E@dominion.thruhere.net>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
	<3CF857B7-AE49-4B03-9535-B97EDC1F880E@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/7] rootfs generation improvements v3
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
X-List-Received-Date: Wed, 25 Jul 2012 20:40:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 July 2012 21:08:53 Koen Kooi wrote:
> Op 25 jul. 2012, om 20:42 heeft Paul Eggleton het volgende geschreven:
> > Fix up handling of "complementary" package installation (dev, dbg, doc,
> > etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.
> > 
> > Changes since v2:
> > 
> > * Clear IMAGE_FEATURES in core-image-minimal so that it doesn't
> > 
> >  have dev/dbg packages added (since the default value of IMAGE_FEATURES
> >  contains dev-pkgs and dbg-pkgs and this will now apply to any image).
> 
> Wait, what?

Ah, right... not sure what I was thinking - there is no such default value. I 
have dropped that patch from the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


