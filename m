Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Szl3W-000488-8j
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 10:58:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2012 01:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,744,1336374000"; d="scan'208";a="132466326"
Received: from unknown (HELO helios.localnet) ([10.252.121.78])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2012 01:47:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Aug 2012 09:47:01 +0100
Message-ID: <1384904.B8yRp5DXBX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Fri, 10 Aug 2012 08:58:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 August 2012 10:03:06 Koen Kooi wrote:
> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het volgende 
geschreven:
> > svn tar balls are 96M as compared to 1.3G git tars
> > its unnessary to suck in that much of data.
> 
> That's indeed a big difference and also expected, with svn you only get
> revision N and N-1, with git you get everything. But even so, I can fetch
> that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong side
> of the ocean, but that gcc svn server is sloooooooooooooooooooooow.

FWIW the git option was much, much, much slower for us here in the UK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


