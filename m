Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RmrAY-0002ga-TW
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:20:36 +0100
Received: from 50-78-106-41-static.hfc.comcastbusiness.net ([50.78.106.41]
	helo=[10.1.0.230])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Rmr3A-0006hn-Vn; Mon, 16 Jan 2012 19:12:57 +0100
Message-ID: <1326737570.3367.19.camel@pb-ThinkPad-R50e>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 16 Jan 2012 18:12:50 +0000
In-Reply-To: <1427429.26ZIzxQgNj@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322068148.15626.15.camel@ted> <1412695.vvBBPeJL4B@helios>
	<1427429.26ZIzxQgNj@helios>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 16 Jan 2012 18:20:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-16 at 17:58 +0000, Paul Eggleton wrote:
> On Thursday 29 December 2011 12:55:56 Paul Eggleton wrote:
> > On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
> > > I'm wondering if we can do something in the core like:
> > > 
> > > DISTRO_FEATURES_BACKFILLOPTS = "pulseaudio"
> > > 
> > > and have the distro set:
> > > 
> > > DISTRO_FEATURES_BACKFILLCONSIDERED = ""
> > > 
> > > and then add some code which looks for anything in
> > > DISTRO_FEATURES_BACKFILLOPTS but not in
> > > DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
> > > 
> > > Distros can then opt out of a given feature by adding it to
> > > DISTRO_FEATURES_BACKFILLCONSIDERED.
> > > 
> > > This would let us maintain compatibility but also move forward and
> > > create new settings with names that make sense.
> > 
> > I'd like to try to move forward with this fix (although I prefer an
> > alternative term to "backfill", perhaps "introduce" instead?) If this is
> > what we want to do, should it be implemented by:
> > 
> > (a) modifying DISTRO_FEATURES directly (as I think Richard is suggesting),
> > or
> > 
> > (b) a simple python call that the distro needs to add to their own
> > DISTRO_FEATURES (i.e. "${@distro_features_introduce(d)}" ?
> > 
> > Option (a) is a little tidier but (b) makes it obvious where any introduced
> > items in DISTRO_FEATURES are coming from.
> 
> This was brought up at the last TSC meeting, but we agreed to leave the 
> discussion on the mailing list for the moment.
> 
> So, any thoughts?

Personally I prefer option (a) and Richard's terminology.  I think the
"introduce" naming is a bit too vague and generic and doesn't really
capture what's going on here.

p.




