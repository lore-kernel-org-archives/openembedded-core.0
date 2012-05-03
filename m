Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPwFX-00044Z-8L for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 15:39:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43DTUT9000693
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 14:29:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00605-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 14:29:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43DTMAB000687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 14:29:24 +0100
Message-ID: <1336051765.30113.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 14:29:25 +0100
In-Reply-To: <20120503092955.GE4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net> <1336035344.30113.51.camel@ted>
	<20120503092955.GE4658@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 13:39:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-03 at 11:29 +0200, Martin Jansa wrote:
> FWIW: I've seen it on one device and only in midori (in same batch of
> upgrades with bring newer midori and newer gcc, so at the time I was
> sending glib-2.32.1 I didn't know midori fails and it was working for me
> in other apps).
> 
> That's why I sent follow-up patch to upgrade to 2.32.2 which will not
> build on architectures without this so it will never go to runtime and
> people which are building for e.g. mips will notice that soon enough.

2.32.2 is certainly a better option at this point.

> > I'm not taking any glib patches until we have this working on the core
> > architectures we support.
> 
> True, hopefully now the maintainers or even owners of those
> architectures will do their job and add those site config values.

The patch cannot go in until this has happened so yes, I hope so to.
 
> > Please can people not send upgrades which knowingly break things. I'm
> > fine having a fairly aggressive set of updates but anything with serious
> > breakage like this will get reverted and cause me to consider patches
> > from those person long and hard with a lot of testing before merging in
> > future.
> 
> And I'm pretty sad from contributing something in my free time and then
> being asked over and over again to fix stuff I've never used/built
> before. So this patchset is probably last one from me to oe-core/meta-oe
> and now I'll care only about stuff in meta-smartphone and for other
> layers just fill bug reports/feature requests to keep paid developers
> busy and enjoy my free time in other ways..

This is not what I'm saying. I'm asking that if people know that a patch
is going to break two out of four architectures we support, they mention
this clearly in the patch/pull request so we can deal with it. That is
taking some responsibility for the overall integrity of the project.
This was only partially known in the 2.32.1 timeframe but was clearly
known for 2.32.2. Evening an indication of what testing was done would
help me.

You are not being asked to fix it, however it will have to get fixed
before such a change can be applied to OE-Core (there is a difference
between those two things). I am going to find someone to figure out the
values for the other architectures and then this can go in.

The number of times I take something, people knew there was an issue but
didn't mention it, things break and then I personally end up having to
fix up the problem is getting beyond the point I can cope with. I'm
asking for people's help here...

Cheers,

Richard



