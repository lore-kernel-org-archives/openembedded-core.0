Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B82270C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:50:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2014 04:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,848,1400050800"; d="scan'208";a="557374294"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.182])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2014 04:50:49 -0700
Date: Tue, 12 Aug 2014 14:50:48 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140812115048.GD30070@lpalcu-linux>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
	<20140725132158.GU2492@jama>
	<CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
	<CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
	<20140725134601.GV2492@jama>
	<CADkTA4P0fQJjmQ_JwrodNSeYrhpjmTQbf=M9EXGOVMoDwoht1g@mail.gmail.com>
	<20140812113305.GG14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140812113305.GG14848@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Tue, 12 Aug 2014 11:50:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Tue, Aug 12, 2014 at 01:33:05PM +0200, Martin Jansa wrote:
> > > Sorry I thought you're maintainer of lttng-*, it seems like Laurentiu is
> > 
> > No worries. I just get caught in the blast when lttng blows up during
> > kernel uprevs, and I fix the wreckage so I can send out my updates :)
> > 
> > If we don't hear from Laurentiu, I can still do the update, so I'll hold it
> > as a separate patch here.
> 
> Ping!
> 
> Someone just sent patch to upgrade lttng-ust, so I've asked him for
> LICENSE fix as well.
It seems I missed your previous email... :/ My apologies.

Regarding lttng* recipes, as of a couple of months ago, RP is the
maintainer:

RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"

laurentiu

