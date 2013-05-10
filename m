Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Uaqdd-0003E0-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 18:57:48 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 64CED952B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 17:39:41 +0100 (BST)
Message-ID: <518D22CC.1040002@r-finger.com>
Date: Fri, 10 May 2013 17:39:40 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
In-Reply-To: <1368185566.11129.28.camel@ted>
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
X-List-Received-Date: Fri, 10 May 2013 16:57:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/13 12:32, Richard Purdie wrote:
> On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
>> On 10/05/13 10:05, Richard Purdie wrote:
> The closely track upstream is the key part and I think the core can do
> this, apart from the ~six week stabilisation window.

If you mean you are prepared to do frequent point releases to keep up
with clutter, that could work. But if you mean that those interested can
closely track oe-core master, then that is not that useful, there are
too many other changes happening at the same time. A small single
purpose layer means updates (and breakages) can be very contained.


> My argument for this is that I really do want to stress out the graphics
> stack we have, clutter provides a good way to test some of those
> components, particularly some of the more unusual parts. Currently its
> mostly build test however we do have plans to make that runtime too. I
> do think that clutters unusual usage of the stack makes it particular
> useful in this role. I'd appreciate help from anyone who can help make
> this all work.

I am all for this, but does using clutter for automated tests require
for the clutter packages to be in oe-core? The only thing you can stress
test in oe-core using clutter is mesa, which is only applicable to the
i915/i965 chip sets. I think it would be useful if any such tests could
be applied to other graphics stacks provided by BSPs; I think all of the
BSPs would benefit from this.

I'd really like for people to be able to just pick up uptodate and
working clutter packages for the major platforms the actively maintained
BSPs support. Every so often someone asks about clutter for XYZ (usually
the Beagleboard or RPi) on the clutter list: this should be readily
available somewhere.

have a good weekend everyone,

Tomas

-- 
http://sleepfive.com


