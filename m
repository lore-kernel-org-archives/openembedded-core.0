Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RcY32-0006dL-Im
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 08:54:12 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RcXwG-0001ZB-HA
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 08:47:12 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAGDS+nkN7ZySZE7wNjX0Wmz1hS1h2j29oibD1__6nzKzy3BDfg@mail.gmail.com>
References: <CAGDS+nkN7ZySZE7wNjX0Wmz1hS1h2j29oibD1__6nzKzy3BDfg@mail.gmail.com>
Date: Mon, 19 Dec 2011 07:47:05 +0000
Message-ID: <1324280825.4492.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Time for kernel26 MACHINE_FEATURES to go away?
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
X-List-Received-Date: Mon, 19 Dec 2011 07:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-12-18 at 21:15 -0800, Steve Sakoman wrote:
> I was preparing a bsp layer today and discovered that my new machine
> needed kernel26 in the MACHINE_FEATURES list or update-modules would
> fail during a kernel build.
> 
> The kernel26 feature is only referenced in a few places in oe-core:
> 
> meta/conf/bitbake.conf:MACHINE_FEATURES ?= "kernel26"
> meta/conf/machine/include/qemu.inc:MACHINE_FEATURES = "kernel26 apm
> alsa pcmcia bluetooth irda usbgadget screen"
> meta/recipes-kernel/update-modules/update-modules_1.0.bb:RDEPENDS_${PN}
> = "${@base_contains("MACHINE_FEATURES", "kernel26",
> "module-init-tools-depmod","modutils-depmod",d)} "
> 
> Perhaps it might be a good time to retire kernel26?

I thought we'd done this ages ago.  I think the bit in update-modules
must just be some ancient relic.  Please do send a patch to remove it.

p.




