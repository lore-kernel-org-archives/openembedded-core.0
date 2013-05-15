Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcfhP-00019j-2F
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:41:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2013 10:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,678,1363158000"; d="scan'208";a="302924453"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2013 10:22:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 18:22:42 +0100
Message-ID: <5328014.mpvvKFpo4D@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5193B925.6010607@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <5543572.N8ppyBn6lW@helios>
	<5193B925.6010607@r-finger.com>
MIME-Version: 1.0
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 17:42:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 May 2013 17:34:45 Tomas Frydrych wrote:
> On 15/05/13 15:09, Paul Eggleton wrote:
> > Can you not just get the appropriate changes into the BSP layers
> > so that when you add the BSP on top of OE-Core it does just work "out of
> > the box"?
> 
> What you are really saying is that the onus of maintaining working
> clutter packages should be on the BSP maintainers. I have already
> explained previously in this thread why I don't think this is going to
> work out in practice, so I am not going to repeat myself again.

No, I'm not. I'm saying configuration specific to a machine, if there is any, 
needs to be in the BSP layer for that machine. Whether the maintainer of that 
BSP or some external contributor provides and maintains that is a separate 
question.

If there are clutter tests we can run on the Yocto Project reference hardware 
platforms (which I understand from Bruce may be refreshed for 1.5) and they 
could be run in an automated manner, we can run these on the autobuilder and 
this will help prove the functionality of clutter itself. Once the tests are 
set up it should be easy for others to run these regularly on their own 
autobuilders with other BSPs.

> > If clutter is taken out of OE-Core this becomes even harder because then
> > BSPs can no longer bbappend clutter or cogl (if that is indeed what is
> > required in order to enable machine-specific functionality) without
> > fiddling around with BBMASK or keeping the appends in yet another
> > separate layer so they don't impact other BSP users who aren't building
> > Clutter.
> 
> The BSPs would not need to do anything regarding clutter, no bbappends,
> meta-clutter would be self-contained in this regard.

First you say there are hardware specific bits, then you say there aren't any 
changes required. I'm not following at all.

> I don't think there is any point in bothering the list with this
> discussion any further, we have gone around the circle more than once.

Sorry, but I don't think the important questions have been answered yet.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


