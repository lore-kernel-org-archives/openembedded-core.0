Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ScPjB-0001hx-Bg for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 01:33:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q56NMvOu022542
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 00:22:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22475-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2012 00:22:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q56NMoNR022536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 00:22:51 +0100
Message-ID: <1339024972.20169.294.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 07 Jun 2012 00:22:52 +0100
In-Reply-To: <CB9D6A1A-7072-4448-8C8D-BD5840102797@dominion.thruhere.net>
References: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
	<4FCF7959.3070102@linux.intel.com>
	<CB9D6A1A-7072-4448-8C8D-BD5840102797@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
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
X-List-Received-Date: Wed, 06 Jun 2012 23:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-06 at 19:51 +0200, Koen Kooi wrote:
> Op 6 jun. 2012, om 17:38 heeft Saul Wold het volgende geschreven:
> 
> > On 06/06/2012 03:46 AM, Burton, Ross wrote:
> >> On 6 June 2012 06:34, Saul Wold<sgw@linux.intel.com>  wrote:
> >>> Upstream Gnome projects are starting to migrate to the .xz
> compress format,
> >>> so we need to add this to allow recipes to override the default
> of .bz2 as
> >>> the upstreams make the transition.
> >> 
> >> Considering all future tarballs are going to be .xz, would it make
> >> sense to default to .xz and fix the recipes where there isn't
> a .xz?
> >> 
> > I think until we get a predominant number of the gnome packages
> updated there is not much point in doing that as it would require
> extra recipe edits.  I think if we can do a batch update and then
> switch the default that would make more sense.  I will leave that up
> to the new gnome recipe maintainer Valentin.
>
> When are the gnome recipes going to move out of OE-core?

I keep seeing people mentioning their pet hates but nobody has put
together a reasonable proposal encompassing all the different elements
about how we could change the current set, thinking through the various
implications.

I will state once again for the record that we need enough in OE-Core
that we can build some working environments which are testable. I do not
want to end up in a position where we have a core which we can't
actually test. I also want the core to contain enough pieces to actually
be real world useful. I think the core today does that but if we start
pulling out every gnome piece or X11 then it would not be as real world
generally useful. I realise not everyone uses X11 but it does test a
significant set of the system, be it kernel framebuffer drivers, the
compiler etc.

I'm not thrilled to have sato there either but again, until we can come
up with a plan to replace it whilst still having a testable core, I
don't want to remove it.

Yes, I've said this before but since people keep asking the question,
I'll have to keep repeating myself.

Personally, I think there are bigger more pressing issues to deal with
too...

Cheers,

Richard






