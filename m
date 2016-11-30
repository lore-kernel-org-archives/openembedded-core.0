Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B3F7871A1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:39:14 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 29 Nov 2016 17:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,719,1473145200"; d="scan'208";a="35683069"
Received: from cloo7-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.199])
	by orsmga004.jf.intel.com with ESMTP; 29 Nov 2016 17:39:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jiajie Hu <jiajie.hu@intel.com>
Date: Wed, 30 Nov 2016 14:39:12 +1300
Message-ID: <9313919.Y4CtTjI68L@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1896562.UY4VSfhxnH@jiajiehu>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
	<4232623.fUgL5pQE4S@peggleto-mobl.ger.corp.intel.com>
	<1896562.UY4VSfhxnH@jiajiehu>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Wed, 30 Nov 2016 01:39:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 30 Nov 2016 09:33:22 Jiajie Hu wrote:
> On Wednesday, November 30, 2016 07:01:30 AM Paul Eggleton wrote:
> > So this in itself looks reasonable in theory, but I have to warn you that
> > when we switch to tinfoil2 [1] these commits are going to be done via the
> > metadata instead, and beyond a possible hack that I'd really rather not
> > think about it's going to be a bit difficult to intercept the
> > prefuncs/postfuncs there. At least they will be executed though since with
> > tinfoil2 we'll be going through a much more standard path to run the
> > tasks.
> >
> > [1] https://wiki.yoctoproject.org/wiki/Tinfoil2
> 
> Glad to know that my fix can be superseded by tinfoil2 APIs. Do you have any
> estimation when the switch will happen?

The target is 2.3 milestone 1, which is in December. However there are still a 
lot of things to be fixed as I've noted on the wiki page I linked.

Thinking about it though it's possible I could split out this particular 
change and get it sent earlier - in fact that may be a good idea anyway. I'll 
look into that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

