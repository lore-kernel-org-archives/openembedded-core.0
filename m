Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcY9x-0006u4-1w
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 11:38:09 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id E9AF0952B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 10:19:57 +0100 (BST)
Message-ID: <5193533D.70503@r-finger.com>
Date: Wed, 15 May 2013 10:19:57 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com>
	<1368459699.6920.41.camel@phil-desktop.brightsign>
	<5192006C.1060803@r-finger.com> <1824887.iAjz2He6PC@helios>
In-Reply-To: <1824887.iAjz2He6PC@helios>
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
X-List-Received-Date: Wed, 15 May 2013 09:38:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

On 14/05/13 17:55, Paul Eggleton wrote:
> Having clutter in OE-Core does not preclude such testing with additional BSPs, 
> and I'm unclear on how moving it out to another layer helps at all with this 
> specific issue.

It prevents efficiently supporting clutter on any real machine that does
not use mesa's GL, which means all machines not in meta-intel, and some
machines in meta-intel. This is the main issue, real HW support.


> This could present a problem. What if I want Clutter but I don't want the 
> latest version of glib, but instead the version that is being shipped with OE-
> Core that is tested with the other pieces of the system that depend upon it 
> (especially given glib has recent history of breaking other packages)? Surely 
> the safest alternative is the last stable version of Clutter that works with 
> that version of glib? That would make it difficult to depend upon an external 
> layer that provides its own newer version of glib would it not?

Sometimes a 6 month old release is not enough, and having to provide the
updated packages yourself is the least desirable of all options. In a
small layer, such issues can be handled gracefully, and their impact
limited.


> There's no denying that the maintenance of the Clutter recipes in OE-Core has 
> slipped. I don't think that is an argument in itself to split them out, that 
> just means we need to recognise that and maintain those recipes more 
> effectively.

The lack of maintenance reflects the relative importance of Clutter for
oe-core, and is an orthogonal issue. I am not complaining that it is not
being maintained, I am arguing that it cannot be properly maintained
with just reference to mesa and qemu, hence the suggestion to split it out.


> Honestly I think if Clutter continues to be something that people are using to 
> develop applications we're much better off with the "canonical" stable version 
> being in OE-Core.

Where 'canonical' means 'unusable on non-Intel HW', but I am repeating
myself ...

Tomas


