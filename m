Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rg067-0000MQ-S8
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:27:39 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RfzzA-0006Sw-Cs
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:20:28 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8285067.9cfZeAKmYZ@helios>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
Date: Wed, 28 Dec 2011 20:20:22 +0000
Message-ID: <1325103622.3089.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 28 Dec 2011 20:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-28 at 09:14 +0000, Paul Eggleton wrote:
> On Wednesday 28 December 2011 14:55:08 b19537@freescale.com wrote:
> > +RDEPENDS += "eglibc-dbg"
> 
> So I might be completely off-base here having never tried it, but what if 
> you're using uclibc?

I don't really understand why valgrind is doing that at all.  Aside from
the missing _${PN} thing (which I think is a QA warning, which in turn
makes me wonder how well tested this really is) it seems as though the
libc debug symbols should be Suggests at most.  I don't think it's
reasonable to drag them in as a hard dependency for valgrind.

p.




