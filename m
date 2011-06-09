Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QUhGJ-0002aI-1K
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:35:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jun 2011 08:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="10051783"
Received: from unknown (HELO helios.localnet) ([10.255.13.6])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2011 08:31:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 9 Jun 2011 16:31:48 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
In-Reply-To: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106091631.48506.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 15:35:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 09 June 2011 16:15:49 Koen Kooi wrote:
> I ran bitbake layers on a stock angstrom setup and it reported a lot of
> 'broken' bbappends:

I've recently submitted a patch to bitbake-devel which fixes bitbake-layers' 
handling of skipped recipes so that it doesn't report them as missing. I don't 
think skipped recipes can account for that entire list however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


