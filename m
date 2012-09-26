Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGs95-0001Zx-DU for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:59:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDkVe1020153;
	Wed, 26 Sep 2012 14:46:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20063-02; Wed, 26 Sep 2012 14:46:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDkMdU020147
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 14:46:23 +0100
Message-ID: <1348667183.8662.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 26 Sep 2012 14:46:23 +0100
In-Reply-To: <1348655282.31293.94.camel@phil-desktop>
References: <1348652719.31293.90.camel@phil-desktop>
	<20120926095459.GE3313@jama.jama.net>
	<1348653462.31293.92.camel@phil-desktop>
	<20120926100123.GF3313@jama.jama.net>
	<1348655282.31293.94.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Sep 2012 13:59:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 11:28 +0100, Phil Blundell wrote:
> On Wed, 2012-09-26 at 12:01 +0200, Martin Jansa wrote:
> > Sorry I haven't noticed that it's the same value as before. 
> > 
> > But if it causes different sstate checksum than PR bump would be nice to get new
> > builddir (well maybe not needed after f15f61af77cc4e52a037f509f8e49e1ea530cf35).
> 
> OK.  In that case I'll leave the patch alone for now and see if Richard
> will swallow it as it stands.

I've merged it, lets see how that previous commit stands up to this
test. I did change it to ?=, not that it matters a great deal.

Cheers,

Richard



