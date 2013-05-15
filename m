Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcivV-0001rZ-1h for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 23:08:00 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ucidt-0000DV-HA; Wed, 15 May 2013 22:49:45 +0200
Message-ID: <1368650968.16243.145.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 15 May 2013 21:49:28 +0100
In-Reply-To: <CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
	<CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 21:08:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-15 at 16:28 -0300, Otavio Salvador wrote:
> I agree but it seems it hadn't succeed in this specific case until
> now. I personally think Clutter will benefit from getting a specific
> place to look at and it does seem multiple people has been adding
> Clutter recipes in their internal layers (Phil for example, Guacamayo
> project and so on).

I did actually have a couple of goes at trying to factor out some of our
local changes to the clutter recipes for submission to oe-core, but on
each occasion I gave up because the effort seemed to outweigh the
benefits. 

For what it's worth, some of the ways in which our local recipes diverge
from what's in oe-core are:

- we have a different (newer) version

- we build from a local git checkout, srctree-style, because our sources
are significantly patched compared to upstream

- we use eglnative mostly, though we might start wanting to use glx
under qemu for testing (subject to getting a suitable mesa)

- we have a slightly funky 2-stage bootstrap process for cogl in order
to break the dependency cycle with cairo; this involves hacks to the
recipes for cogl, cairo, pango and harfbuzz (at least) which I suspect
would not be very palatable to oe-core.

The net result of all this is that, whenever I try to factor out a set
of stuff that's "generic clutter" and could go into oe-core, I end up
with recipes that have virtually nothing in common with what we're
actually using and consequently don't actually solve any of my problems.
However, I have no doubt that someone cleverer than me could do a better
job of it.

p.




