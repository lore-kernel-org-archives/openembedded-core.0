Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8oxN-0001Yr-HG
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 10:58:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 01:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,366,1344236400"; d="scan'208";a="217494901"
Received: from unknown (HELO helios.localnet) ([10.252.121.161])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 01:45:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 04 Sep 2012 09:45:21 +0100
Message-ID: <1482699.RloAfy9ffa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <81163693-909A-48E2-A67C-2F753F31B815@dominion.thruhere.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<6771659.ZmALF9uaXJ@helios>
	<81163693-909A-48E2-A67C-2F753F31B815@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 08:58:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 September 2012 10:38:03 Koen Kooi wrote:
> Op 3 sep. 2012, om 18:35 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > On Monday 03 September 2012 18:26:14 Koen Kooi wrote:
> >> Op 3 sep. 2012, om 12:30 heeft Paul Eggleton
> >> <paul.eggleton@linux.intel.com>> 
> > het volgende geschreven:
> >>> This rather large set of changes renames "task" to "packagegroup" and
> >>> attempts to clean up a number of package group related issues [1]. It
> >>> doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> >>> core-lsb and core-basic recipes even further, but unfortunately I ran
> >>> out of time for this cycle.
> >> 
> >> Instead of replying to a ton of patches, I'll reply to the cover letter
> >> :)
> >> 
> >> Missing PR bumps
> > 
> > Why would you need a PR bump when renaming the entire recipe?
> 
> Take 15/28 for example, it changes the output package and doens't do a PR
> bump. 

The changes are intended to be considered as a whole, in which case it is not 
important.

Look, I can make the PR bumps if it makes you feel better - that's all it will 
actually achieve however. Is this the only feedback you have on this series?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


