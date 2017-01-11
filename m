Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6920A71A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758372"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:17 +0000
Message-Id: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2 0/7] poky-tiny improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 19:58:23 -0000

This is the first set of patches meant to improve some of the characteristics
of poky-tiny, these patches are from or based on Tom Zanussi's work; includes
a new image recipe to be able to boot poky-tiny from initrd, along with 
changes to be able to create it using bootimg-efi, make it compatible with 
systemd-boot, and scripts to measure size of the image, kernel and modules.


The following changes since commit 7d5dec1b1f3d1580e10bf4f92ef4aac4edb5ee77:

  gummiboot: Remove old gummiboot recipe, related class and wks  file (2017-01-11 19:45:41 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/tinymaster3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/tinymaster3

Alejandro Hernandez (3):
  image-.bbclass: standarize usage of DEPLOY_DIR_IMAGE
  core-image-tiny-initramfs: Fix error message shown after a successful
    initrd boot
  systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation

Tom Zanussi (4):
  image-live-artifacts: Add support for creating image artifacts only
  wic: Look for image artifacts in a common location
  core-image-tiny-initramfs: Add and image creating image artifacts only
  tiny scripts improvements: python3 fixes and new tool ksum

 meta/classes/image-live-artifacts.bbclass          |  40 +++++
 meta/classes/image-live.bbclass                    |  18 +--
 meta/classes/image-vm.bbclass                      |  12 +-
 meta/classes/image.bbclass                         |   3 +
 meta/classes/image_types.bbclass                   |   4 +-
 meta/classes/systemd-boot.bbclass                  |   3 +
 meta/lib/oeqa/selftest/wic.py                      |   2 +-
 .../images/core-image-tiny-initramfs.bb            |  42 ++++++
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  28 +++-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  21 ++-
 scripts/tiny/ksize.py                              |  17 ++-
 scripts/tiny/ksum.py                               | 168 +++++++++++++++++++++
 12 files changed, 323 insertions(+), 35 deletions(-)
 create mode 100644 meta/classes/image-live-artifacts.bbclass
 create mode 100644 meta/recipes-core/images/core-image-tiny-initramfs.bb
 create mode 100755 scripts/tiny/ksum.py

-- 
2.6.6


