Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QEosf-0004Ov-FF
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 22:29:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Apr 2011 13:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,270,1301900400"; d="scan'208";a="425923840"
Received: from unknown (HELO [10.255.13.84]) ([10.255.13.84])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2011 13:26:37 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2011 13:26:37 -0700
In-Reply-To: <A64BF647-3F77-4108-BAED-FBF48FE567D7@dominion.thruhere.net>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal>
	<6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
	<1303407705.9960.51.camel@vorpal>
	<76BC4841-53CE-4F09-A5CE-7B627922451E@dominion.thruhere.net>
	<1303489384.2293.5.camel@scimitar>
	<A64BF647-3F77-4108-BAED-FBF48FE567D7@dominion.thruhere.net>
X-Mailer: Evolution 3.0.0 (3.0.0-1.fc15) 
Message-ID: <1303849597.28281.39.camel@scimitar>
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
X-List-Received-Date: Tue, 26 Apr 2011 20:29:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-22 at 19:34 +0200, Koen Kooi wrote:
> Op 22 apr 2011, om 18:23 heeft Joshua Lock het volgende geschreven:
> 
> > On Thu, 2011-04-21 at 20:12 +0200, Koen Kooi wrote:
> >> Op 21 apr 2011, om 19:41 heeft Joshua Lock het volgende geschreven:
> >> 
> >>> On Thu, 2011-04-21 at 19:29 +0200, Koen Kooi wrote:
> >>>> Op 21 apr 2011, om 18:40 heeft Joshua Lock het volgende geschreven:
> >>>> 
> >>>>> On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
> >>>>>> On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
> >>>>>>> and possibly more. I would like to create a meta-gnome layer in the
> >>>>>>> meta-openembedded repository where new recipes get added and things from
> >>>>>>> meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
> >>>>>>> should move there as well.
> >>>>>>> 
> >>>>>>> What are your thoughts on this?
> >>>>> 
> >>>>> +1
> >>>>> 
> >>>>>> 
> >>>>>> From my perspective this sounds like a great idea. The only question would be 
> >>>>>> how much of the "GNOME" libs would remain in oe-core as some of them are quite 
> >>>>>> widely used outside of GNOME proper; however that can easily be worked out as 
> >>>>>> these things mature.
> >>>>> 
> >>>>> +1
> >>>>> 
> >>>>> My personal opinion would be that we start with glib & gtk+ (plus their
> >>>>> dependencies, i.e. pango, atk, etc) in core and move the rest out to a
> >>>>> layer.
> >>>>> 
> >>>>> I feel that Gtk+ is used by enough non-gnome software that it belongs in
> >>>>> core but others may disagree?
> >>>>> 
> >>>>> Between meta/recipes-gnome and meta-demoapps we have a reasonable start
> >>>>> to a meta-gnome/
> >>>> 
> >>>> Where did meta-demoapps go? It's not in OE-core anymore by the looks of it.
> >>> 
> >>> Hmm, still exists for me:
> >>> 
> >>> joshual@vorpal:~/Projects/Yocto/oe-core/meta-demoapps[master]
> >>> $ pwd
> >>> /home/joshual/Projects/Yocto/oe-core/meta-demoapps
> >>> 
> >>> 
> >>>> 
> >>>>> I'd be happy to help with this layer.
> >>>> 
> >>>> Awesome, do you have any objection to put meta-gnome into the meta-openembedded repo for the time being? Once we get better tooling we can move it elsewhere, of course.
> >>> 
> >>> None whatsoever. I keep meaning to push some recipes into that layer
> >>> anyway.
> >> 
> >> I just sent out 10 patches for review that import recipes-gnome from meta-demoapps into meta-gnome. Please review :)
> > 
> > The way I see it there are two approaches, tidy & test the recipes then
> > merge *or* merge then fix.
> > 
> > If we're going for the latter approach let's get your patches merged!
> 
> While I'd love the first approach, the second is a lot more practical
> for 'yocto' recipes, I would reserve the vetting for the ones imported
> from OE. Does that sound OK?

Agreed.

> 
> > This does raise another question, is meta-oe striving for the same
> > standards of metadata as oe-core? i.e. SRC_URI & license checksums,
> > updated patch syntax, etc.
> 
> It does, but it still has crud in it from "the early days" which needs
> to get cleaned up. No license checksum is fatal, so that one is
> covered, but the source checksums aren't.  I would be nice to make the
> following errors fatal (if they haven't already):
> 
> 1) license checksums
> 2) LDFLAGS (gnu-hash)
> 3) source checksums

Bug report in email? :-)

> 
> > Also, how much gnome do we want to support? Are we trying to be all new
> > and shiny and drop deprecated libraries (gnome-vfs)?
> 
> Personally I would go for importing 2.30 from OE and see if there are
> 2.32 updates available. 2.30 should be relatively gnome-vfs free. So
> for this specific example, let's try to avoid gnome-vfs. In a broader
> sense, let's get gnome 2 in and look at gnome 3 later. I suspect gnome
> 3 will be a world of hurt with its clutter and hence openGL
> requirements.

I agree with this approach. I think the gobject-introspection will be a
bigger pain point than GL though.

> 
> > Just trying to work out what patches to work on ;-)
> 
> Which reminds me, the gtk+ in meta-oe needs to get compared to the one
> in oe-core to see what's different, I don't want to keep a copy in
> meta-oe.
> 
> > Perhaps we can
> > define a policy of what's appropriate for the layer in a README?
> 
> Are you volunteering to draft a README? If so, go for it :)

I guess so. I'll try and submit some patches.

Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



