Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1CAE65D00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 14:11:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2015 07:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,558,1437462000"; d="scan'208";a="772496496"
Received: from stephe7x-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.17.248])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2015 07:11:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2015 15:11:07 +0100
Message-ID: <1645470.n3OXXfCF9z@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAMKF1sqF2gL_gNTEnXuoVnggoBVJVQePHHS6+gj6JZMvczkvDA@mail.gmail.com>
References: <cover.1442585757.git.paul.eggleton@linux.intel.com>
	<ead9754fdacb95aa9d2f02f5880886d4707f13a7.1442585757.git.paul.eggleton@linux.intel.com>
	<CAMKF1sqF2gL_gNTEnXuoVnggoBVJVQePHHS6+gj6JZMvczkvDA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4: remove already merged patch
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
X-List-Received-Date: Sat, 19 Sep 2015 14:11:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 September 2015 17:55:06 Khem Raj wrote:
> On Fri, Sep 18, 2015 at 7:16 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > This patch was merged into the 4.8.7 release. This was missed on
> > upgrade, and we didn't notice because our quilt-based patch handling
> > code ignores already-applied patches.
> 
> this is a problem. My host quilt fails on me on duplicate patching,
> this should be default otherwise we will accumulate dead code.

I suspect this is the way it's always been unfortunately; not to say it 
shouldn't be fixed though. When I cleaned this up last time I found 5 or 6 
recipes in OE-Core that had already-applied patches. It may be the logic we 
have in patch.bbclass / lib/oe/patch.py that wraps quilt rather than quilt 
itself; other than fixes I've made to the git part, that code is ancient.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

