Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RzyrT-00050g-4k
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:11:07 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RzyjQ-0005xX-Q1
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:02:50 +0100
Message-ID: <1329865345.2591.201.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 23:02:25 +0000
In-Reply-To: <20120221224811.GB3769@jama.jama.net>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
	<1329861178.20261.62.camel@ted>
	<CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
	<20120221224811.GB3769@jama.jama.net>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 23:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 23:48 +0100, Martin Jansa wrote:
> On Tue, Feb 21, 2012 at 02:26:49PM -0800, Steve Sakoman wrote:
> > I'll try a clean build to see if the problem persists.  The libz
> > change from last week seems to have put my builds in a bad state, and
> > the PR bumps intended to fix things really don't seem to be fixing
> > things, at least on my build machines.  I suspect it might be faster
> > to do a clean build than to track down where the corruption is.
> 
> The list of PR bumped recipes probably wasn't complete for you. It was
> for me, but later I've noticed that ie subversion-1.6 wasn't bumped,
> because I'm using only 1.7.
> 
> So it was complete for my default build (when those PR bumps were
> applied to all included layers at once, which is not the case for most
> people) and if you build different recipes or different versions you
> have to add your own PR bumps in those recipes (see khem's script).
> 
> Clean build could be faster but doesn't fix installed -dev packages on
> target..

I still don't entirely understand why we don't just put libz.la back the
way it was.  I can understand the attraction of eliminating .la files in
a general sense, but it doesn't seem as though the removal of this
particular one is buying us much.  What is the reason for expending so
much effort on getting rid of it?

p.




