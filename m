Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTFrt-0007AI-3s
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:40:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Nov 2011 08:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,559,1315206000"; d="scan'208";a="40552412"
Received: from unknown (HELO helios.localnet) ([10.252.121.207])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Nov 2011 08:33:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Nov 2011 16:33:32 +0000
Message-ID: <3298934.bvzy1dahMQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <E459AF7A-6F7C-43F7-85C8-784419C4E6FE@dominion.thruhere.net>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<E459AF7A-6F7C-43F7-85C8-784419C4E6FE@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 16:40:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 23 November 2011 16:59:56 Koen Kooi wrote:
> The phonon backends (e.g. gstreamer) are nicely modularized is the
> pulseaudio case different?

Unfortunately yes, since libphonon.so.* itself becomes linked to several 
pulseaudio shared libraries when it is enabled at configure time.

> We discussed this in yesterdays TSC meeting and I hope I paraphrase the
> consenses correctly: we want to use PACKAGECONFIG to do the heavy lifting
> (DEPENDS, EXTRA_OECONF) and have DISTRO_FEATURES do the triggering. RP
> pointed out that having DISTRO_FEATURES trigger PACKAGECONFIG currently
> leads to a convoluted syntax which we need to address.
> 
> We also agreed that the current behaviour should be retained, so needing to
> add pulse to distro features would go against that. Having said that, I
> personally would dislike having negative ('nopulseaudio') entries to
> address that. Feedback needed :)

I don't see how we can achieve this without making a huge mess. I'm happy to 
be proven wrong, but I would really like us to figure this stuff out soon so we 
can get the actual problem here fixed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


