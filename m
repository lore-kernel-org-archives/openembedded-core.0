Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcaGr-000285-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 13:53:36 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 0FA7A952B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 12:35:13 +0100 (BST)
Message-ID: <519372F1.6050902@r-finger.com>
Date: Wed, 15 May 2013 12:35:13 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1824887.iAjz2He6PC@helios>
	<5193533D.70503@r-finger.com> <3057509.dy5Cs7AUqs@helios>
In-Reply-To: <3057509.dy5Cs7AUqs@helios>
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
X-List-Received-Date: Wed, 15 May 2013 11:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

On 15/05/13 10:49, Paul Eggleton wrote:
>> It prevents efficiently supporting clutter on any real machine that does
>> not use mesa's GL, which means all machines not in meta-intel, and some
>> machines in meta-intel. This is the main issue, real HW support.
> 
> How does it prevent that? Surely if machine-specific changes are required then 
> they will be required on top of a separate layer as much as they are if the 
> recipes remain in OE-Core.

It could be all pulled together into the meta-clutter layer, the
supported BSPs and machines documented, etc, so that common machines
just work out of the box. We could have a dedicated mailing list, a bug
tracker, build a community around it, pull resources.


> The layer mechanism exists to allow specific 
> recipes to be extended if needed. Having the recipes in OE-Core does not 
> preclude their extension or replacement with newer versions elsewhere for 
> those that need it.

I have followed the model you advocate for over a year with clutter, and
it is a PITA, so I am thinking that perhaps there are others who are
doing the same and we could do it in one well known place.


> You may well be right about the need to test on other GL implementations.
> That does not explain how moving them to a separate layer directly helps to address 
> that need. You must also expect to make some changes to the recipes 
> themselves, so what changes would you be making?

It's not just about testing, you have to build it first: I would like to
see a set of recipes that can support a whole bunch of machines in the
public OE BSP layers out of the box: configs that work and make sense,
patches where needed, documentation, including documentation of BSP
specific issues.

In the absence of a community-owned meta-clutter layer, if anyone is
stuck maintaining their own clutter recipes, I have a set at
https://github.com/Guacamayo/meta-clutter which can perhaps be of some use.

Tomas


-- 
http://sleepfive.com


