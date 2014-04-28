Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD9765EDA;
	Mon, 28 Apr 2014 11:08:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2014 04:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,943,1389772800"; d="scan'208";a="424822880"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.52])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2014 04:08:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 12:08:17 +0100
Message-ID: <3327056.Df3VZKvVg7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <0D39BCEC-9039-4A3F-9E65-85965061E698@dominion.thruhere.net>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
	<0D39BCEC-9039-4A3F-9E65-85965061E698@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: OE Github repositories
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
X-List-Received-Date: Mon, 28 Apr 2014 11:08:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 April 2014 12:43:58 Koen Kooi wrote:
> Op 28 apr. 2014, om 12:10 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > Hi folks,
> > 
> > Could whoever has admin access for the OpenEmbedded repositories on github
> > please do two things:
> > 
> > 1) Stop having both "oe-core" and "openembedded-core" repositories - the
> > latter is four months out-of-date. I'd suggest if we want to be consistent
> > with our openembedded.org repos we should keep the "openembedded-core"
> > repository and make it so it is kept up-to-date.
> > 
> > 2) Rename the "meta-oe" repository to "meta-openembedded", since meta-oe
> > the layer is distinct from meta-openembedded the repository, and again
> > this would be consistent with the primary repository naming.
> 
> Keep in mind that renaming/removing 'oe-core' and 'meta-oe' will breaks
> things which use those repos to pull from by default. Which the oe.org git
> server has improved a lot, it still can't beat githubs CDN.

OK then, how about this instead:

1) Ensure the "openembedded-core" repository is kept up-to-date

2) Add a "meta-openembedded" repository and ensure it is kept up-to-date

3) Add a warning to the description for the contracted name repositories that 
the fully-named repositories should be used instead, so we can eventually drop 
them

4) Change documentation / scripts to match #3

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

