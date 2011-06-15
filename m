Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWnHz-00017u-BW for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 12:25:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FAMA0N025476
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:22:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25159-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:22:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FAM4QZ025470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:22:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<1308132426.15712.387.camel@rex>
	<9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 11:22:02 +0100
Message-ID: <1308133322.15712.395.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 10:25:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 12:15 +0200, Koen Kooi wrote:
> Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende geschreven:
> > Well, I was trying to provide some hints as to how we might be able to
> > improve this situation, not write the whole roadmap. From what I
> > remember and the quick discussion we had offlist there are two things
> > FEED_ARCH tries to do:
> > 
> > a) Provide an addition to overrides that represents the
> > optimisation/tune profile being used (like armv7a).
> > 
> > b) Provide some info in BASE_PACKAGE_ARCH so that when PACKAGE_ARCH is
> > overwritten, you can still find out what it would have been set to.
> > 
> > For a), we could update the common include files for the omap/armv7a
> > platforms and append to MACHINEOVERRIDES there with the appropriate
> > entries
> 
> It's not omap specific, you really need have access to the arch in
> overrides for *all* platforms. I'm using armv7a is an example since
> angstrom does TARGET_FPU_armv7a = "hard", but it also does that for
> various powerpc architectures.

I'm also using omap as an example. I'd imagine the powerpc bits would
also work from a common small set of tune include files though? I
suspect the Intel guys would love some way to say "x86" instead of
"i386|i486|i586|i686" etc. so this is a general problem.
> 
> And any change like this would need to get propagated to all the
> machine layers out there as well, unlike .dev where everything was in
> one place.

I know, but we have two choices:

a) Continue this spiral of confusing variable names, conflict and wacky 
   bugs

b) Come up with a plan to address it and roll it out

I'm favouring b), particularly since this would help several different
architectures with a variety of issues. If we need to better document
that and have a process fine, but that is not a good argument for not
doing it at all.

Cheers,

Richard



