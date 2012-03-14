Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7jmF-0004VB-B0
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:41:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 01:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120850270"
Received: from unknown (HELO helios.localnet) ([10.252.123.159])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 01:33:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 14 Mar 2012 08:32:58 +0000
Message-ID: <5205752.2zb4P1afWQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <512FF648-8A82-4307-BEB7-0EC1A8FD15A7@dominion.thruhere.net>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<9583d660052617740b61feeb6739263f06e5a64f.1331685330.git.paul.eggleton@linux.intel.com>
	<512FF648-8A82-4307-BEB7-0EC1A8FD15A7@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 08:41:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 09:21:06 Koen Kooi wrote:
> Op 14 mrt. 2012, om 01:36 heeft Paul Eggleton het volgende geschreven:
> > The kernel configuration requires lzma to compress the kernel image
> > (CONFIG_KERNEL_LZMA=y), so add a dependency on xz-native which provides
> > it.
> 
> Have a look at
> https://github.com/Angstrom-distribution/meta-ti/commit/b72cb13fcf83b9d3428
> 08ea30379bfb6a1321b54 :)

Right, I thought about that already - but we do not (by default) use defconfigs 
with linux-yocto*, so you'd have to go through all config fragments with this 
check. I figured it probably wasn't worth the effort in this case.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


