Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 91D7F60C16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 12:59:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2013 04:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,573,1384329600"; d="scan'208";a="431689040"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.78])
	by orsmga001.jf.intel.com with ESMTP; 30 Dec 2013 04:59:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 30 Dec 2013 12:59:26 +0000
Message-ID: <5014991.yOqVctVWSl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52C0CDD6.4030904@windriver.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<adab38ead3101f3c88240606dc40ee629cac6f79.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Mon, 30 Dec 2013 12:59:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Monday 30 December 2013 09:35:18 Robert Yang wrote:
> I'm afraid that the standardlinux maybe a little confused with
> linuxstdbase, bu I don't have any better idea about it.

You could be right. I've thought for a long time about renaming this and 
haven't been able to come up with anything better. On the other hand, in our 
current configuration we are actually using the basic/standardlinux 
packagegroup as part of our LSB images; although that might not be the right 
thing to continue doing - LSB probably ought to be independent.

FWIW, let's consider this particular patch as RFC, maybe someone else has a 
better idea of what to name it. I am very much convinced that "basic" is not 
the right name though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

