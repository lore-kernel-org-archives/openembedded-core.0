Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1buY-0008MJ-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 13:37:18 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1bj2-0003oK-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 13:25:24 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 12:25:23 +0100
In-Reply-To: <2404459.dJBf5OQotX@helios>
References: <2404459.dJBf5OQotX@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345029924.23275.444.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 11:37:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 10:46 +0100, Paul Eggleton wrote:
> 1) Do we rename "task" to something a little more understandable to the 
> uninitiated, such as "package group"? The word "task" is already used in a 
> much more natural sense within bitbake as a unit of work. Historically I 
> believe we picked up this term from Debian but I'm not aware of significant use 
> by other mainstream distributions.

Yeah, I think OE inherited it from Familiar, which in turn got it from
Debian.  But the meaning of the term has drifted slightly through the
generations and, as you say, it is no longer a very accurate reflection
of what the packages in question are doing.

It's never been totally obvious to me that there is much need for
tasks/package group recipes as such in oe-core itself; they're rather
more of a DISTRO policy thing and their presence in the metadata does
obviously have a cost in terms of parse time and memory usage.  It might
perhaps be worth exploring what they're actually being used for in
oe-core and whether those things could be better done in a different way
that doesn't involve having a .bb file for them.

p.




