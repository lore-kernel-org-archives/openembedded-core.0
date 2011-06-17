Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QXW6N-0007Cf-If for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:16:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QXW33-0007pg-9U
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:13:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DFA8F49.8000309@gmail.com>
References: <1308219330.25285.4194.camel@phil-desktop>
	<4DFA0824.5030809@gmail.com> <1308234598.25285.4740.camel@phil-desktop>
	<4DFA8F49.8000309@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 17 Jun 2011 11:13:08 +0100
Message-ID: <1308305588.25285.7154.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Fri, 17 Jun 2011 10:16:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-16 at 16:18 -0700, Khem Raj wrote:
> On 06/16/2011 07:29 AM, Phil Blundell wrote:
> > On Thu, 2011-06-16 at 06:41 -0700, Khem Raj wrote:
> >> I nfsmount eglibc builddir on target and run the testsuite. I see aroung
> >> 10-15 fails. Havent run the testsuite in a while
> >
> > Maybe the right thing to do with eglibc would be to build a rootfs
> > containing the testsuite, run it up in qemu-system-arm, and then
> > engineer some IPC mechanism to get the test results back to the host.
> 
> using nfs isnt bad either since the tests excercise libraries from /lib
> on target IOW installed eglibc.

True, though I can't think of any instances where the libc behaviour
will change depending on where it's installed. 

The thing about nfs is that it's awkward to set up in an automated way.
What I want is to arrive at a situation where you can just do:

$ bitbake -c check micro-base-image (or whatever)

and have it build all the necessary components, run their respective
testsuites, and generate a report of both the current status and any
regressions.  Ideally I want this to be doable without a lot of
installation-specific fiddling around with networking configuration and
suchlike, and I definitely want an arrangement which doesn't rely on
having target hardware on hand.  Practically speaking I think that means
it basically has to be qemu of some kind or another.

> Yes I think I should put together my mechanism somewhere and post it
> and dejaGNU setup I use for cross testing

That would be cool.

p.




