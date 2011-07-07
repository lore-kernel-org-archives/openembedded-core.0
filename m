Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qepj3-0007ho-9T
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:38:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 07:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="22652407"
Received: from unknown (HELO helios.localnet) ([10.255.17.202])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 07:34:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2011 15:34:51 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>
	<09ECC867-24F5-4CC7-8312-F00F34897B68@dominion.thruhere.net>
In-Reply-To: <09ECC867-24F5-4CC7-8312-F00F34897B68@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107071534.51372.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Thu, 07 Jul 2011 14:38:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 07 July 2011 15:24:46 Koen Kooi wrote:
> angstrom has been setting it to 2.6.16 for some years now, I forget which
> bug that fixed over 2.6.0

Personally I don't know enough about which crusty old 2.6 kernels people are 
still using out there, so I figured 2.6.0 was the safest bet.

A trawl of the OE history turns up these two:

-----------------------------------
commit 8b0202e6e3f90a772df301e8522f9deb03e50132
Author: Tom Rini <tom_rini@mentor.com>
Date:   Wed Mar 3 12:17:38 2010 -0700

    glibc*.inc: Bump OLDEST_KERNEL to 2.6.16
    
    Per glibc's ChangeLog, 2.6.16 is the minimum required by at least glibc
    2.9 
    Prior to this, it was a murky 2.6.14 + patches to 2.6.16 (when it was all
    upstream).
-----------------------------------
commit 794e8652f5c4fef71a8b9ab834b39f75b99f9420
Author: Koen Kooi <koen@openembedded.org>
Date:   Thu May 21 20:30:37 2009 +0200

    Angstrom 2009.X: set OLDEST_KERNEL to 2.6.16 to avoid problems with 
ppoll()
-----------------------------------

Any further comments/info? Should we be using 2.6.16 in oe-core as well?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


