Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBlBN-0006Dx-DU for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 11:55:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I9rRJ7011043;
	Mon, 18 Apr 2011 10:53:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10520-08; Mon, 18 Apr 2011 10:53:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I9rIBu011037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Apr 2011 10:53:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E3CCB8FD-559F-4700-B922-FC7C86033E40@dominion.thruhere.net>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
	<201104181017.59589.paul.eggleton@linux.intel.com>
	<E3CCB8FD-559F-4700-B922-FC7C86033E40@dominion.thruhere.net>
Date: Mon, 18 Apr 2011 10:53:10 +0100
Message-ID: <1303120390.5518.88.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 09:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 11:30 +0200, Koen Kooi wrote:
> Op 18 apr 2011, om 11:17 heeft Paul Eggleton het volgende geschreven:
> 
> > On Friday 15 April 2011 19:26:43 Saul Wold wrote:
> >> There was some initial discussion at ELC this last week about what goes
> >> where and how layers are going to work moving forward.  I know that we
> >> are committed to the qemu* machines in oe-core (meta), and that
> >> currently meta-yocto contains a set of core HW (beagleboard among them),
> >> so the question then is should the HW specific stuff, such as this patch
> >> move to meta-yocto or some other layer?  There are a couple other
> >> recipes such as x-load and formfactor that contain HW specific files.
> > 
> > Ah, yes, you're right - we definitely don't want this file in oe-core. I should 
> > have pushed this particular patch to meta-yocto 
> 
> You mean meta-texasinstruments, right? Or do you yocto folks keep
> going to deny that there's an upstream layer for beagleboard support?

To quote my email from earlier today:

"""
> It should live in the upstream beagleboard BSP layer, which currently
> is meta-texasinstruments

That is the goal, yes. It was agreed that until we sort out the layer
tooling, there would be some code in meta-yocto which would be a copy of
various upstream parts which includes beagleboard. Over time I'm hoping
to see these pieces converge, then we when get the tooling right it will
become automated.
"""

which I'd hardly call denial. There is a plan indicated above which we
agreed to and we intend to follow unless there is a problem?

Cheers,

Richard



