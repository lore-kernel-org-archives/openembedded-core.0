Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QBj3s-0008Qd-7N
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 09:39:57 +0200
Received: (qmail invoked by alias); 18 Apr 2011 07:37:35 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp025) with SMTP; 18 Apr 2011 09:37:35 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19ansB0agpasq3IDEebQnBD6gYf46WlpJkqp/STK2
	BPC4QvIgZEDPI9
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2011 09:33:53 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1303107421.5518.45.camel@rex>
In-Reply-To: <1303107421.5518.45.camel@rex>
MIME-Version: 1.0
Message-Id: <201104180933.53561.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Mon, 18 Apr 2011 07:39:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 18 April 2011 08:17:01 Richard Purdie wrote:
> Layer Tooling for OpenEmbedded
> ==============================
> 
> As we move forward with encouraging the use of metadata layers, a number
> of issues are appearing which imply the need for either infrastructure
> improvements to the layer construction, or better tools to handle the
> layers. The OS TSC discussed layers and layer tooling at the face to
> face TSC meeting in San Francisco. Some example problems that were
> identified that currently need addressing in some form are:
> 
> * There is no dependency information between layers (layer X depends on
>   layer Y and Z)
> * There is no version information present (layer X needs version A of
>   layer Y)
> * There is no layer "ABI" version number present in layers
> * Layer specific sanity checks? (other types of sanity checks on Yocto
>   1.1 roadmap)
> * Ability to fetch layers from other repositories
>   - Multi SCM?
>   - Use bitbake fetcher?
> * Ability to generate repositories representing composited layers (Poky,
>   RP has hacky scripts)
> * Tool to seperate patch into one for different composited parts
> * Ability to include partial components of repositories (e.g. only
>   beagleboard from meta-ti)
> * Tool to merge (flatten) several layers into one
> * Able to visualise dependencies between layers
> * When bitbake prints banner of branch/commit, need to cover all layer
>   components present
> * bitbake -e on steroids to highlight differences due to layer changes?
>   (long term goal)
> 
> Implementation thoughts:
> 
> * This layer tooling probably belongs at a higher level on the stack
>   than bitbake itself
> * Maybe need to split into "bootstrap" steps (e.g where pseduo is
>   established, layers downloaded etc)
> * Need some kind of config file defining layer's properties or at least
>   enhance layer.conf significantly
> * git submodules and repo should be looked at but due to specific needs
>   and ability to control tool evolution, likely need own tool.
> 
> This hopefully summarises the ideas we discussed in person, we therefore
> need to start looking at how to move forward from here with this but I
> wanted to document this for starters!
> 
> Cheers,
> 
> Richard
Afraid being killed I didn't dare to ask - but it's getting time to do so: What 
exactly are layers in OE and what are their advantages?

Andreas


