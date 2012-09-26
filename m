Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGp2z-0002VK-Cc
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:40:53 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGoqY-0006M6-Bd; Wed, 26 Sep 2012 12:28:02 +0200
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Sep 2012 11:28:01 +0100
In-Reply-To: <20120926100123.GF3313@jama.jama.net>
References: <1348652719.31293.90.camel@phil-desktop>
	<20120926095459.GE3313@jama.jama.net>
	<1348653462.31293.92.camel@phil-desktop>
	<20120926100123.GF3313@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348655282.31293.94.camel@phil-desktop>
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
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
X-List-Received-Date: Wed, 26 Sep 2012 10:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 12:01 +0200, Martin Jansa wrote:
> Sorry I haven't noticed that it's the same value as before. 
> 
> But if it causes different sstate checksum than PR bump would be nice to get new
> builddir (well maybe not needed after f15f61af77cc4e52a037f509f8e49e1ea530cf35).

OK.  In that case I'll leave the patch alone for now and see if Richard
will swallow it as it stands.

p.




