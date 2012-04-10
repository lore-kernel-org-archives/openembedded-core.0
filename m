Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SHXRU-0000NC-O3
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 11:32:52 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SHXIX-0001Ji-F8
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 11:23:37 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 10:23:36 +0100
In-Reply-To: <4F835832.8070905@windriver.com>
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
X-Mailer: Evolution 3.0.2- 
Message-ID: <1334049817.28712.96.camel@phil-desktop>
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
X-List-Received-Date: Tue, 10 Apr 2012 09:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-09 at 16:44 -0500, Mark Hatle wrote:
> Depends on the distribution and reasons for these feeds.  What is typical is 
> that a base distribution will be generated for a common compatible (reasonable) 
> architecture.. i.e. armv5 -- with specific optimized package (glibc, openssl, 
> etc) for the target arch, i.e. armv7a.  Then you have a couple of packages 
> hand-tuned for size, speed, or other that define or not thumb and add even a 
> higher level of optimization.  It's possible, folks do it today.. but it's not 
> always obvious.  (I have existing customers today that run a mix like I 
> described through their own package feed like system.  They really don't care at 
> all that the core system is tuned for a given processor -- they only care that 
> their specific applications and certain areas are specifically tuned to their 
> use-cases.)  Note, this is not what I would consider a typical use-case!

Sorry, I'm not quite sure I understand what point you're trying to make
here.  Are you describing what your customers are currently doing with
OE, or are you saying that this is something that they would like to do
with OE but don't feel they are able to at present, or something else?

I'm still not entirely clear on what you feel is broken about the
current state of the ARM tunings.  What exactly is the scenario that
works with the "traditional workstaton/server Linux OS" and can't be
replicated with OE?

But, all that aside, it seems ultimately that the exact way the
PACKAGE_ARCHs are structured ought to be a DISTRO policy decision and
not something that's mandated by the underlying infrastructure.  That
would perhaps remove some of the need for tinkering with these things in
oe-core itself.

p.



