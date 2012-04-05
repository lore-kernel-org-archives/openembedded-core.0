Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFpY5-0006xo-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:28:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 09:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150031623"
Received: from unknown (HELO helios.localnet) ([10.252.120.33])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2012 09:19:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dexuan Cui <dexuan.cui@intel.com>
Date: Thu, 05 Apr 2012 17:19:22 +0100
Message-ID: <1567550.pQkNRWCquK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <db6ed82ab474a1b521b8f9bcb14abee243ac63a9.1333642153.git.dexuan.cui@intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
	<db6ed82ab474a1b521b8f9bcb14abee243ac63a9.1333642153.git.dexuan.cui@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] xterm: port the recipe from OE and upgrade to v278
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
X-List-Received-Date: Thu, 05 Apr 2012 16:28:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 06 April 2012 00:10:12 Dexuan Cui wrote:
> The recipe is ported from OE:
> http://git.openembedded.org/openembedded/tree/recipes/xorg-app/xterm_266.bb
> 
> I upgraded it from v266 to v278.
> I added LICENSE, LIC_FILES_CHKSUM and updated SRC_URI checksums.

I think it's unfortunate we have to pull in xterm just for the sake of showing 
the qemu output - can we not use matchbox-terminal for this?

If we have to have it, Dexuan can you please compare this to the meta-oe xterm 
recipe as that is likely to be more up-to-date than the one in OE-Classic?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


