Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcbdW-0002im-98 for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 13:11:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcbZv-0002DQ-NF
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 13:08:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=ptn9KrXjdfzu62BWJ0XZPFtcGOQ@mail.gmail.com>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<1309516055.7987.123.camel@desktop.home>
	<BANLkTi=ptn9KrXjdfzu62BWJ0XZPFtcGOQ@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 12:08:06 +0100
Message-ID: <1309518486.2633.54.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 11:11:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 12:53 +0200, Andrea Adami wrote:
> Now, the detractors have argued that those flags would be a nightmare
> for people packaging feeds, with no way for the package manager to
> detect those different recipes with the same name.

That does indeed come up frequently but I think this objection is
misplaced.  The people building the feeds just need to make sure that
their particular DISTRO is using a consistent set of flags and refrain
from changing them capriciously in places like local.conf.

Or, to look at it from another perspective, there are already plenty of
ways in which you can generate two .ipk files with the same name but
different/incompatible contents by changing the contents of your
configuration files.  (For example, a DISTRO can already clobber
EXTRA_OECONF_pn-foo in any way that it wants by using an override.)
It's not at all obvious that introducing per-recipe USE flags would make
things any worse in that respect.

I think Chris's proposal is basically a good one.  In one sense it's
just syntactic sugar, since (as above) it doesn't actually allow you to
do anything that you couldn't already achieve by other means, but it
certainly makes it neater.

p.



