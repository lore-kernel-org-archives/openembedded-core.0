Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UbpMu-0000Wn-Ny
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:48:36 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8195B952B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 10:30:23 +0100 (BST)
Message-ID: <5190B2AE.9010102@r-finger.com>
Date: Mon, 13 May 2013 10:30:22 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<518D5A7D.20606@windriver.com>
In-Reply-To: <518D5A7D.20606@windriver.com>
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
X-List-Received-Date: Mon, 13 May 2013 09:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 10/05/13 21:37, Mark Hatle wrote:
> One of the key pieces of the oe-core, it must be able to work without
> any additional layers.  It also much be able to be tested without any
> additional layers.
> 
> I personally don't have a preference for the clutter and related items
> on where they live... but I do want to make sure that oe-core can
> standalone as a starting point for people to develop devices.  Part of
> being standalone means that it is capable of being tested.

Yes, but the clutter packages are not being tested, and more to the
point, they cannot be meaningfully tested using oe-core, because such
testing has to be done against a real OGL/GLES implementation -- Clutter
can only be tested properly in conjunction with BSP layer(s). All you
can test with oe-core is the mesa software rasterizer, which is just
about the one thing nobody cares about because it is of no practical use.

There are two ways that tested clutter packages are achievable:

a) Generic clutter recipes in oe-core and BSP specific bbappends in the
BSP layers. There are a couple of problems with this: I don't think the
BSP maintainers have time/impetus for maintaining the bbappends and
testing Clutter, and the BSP support might need upgrading the base
package and dependencies (plus Clutter is a fairly high level package to
be part of a BSP anyway, IMO).

b) A dedicated layer that is not subject to the oe-core constraints and
can make reference to external BSP layers.

Tomas

-- 
http://sleepfive.com


