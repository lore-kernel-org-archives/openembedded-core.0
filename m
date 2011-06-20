Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QYebL-0007So-SM for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:33:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QYeXx-0001pG-Vi
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:29:46 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DFF49B8.9050908@windriver.com>
References: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>
	<4DFF49B8.9050908@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 20 Jun 2011 14:29:43 +0100
Message-ID: <1308576583.25285.12093.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 13:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-20 at 08:23 -0500, Mark Hatle wrote:
> (The minor cases are primarily firmware loaded into off-board cards in PCI
> chasis and such.. occasionally these firmware are ELF and of an architecture not
> the same as the host..  it's rare, but I have seen it before.)

Shouldn't those firmware images just go in a separate package?

p.




