Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qhjyf-0000NO-Ea
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:06:53 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qhjup-0007HI-1a
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:02:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 16:02:54 +0100
In-Reply-To: <CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310742175.30326.1.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: kernels
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
X-List-Received-Date: Fri, 15 Jul 2011 15:06:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
> > The other day I was working on a BSP layer for a fairly generic i586
> > system and I was struck by the fact that we don't appear to have any
> > vanilla kernel recipes in oe-core.  I had sort of expected that, to get
> > a standard bzImage out, I would just need to ship an appropriate
> > defconfig in my layer and everything else would "just work".
> 
> Hmm. Perhaps it isn't documented clearly enough as such, but the linux-yocto
> kernel base can work in this mode, since that was a design goal of
> 1.0.
> 
> You pick a branch, throw in a config fragment (or defconfig if you really
> want)  and build. The base branches in the tree are generic enough to
> sort a range of boards out of the box, and should form a base.

Okay, cool.  I'll give it a go and see how I get on.

Is there a description anywhere of what the functional differences are
between the code in linux-yocto git and the upstream kernel.org tree?

p.




