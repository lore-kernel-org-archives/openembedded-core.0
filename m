Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QDJCk-000324-D1
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 18:27:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 09:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,254,1301900400"; d="scan'208";a="632710507"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 09:25:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2011 09:25:11 -0700
In-Reply-To: <1303413834.5518.361.camel@rex>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal> <1303413834.5518.361.camel@rex>
X-Mailer: Evolution 3.0.0 (3.0.0-1.fc15) 
Message-ID: <1303489512.2293.7.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Fri, 22 Apr 2011 16:27:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-21 at 20:23 +0100, Richard Purdie wrote:
> On Thu, 2011-04-21 at 09:40 -0700, Joshua Lock wrote:
> > On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
> > > On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
> > > > and possibly more. I would like to create a meta-gnome layer in the
> > > > meta-openembedded repository where new recipes get added and things from
> > > > meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
> > > > should move there as well.
> > > > 
> > > > What are your thoughts on this?
> > 
> > +1
> > 
> > > 
> > > From my perspective this sounds like a great idea. The only question would be 
> > > how much of the "GNOME" libs would remain in oe-core as some of them are quite 
> > > widely used outside of GNOME proper; however that can easily be worked out as 
> > > these things mature.
> > 
> > +1
> > 
> > My personal opinion would be that we start with glib & gtk+ (plus their
> > dependencies, i.e. pango, atk, etc) in core and move the rest out to a
> > layer.
> 
> Do we move out sato as well?
> 
> > I feel that Gtk+ is used by enough non-gnome software that it belongs in
> > core but others may disagree?
> 
> I think it needs to be in the core as we need something there to test
> X/graphics and so forth. This implies we need sato and its dependencies
> there too though (which are thankfully minimal by design).

I don't disagree with the need for a GUI in the core, my only concern is
that we'll have old/deprecated libraries in oe-core unless we find some
time to update Sato a bit.

Note: this is still on my To Do but isn't as high a priority as I might
like.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



