Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0E8a-00055r-Mf
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:29:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2012 07:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="113396298"
Received: from unknown (HELO helios.localnet) ([10.252.123.31])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2012 07:21:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 15:21:25 +0000
Message-ID: <2449634.H5BiXpsY7e@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
MIME-Version: 1.0
Subject: QEMU recipe cleanup
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
X-List-Received-Date: Wed, 22 Feb 2012 15:29:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

I was looking into Yocto bug #2020 today and I noticed we have some "old" QEMU 
recipes kicking around. 0.15.1 is the latest version which AFAIK I've been 
using since it was merged mid-October last year, and it seems to be working 
fine. We also have 0.14.0 and a _git recipe which claims (via manually set PV) 
to be 0.14.0 as well.

Do we need to keep all of these?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


