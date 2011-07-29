Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmhWM-0002xo-SH
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:30:10 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmhSG-0003gn-Kw
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:25:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E324C2D.2070201@gmail.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E324C2D.2070201@gmail.com>
Date: Fri, 29 Jul 2011 08:25:50 +0100
Message-ID: <1311924350.3141.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 07:30:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 22:59 -0700, Khem Raj wrote:
> here I guess we have to say AVAILTUNES += "arm920t arm920"
> where arm920 is arm mode and 920t is thumb mode. but anyway I would 
> prefer that thumb is optionally added provided user asked for it
> through DISTRO/MACHINE features then we should first make sure
> that selected machine has thumb feature and if yes for both then we 
> should enable -mthumb compiler option which now it enable when thumb 
> appears in TUNE_FEATURES

I don't think we want to go down the road of inventing CPU names for
ARM-state variants of Thumb-capable cores.  (In other words, we
shouldn't start putting things like "arm920" in AVAILTUNES when there
isn't actually a core named arm920.)

Fundamentally I think you're right that the choice between ARM-state and
Thumb-state (for t1 at least) ought to be under the control of the
DISTRO and not selected purely on the basis of the hardware
capabilities.  For t2 it is a bit less of a clear-cut issue but, if
there are genuinely people making ARMv7 cores with the Thumb decoder
removed, I guess we need to have that same switch there as well.

p.




