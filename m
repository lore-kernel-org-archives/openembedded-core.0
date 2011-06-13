Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW52K-0005cM-Ie for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 13:10:30 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QW4z4-0002KQ-Kl
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 13:07:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=eocC9OGqLSiFHPttwYsDhNBR61Q@mail.gmail.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
	<1307955932.6879.12.camel@lenovo.internal.reciva.com>
	<4DF5D514.3030102@windriver.com>
	<1307957234.6879.22.camel@lenovo.internal.reciva.com>
	<4DF5D9B6.1010100@windriver.com>
	<1307958174.6879.29.camel@lenovo.internal.reciva.com>
	<BANLkTi=eocC9OGqLSiFHPttwYsDhNBR61Q@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 13 Jun 2011 12:07:04 +0100
Message-ID: <1307963224.25285.36.camel@phil-desktop>
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
X-List-Received-Date: Mon, 13 Jun 2011 11:10:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 12:00 +0200, Martin Jansa wrote:
> On Mon, Jun 13, 2011 at 11:42 AM, Phil Blundell <pb@pbcl.net> wrote:
> > FWIW, I think ipv6 should probably be set on in default-distrovar's
> > DISTRO_FEATURES, but I guess some higher authority would need to make
> > that decision.
>
> I see your point
> 
> but ipv6 as DISTRO_FEATURES_LIBC ends in DISTRO_FEATURES as well
> DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
> wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"

Oh, so it does.  So the effect of this is that we will end up with ipv6
on in DISTRO_FEATURES anyway.  I guess I would consider this a good
result, if perhaps for the wrong reasons :-)

p.




