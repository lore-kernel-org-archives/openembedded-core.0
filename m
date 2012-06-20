Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ShKDb-0004sF-NH
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:41:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jun 2012 05:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155982830"
Received: from unknown (HELO helios.localnet) ([10.252.120.176])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2012 05:30:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 13:30:19 +0100
Message-ID: <1715738.BjBOBnumCa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1340195059.14857.198.camel@phil-desktop>
References: <alpine.DEB.2.02.1206200807090.4904@oneiric>
	<1340195059.14857.198.camel@phil-desktop>
MIME-Version: 1.0
Subject: Re: oddities related to "_append" and "_prepend" in oe-core
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
X-List-Received-Date: Wed, 20 Jun 2012 12:41:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 June 2012 13:24:13 Phil Blundell wrote:
> > meta/conf/bitbake.conf:DISTRO_FEATURES_append =
> > "${@oe.utils.distro_features_backfill(d)}"
>
> That one is probably ok.

FYI I designed that not to change DISTRO_FEATURES at all if there was nothing 
to add - oe.utils.distro_features_backfill() adds a leading space itself if it 
returns any items, so an explicit space is not needed or desirable in this 
instance.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


