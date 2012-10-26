Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRjYX-0006FL-Q6
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 15:02:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Oct 2012 05:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="209662276"
Received: from unknown (HELO helios.localnet) ([10.252.122.111])
	by azsmga001.ch.intel.com with ESMTP; 26 Oct 2012 05:49:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk
Date: Fri, 26 Oct 2012 13:49 +0100
Message-ID: <2123894.VsbK2PYknT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <508A83F0.7040603@communistcode.co.uk>
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
	<508A83A4.2040303@communistcode.co.uk>
	<508A83F0.7040603@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 13:02:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 October 2012 13:37:04 Jack Mitchell wrote:
> So you're saying I should do:
> 
> git send-email -3 --no-chain-reply-to --cover-letter --to
> openembedded-core@lists.openembedded.org --subject-prefix=oe][PATCH
> 
> And also remove the '---' from my commit message on patch 1?

I don't use this method myself (for >1 patch I tend to use the create-pull-
request / send-pull-request scripts, but that assumes you have somewhere to 
push a branch); however that looks like it should be the right thing to do. 

> I think [1] should be updated for a few more use cases e.g. multiple
> patches.
> [1] http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Unfortunately like most of the pages on the OE wiki this is out-of-date. 
Richard and I are going to try to set some time aside at ELCE to update the 
wiki or at the very least mark outdated information; hopefully we can convince 
others to join in as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


