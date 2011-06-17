Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QXWIn-0000GI-T1 for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:29:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5HAPsJb020640
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 11:25:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20607-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 11:25:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5HAPii9020634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 11:25:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308305588.25285.7154.camel@phil-desktop>
References: <1308219330.25285.4194.camel@phil-desktop>
	<4DFA0824.5030809@gmail.com> <1308234598.25285.4740.camel@phil-desktop>
	<4DFA8F49.8000309@gmail.com> <1308305588.25285.7154.camel@phil-desktop>
Date: Fri, 17 Jun 2011 11:25:40 +0100
Message-ID: <1308306340.15712.458.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: eglibc testing?
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
X-List-Received-Date: Fri, 17 Jun 2011 10:29:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-17 at 11:13 +0100, Phil Blundell wrote:
> On Thu, 2011-06-16 at 16:18 -0700, Khem Raj wrote:
> > On 06/16/2011 07:29 AM, Phil Blundell wrote:
> > > On Thu, 2011-06-16 at 06:41 -0700, Khem Raj wrote:
> > >> I nfsmount eglibc builddir on target and run the testsuite. I see aroung
> > >> 10-15 fails. Havent run the testsuite in a while
> > >
> > > Maybe the right thing to do with eglibc would be to build a rootfs
> > > containing the testsuite, run it up in qemu-system-arm, and then
> > > engineer some IPC mechanism to get the test results back to the host.
> > 
> > using nfs isnt bad either since the tests excercise libraries from /lib
> > on target IOW installed eglibc.
> 
> True, though I can't think of any instances where the libc behaviour
> will change depending on where it's installed. 
> 
> The thing about nfs is that it's awkward to set up in an automated way.

The qemu scripts in OE-Core use usermode NFS by default for booting qemu
images...

> What I want is to arrive at a situation where you can just do:
> 
> $ bitbake -c check micro-base-image (or whatever)
> 
> and have it build all the necessary components, run their respective
> testsuites, and generate a report of both the current status and any
> regressions.  Ideally I want this to be doable without a lot of
> installation-specific fiddling around with networking configuration and
> suchlike, and I definitely want an arrangement which doesn't rely on
> having target hardware on hand.  Practically speaking I think that means
> it basically has to be qemu of some kind or another.
> 
> > Yes I think I should put together my mechanism somewhere and post it
> > and dejaGNU setup I use for cross testing
> 
> That would be cool.

We have the automated image QA tests in OE-Core already so perhaps we
could extend these to handle the tests somehow?

Cheers,

Richard



