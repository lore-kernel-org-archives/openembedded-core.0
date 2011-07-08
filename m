Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfIfi-0000Vx-Bx for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 23:33:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfIbz-0007cF-FT
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 23:29:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE293C92@orsmsx504.amr.corp.intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
	<1310138792.20015.880.camel@rex>
	<1310139246.6337.130.camel@phil-desktop>
	<9DA5872FEF993D41B7173F58FCF6BE94DE293C92@orsmsx504.amr.corp.intel.com>
Date: Fri, 08 Jul 2011 22:29:11 +0100
Message-ID: <1310160551.18564.23.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 4/7] binutils: package unpackaged files
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
X-List-Received-Date: Fri, 08 Jul 2011 21:33:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 14:15 -0700, Kamble, Nitin A wrote:
> Just verified that ld.bfd is a soft link to i586-poky-linux-ld.bfd
> 
> So what is the right think here, rm -f ld.bfd, or putting it in the symlinks package is good?

Do the same thing that you do with ${bindir}/ld, whatever that is.
Hopefully it isn't rm -f :-)

p.




