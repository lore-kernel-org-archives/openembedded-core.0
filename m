Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlLl7-00024m-Ak
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:03:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlLh5-0000rG-Gx
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:59:39 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 14:59:38 +0100
In-Reply-To: <f654f647aa04b5173883785af5cb062df676842a.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<f654f647aa04b5173883785af5cb062df676842a.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311602379.30326.220.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] eglibc: Update 2.13 to avoid multilib conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 14:03:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/arch-ia32.patch
> @@ -0,0 +1,5309 @@
> +Sync the i386 and x86_64 headers into one common IA32 set of headers.
> +
> +The goal is to ensure that any headers produced in a 32-bit or 64-bit build
> +are not only functionally equivalent, but actually the same in order to avoid
> +file conflicts.
> +
> +The only remaining conflict is the bits/syscall.h.  This is dynamically
> +generated, and so far I've been unable to figure out how to get both
> +i386 and x86_64 to generate the same file.  We'll need to handle this
> +in the recipe itself.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

This patch is missing an Upstream-Status.  It's also rather large and
intrusive which makes it hard to review sensibly and seems like it might
be a maintenance headache in the future.  I wonder whether it would be
better to just put the 32-bit and 64-bit headers for eglibc in separate
subdirectories (say /usr/include/32/... and /usr/include/64/...) and not
bother even trying to patch them to be the same.

p.




