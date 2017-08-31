Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BCF2071A8E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 21:01:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 31 Aug 2017 14:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,455,1498546800"; d="scan'208";a="1168051448"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga001.jf.intel.com with ESMTP; 31 Aug 2017 14:01:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 01 Sep 2017 09:01:53 +1200
Message-ID: <2289008.Qv25xzknfF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LbvOwwFh1MGthT36jcJaJZKpuD6aszR5oUtKfFvbwnXFg@mail.gmail.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
	<b13dbb2dbe5e7582386cef8450529134075c1aa7.1504137086.git.paul.eggleton@linux.intel.com>
	<CAJTo0LbvOwwFh1MGthT36jcJaJZKpuD6aszR5oUtKfFvbwnXFg@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] devtool: upgrade: check that user has configured git properly
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
X-List-Received-Date: Thu, 31 Aug 2017 21:01:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 1 September 2017 1:29:38 AM NZST Burton, Ross wrote:
> On 31 August 2017 at 00:54, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> 
> > From: paul <paul@peggleto-mobl.ger.corp.intel.com>
> >
> > If user.name or user.email haven't been set then git rebase can't really
> > work properly. Check that the user has set these and error out if not.
> > (Elsewhere we are relying on OE's git patch functionality which forces
> > a dummy OE value - that's OK there as it's completely under OE's control
> > and therefore it's OK for a dummy OE user to be the committer, but here
> > the rebase may require intervention so it's reasonable to have the
> > user's actual name and email on the operation.)
> >
> 
> The irony is strong in this one.
> 
> (I'll fixup when merging)

Shoot. Of course I committed the change just after I'd cleared out the 
settings to test the darn thing ;)

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

