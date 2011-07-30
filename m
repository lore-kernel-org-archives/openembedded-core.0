Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnFn9-0002Po-QG
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 22:05:47 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QnFj1-0004sQ-TR
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 22:01:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <16609727.QKxnTdGfvX@perseus>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<EF599739-F511-4465-B5BD-B19F15534482@dominion.thruhere.net>
	<1311779631.30326.366.camel@phil-desktop> <16609727.QKxnTdGfvX@perseus>
Date: Sat, 30 Jul 2011 21:01:26 +0100
Message-ID: <1312056086.3497.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Sat, 30 Jul 2011 20:05:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-07-30 at 11:43 -0700, Khem Raj wrote:
> On Wednesday, July 27, 2011 04:13:47 PM Phil Blundell wrote:
> > On Wed, 2011-07-27 at 17:06 +0200, Koen Kooi wrote:
> > > From the conversations I had with ARM they implied that it isn't
> > > optional for cortex a8/9/15, only neon is (e.g. marvell dove, nvidia
> > > tegra2). I haven't seen any black on white contracts saying that,
> > > though :)
> > The spec on the web seems to say fairly clearly that it's optional, at
> > least in theory.  I guess they might have commercial reasons for not
> > wanting to sell it without VFP in any given situation.
> > 
> > See:
> > 
> > http://www.arm.com/products/processors/cortex-a/cortex-a5.php?tab=Specificat
> > ions
> > 
> > for example
> 
> thats only for for a5. For procesors koen mentioned VFP is mandatory

Oh yeah, you're right.  Sorry, I didn't read his email carefully enough.

The original question, though, was whether VFP is mandatory for the
ARMv7-A architecture.  Irrespective of what the situation is with
A8/A9/A15, Cortex-A5 is still an ARMv7-A processor and hence VFP can't
be mandatory for the architecture as a whole.

p.




