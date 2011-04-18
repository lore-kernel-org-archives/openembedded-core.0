Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBich-0007dR-9U for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 09:11:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I79S2q009487
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 08:09:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09443-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 08:09:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I79MFF009481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 08:09:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110418065013.GI25122@jama.jama.net>
References: <1303107421.5518.45.camel@rex>
	<20110418065013.GI25122@jama.jama.net>
Date: Mon, 18 Apr 2011 08:09:15 +0100
Message-ID: <1303110555.5518.64.camel@rex>
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
X-List-Received-Date: Mon, 18 Apr 2011 07:11:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 08:50 +0200, Martin Jansa wrote:
> On Mon, Apr 18, 2011 at 07:17:01AM +0100, Richard Purdie wrote:
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
> 
> maybe I've missed something, but
> * Parsing error when ie foo_1.0.bbappend is found, but foo_1.0.bb in
>   upper layer was upgraded to foo_1.1.bb
>
> This can cause big problems when distribution explicitly enables
> something in .bbappend with EXTRA_OECONF, and someone updates all
> layers, builds foo_1.1.bb and installs it on targets before noticing
> that foo_1.0.bbappend wasn't used. Then he has to bump PR after adding
> foo_1.1.bbappend to distro layer (to fix foo on targets), so I would
> prefer parsing error in this case (won't help if upper layer keeps both
> versions foo_1.0.bb and foo_1.1.bb ;/).
> 
> This should be combined with your 2nd point and person who changes
> versioned dependency on upper layer should check that all needed
> .bbappends still apply.

Agreed but I thought we already had a tool to handle at least some of
this though? Certainly integration of that with the above is essential
though.

Cheers,

Richard





