Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QpKu2-0006BN-65
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 15:57:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 06:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34889719"
Received: from unknown (HELO helios.localnet) ([10.255.18.72])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 06:53:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 5 Aug 2011 14:53:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <201108040011.52049.schnitzeltony@gmx.de>
	<1808891.sPgEKESHSy@perseus>
In-Reply-To: <1808891.sPgEKESHSy@perseus>
MIME-Version: 1.0
Message-Id: <201108051453.01254.paul.eggleton@linux.intel.com>
Subject: Re: Howto pin u-boot to a version supplied by oe-core
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
X-List-Received-Date: Fri, 05 Aug 2011 13:57:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 04 August 2011 02:34:17 Khem Raj wrote:
> in anycase what you need to lock is PV and the recipes in oe-core has
> 
> u-boot_2011.03.bb:PV = "v2011.03+git${SRCPV}"
> u-boot_2011.06.bb:PV = "v2011.06+git${SRCPV}"
> 
> So what you need is
> 
> PREFERRED_VERSION_pn-u-boot = "v2011.03+git%"

Hmm, I wonder if the message could be changed to be more helpful for the cases 
where the recipe grabs source from some SCM. I have to admit I did not 
consider this case when writing the PREFERRED_VERSION message change.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


