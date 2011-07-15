Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QhiOL-0006py-VQ for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:25:18 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QhiKT-0007Bp-ST
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:21:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 14:21:17 +0100
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310736077.3805.37.camel@phil-desktop>
Mime-Version: 1.0
Subject: kernels
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
X-List-Received-Date: Fri, 15 Jul 2011 13:25:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The other day I was working on a BSP layer for a fairly generic i586
system and I was struck by the fact that we don't appear to have any
vanilla kernel recipes in oe-core.  I had sort of expected that, to get
a standard bzImage out, I would just need to ship an appropriate
defconfig in my layer and everything else would "just work".

However, the only kernel that I could immediately find in oe-core was
linux-yocto, which appears to be somewhat more specialized than that
and, at a first glance, looks like it would be better placed in some or
other poky layer than oe-core itself.

Is it the intent that BSP layers are meant to start from linux-yocto and
customise that, or are they expected to provide their own standalone
recipes?

I was also slightly confused by the fragmentary nature of the kernel
helper files.  Chasing the references from linux-yocto.bb seems to show
that it includes two .incs and explicitly inherits a total of
six .bbclasses (one of which is, admittedly, blank) and it's not always
entirely obvious what each one is really doing or how they are meant to
interact with each other.

p.




