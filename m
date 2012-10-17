Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOUFI-0002PG-S9
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:05:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Oct 2012 06:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,600,1344236400"; d="scan'208";a="205594051"
Received: from unknown (HELO helios.localnet) ([10.252.122.85])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2012 06:51:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 17 Oct 2012 14:51:54 +0100
Message-ID: <13507481.xhLg1jrNlM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1350481324.3259.185.camel@phil-desktop>
References: <1350481324.3259.185.camel@phil-desktop>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 14:05:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 October 2012 14:42:03 Phil Blundell wrote:
> It's not obvious that libtool's .la files serve any very useful purpose
> on a modern system and they can be positively vexatious under some
> circumstances.  Make installation of this stuff conditional on the new
> "libtool-garbage" flag in DISTRO_FEATURES and backfill it for existing

Could we perhaps have a less inflammatory feature name? Since this is going to 
be set in stone after all...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


