Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJkQ3-0003tx-9L
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 14:20:47 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TJkDU-000815-GP
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 14:07:48 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 04 Oct 2012 13:07:46 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349352468.32611.164.camel@phil-desktop>
Mime-Version: 1.0
Subject: Only one copy of bitbake should be run against a build directory
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
X-List-Received-Date: Thu, 04 Oct 2012 12:20:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since updating my copy of bitbake to one which does this extra locking,
I've come to realise that the constraint of having only one copy of
bitbake running is a bit of a nuisance when making use of devshells.  I
used to quite often have one or two long-running devshells for packages
that I was actively working on, and then in parallel with that would use
bitbake to recompile other things.  With the new locking mechanism, as
soon as I have a single devshell open I am now prohibited from using
bitbake for anything else in that same build directory.

Would it be reasonable to exempt devshells from that locking or is there
some compelling reason why they need to be serialised?

thanks

p.




