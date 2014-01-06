Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C786760D2D;
	Mon,  6 Jan 2014 11:22:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2014 03:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,612,1384329600"; d="scan'208";a="434436285"
Received: from unknown (HELO helios.localnet) ([10.252.122.119])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2014 03:22:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 06 Jan 2014 11:22:55 +0000
Message-ID: <1424614.QymdokhKXO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131224105050.GX3706@jama>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org> <20131224105050.GX3706@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Piglit in Poky
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
X-List-Received-Date: Mon, 06 Jan 2014 11:22:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 December 2013 11:50:50 Martin Jansa wrote:
> On Mon, Dec 23, 2013 at 08:09:30PM -0500, Philip Balister wrote:
> > On 12/23/2013 01:01 PM, Burton, Ross wrote:
> > > We'd like to integrate Piglit (an OpenGL test suite) into Poky so that
> > > we can run automated QA on the GL stack.  Piglit is currently residing
> > > in meta-oe, but as Poky is a self-contained project we can't just add
> > > meta-oe to it:  apart from the size of meta-oe, we can't ensure
> > > stability if meta-oe makes incompatible changes that affect Poky.
> > > 
> > > Piglit isn't a stand-alone package, there are the dependencies of
> > > waffle, python-mako and python-numpy to consider too.  There are two
> > > possibilities I can see:
> > > 
> > > 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > > and pushes the boundaries of "core platform".  In a sense this is a
> > > repeat of the discussion we had with Midori...  does oe-core contain
> > > everything needed to sufficiently exercise the core components it
> > > ships or not?
> > 
> > I expect Richard will push back on this, and I would support him here.
> > 
> > > 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> > > meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> > > forbid mixing distribution policy and recipes.  We'd need to sync
> > > meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> > > that's our problem.
> > 
> > So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> > want to include something called meta-yocto-qa just to pick up numpy.
> > 
> > So this presents a quandry. Moving numpy to a special layer to support a
> > specific recipe is just not the right thing to do. Conceivably, we could
> > create a layer for the bits of meta-oe that are python related, but I am
> > not sure that solves your entire problem.
> > 
> > I certainly do not want to see one recipe appear in two layers. That is
> > a recipe for trouble.
> > 
> > Long term, we need to make the layer model work for the entire project
> > and get over the reluctance to use other peoples layers.
> 
> Agreed, meta-python in meta-oe repository sounds a lot better than
> having the same recipe in 2 layers.

FWIW, independent of this issue I'd like to see us have a meta-python layer in 
the meta-openembedded repo anyway. I'll even volunteer to maintain it if it 
helps.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

