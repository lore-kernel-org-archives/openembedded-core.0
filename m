Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 35047615F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:20:56 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 01:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,845,1371106800"; d="scan'208";a="291077508"
Received: from unknown (HELO helios.localnet) ([10.252.123.106])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Sep 2013 01:20:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 05 Sep 2013 09:20:55 +0100
Message-ID: <3107150.CumXHZvvrO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130905080407.GH11500@jama>
References: <1497435.xtb1AxO9Wj@helios> <20130905080407.GH11500@jama>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] OpenEmbedded Layer Index updated
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
X-List-Received-Date: Thu, 05 Sep 2013 08:20:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Thursday 05 September 2013 10:04:07 Martin Jansa wrote:
> On Thu, Sep 05, 2013 at 01:10:47AM +0100, Paul Eggleton wrote:
> > As always, feedback is welcome.
> 
> Great job!
> 
> One more suggestion (maybe I've overlooked it):
> 
> It would be nice to be able to search recipe across all branches
> (including oe-classic)
> 
> e.g. if someone asks me to include ace in our builds I would like to
> just search for ace, like:
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ace
> 
> and find it's not in master/dylan/danny, but that it still is in
> oe-classic
> http://layers.openembedded.org/layerindex/oe-classic/recipe/13881/
> 
> Now I have to run the same search in 2-4 different branches to be sure
> there isn't recipe for ace already.
> 
> In many cases we can assume that if something isn't in master then it
> isn't in danny/dylan, but that's not true for e.g. mysql5 which should
> correctly show availability in oe-classic/danny/dylan (and master has
> mariadb).

Right, this would be the next step. I think we'd have to be careful about how 
we present search results from other branches / OE-Classic (so it's clear what 
is being shown) but now we actually have the data it's certainly technically 
possible. I'll be continuing to work on this application as my spare time 
allows.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

