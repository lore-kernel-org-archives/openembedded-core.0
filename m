Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>)
	id 1TCzNg-0008UI-6d; Sat, 15 Sep 2012 22:54:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TCzBV-00053W-11; Sat, 15 Sep 2012 22:41:49 +0200
Message-ID: <1347741572.4444.54.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 15 Sep 2012 21:39:32 +0100
In-Reply-To: <20120915172816.GC11051@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<1347729817.4444.52.camel@x121e.pbcl.net>
	<20120915172816.GC11051@jama.jama.net>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
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
X-List-Received-Date: Sat, 15 Sep 2012 20:54:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-15 at 19:28 +0200, Martin Jansa wrote:
> On Sat, Sep 15, 2012 at 06:23:37PM +0100, Phil Blundell wrote:
> > On Sat, 2012-09-15 at 18:20 +0200, Martin Jansa wrote:
> > > This changes .so name from libffi5 to libffi6, breaking every recipe
> > > depending on libffi when someone is using debian.bbclass.
> > 
> > How exactly do the recipes break?  The whole point of debian.bbclass is
> > to avoid breakage when this happens by making libffi5 and libffi6
> > parallel installable.  If that isn't working then there is clearly a bug
> > somewhere and we should fix that.
> 
> libffi5 is no longer in feed, so if you try to install something from
> feed which still has libffi5 in depends it will fail.

Ah, right.  So it's not actually the recipes which are broken, it's just
that something is wrong with whatever maintains the feed and the old
binaries are no longer installable.  I guess you need to figure out why
libffi5 is being removed and prevent that from happening.

p.




