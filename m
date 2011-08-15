Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qsy8p-0001gI-S2
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:27:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2011 07:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; 
   d="scan'208";a="7308644"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Aug 2011 07:23:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 15:23:08 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313417701.14274.581.camel@rex>
In-Reply-To: <1313417701.14274.581.camel@rex>
MIME-Version: 1.0
Message-Id: <201108151523.09022.paul.eggleton@linux.intel.com>
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 14:27:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 15:15:01 Richard Purdie wrote:
> It sounds like its being installed to the right location but that opie
> isn't looking for it in the right place later.
> 
> How does opie know where to look for the file?

Same way it gets installed, it looks for it in ${OPIEDIR}. It's just that the 
second time around if the machine is not the same, ${OPIEDIR} is not the same 
either.

-- 

Paul Eggleton
Intel Open Source Technology Centre


