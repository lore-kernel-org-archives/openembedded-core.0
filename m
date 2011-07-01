Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcTZy-0007i6-6O
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 04:35:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2011 19:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="22192821"
Received: from swold-mobl.jf.intel.com ([10.24.82.35])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2011 19:31:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 19:31:46 -0700
Message-Id: <cover.1309487353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] x-load and uboot updates for Beagleboard
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
X-List-Received-Date: Fri, 01 Jul 2011 02:35:38 -0000

Richard,

This address 2 bugs filed by Darren for the Beagleboard, they build
correctly.

Thanks
	Sau!

The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408:

  uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  x-load: Update to 1.5.0
  uboot: Update to 2011.06

 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 ...kimage_2011.03.bb => u-boot-mkimage_2011.06.bb} |   12 +++++-------
 .../uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} |   10 +++++-----
 meta/recipes-bsp/x-load/x-load_git.bb              |   11 +++++------
 5 files changed, 15 insertions(+), 18 deletions(-)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage_2011.03.bb => u-boot-mkimage_2011.06.bb} (51%)
 rename meta/recipes-bsp/uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} (74%)

-- 
1.7.3.4



