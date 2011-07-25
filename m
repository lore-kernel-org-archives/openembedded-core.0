Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlLyl-0002Px-CI
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:17:55 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlLuj-0000rk-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:13:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 15:13:44 +0100
In-Reply-To: <b7b6ab25887f5d5fcc541f44287942e1ccd150af.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<b7b6ab25887f5d5fcc541f44287942e1ccd150af.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311603225.30326.229.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 4/5] ncurses: Uncompress man pages
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
X-List-Received-Date: Mon, 25 Jul 2011 14:17:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> If the man pages are compressed, then they cause file conflicts between
> the 32-bit and 64-bit versions of the package.

I'm slightly bemused as to why it makes a difference (for this purpose)
whether the manpages are compressed or not, and I would have thought
that we would generally want to ship manpages as compressed for reasons
of disk-space efficiency.  Can you explain where exactly that conflict
comes from and why uncompressing the man pages resolves it?

> +inherit autotools binconfig multilib_header
>  
>[...]
>
> +	oe_multilib_header curses.h

This change isn't mentioned in either the short or long commit messages
and, as I mentioned in my previous email, it looks like it will cause
some complications with the LICENSE.

p.




