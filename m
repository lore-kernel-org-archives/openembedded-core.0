Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0bWm-00041A-IX
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 17:56:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2011 08:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,333,1312182000"; d="scan'208";a="45722267"
Received: from unknown (HELO helios.localnet) ([10.252.120.53])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2011 08:51:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 5 Sep 2011 16:51:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315229054-1859-1-git-send-email-denis@eukrea.com>
	<FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
In-Reply-To: <FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201109051651.01532.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] qt4.inc: remove the optional documentation package from the demo's RRECOMMENDS
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
X-List-Received-Date: Mon, 05 Sep 2011 15:56:04 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 05 September 2011 16:38:42 Koen Kooi wrote:
> Op 5 sep. 2011 om 15:24 heeft Denis Carikli <denis@eukrea.com> het volgende 
geschreven:
> > The documentation is 285M and doesn't fit on the NAND of many machines.
> 
> That does remove all the descriptions from the qtdemo app, so removing all
> docs isn't a good idea

This is what I was afraid of when the discussion came up on IRC. The proper 
solution is to split out the files required for the descriptions to a separate 
package. I don't know which files those are however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


