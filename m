Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QX9zT-0001g9-FU
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 12:40:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jun 2011 03:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,374,1304319600"; d="scan'208";a="13748810"
Received: from unknown (HELO helios.localnet) ([10.255.16.180])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2011 03:36:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Dongxiao Xu <dongxiao.xu@intel.com>
Date: Thu, 16 Jun 2011 11:36:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>
In-Reply-To: <1308216925.25285.4101.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201106161136.13911.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Thu, 16 Jun 2011 10:40:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 16 June 2011 10:35:25 Phil Blundell wrote:
> These changes look like they will have a rather wider impact than just
> the sato image.  I'm not sufficiently au fait with connman to say
> whether this is a good thing or not (although my immediate reaction to
> adding extra RDEPENDS tends to be that it is not), but if they're going
> to be added globally then the checkin comment ought to reflect that and
> explain why it's being done.

Dongxiao, I'm somewhat in agreement in that I don't think we want to force 
ofono to be installed for people who only need connman. Ofono support in 
connman is a plugin, so we should be able to have this as a separate sub-
package and then make only that depend on ofono.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


