Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 70FC060F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 15:38:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2013 07:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,878,1378882800"; d="scan'208";a="448998634"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.252])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2013 07:38:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Dec 2013 15:38:40 +0000
Message-ID: <1596746.rPg2Sq2BUj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131212142730.GD3717@jama>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
	<9c7ab89a1f2d3e7d20d7ba51d573482a7adf686c.1386847526.git.paul.eggleton@linux.intel.com>
	<20131212142730.GD3717@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] external-sourcery-toolchain: remove
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
X-List-Received-Date: Thu, 12 Dec 2013 15:38:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 December 2013 15:27:30 Martin Jansa wrote:
> On Thu, Dec 12, 2013 at 11:25:53AM +0000, Paul Eggleton wrote:
> > As per discussion on the mailing list [1], remove this largely
> > unmaintained external toolchain support in favour of the maintained
> > version in meta-sourcery [2].
> > 
> > [1]
> > http://lists.openembedded.org/pipermail/openembedded-core/2013-December/0
> > 87133.html [2] https://github.com/MentorEmbedded/meta-sourcery/
> 
> Can you add links to meta-sourcery and meta-linaro external toolchains
> in oe-core/meta/conf/distro/defaultsetup.conf next to:
>  TCMODE ?= "default"
>  require conf/distro/include/tcmode-${TCMODE}.inc
> or local.conf.sample.extended ?

Ah yes, I hadn't noticed we have some documentation in 
local.conf.sample.extended which definitely needs updating for this. I'll send 
a v2.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

