Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QrW87-0000HE-11
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:21:03 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrW3g-0006TN-Lw
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:16:28 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 15:16:27 +0100
In-Reply-To: <20110811132703.GA29758@chargestorm.se>
References: <1313065027.6733.127.camel@phil-desktop>
	<20110811132703.GA29758@chargestorm.se>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313072188.6733.134.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: X11 as DISTRO_FEATURE
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
X-List-Received-Date: Thu, 11 Aug 2011 14:21:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 15:27 +0200, Anders Darander wrote:
> The opposite of objections, at least from me... This is something that
> I've wanted to do for a long time (but I never seem to get the time for
> it).
> 
> Once again, I'm fighting against not only building X-related stuff, but
> also preventing it from leaking into my image...

I guess another solution to the leakiness would be to evacuate all the
X11 recipes to a separate layer (but still within the oe-core repo) so
that you could enable or disable them en masse.

p.




