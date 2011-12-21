Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RdKs4-0007JC-SD
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 13:02:08 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RdKlG-0004lH-5y
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 12:55:06 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 11:55:05 +0000
In-Reply-To: <1324465882.16323.13.camel@ted>
References: <1324465882.16323.13.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1324468506.24417.278.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: RFC: nativesdk and native recipe names
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
X-List-Received-Date: Wed, 21 Dec 2011 12:02:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 11:11 +0000, Richard Purdie wrote:
> If we change nativesdk to become a prefix, the problem can share the
> same code as multilib and become much more widely usable rather than the
> current special cases. Its obviously a fairly major change in recipe
> naming though. Would changing this be acceptable?

I wonder whether we should just stop this business of bashing PN around
altogether and encode the native- or sdk-ness into PACKAGE_ARCH or some
such instead.  (I guess this would need bitbake enhanced to be able to
build a parallel dependency tree for each architecture, and a way of
specifying the desired arch in DEPENDS, neither of which it can
presumably do at the moment.)  

All these transforms on PN seem rather fragile and, although changing
the infix to be a prefix will help, it still doesn't completely
eliminate the chance of ambiguity.

p.




