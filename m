Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RGv3m-0002RL-1B for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:01:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KFtg10019426
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:55:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18739-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:55:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KFtax7019420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:55:37 +0100
Message-ID: <1319126135.2410.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 16:55:35 +0100
In-Reply-To: <20111020143631.GJ3522@jama.jama.net>
References: <9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop> <4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
	<4E9F5E5A.6040002@intel.com> <1319120752.2410.34.camel@ted>
	<20111020143631.GJ3522@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Thu, 20 Oct 2011 16:01:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 16:36 +0200, Martin Jansa wrote:
> On Thu, Oct 20, 2011 at 03:25:52PM +0100, Richard Purdie wrote:
> > On Wed, 2011-10-19 at 16:33 -0700, Saul Wold wrote:
> > > On 10/19/2011 12:00 PM, Otavio Salvador wrote:
> > > > On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>  wrote:
> > > > ...
> > > >>>>> Many upstreams we can't track if updates are required automagically, so
> > > >>>>> we
> > > >>>>> need a place to record when the last manual check was, also possible
> > > >>>>> reasons
> > > >>>>> why we should not update to newer versions, ...
> > > >>
> > > >> hmm manual check means it has to be done manually is there any thing
> > > >> that needs it ?
> > > >>
> > > >> I think unless they are distro specific which seems not since they are
> > > >> in oe-core
> > > >> they could exist in recipes  thats my opinion.
> > > >
> > > > I agree that this should be put into the recipes. Besides this allows
> > > > for checking if it was updated when the version has been updated.
> > > >
> > > > If done right, when updating the version this data will be updated
> > > > together. I see no change in the amount of changes.
> > > >
> > > > A plus of this choice is it will be more difficult to forget to update
> > > > that info. This happened in last qt update for an example.
> > > >
> > > 
> > > This may need to be something that the TSC brings up, possibly we can 
> > > talk about it in Prague next week.
> > 
> > So just to give some background here, the information in those files was
> > added by Yocto people to give some idea of the update status of various
> > recipes. This included when the version was last checked/updated for
> > recipes which we can't automate that process for, when certain cleanup
> > checks were made, what the general state of the recipe was and who on
> > the Yocto team was specifically looking after given recipes.
> > 
> > When it was discussed, some of it was Yocto specific, some of it wasn't
> > and popular opinion was against it going into the recipes themselves. I
> > was ok with that given we have the pn- overrides and can handle the
> > problem that way just fine.
> > 
> > OE-Core happened and we kept the data with OE-Core at least for now. We
> > have several options:
> > 
> > a) Keep the data where it is
> > b) Merge the data into the recipes
> > c) Move the data out of OE-Core
> > 
> > Since a lot of that data is fairly Yocto process specific, it may make
> > sense to move it over to meta-yocto...
> 
> I don't like "global" files where many people should maintain their info
> and it's so easy to forgot when it's somewhere else then real changes
> (like it was with checksums.ini and sane-src*.ini).

Some data does make sense to be maintained globally and I don't think we
should automatically say its bad. It depends what the use case is and
how its intended to be used.

> So I vote for b) Merge the data into the recipes, only problem with this
> is that if we have 2 versions of foo (foo_1.0.bb, foo_git.bb) without
> any foo.inc, will we create foo.inc just for distro-tracking info? Maybe
> we should and move at least DESCRIPTION and similar variables too.
> 
> c) moving it to meta-yocto will probably make distro-tracking info even
> more outdated as sometimes different people then who did upgrade in
> oe-core will have to update distro-tracking info in this layer (this is
> also the case now sometimes, but with distro-tracking info in recipe we
> can try better to update it with upgrades).

I'd actually like Saul's view on this since he generally looks after
that data. There as been discussion about whether it is "internal" yocto
tracking stuff or whether its more general OE focused and I don't know
what the answer is there. I think there is a mixture of uses. I'm also
wary of "pushing" Yocto policy into OE which I think this might amount
to.

As a specific example, we've moved away from wanting MAINTAINER info in
the recipes in the past and this gets us back there again. I don't
really want to loop over adding data and then removing it again
repeatedly so this needs thought/discussion. Who gets their name in the
MAINTAINER field exactly? What is the process for that and what
responsibilities does that person have?

Cheers,

Richard





