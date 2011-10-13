Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RERGf-0000IL-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 21:48:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RERB9-00032y-Kn
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 21:42:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201110131249.55190.GNUtoo@no-log.org>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<9e0189cadfc1211c918dac076619f71ec3e4d19a.1318405370.git.Martin.Jansa@gmail.com>
	<1318454810.3052.9.camel@lenovo.internal.reciva.com>
	<201110131249.55190.GNUtoo@no-log.org>
Date: Thu, 13 Oct 2011 20:42:48 +0100
Message-ID: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [oe-core 3/4] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Thu, 13 Oct 2011 19:48:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 12:49 +0200, Denis 'GNUtoo' Carikli wrote:
> >This patch doesn't seem to do what it says in the subject line.  It
> >doesn't add an "armv6-novfp" tune, instead it removes vfp from the
> >existing armv6 and armv6t tunes.
> yes that's what it does,but it also adds an armv6-vfp.
> The commit message is wrong, sorry.
> 
> by the way is the content ok? or should I re-do the content too(if so I would 
> need some indications of what the right way is)?

Well, if it were up to me, I would prefer to leave armv6 and armv6t
alone and (as the subject line implied this patch was going to) add new
tunes for the non-vfp variants of them.  Otherwise everybody who is
currently using armv6 is liable to get a nasty surprise when the meaning
suddenly changes underneath them.

p.




