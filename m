Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RVIdJ-0004uW-IC
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:01:41 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RVIWu-0008NC-36; Tue, 29 Nov 2011 08:55:04 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111129070444.GA3653@ad.chargestorm.se>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
	<20111123085906.GA16705@ad.chargestorm.se>
	<4ED47205.6050608@linux.intel.com>
	<20111129070444.GA3653@ad.chargestorm.se>
Date: Tue, 29 Nov 2011 07:54:58 +0000
Message-ID: <1322553298.3077.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: g@ad.chargestorm.se
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 29 Nov 2011 08:01:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 08:04 +0100, Anders Darander wrote:
> Any more comment on this one? Otavio replied earlier that if it was a
> small cost, he would prefer to have it on by default. Otherwise, any
> suggestions for DISTRO/IMAGE_FEATURE?

We've talked about this a few times in the past and it's never seemed as
though this would buy much in relation to busybox.  The busybox
configuration is so highly specific that each DISTRO is probably going
to end up wanting its own custom configuration file and it isn't obvious
that there is going to be much/any commonality between them.  That being
the case it seems as though it's easier for the distros to actually ship
the config files themselves, rather than try to translate every
conceivable option into PACKAGE_CONFIG and then express them that way.

I guess the other thing that naturally follows from this is that there
probably aren't very many people using the actual defconfig that oe-core
provides, and hence it probably doesn't matter all that much what is and
isn't enabled in it.  Enabling FEATURE_SYSTEMD seems like a reasonable
idea if there is already the mechanism in oe-core to make use of it, but
probably just a waste of space otherwise.

p.




