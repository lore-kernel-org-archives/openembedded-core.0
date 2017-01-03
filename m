Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFE73600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315222"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:36 +0000
Message-Id: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/6] poky-tiny improvements
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:29 -0000

This is the first set of patches meant to improve some of the characteristics
of poky-tiny, these patches are from or based on Tom Zanussi's work; includes
a new image recipe to be able to boot poky-tiny from initrd, along with 
changes to be able to create it using bootimg-efi, make it compatible with 
systemd-boot, and scripts to measure size of the image, kernel and modules.

The following changes since commit ce6e0c09723b4894beef32bba02785afdaff868b:

  bitbake: fetch2/wget: fixup case with no useful netrc data (2016-12-21 23:05:25 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/tinymaster2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/tinymaster2

Alejandro Hernandez (1):
  core-image-tiny-initramfs: Fix error message shown after a successful
    initrd boot

Tom Zanussi (5):
  image-live-artifacts: Add support for creating image artifacts only
  core-image-tiny-initramfs: Add and image creating image artifacts only
  ksize.py: Python 3 fixes
  scripts/tiny/ksum.py: New tool
  bootimg-efi: Look for image artifacts in a common location

 meta/classes/image-live-artifacts.bbclass          |  64 ++++++++
 meta/classes/image.bbclass                         |   4 +
 .../images/core-image-tiny-initramfs.bb            |  43 ++++++
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  28 +++-
 scripts/tiny/ksize.py                              |  17 ++-
 scripts/tiny/ksum.py                               | 168 +++++++++++++++++++++
 6 files changed, 313 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/image-live-artifacts.bbclass
 create mode 100644 meta/recipes-core/images/core-image-tiny-initramfs.bb
 create mode 100755 scripts/tiny/ksum.py

-- 
2.6.6


