Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcjUU-0004eo-LS for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 23:44:15 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcjCt-0000Fu-9w; Wed, 15 May 2013 23:25:55 +0200
Message-ID: <1368653137.16243.153.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 15 May 2013 22:25:37 +0100
In-Reply-To: <1368526728.25898.18.camel@ted>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
	<1368456796.6920.23.camel@phil-desktop.brightsign>
	<51920240.3070408@r-finger.com> <1368526728.25898.18.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Wed, 15 May 2013 21:44:30 -0000
X-List-Received-Date: Wed, 15 May 2013 21:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 13:18 +0300, Richard Purdie wrote:
> I'd also take
> a patch to have bitbake do some primitive wildcard (% along the lines of
> PREFERRED_VERSION?) type match on the bbappend filenames.

I do still think that, as far as oe-core goes at least, simply
discontinuing the practice of putting PV in the filenames would be an
easier and better plan.  This would: not require any bitbake changes,
avoid the need for a .inc in most cases, discourage the common mistake
of adding a new version and forgetting to remove the old one, and make
it easier to follow the git history because there wouldn't be renames
all over the place.  

But it appears that I am in a minority of one in favouring this plan and
I guess wildcarded .bbappends are the next best thing.  Your proposal
above sounds like a reasonable enough idea; having % in .bbappend
filenames will look a bit weird but there doesn't seem to be any obvious
reason why it wouldn't work.

p.




