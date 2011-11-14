Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RQ0aF-0003ER-QE
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:44:39 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RQ0U8-0004h6-BS
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:38:20 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 17:38:19 +0000
In-Reply-To: <1321291170.26881.64.camel@ted>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
	<8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
	<1321279039.26881.62.camel@ted>
	<1321283752.29435.39.camel@phil-desktop>
	<1321291170.26881.64.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321292300.29435.44.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] base-passwd: Move update-passwd into a separate package
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
X-List-Received-Date: Mon, 14 Nov 2011 17:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 17:19 +0000, Richard Purdie wrote:
> Why can't opkg just wipe the postinst's its run off the disk? Its not
> like it needs them any longer...

Yes, that's true.  In fact for my purposes I end up wiping the whole of
the opkg metadata anyway so it is a moot issue. :-)  But you're right,
"opkg configure" is a one-shot operation and it will never use the
postinst again so it might as well delete them for itself.

p.




