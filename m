Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW8rR-0007eA-Mp for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:15:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QW8oB-0002iW-Np
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:12:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307976845.10825.5.camel@elmorro>
References: <1307975748.10825.2.camel@elmorro>
	<05D8A861-D865-4303-BB8B-69F5F22B651D@dominion.thruhere.net>
	<1307976845.10825.5.camel@elmorro>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 13 Jun 2011 16:12:06 +0100
Message-ID: <1307977926.25285.80.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] systemtap: remove non-core COMPATIBLE_MACHINES
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
X-List-Received-Date: Mon, 13 Jun 2011 15:15:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 09:54 -0500, Tom Zanussi wrote:
> On Mon, 2011-06-13 at 07:47 -0700, Koen Kooi wrote:
> > Op 13 jun 2011, om 16:35 heeft Tom Zanussi het volgende geschreven:
> > > -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
> > > +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|atom-pc)"
> > 
> > After having looked at the recipe (basically 'inherit autotools', PACKAGE_ARCH = BASE_PACKAGE_ARCH) and reading the systemtap wiki I can't figure out why COMPATIBLE_MACHINE is actually needed. The closest I get is "needs specific kernel config", but that argument quickly falls down when looking at other recipes that need that (e.g. udev) and considering out layer strategy (bbappending it for all your machines).
> > 
> > So, what am I missing here?
> > 
> 
> My testing showed systemtap doesn't actually work on arm, and has no
> support for mips - the machines listed are the only ones I've been able
> to verify that work.

If it's actually architecture-dependent, ie it will work on any x86 (or
sparc, or...) platform, the way to deal with that is via
COMPATIBLE_HOST.

p.




