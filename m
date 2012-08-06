Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyO6S-00006n-9Y for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:16:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76E4V5c028395
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:04:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27900-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 15:04:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76E4Llc028389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:04:22 +0100
Message-ID: <1344261864.9756.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 15:04:24 +0100
In-Reply-To: <1D87F6F5-E962-4348-A240-97BFA89CB913@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
	<EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
	<132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
	<1344257012.9756.143.camel@ted>
	<1D87F6F5-E962-4348-A240-97BFA89CB913@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 14:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 15:24 +0200, Koen Kooi wrote:
> Op 6 aug. 2012, om 14:43 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Fri, 2012-08-03 at 17:46 +0200, Koen Kooi wrote:
> >> Op 3 aug. 2012, om 15:19 heeft Ross Burton <ross.burton@intel.com> het
> >> volgende geschreven:
> >> 
> >>> On Friday, 3 August 2012 at 11:18, Koen Kooi wrote:
> >>>> libegl and libgles aren't built nowadays, so the problem is
> >> avoided. Noone has dared to touch this subject the past 2.5 years:
> >> http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3d96f8cb61225d515b5cb4fe863f0d50c3ced436
> >>>> 
> >>>> The best solution[1] is to disable egl/gles in the mesa-recipes and
> >> add a seperate recipe for them. That way you still get glu and other
> >> useful mesa bits needed for gnome/efl/xfce/etc, but you can skip the
> >> sysroot/shlib poisoning if needed.
> >>> After much digging I see that the Beagle PVR drivers only provide
> >> gles and egl, which is why you say that the problem was avoided.  Of
> >> course that's just one specific driver, for example the Cedar Trail
> >> EMGD driver does build libgl, libgles and libegl.
> >>> 
> >>> If the solution is "put the egl/gles bits in another package"
> >> 
> >> Recipe, not package. Big difference :)
> >> 
> >>> then I'm totally confused as to what the actual problem is.
> >> Considering there's numerous libegl libraries for the many variants of
> >> PVR on ARM, I'm struggling to understand exactly what is new here.
> >>> 
> >>> Can you explain clearly what the problem is, I'm obviously missing
> >> something.  Once I understand the problem I can help with a solution.
> >> 
> >> You need mesa for the !egl and !gles libs and evil vendor blob for egl
> >> and gles libs. In the emgd case you can get gl from the evil vendor as
> >> well. To build e.g. EFL I need mesa for the !egl and !gles bits, to
> >> build EFL with gles support I need mesa (again !egl, !gles) in
> >> addition to evil vendor blob for egl and gles. 
> >> We could make this work with MACHINE_FEATURES or something similar,
> >> but that would mean that a very large chunk of userspace now becomes
> >> machine specific. This is how clutter worked in the past and just look
> >> at the fit the canonical/linaro people threw when they started doing
> >> 'embedded' and clutter.
> >> 
> >> To compress the above: you need to build both the mesa and the
> >> evil-egl-binary *recipes* for things to work, so the egl bits should
> >> be a different recipe, not a subpackage of the mesa recipe. This is
> >> all assuming we care abou the binary blobs e.g. TI distributes for 3d
> >> support. If you don't, fine, merge this patchset.
> > 
> > Let me test this a little bit more. The binary blobs shipped by TI would
> > be machine specific
> 
> They aren't machine specific, they contain multiple blobs to support a
> wide range of SoCs. But even if they were machine specific it wouldn't
> work like you want to.
> 
> > and would be marked as such in the package feeds?
> > The mesa pieces would be marked as architecture specific and more
> > generic. In feeds, machine specific has priority so on the machines
> > where there is hardware support, the hardware optimised versions would
> > get installed?
> 
> You're assuming all libraries are subpackaged into their own package
> and renamed identically, they aren't (which is actually a feature in
> the current situation).

They don't have to be renamed identically, the would have to have
RPROVIDES that cover what is needed in some standard namespace.

> > If the above isn't the case, can we make it work like that?
>
> We can't. Even if we could, it would be a giant step backwards for
> people using the output of the build (see below).
>
> The only solution that keeps the good things of the current situation
> is to have the following recipes:
>
> 1) mesa (does not build libgl or libgles)
> 2) mesa-gles (only builds libgl+libgles)
> 3) evil-vendor-blob
>
> And you can specify per SoC something like
> PREFERRED_PROVIDER_virtual/egl = "mesa-gles" or
> PREFERRED_PROVIDER_virtual/egl = "evil-vendor-blob".
>
> That will cause problems if you are building for 2 SoCs in the same
> architecture family that need different gl providers, the shlib code
> might get a bit upset. I don't have a good solution for that, but we
> have that problem right now as well.
>
> From the build side we could make it a bit prettier by making all the
> gl stuff machine specific, but that will be a giant pain in the ass
> for the end user (distro maintainer,  $silicon_vendor customer,
> $silicon_vendor SDK).
>
>  If we end up doing it like that, we'll need buy-in from the silicon
> vendors involved to change the way they distribute their blobs. That
> is doable, I managed to get the TI blobs changed a few times in the
> past, but it's a slow process.
> And everything using GL would suddenly be machine specific, I hope the
> yocto autobuilder can keep up with that.

Everything does not have to become machine specific if the things in
question have known good portable APIs. As I understand it we have GL so
we can swap in the binary blobs in place of the generic ones without
needing everything to be machine specific.

> Executive summary: ARM SoCs with 3d suck, Intel parts with 3d sucks
> less. It's a mess in oe-core.

Ok, we need to do something about this mess, period. Its not going to
get any better and we need to sort it out. I can't "force" changes in
but on the other hand I'm not going to tie the hands of everyone just
because the ARM world in particular is a total mess in this area.

As such, I'm likely going to allow architecture overrides in core mesa
so for example, IA can enable gles and egl for everyone and cleanup
their binary blobs to override them on platforms where it makes sense. I
suspect someone will start sending patches to enable a generic arm core
and I am going to have a *really* hard time refusing the patches due to
any one silicon provider's binary blob issues.

IMO, the evil-vendor-blob recipes need to start generating packages
which are machine or platform specific and those platforms need to
correctly list those feeds as being compatible, providing a set of
standard things which allow replacement of the core generic architecture
providers.

How does that sound?

Cheers,

Richard





