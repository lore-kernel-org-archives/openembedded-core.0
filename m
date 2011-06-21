Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZ51J-0001JQ-4L
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:45:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jun 2011 10:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="18922892"
Received: from unknown (HELO helios.localnet) ([10.255.17.54])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2011 10:42:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 18:42:09 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
	<1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
	<D1BE4C62-7336-430E-9072-F827A2513CAD@dominion.thruhere.net>
In-Reply-To: <D1BE4C62-7336-430E-9072-F827A2513CAD@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106211842.09743.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 17:45:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 21 June 2011 18:34:54 Koen Kooi wrote:
> Can you add a comment above the rev in the lines of "bitbake sucks, we need
> to use a rev instead of a tag, this one maps to 2011.03"?

I will add a comment about the revision corresponding to the tag, good idea.

However, if you do specify a tag for SRCREV and SRCPV is part of PV, then 
bitbake needs to fetch the revision from the repo in order to determine SRCPV 
so it can expand PV when it comes to figure out if a recipe needs to be rebuilt 
or not (remembering that if SRCREV isn't a full revision, bitbake can't tell 
if what you've specified is a "fixed" tag or a potentially moving branch.

If you've got a better idea on how to handle this I'd love to hear it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


