Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rfqhp-00064r-4O
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 11:25:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 02:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90178777"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 02:18:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 10:18:40 +0000
Message-ID: <2295923.3R0Nmqr59V@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
MIME-Version: 1.0
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Garg Vakul-B16394 <B16394@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 28 Dec 2011 10:25:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 10:01:13 Luo Zhenhua-B19537 wrote:
> May I know what's the concern with eglibc instead of uclibc?

So my concern is, if you add a runtime dependency on eglibc-dbg to valgrind 
and you've selected uclibc instead, it will force installation of eglibc when 
you install valgrind (not to mention building it when you build valgrind); 
this is almost certainly not what you want.

If a dependency on the libc debug packages is really needed you could do 
something this instead:

RRECOMMENDS_${PN} += "${TCLIBC}-dbg"

(I suggest using RRECOMMENDS here rather than RDEPENDS in case here is no such 
debug package for the user's selected libc.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


