Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sr8DH-0006en-GD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 15:53:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 06:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173171335"
Received: from unknown (HELO helios.localnet) ([10.252.121.35])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 06:41:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 Jul 2012 14:41:51 +0100
Message-ID: <1997389.yhY4ZDbdgv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <19F41A1C-D530-4725-AB58-4193025996BB@dominion.thruhere.net>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<1880207.FUrsv2Gi0U@helios>
	<19F41A1C-D530-4725-AB58-4193025996BB@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] iproute2: upgrade to 3.4.0
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
X-List-Received-Date: Tue, 17 Jul 2012 13:53:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 July 2012 15:27:01 Koen Kooi wrote:
> Op 17 jul. 2012, om 15:08 heeft Paul Eggleton het volgende geschreven:
> > On Tuesday 17 July 2012 12:24:41 Andrei Gherzan wrote:
> >> On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga
> >> 
> >> <cristian.iorga@intel.com>wrote:
> >>> +PR = "r0"
> >> 
> >> Not needed anymore. (The same mention for wpa-s. and pulseaudio.)
> > 
> > This is not a hard-and-fast rule for OE-Core AFAIK.
> 
> It would be *very* nice to get rid of all PR = r0 instances in the complete
> oe metaverse. 

I haven't yet heard a compelling argument as to why it's such a great idea to 
keep removing it. For my part, leaving PR = "r0" just means the PR line stays 
in the same place instead of jumping around when people remove and add it in 
different locations within the recipe.

Of course, once we move to using the PR server this is a moot point.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


