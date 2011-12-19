Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rci82-0003VA-SS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:40:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 10:32:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89177454"
Received: from unknown (HELO helios.localnet) ([10.252.122.37])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 10:32:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Dec 2011 18:32:15 +0000
Message-ID: <4077851.vBmcQh9dAf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<1817157.LPoMfdErnK@helios>
	<7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Mon, 19 Dec 2011 18:40:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 December 2011 19:27:06 Koen Kooi wrote:
> Op 19 dec. 2011, om 19:22 heeft Paul Eggleton het volgende geschreven:
> > On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
> >> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende geschreven:
> >>> Set the default psplash image to the OpenEmbedded logo, and provide
> >>> a
> >>> script to allow people to use their own custom image.
> >> 
> >> What I did in OE-classic and meta-angstrom is to use
> >> update-alternatives to provide different psplash images. This way you
> >> can choose a different splash for each image instead of having a
> >> distro wide one. Is something like that suitable for oe-core as well?
> > 
> > Sounds like a useful capability, however, does this mean that when you
> > want to override it in the image you end up with both psplash versions
> > installed?
> in a splashless image you can just do 'IMAGE_INSTALL += psplash-angstrom and
> it will only install that one. If you want to reuse an existing, unmodified
>  image with psplash and add your own, then you will end up with both.

Although I guess another way to do it would be to do a VIRTUAL-RUNTIME type 
thing like we do for other such selections. At the moment in OE-core, psplash 
is brought in via task-core-console, and whilst it is a separate variable that 
could be overridden it's a task which once built really makes it impossible to 
customise per-image.

What about a "splash" IMAGE_FEATURE and then a VIRTUAL-RUNTIME_splash to 
select which psplash to install? Would update-alternatives be needed at all in 
that case?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


