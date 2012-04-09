Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SHMKV-0000Tx-AV
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:40:55 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SHMBY-0000w3-La
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:31:40 +0200
Message-ID: <1334007051.3382.19.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Apr 2012 22:30:51 +0100
In-Reply-To: <4F8352CD.7070500@windriver.com>
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
X-List-Received-Date: Mon, 09 Apr 2012 21:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-09 at 16:21 -0500, Mark Hatle wrote:
> I do, and thus the hell that is ARM.  I could not currently generate a single 
> package feed that work would on a variety of devices (like a traditional 
> workstaton/server Linux OS would.) 

Well, actually, you could in fact do exactly that.  What you couldn't
necessarily do with the tunings as they exist right now is generate a
package feed which is optimised for (as opposed to "works on") all those
devices.  But it isn't clear to me that you could do that with a
"traditional workstaton/server" kind of distribution either.  In the x86
world, for example, the majority of the big distros do not bother to
ship individually-tuned binaries for different processor types,
certainly not for the entire distribution.

>Add in to that one of the tunings -- not indicated by the package arch
>of thumb enabled or not

There are multiple reasons why this isn't indicated by the PACKAGE_ARCH.
Firstly, it's irrelevant: on v5T or newer, the question of whether a
given package is using Thumb-state or not has no ABI impact and there is
no reason for anyone to care at a compatibility level.  Second, it may
be unpredictable: the compiler is at liberty (although current versions
of gcc don't exploit this latitude) to switch arbitrarily between
ARM-state and Thumb-state as it sees fit to get the best performance.
And thirdly, it's just another piece of distro policy in the same way as
compiling for -O2 vs -Os (which we also don't encode into PACKAGE_ARCH)
is.

p.




