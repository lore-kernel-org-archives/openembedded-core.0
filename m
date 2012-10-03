Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJRHy-0008FJ-2j
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:55:10 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TJR5Q-0005Ws-E3
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:42:12 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Oct 2012 16:42:11 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349278932.32611.140.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 03 Oct 2012 15:55:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 11:24 +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> This requires qa.elf.run_objdump() so needs to be applied after the
> patch which adds that function.

By the way, the background motivation for this was that the current
oe-core version of gcc seems to be somewhat broken in this respect on
MIPS; it seems to have reverted to generating an .eh_frame with a
relocation in it which results in DT_TEXTREL on the binary.  

With -fasynchronous-unwind-tables it seems to get even worse.  I don't
quite recall exactly what the failure was there but it was bad enough to
make it unusable.

I think both of these problems are regressions from the gcc-4.6 that we
were using previously.  I'm not quite sure at what point it went wrong
though.

p.




