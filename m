Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeqI6-0000eR-JS
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 17:14:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2011 08:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24977300"
Received: from unknown (HELO helios.localnet) ([10.255.17.202])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2011 08:11:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2011 16:11:03 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1309881139.2410.14.camel@phil-desktop>
	<4E14F23C.5050001@linux.intel.com>
	<1310050317.6337.87.camel@phil-desktop>
In-Reply-To: <1310050317.6337.87.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201107071611.03605.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Thu, 07 Jul 2011 15:14:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 07 July 2011 15:51:54 Phil Blundell wrote:
> On Wed, 2011-07-06 at 16:39 -0700, Saul Wold wrote:
> > I will take a patch that deletes from here and adds it into the
> > meta-extra's layer.
> 
> OK.  What's meta-extra's?  I don't think I'm familiar with that layer.

It's a Yocto layer that has been traditionally the place to preserve obsolete 
stuff that was removed from Poky.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/

(FWIW, just noticed - I still haven't added the machine-specific stuff I removed 
from OE-core to meta-extras yet.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


