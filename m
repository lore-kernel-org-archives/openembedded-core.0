Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Ucewk-0005Ue-L4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 18:53:04 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id DC148952D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 17:34:46 +0100 (BST)
Message-ID: <5193B925.6010607@r-finger.com>
Date: Wed, 15 May 2013 17:34:45 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com> <5543572.N8ppyBn6lW@helios>
In-Reply-To: <5543572.N8ppyBn6lW@helios>
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
X-List-Received-Date: Wed, 15 May 2013 16:53:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

On 15/05/13 15:09, Paul Eggleton wrote:
> Can you not just get the appropriate changes into the BSP layers 
> so that when you add the BSP on top of OE-Core it does just work "out of the 
> box"?

What you are really saying is that the onus of maintaining working
clutter packages should be on the BSP maintainers. I have already
explained previously in this thread why I don't think this is going to
work out in practice, so I am not going to repeat myself again.


> If clutter is taken out of OE-Core this becomes even harder because then 
> BSPs can no longer bbappend clutter or cogl (if that is indeed what is 
> required in order to enable machine-specific functionality) without fiddling 
> around with BBMASK or keeping the appends in yet another separate layer so 
> they don't impact other BSP users who aren't building Clutter.

The BSPs would not need to do anything regarding clutter, no bbappends,
meta-clutter would be self-contained in this regard.

I don't think there is any point in bothering the list with this
discussion any further, we have gone around the circle more than once.
The whole point of the proposal was to make maintaining, using and
supporting the clutter packages easier for everyone, but it seems I
underestimated how important Clutter is to oe-core, and I am already
looking forward to this newly discovered importance being translated
into user happiness before too long. :)

Tomas


