Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rvpa3-0006i2-Lx
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 13:27:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2012 04:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108631836"
Received: from unknown (HELO helios.localnet) ([10.252.122.199])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 04:19:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 12:19:50 +0000
Message-ID: <1443906.UPv3ikXssj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <7113E9EE-BFA2-47CA-94A5-381601F92C7F@dominion.thruhere.net>
References: <4F34729A.3020402@opendreambox.org>
	<7113E9EE-BFA2-47CA-94A5-381601F92C7F@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH/RFC] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 12:27:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 February 2012 09:38:59 Koen Kooi wrote:
> I know you're just moving the error message around, but I would suggest
> changing it to "'x11' not in DISTRO_FEATURES".

You have to be careful with this, as it will pick up partial words e.g. 
assuming we had an "x11test" DISTRO_FEATURE then this would also be picked up 
by this statement; whereas oe.utils.contains() does a split to make it a list 
first and therefore does not have this issue. I'd suggest leaving it as-is, or 
if you really want to change it, do a split on the string first.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


