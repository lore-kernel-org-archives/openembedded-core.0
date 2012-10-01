Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIeiD-0004Hc-F2
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 14:03:01 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TIeVi-0006fR-El; Mon, 01 Oct 2012 13:50:06 +0200
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 01 Oct 2012 12:50:03 +0100
In-Reply-To: <20120924192845.GE3295@jama.jama.net>
References: <1348501103.31293.51.camel@phil-desktop>
	<50607F4E.5040300@linux.intel.com>
	<1348503778.31293.52.camel@phil-desktop>
	<20120924192845.GE3295@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349092206.32611.57.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: work-shared not being correctly shared
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
X-List-Received-Date: Mon, 01 Oct 2012 12:03:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 21:28 +0200, Martin Jansa wrote:
> On Mon, Sep 24, 2012 at 05:22:57PM +0100, Phil Blundell wrote:
> > On Mon, 2012-09-24 at 08:42 -0700, Saul Wold wrote:
> > > Yes, I am seeing something similar with do_patch happening twice on the 
> > > work-shared area, I talked with Richard a bit ago about it, and I am 
> > > digging into the siginfo files, you can use bitbake-sigdiff to see what 
> > > sigs are changed causing it unpack twice (or in my case patch twice).
> > 
> > Ah, right, it seems to be rm_old_work that's causing the problem.  I'll
> > disable that for now and figure out how to fix it later.
> 
> That was already discussed few weeks ago, you should be able to find it
> in archive.

I found this thread:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026185.html

but there didn't appear to be any clear conclusion about what the right
fix for the problem was.  Does anybody have any further insight into
that?

p.




