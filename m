Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RfpiM-0003sM-Pp
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 10:22:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2011 01:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106621840"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2011 01:14:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 09:14:55 +0000
Message-ID: <8285067.9cfZeAKmYZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1325055308-17731-1-git-send-email-b19537@freescale.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 28 Dec 2011 09:22:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 14:55:08 b19537@freescale.com wrote:
> +RDEPENDS += "eglibc-dbg"

So I might be completely off-base here having never tried it, but what if 
you're using uclibc?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


