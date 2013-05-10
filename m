Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UalHs-0000T0-Pu
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:14:57 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id BDCAB952B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 11:56:48 +0100 (BST)
Message-ID: <518CD26F.3090901@r-finger.com>
Date: Fri, 10 May 2013 11:56:47 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
In-Reply-To: <1368176725.11129.9.camel@ted>
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
X-List-Received-Date: Fri, 10 May 2013 11:15:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 10/05/13 10:05, Richard Purdie wrote:
>> Yes, I could have submitted clutter 1.12 recipes to oe-core in some form
>> and shape in the last 6 months, and we would have had a less outdated
>> package in oe-core; but nevertheless outdated, since again the clutter
>> 1.14 release came too late to make it into dylan. I can see this
>> happening again and again.
> 
> The trouble is you can make this argument for every single piece of
> software in OE-Core.

The clutter related packages are the only ones where I have run into
this problem. In the last 12 months clutter went through 7 stable
releases or so, of these there were 3 minor version changes, which
signal API changes, another minor version change, as well as a major
version change to 2.0, is on the horizon. If you are developing an
application using clutter; you need to keep up. If you are using
Yocto/OE to develop an application using clutter (and people do), then
everyone is left to maintain their own rolling recipes.


> A dedicated layer will still have timing issues, it will just move onto
> your personal schedule rather than the OE-Core one and whilst this will
> obviously suit you, it likely won't suit all other users.

For a small dedicated layer the schedule can closely track the upstream.
It might not suit all clutter users, but I think it could be made to
work for most of them; the current situation suits no one at all.


> I suspect the bigger problem here is that clutter is hard to write
> recipes for since it needs to suit a number of different targets and
> configurations. Going to the effort of doing a generic implementation in
> OE-Core is hard, whereas creating your own layer means you can customise
> to your usecase and not worry about the other cases. I suspect your
> reply to this will be that anyone wanting to add other cases can send
> you patches. The implication is that the layer will become much more
> specialised/focused than the core recipes currently are.

My reply is that it clutter is not that complex, there are only a finite
number of possible configurations that make sense and it should be
entirely possible to write a good base recipe that can be easily tweaked
using a bbappend based on machine and distro needs. But that's not the
real issue.


> My preference would still be to fix up the recipes in the core, than
> have some specific branches for danny/dylan with the 1.12/1.14
> components in if/as needed. We can create the core recipes so they're
> properly configurable to the different usecases.

Fixing up the recipes in oe-core only addresses one aspect of the
problem. The fast turnover of the clutter packages will remain, as will
the fact that nothing in oe-core uses clutter, so the oe-core packages
are untested. Then there is the fact that oe-core does not have any
machines that clutter could be really used with. Then there are also
other projects that are closely tied to clutter version, such as (the
recently removed) mutter, and, dare I say, GnomeShell, which should be
maintained together.

I am still to hear any reason why clutter should be in oe-core ... the
same logic that said mutter should be removed from oe-core applies to
clutter, I think.

Tomas


