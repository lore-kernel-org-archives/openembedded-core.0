Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QeBYQ-0003xj-EW for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:45:06 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QeBUl-0002uj-1m; Tue, 05 Jul 2011 21:41:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <201107051731.12273.paul.eggleton@linux.intel.com>
References: <1309881139.2410.14.camel@phil-desktop>
	<1309881259.2410.16.camel@phil-desktop>
	<201107051731.12273.paul.eggleton@linux.intel.com>
Date: Tue, 05 Jul 2011 19:37:24 +0100
Message-ID: <1309891044.3176.7.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Tue, 05 Jul 2011 19:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 17:31 +0100, Paul Eggleton wrote:
> On Tuesday 05 July 2011 16:54:18 Phil Blundell wrote:
> > Or an alternative patch might be just to delete this recipe altogether.
> > Its sole purpose is to work around defects in hardware which must be the
> > best part of a decade old and I would be slightly surprised if anyone
> > was still using DTL1s in this day and age.
> 
> Is it possible some people are still using PCMCIA/CF cards with this hardware 
> in it?

It's certainly possible, yes.  But I don't think that the mere
possibility is a very strong argument for keeping the recipe in oe-core.
Maybe it would be better suited to meta-oe or some BSP layer,

I also have at least half a suspicion that the scripting in that recipe
is only compatible with 2.4 kernels anyway.

p.




