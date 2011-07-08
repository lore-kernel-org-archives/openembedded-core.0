Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qf7of-0007hp-Kz for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 11:57:45 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qf7kx-0006x1-GZ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 11:53:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107080938.37370.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107071534.51372.paul.eggleton@linux.intel.com>
	<4E1693CC.8080403@gmail.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 10:53:49 +0100
Message-ID: <1310118829.18564.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 09:57:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 09:38 +0100, Paul Eggleton wrote:
> On Friday 08 July 2011 06:21:16 Khem Raj wrote:
> > If oe-core never supported older kernel than 2.6.37 then setting it to
> > 2.6.37 would be better IMO
> 
> It's not necessarily just about oe-core - it's about what layers get used on 
> top, and some of those will be using kernels older than 2.6.37.

They can always provide their own OLDEST_KERNEL setting, though.  To
some extent I think it's a bit academic what the default in oe-core is.

p.




