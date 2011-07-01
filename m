Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcXgM-0004F9-09
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:58:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jun 2011 23:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="25080453"
Received: from unknown (HELO swold-MOBL.localdomain) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 23:54:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 23:54:27 -0700
Message-Id: <cover.1309503004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: Updated [PATCH 0/4] SRC_URI Check Updates with Beagleboard updates
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
X-List-Received-Date: Fri, 01 Jul 2011 06:58:31 -0000

Richard,

This address 2 bugs filed by Darren for the Beagleboard, they build
correctly.

It also updates two recipes that Mark Hatle found lacking checksums.

Thanks
	Sau!

The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408:

  uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (4):
  x-load: Update to 1.5.0
  uboot: Update to 2011.06
  mpeg2dec: add SRC_URI Checksum
  libmad: add SRC_URI Checksum

 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 ...kimage_2011.03.bb => u-boot-mkimage_2011.06.bb} |   12 +++++-------
 .../uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} |   10 +++++-----
 meta/recipes-bsp/x-load/x-load_git.bb              |   11 +++++------
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    3 +++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    3 +++
 7 files changed, 21 insertions(+), 18 deletions(-)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage_2011.03.bb => u-boot-mkimage_2011.06.bb} (51%)
 rename meta/recipes-bsp/uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} (74%)

-- 
1.7.3.4



