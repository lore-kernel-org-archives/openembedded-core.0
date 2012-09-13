Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TC8c3-0003t0-JQ
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 14:33:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2012 05:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,416,1344236400"; d="scan'208";a="192513201"
Received: from unknown (HELO helios.localnet) ([10.252.121.214])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2012 05:21:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Thu, 13 Sep 2012 13:21:04 +0100
Message-ID: <2145007.czf2bJ2Tzi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347535204-25960-1-git-send-email-ml@communistcode.co.uk>
References: <1347535204-25960-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample: change valgrind support architecture comment
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
X-List-Received-Date: Thu, 13 Sep 2012 12:33:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 September 2012 12:20:04 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> The comment for debug-tools states valgrind will only be installed for x86
> targets. This is not true as valgrind now supports x86*, PPC* and ARMv7a;
> alter the comment to reflect this.

I have to say I think we can just drop this part of the comment entirely given 
how wide the support is now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


