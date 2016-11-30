Return-Path: <jiajie.hu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8C46014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:32:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 29 Nov 2016 17:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,719,1473145200"; d="scan'208";a="37025212"
Received: from jiajiehu.sh.intel.com (HELO jiajiehu.localnet)
	([10.239.160.136])
	by orsmga005.jf.intel.com with ESMTP; 29 Nov 2016 17:32:22 -0800
From: Jiajie Hu <jiajie.hu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 30 Nov 2016 09:33:22 +0800
Message-ID: <1896562.UY4VSfhxnH@jiajiehu>
User-Agent: KMail/4.13.3 (Linux/4.4.0-47-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <4232623.fUgL5pQE4S@peggleto-mobl.ger.corp.intel.com>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
	<4232623.fUgL5pQE4S@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Wed, 30 Nov 2016 01:32:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi, Paul

On Wednesday, November 30, 2016 07:01:30 AM Paul Eggleton wrote:
> So this in itself looks reasonable in theory, but I have to warn you that
> when we switch to tinfoil2 [1] these commits are going to be done via the
> metadata instead, and beyond a possible hack that I'd really rather not
> think about it's going to be a bit difficult to intercept the
> prefuncs/postfuncs there. At least they will be executed though since with
> tinfoil2 we'll be going through a much more standard path to run the tasks.
> 
> Cheers,
> Paul
> 
> [1] https://wiki.yoctoproject.org/wiki/Tinfoil2

Glad to know that my fix can be superseded by tinfoil2 APIs. Do you have any 
estimation when the switch will happen?


