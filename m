Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWoRx-00015w-T2 for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 13:39:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FBaVS8026065
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 12:36:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25738-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 12:36:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FBaNNn026059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 12:36:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0566033F-1AB8-4E16-A064-A3EB3A5CA143@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<1308132426.15712.387.camel@rex>
	<9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
	<1308133322.15712.395.camel@rex>
	<0566033F-1AB8-4E16-A064-A3EB3A5CA143@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 12:36:22 +0100
Message-ID: <1308137782.15712.415.camel@rex>
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
X-List-Received-Date: Wed, 15 Jun 2011 11:39:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 12:37 +0200, Koen Kooi wrote:
> Op 15 jun 2011, om 12:22 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-06-15 at 12:15 +0200, Koen Kooi wrote:
> >> Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende geschreven:
> > I know, but we have two choices:
> > 
> > a) Continue this spiral of confusing variable names, conflict and wacky 
> >   bugs
> > 
> > b) Come up with a plan to address it and roll it out
> > 
> > I'm favouring b), particularly since this would help several different
> > architectures with a variety of issues. If we need to better document
> > that and have a process fine, but that is not a good argument for not
> > doing it at all.
> 
> I agree on that, put previous efforts in the yocto universe were
> rushed through (like the machine-name -> machine_name change I keep
> going on about), so I have a knee jerk reaction to such things
> nowadays. For various reasons yocto and later oe-core have not been
> friendly to distros having package feeds out there. Sometimes the
> changes made things better, but they were still painfull. It seems to
> be getting better nowadays, which is good, but everyone still needs to
> be carefull. Pet peeve: missing PR bumps.

Well, I think everyone is trying to improve, trying to do better and
hopefully we are learning from any mistakes made.

> What I need for angstrom is a variable that:For 
> 
> 1) *never* changes its value

As I've mentioned several times, I think it is reasonable to allarch to
clear or otherwise invalidate such a variable. That is a very special
case though and setting it to "all" was perhaps a poor choice of value.

> 2) holds the base arch (armv7a, ppc603e, etc)

Sounds like BASE_PACKAGE_ARCH

> 3) Is set in *all* the tune include files

Again sounds like BASE_PACKAGE_ARCH. Can it not default to TARGET_ARCH?

Grepping the tune files in OE-Core we seem to be pretty good about this
right now.

> 4) must be set to complete parsing when MACHINE is set

I suspect this doesn't give as much value as you'd think but I'm
indifferent.

> I don't care if it's in overrides by default or not since that's easy
> enough to do in distro configs.

Is this a decision the machine/tune files should make or the distro
though?

Cheers,

Richard



