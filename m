Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPJX1-0002EV-I3 for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 21:14:11 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPJU6-0004nh-Tv; Wed, 25 May 2011 21:11:11 +0200
From: Phil Blundell <pb@pbcl.net>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDD50D3.4090202@linux.intel.com>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
	<1306260430.2491.2.camel@elmorro>  <1306333690.2491.82.camel@elmorro>
	<1306334330.2525.236.camel@phil-desktop>
	<4DDD50D3.4090202@linux.intel.com>
Date: Wed, 25 May 2011 20:11:04 +0100
Message-ID: <1306350664.3120.28.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 19:14:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 11:56 -0700, Darren Hart wrote:
> If it is indeed space separated then I should be able to remedy both
> issues by simply using the append operator and not self-referencing.
> Correct?

I think that's true, yes.  But, space separation is fairly undesirable
for anything involving paths (particularly absolute ones) and it is
tempting to say that we should change that variable to have a different
separator. 

p.



