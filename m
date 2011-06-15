Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWl9H-0006Kc-0Z for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 10:08:27 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWl5y-0005UH-UB
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 10:05:03 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
References: <1308065443.25285.268.camel@phil-desktop>
	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 09:04:51 +0100
Message-ID: <1308125091.6879.39.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 08:08:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 17:38 +0200, Koen Kooi wrote:
> Out of curiousity, how well does gold work nowadays? Last I remember hearing of it was in its x86-only days.

It works for arm, x86 and amd64 which are the only targets that I've
tried for myself.  I suspect it doesn't support some of the more obscure
architectures.  Obviously it doesn't (and isn't intended to) support non
ELF targets, though I can't think of any such in OE.

One slightly annoying thing is that (e)glibc isn't buildable with gold
because the linker scripts don't work.  So a little bit of patching is
going to be needed to have it use ld.bfd there.  There might be some
other packages with similar issues but I haven't come across any yet.

p.



