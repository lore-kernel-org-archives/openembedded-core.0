Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Ua7bi-0005RS-6a
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 18:52:53 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id D933D952B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 17:34:45 +0100 (BST)
Message-ID: <518A7EA5.2000308@r-finger.com>
Date: Wed, 08 May 2013 17:34:45 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com>
	<1368026595.14512.342.camel@phil-desktop.brightsign>
In-Reply-To: <1368026595.14512.342.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Wed, 08 May 2013 16:52:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/13 16:23, Phil Blundell wrote:
> One particular issue for us is that the clutter recipes as they stand in
> oe-core are very X11-centric.  We don't have X and, instead, use the
> eglnative backend.  It'd be handy for us if some putative refactoring of
> the recipes made them more friendly to non-X11 deployments.

I have a similar problem in Guacamayo, where I have more than one target
machine, and generally prefer to use the elg-native backend unless it
cannot be avoided because the elg driver is too broken. So the recipes
in Guacamayo were set up so as to make it easy to reconfigure the
packages based on machine and distro features using a mininal bbappend,
e.g.,
https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-graphics/clutter/clutter-1.12_git.bbappend.
The original recipes are too much marked by the specifics of the
Guacamayo set up and their gradual evolution, but I am in the process of
cleaning this up, so it can be used by others.

Tomas


-- 
http://sleepfive.com


