Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBjqY-0007VX-GL for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:30:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8Rpad010095
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:27:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10049-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:27:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I8RfGD010089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:27:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201104180933.53561.schnitzeltony@gmx.de>
References: <1303107421.5518.45.camel@rex>
	<201104180933.53561.schnitzeltony@gmx.de>
Date: Mon, 18 Apr 2011 09:27:33 +0100
Message-ID: <1303115253.5518.68.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: Layer tooling brainstorming
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
X-List-Received-Date: Mon, 18 Apr 2011 08:30:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 09:33 +0200, Andreas Mueller wrote:
> On Monday 18 April 2011 08:17:01 Richard Purdie wrote:
> > Layer Tooling for OpenEmbedded
> > ==============================
> > 
> > As we move forward with encouraging the use of metadata layers, a number
> > of issues are appearing which imply the need for either infrastructure
> > improvements to the layer construction, or better tools to handle the
> > layers. The OS TSC discussed layers and layer tooling at the face to
> > face TSC meeting in San Francisco. Some example problems that were
> > identified that currently need addressing in some form are:
> > 
> > * There is no dependency information between layers (layer X depends on
> >   layer Y and Z)
> > * There is no version information present (layer X needs version A of
> >   layer Y)
> > * There is no layer "ABI" version number present in layers
> > * Layer specific sanity checks? (other types of sanity checks on Yocto
> >   1.1 roadmap)
> > * Ability to fetch layers from other repositories
> >   - Multi SCM?
> >   - Use bitbake fetcher?
> > * Ability to generate repositories representing composited layers (Poky,
> >   RP has hacky scripts)
> > * Tool to seperate patch into one for different composited parts
> > * Ability to include partial components of repositories (e.g. only
> >   beagleboard from meta-ti)
> > * Tool to merge (flatten) several layers into one
> > * Able to visualise dependencies between layers
> > * When bitbake prints banner of branch/commit, need to cover all layer
> >   components present
> > * bitbake -e on steroids to highlight differences due to layer changes?
> >   (long term goal)
> > 
> > Implementation thoughts:
> > 
> > * This layer tooling probably belongs at a higher level on the stack
> >   than bitbake itself
> > * Maybe need to split into "bootstrap" steps (e.g where pseduo is
> >   established, layers downloaded etc)
> > * Need some kind of config file defining layer's properties or at least
> >   enhance layer.conf significantly
> > * git submodules and repo should be looked at but due to specific needs
> >   and ability to control tool evolution, likely need own tool.
> > 
> > This hopefully summarises the ideas we discussed in person, we therefore
> > need to start looking at how to move forward from here with this but I
> > wanted to document this for starters!
> > 
> > Cheers,
> > 
> > Richard
> Afraid being killed I didn't dare to ask - but it's getting time to do so: What 
> exactly are layers in OE and what are their advantages?

Layers are the things that have also been called overlays or
collections. If neither of those things mean anything either, they're a
method of separating metadata and customisations into containers.

The concept itself has been around for a long time but we've recently
made enhancements to make it much more useful/usable.

http://www.yoctoproject.org/docs/bsp-guide/bsp-guide.html shows an
example layer.

Cheers,

Richard



