Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYIj7-0004qT-AZ
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 15:44:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Dec 2011 06:37:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="83883811"
Received: from unknown (HELO helios.localnet) ([10.252.122.2])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2011 06:37:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ulf@emagii.com
Date: Wed, 07 Dec 2011 14:37:14 +0000
Message-ID: <3741284.XQAanrv0Ii@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EDF788E.60804@emagii.com>
References: <4EDF2360.7090402@emagii.com>
	<E5CF0974-DCA6-4DAA-859C-ED40990CC11E@dominion.thruhere.net>
	<4EDF788E.60804@emagii.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Possible stale tags in the download directory
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
X-List-Received-Date: Wed, 07 Dec 2011 14:44:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 December 2011 15:30:38 Ulf Samuelsson wrote:
> Richard says that if the *.done file is there, then the checksum is not
> calculated.
> Or that is at least how I interpret his comment.
> 
> If the check is always there, why the tag?

That's not what my reading of the bitbake source says. 
bitbake/lib/bb/fetch2/__init__.py contains the only references to .done files 
and all it does is make sure the done file gets "touched" whenever a fetch for 
the associated file occurs; it does not otherwise check for its existence.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


