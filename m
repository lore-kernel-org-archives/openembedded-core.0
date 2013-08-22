Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 486FD60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:51:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 05:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,934,1367996400"; d="scan'208";a="366787404"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.241])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2013 05:51:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Aug 2013 13:51:12 +0100
Message-ID: <1466146.RJNtyhCQ4g@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1377166846.428.50.camel@ted>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios> <1377166846.428.50.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 12:51:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 August 2013 11:20:46 Richard Purdie wrote:
> On Thu, 2013-08-22 at 10:07 +0100, Paul Eggleton wrote:
> > On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
> > > Marko Lindqvist (3):
> > >   texinfo: correct dont-depend-on-help2man.patch
> > >   SDL2: add recipe
> > >   boost: fix build when PARALLEL_MAKE is not set
> > > 
> > > Otavio Salvador (1):
> > >   distro_features_check.bbclass: Allow checking of required/conflicting
> > >   
> > >     features
> > 
> > I should have asked this earlier - why does this need to be a separate
> > bbclass? The code doesn't do anything if the variables aren't set, so it
> > can't be because it could have an impact on existing setups that don't
> > set them.
>
> FWIW I do have a worry about the shear weight of the core these days as
> we're building up piles of anonymous python for example. In many ways I
> therefore like the idea of having more classes which get included when
> they're needed.

For something like this though it just increases complexity for users - unlike 
other optional class-supported functionality it's not even clear from the 
variable name that you'll need to inherit the class before they can be used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

