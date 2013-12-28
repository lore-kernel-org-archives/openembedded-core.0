Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 80BA260D03;
	Sat, 28 Dec 2013 11:48:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Dec 2013 03:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,566,1384329600"; d="scan'208";a="458726844"
Received: from acdivito-mobl.gar.corp.intel.com (HELO helios.localnet)
	([10.252.122.61])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2013 03:48:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 Dec 2013 11:48:47 +0000
Message-ID: <1801103.RjHpRo2rCi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <l9c5ar$2mb$1@ger.gmane.org>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<l9c5ar$2mb$1@ger.gmane.org>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Piglit in Poky
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 11:48:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Koen,

On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
> Burton, Ross schreef op 23-12-13 19:01:
> > We'd like to integrate Piglit (an OpenGL test suite) into Poky so that we
> > can run automated QA on the GL stack.  Piglit is currently residing in
> > meta-oe, but as Poky is a self-contained project we can't just add
> > meta-oe to it:  apart from the size of meta-oe, we can't ensure stability
> > if meta-oe makes incompatible changes that affect Poky.
> > 
> > Piglit isn't a stand-alone package, there are the dependencies of waffle,
> > python-mako and python-numpy to consider too.  There are two
> > possibilities I can see:
> > 
> > 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only and
> > pushes the boundaries of "core platform".  In a sense this is a repeat of
> > the discussion we had with Midori...  does oe-core contain everything
> > needed to sufficiently exercise the core components it ships or not?
> > 
> > 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> > meta-yocto-qa (or similar) because the Yocto Compatible guidelines forbid
> > mixing distribution policy and recipes.
> 
> Speaking of layers, can you *please* rename meta-yocto to meta-poky? It's
> what it's actually is and would remove a lot of confusion when trying to
> explain that yocto is not a distro, even if the distro layer is called
> 'meta-yocto'.

This is a tangent, but a couple of points:

1) This rename would not come for free. We'd need to update people's existing 
bblayers.conf files on the fly, as we did when meta-yocto-bsp was split out of 
meta-yocto, and thus bump LCONF_VERSION; however, doing this only in poky has 
resulted in annoying problems when users remove poky from their configurations 
(since LCONF_VERSION is out-of-step between Poky and OE-Core, leading to 
confusing errors in this situation). Thus I think we'd want to solve this once 
and for all by bumping the value in OE-Core as well as Poky.

2) If you propose this rename, perhaps you will also consider renaming 
meta-oe, since that name within a similarly named meta-openembedded repository 
leads to a similar level of confusion...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

