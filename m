Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzO4n-00019Y-1N
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 09:22:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzO02-0006uC-VK
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 09:17:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314914360.5939.574.camel@rex>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
Date: Fri, 02 Sep 2011 08:15:24 +0100
Message-ID: <1314947724.17121.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Fri, 02 Sep 2011 07:22:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 22:59 +0100, Richard Purdie wrote:
> The latter sounds like what we'll need to do. I haven't looked at shadow
> to see what kind of finessing is required though...
> 
> Does opkg have any notion of bitbake's ASSUME_PROVIDED?

Not explicitly, but the same mechanism that we use for
BAD_RECOMMENDATIONS could be bent to do it; that wouldn't be very
hard.  

OTOH, I don't think this would buy much compared to just removing it
after installation (as we do with base-passwd already) so I'm not sure
that any extra mechanics are justified.  We'd have to address the
postinst issue either way around, so that's probably the thing to look
at first.

p.




