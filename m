Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TXei9-0001BB-HN
	for openembedded-core@lists.linuxtogo.org;
	Sun, 11 Nov 2012 22:04:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2012 12:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,758,1344236400"; d="scan'208";a="217999135"
Received: from unknown (HELO helios.localnet) ([10.252.122.192])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2012 12:49:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Nov 2012 20:49:56 +0000
Message-ID: <4701269.Boc8pSq2zM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121111201613.GB3407@jama.jama.net>
References: <12301427.Yf0uchSh3U@helios> <2026428.K88ggMmWnu@helios>
	<20121111201613.GB3407@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.linuxtogo.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Sun, 11 Nov 2012 21:04:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 11 November 2012 21:16:13 Martin Jansa wrote:
> On Sun, Nov 11, 2012 at 07:58:09PM +0000, Paul Eggleton wrote:
> > On Sunday 11 November 2012 20:52:26 Martin Jansa wrote:
> > > I've noticed quite a few recipes listed here, which does exist in some
> > > layer (recipes mostly from meta-fso, meta-aurora, meta-shr), should I
> > > remove them from that wiki page or add layer name in 2nd column?
> > 
> > I did have all the layers in meta-smartphone included in the list I used
> > to
> > filter this one, so if there are items that somehow didn't get removed I'd
> > like to figure out why. Can you list them here so I can look into that?
>
> Ah sorry, you're probably right
> 
> I've noticed e.g this:
> libfsobasics	[distro]
> libfsoresource	[distro]
> libfsosystem	[distro]
> libfsotransport	[distro]
> but those are now provided by single libfsoframework recipe and I've
> forgot this change
> https://github.com/shr-distribution/meta-smartphone/commit/0298befc97dc5dca2
> a3721fb0ff9d4caf8d24f84
> 
> So I'll just update [distro] flag to something like obsoleted by
> libfsoframework.

Ah ok, sounds good.

> The rest is probably also not 1:1 like qfsodbusxml2cpp-native
> ./meta-fso/recipes-freesmartphone/freesmartphone/qfsodbusxml2cpp_git.bb
> 
> Maybe you can try to update scripts to show matches after "-native"
> suffix strip?

I'd prefer to handle this manually - there are cases when newer recipes 
haven't been BBCLASSEXTENDed to handle -native so I've been checking this by 
hand.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


