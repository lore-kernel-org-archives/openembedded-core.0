Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SHgy7-0003LO-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 21:43:11 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SHgp9-00029B-Qd
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 21:33:55 +0200
Message-ID: <1334086385.3382.29.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 20:33:05 +0100
In-Reply-To: <4F847045.2030203@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com> <4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com> <4F83413F.7010608@opendreambox.org>
	<4F8345BD.6090500@windriver.com>
	<1334005382.3382.10.camel@x121e.pbcl.net>
	<4F8352CD.7070500@windriver.com>
	<1334007051.3382.19.camel@x121e.pbcl.net>
	<4F835832.8070905@windriver.com>
	<1334049817.28712.96.camel@phil-desktop>
	<4F847045.2030203@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: ARM tunings was Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Tue, 10 Apr 2012 19:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 12:39 -0500, Mark Hatle wrote:
> The installation system uses a best 
> to least best match when doing assembly actions.  So if the part is an ARMv7a, 
> it will first look for ARMv7a w/ thumb, vfp and neon, not finding that, ARMv7a 
> w/ thumb and vfp, then ARMv7a w/ thumb, then ARMv5 w/ thumb and vfp, then ARMv5 
> w/ thumb, and finally fall back to the ARMv5 binaries.

This sounds like exactly the behaviour you would get with the current
ARM tunings (except the Thumb bit which, as previously discussed, I
think is somewhat misguided in the first place).  The existing ARM
tunings do seem to correctly encode VFP and Neon-ness.  

Which part isn't working for you?  Maybe you could give a concrete
example of where exactly it falls down.

> I can very much understand that in OE, for ARM specifically the package arch is 
> simply indicating basic compatibility and not ABI & ISA & Optimization like it 
> is on other architectures.

Well, I would consider "ABI & ISA" to be a fairly big part of "basic
compatibility".  It is true that we don't currently encode
optimisations, but as I previously mentioned I don't think many (perhaps
any) other distributions do that either, and it's perhaps debatable
whether it would be a very useful thing to do in the general case.  For
individual packages you can obviously force the issue in your DISTRO
configuration anyway.

p.




