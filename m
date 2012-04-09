Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SHLta-0008LD-Pg
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:13:06 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SHLke-0000vE-32
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:03:52 +0200
Message-ID: <1334005382.3382.10.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Apr 2012 22:03:02 +0100
In-Reply-To: <4F8345BD.6090500@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com> <4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com> <4F83413F.7010608@opendreambox.org>
	<4F8345BD.6090500@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 21:13:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-09 at 15:25 -0500, Mark Hatle wrote:
> And just to be extra clear, I consider it a defect if we can produce a package 
> with the same name for two different tune settings.. (the exception being the 
> hell that is ARM and thumb namings.)

While you might consider that a defect (and it probably is a defensible
position to do so), it hasn't historically been considered such in OE.
The PACKAGE_ARCH value has, traditionally, been concerned purely with
ISA and ABI (i.e. answering the question "can I execute this code?")
rather than optimisations.

For example, the tune-arm926ejs.inc and tune-xscale.inc files in current
oe-core both end up setting PACKAGE_ARCH to "armv5tte" (sic).  But those
are quite different processors and have different tuning requirements,
so the binaries you get are unlikely to be the same.  If you were to
take the view that the PACKAGE_ARCH must uniquely identify one set of
binaries then obviously each of these tunings (and probably all the ARM
cpu-specific tunings) would need to set PACKAGE_ARCH to some unique
value.

p.




