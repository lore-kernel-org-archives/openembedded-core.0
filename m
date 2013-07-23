Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 58B526A464
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 08:20:18 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2013 01:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,725,1367996400"; d="scan'208";a="335422939"
Received: from unknown (HELO helios.localnet) ([10.252.122.115])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 01:20:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 23 Jul 2013 09:20:16 +0100
Message-ID: <6740877.OeitjjUtks@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51EE217A.4040709@dresearch-fe.de>
References: <51ECCF5C.2020505@dresearch-fe.de> <3148065.skdr24gULv@helios>
	<51EE217A.4040709@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Tue, 23 Jul 2013 08:20:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 23 July 2013 08:23:54 Steffen Sledz wrote:
> On 22.07.2013 13:08, Paul Eggleton wrote:
> > On Monday 22 July 2013 12:30:53 Steffen Sledz wrote:
> >> On 22.07.2013 11:51, Paul Eggleton wrote:
> >>> If you want these to increment now AIUI you need to be using the PR
> >>> server:
> >>> 
> >>> https://wiki.yoctoproject.org/wiki/PR_Service
> >> 
> >> This seems to be the thing we need.
> >> 
> >> But the description is not very helpful from the view of a recipe
> >> maintainer. It describes mostly the server part.
> >> 
> >> * What do i have to write in my recipe?
> > 
> > Nothing special. If you used SRCPV in PV where you are using an SCM in
> > SRC_URI, that should be enough. The integer at the start of SRCREV will be
> > incremented automatically if the revision changes, and if it doesn't but
> > other values within the recipe change then PR will automatically be
> > incremented above the initial value set in the recipe.
> > 
> >> * What modifications in bitbake.conf, local.conf, ... are necessary?
> > 
> > I believe as described in the page I linked above you should only need to
> > set PRSERV_HOST.
> 
> You're right. This works. ;-)
> 
> I've two points more:
> * The Wiki-Page mentions the bitbake-prserv-tool. Where can this be found?

Perhaps confusingly it's part of OE-Core. I haven't looked at it to see if 
there's anything OE-specific about it that meant it had to be there rather than 
supplied with bitbake.

> * Does anyone have systemd configs or sysvinit scripts for handling the
> bitbake-prserv?

I don't, but perhaps others do.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

