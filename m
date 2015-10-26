Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 02EC073D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 21:18:33 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZqpA0-0005R8-Hp; Mon, 26 Oct 2015 22:18:32 +0100
Message-ID: <1445894299.6900.8.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 26 Oct 2015 21:18:19 +0000
In-Reply-To: <562E5AF1.3080807@windriver.com>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net> <562E58BE.9060003@windriver.com>
	<1445878220.5251.110.camel@pbcl.net> <562E5AF1.3080807@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problems -- need help!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Oct 2015 21:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-26 at 11:55 -0500, Mark Hatle wrote:
> -last- time I got concrete numbers on a complex boot process.  It was on the
> order of 1-5% boot time.. and a fairly large number of pages saved.. (which
> reduced fragmentation as well as saved memory.)

I'm slightly surprised at the 5% figure.  Martin Jansa posted some
statistics in another thread earlier today which showed an improvement
from prelink of just under 0.5% (0.24 seconds saved out of 49.51 seconds
total) and that's more like what I would have expected.  What sort of
binaries were you running on the system you measured?

I also don't entirely understand the fragmentation argument.  We're not
talking about a no-mmu configuration here, are we?

p.



