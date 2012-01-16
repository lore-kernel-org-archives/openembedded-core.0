Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RmqwJ-0001oD-Sx
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:05:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jan 2012 09:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96409534"
Received: from unknown (HELO helios.localnet) ([10.252.122.171])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2012 09:58:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2012 17:58:10 +0000
Message-ID: <1427429.26ZIzxQgNj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1412695.vvBBPeJL4B@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322068148.15626.15.camel@ted> <1412695.vvBBPeJL4B@helios>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Phil Blundell <philb@gnu.org>
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
X-List-Received-Date: Mon, 16 Jan 2012 18:05:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 December 2011 12:55:56 Paul Eggleton wrote:
> On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
> > On Wed, 2011-11-23 at 16:48 +0000, Phil Blundell wrote:
> > > b) introduce some sort of concept of "feature epochs", where the
> > > DISTRO
> > > gets to declare what epoch it is expecting and the compatibility
> > > code
> > > then backfills DISTRO_FEATURES to take account of things that were
> > > enabled by default in past epochs but have since been removed.  This
> > > introduces a certain extra maintenance burden but it means that
> > > DISTROs
> > > will no longer get unpleasant surprises
> > 
> > I'm wondering if we can do something in the core like:
> > 
> > DISTRO_FEATURES_BACKFILLOPTS = "pulseaudio"
> > 
> > and have the distro set:
> > 
> > DISTRO_FEATURES_BACKFILLCONSIDERED = ""
> > 
> > and then add some code which looks for anything in
> > DISTRO_FEATURES_BACKFILLOPTS but not in
> > DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
> > 
> > Distros can then opt out of a given feature by adding it to
> > DISTRO_FEATURES_BACKFILLCONSIDERED.
> > 
> > This would let us maintain compatibility but also move forward and
> > create new settings with names that make sense.
> 
> I'd like to try to move forward with this fix (although I prefer an
> alternative term to "backfill", perhaps "introduce" instead?) If this is
> what we want to do, should it be implemented by:
> 
> (a) modifying DISTRO_FEATURES directly (as I think Richard is suggesting),
> or
> 
> (b) a simple python call that the distro needs to add to their own
> DISTRO_FEATURES (i.e. "${@distro_features_introduce(d)}" ?
> 
> Option (a) is a little tidier but (b) makes it obvious where any introduced
> items in DISTRO_FEATURES are coming from.

This was brought up at the last TSC meeting, but we agreed to leave the 
discussion on the mailing list for the moment.

So, any thoughts?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


