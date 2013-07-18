Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 733546B1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 11:01:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 04:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,692,1367996400"; d="scan'208";a="347709379"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2013 04:01:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 12:01:57 +0100
Message-ID: <1400703.GdJurTDMZr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAJTo0LbSnT2ejbJCjCBUoxVEhjoCPtKMrzt8NMHFEVYb9LGHYw@mail.gmail.com>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<CAJTo0LbSnT2ejbJCjCBUoxVEhjoCPtKMrzt8NMHFEVYb9LGHYw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 11:01:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 July 2013 11:52:22 Burton, Ross wrote:
> On 18 July 2013 07:34, Saul Wold <sgw@linux.intel.com> wrote:
> >   valgrind: added perl dependency
> 
> I presume the situation here is that a target perl wasn't actually
> built, so adding an explicit runtime dependency causes it to be built
> and therefore available in the feed for rpm to find.
> 
> To me this says that the #!-to-dependency magic from rpmdeps isn't
> really useful, as we then have to go and put explicit dependencies
> back in to ensure the requirements are actually built.

I have to say I too have wondered this. Perhaps these would be better 
implemented as QA warnings (that could be defaulted to errors) rather than 
just silently adding the dependencies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

