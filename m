Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T1Hcr-00050h-6M
	for openembedded-core@lists.linuxtogo.org;
	Tue, 14 Aug 2012 15:57:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 06:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208191220"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 06:45:43 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:50:25 +0300
Message-Id: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Tue, 14 Aug 2012 13:57:41 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato-sdk. Beware that the libxrandr package upgrade
must be applied after applying the randrproto package upgrade.

Constantin Musca (3):
  pciutils: upgrade to 3.1.10
  randrproto: upgrade to 1.4.0
  libxrandr: upgrade to 1.4.0

 .../configure.patch                                |    0
 .../guess-fix.patch                                |    0
 .../lib-build-fix.patch                            |    0
 .../makefile.patch                                 |    0
 .../pcimodules-pciutils.diff                       |    0
 .../{pciutils_3.1.9.bb => pciutils_3.1.10.bb}      |    4 ++--
 .../{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb}     |    6 +++---
 .../{randrproto_1.3.2.bb => randrproto_1.4.0.bb}   |    8 ++++----
 8 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/configure.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/makefile.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/pcimodules-pciutils.diff (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.1.9.bb => pciutils_3.1.10.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb} (72%)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.3.2.bb => randrproto_1.4.0.bb} (68%)

-- 
1.7.9.5



