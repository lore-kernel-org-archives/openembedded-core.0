Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QohjH-0008V7-Gc
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 22:07:47 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qohf4-0004E7-B1
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 22:03:26 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
References: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 21:03:19 +0100
Message-ID: <1312401799.4007.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] tcl: Fix packaging of platform independent files
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
X-List-Received-Date: Wed, 03 Aug 2011 20:07:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 10:43 -0500, Kumar Gala wrote:
> Tcl's doesn't utilize ${baselib} for platform independent files but
> defines it as follows:
> 
> TCL_LIBRARY             = $(prefix)/lib/tcl$(VERSION)
> 
> Match that so if ${baselib} is not just /lib things work properly.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---

Even better would be bashing tcl so that it puts its bits in ${datadir}
where they belong. :-)  But your patch is fine though.

p.




