Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T2uVu-00059I-1G
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 03:41:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T2uKJ-0001IV-Id
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 03:29:15 +0200
Message-ID: <1345339639.24626.62.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 19 Aug 2012 02:27:19 +0100
In-Reply-To: <CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
	<1345285875.27428.27.camel@ted>
	<CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [RFC] Replacing chrpath with patchelf
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
X-List-Received-Date: Sun, 19 Aug 2012 01:41:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-18 at 10:15 -0700, Khem Raj wrote:
> so I figured. which now means you need to have patchelf on build host
> preinstalled instead of chrpath.

That'd be a bit of a pain, since (afaict) patchelf is not so widely
available in host distributions as chrpath.

> you never know. It just lifts this limitation. We ship
> chrpath-nativesdk as well and people can use it in different ways

I agree that removing the weird and arbitrary-seeming (from the user
perspective) restriction on rpath length would be a good thing.  But
it's less clear that swapping a weird restriction that few people will
ever run into for a requirement to pre-install a relatively obscure host
binary on all systems is a good tradeoff.

How about writing a python function, or a trivial standalone program
(which can be compiled -native without requiring anything other than
${BUILD_CC}) to preprocess the binaries before chrpath sees them, or
indeed just to replace chrpath altogether?  Or, as an alternative, how
about fixing chrpath to suck less and then just waiting for the improved
version to trickle down into deployed host distributions?

p.




