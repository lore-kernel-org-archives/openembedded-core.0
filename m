Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Szlji-00058Q-HL
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:42:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SzlYJ-0007qw-8U
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:30:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 10:30:42 +0100
In-Reply-To: <660D912D-3A89-418B-B091-145567C25656@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
	<1384904.B8yRp5DXBX@helios> <1344589634.23275.284.camel@phil-desktop>
	<660D912D-3A89-418B-B091-145567C25656@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344591043.23275.286.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 10 Aug 2012 09:42:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-10 at 11:22 +0200, Koen Kooi wrote:
> Op 10 aug. 2012, om 11:07 heeft Phil Blundell <philb@gnu.org> het volgende geschreven:
> 
> > On Fri, 2012-08-10 at 09:47 +0100, Paul Eggleton wrote:
> >> On Friday 10 August 2012 10:03:06 Koen Kooi wrote:
> >>> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het volgende 
> >> geschreven:
> >>>> svn tar balls are 96M as compared to 1.3G git tars
> >>>> its unnessary to suck in that much of data.
> >>> 
> >>> That's indeed a big difference and also expected, with svn you only get
> >>> revision N and N-1, with git you get everything. But even so, I can fetch
> >>> that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong side
> >>> of the ocean, but that gcc svn server is sloooooooooooooooooooooow.
> >> 
> >> FWIW the git option was much, much, much slower for us here in the UK.
> > 
> > Maybe we should just go back to using the released tarballs for gcc
> > rather than any sort of SCM checkout.  That would be an 80MB download
> > for the tar.bz2 and of course you can get it from your local mirror.
> > 
> > I think the original reason we switched to using the SCM checkout was
> > that, at the time, we were carrying around a huge number of backported
> > patches that hadn't quite made it into any released version yet.
> 
> We pointed it at the release branch, so updating from x.y.0 to x.y.4 was just a srcrev change. But the same can be done by exporting the patches with git-format-patch and importing them into the OE tree.

Right.  Or, once x.y.4 actually gets released, it would be available as
a tarball in its own right anyway.  The only time when it's at all
tricky is the period just before that happens, when there are
potentially-important fixes in the gcc-x.y branch that aren't yet in any
released version.  But, as you say, we can just import those as patches
and I think/hope their number should be fairly limited.

p.




