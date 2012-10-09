Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TLZuT-00023O-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 15:31:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2012 06:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="231702052"
Received: from unknown (HELO helios.localnet) ([10.252.122.38])
	by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2012 06:18:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 09 Oct 2012 14:18:21 +0100
Message-ID: <2358307.KjMcZMityv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <507422A9.9040505@dresearch-fe.de>
References: <507422A9.9040505@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: inc and bb vs. layers
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
X-List-Received-Date: Tue, 09 Oct 2012 13:31:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 October 2012 15:12:09 Steffen Sledz wrote:
> Given to files
> 
>   foo.inc
>   foo.bb (which requires foo.inc)
> 
> in layer Foo. Now i want to write a new
> 
>   bar.bb (which requires foo.inc too)
> 
> in layer Bar. Is this possible without keeping a copy of foo.inc in Bar?

Certainly, you just need to specify the path from the base of the layer where 
the inc file resides in your "require" statement, for example:

require recipes-graphics/xorg-app/xorg-app-common.inc

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


