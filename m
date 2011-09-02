Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzYnP-0000Sn-S0
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 20:48:55 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzYif-0007Bt-5q
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 20:44:01 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314972211.5939.604.camel@rex>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
	<1314957057.19905.224.camel@phil-desktop>
	<1314972211.5939.604.camel@rex>
Date: Fri, 02 Sep 2011 19:43:54 +0100
Message-ID: <1314989034.17121.8.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Fri, 02 Sep 2011 18:48:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 15:03 +0100, Richard Purdie wrote:
> Seriously, does opkg have the logic in it to run this stuff? If so
> perhaps we need to teach opkg about offline postinstalls since it should
> already know about dependencies?

Yeah, that might be a sensible plan.  I'm not entirely sure that opkg
even gets the maintainer script ordering right itself during normal
circumstances, but at least it does have a dependency graph so one could
imagine how it might be made to work correctly.  I'll have a poke at
opkg when I get a moment and see if I can figure out how much work would
be involved in that.

How do the RPM-using folks deal with this; does rpm handle everything
automatically?

p.




