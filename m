Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW3iw-0007iK-2V for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:46:22 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QW3fg-0002GR-Co
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:43:00 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF5D9B6.1010100@windriver.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
	<1307955932.6879.12.camel@lenovo.internal.reciva.com>
	<4DF5D514.3030102@windriver.com>
	<1307957234.6879.22.camel@lenovo.internal.reciva.com>
	<4DF5D9B6.1010100@windriver.com>
Date: Mon, 13 Jun 2011 10:42:54 +0100
Message-ID: <1307958174.6879.29.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Mon, 13 Jun 2011 09:46:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 17:34 +0800, Kang Kai wrote:
> It seems DISTRO_FEATURE doesn't want to enable ipv6 by default, but 
> eglibc needs supports it.

That doesn't seem like it can be right.  Why would you want ipv6 in
eglibc if your DISTRO isn't using it?  

The whole point of DISTRO_FEATURES is that it's meant to give you a
coherent set of system-wide options.

FWIW, I think ipv6 should probably be set on in default-distrovar's
DISTRO_FEATURES, but I guess some higher authority would need to make
that decision.

p.




