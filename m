Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 802F665FD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 16:23:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2014 09:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,868,1392192000"; d="scan'208";a="541549787"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.101])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2014 09:23:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 09:23:17 -0700
Message-Id: <cover.1400516243.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 0/9] Misc Patches
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
X-List-Received-Date: Mon, 19 May 2014 16:23:40 -0000


The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (3):
  udev-extraconf: fix the misuse of /run/media
  init-live.sh: list block devices correctly
  initrdscripts: fix for /run/media

Chong Lu (1):
  syslinux-native: fix parallel building issue

Cristiana Voicu (1):
  packagegroup-core-lsb: fix warning text

Koen Kooi (1):
  curl: work around RRECOMMENDS problems in -native* recipes

Martin Jansa (1):
  lttng-modules: Fix build with older kernels

Ross Burton (1):
  pango: enable ptest

Saul Wold (1):
  libusb1: disable floating dependency on udev

 .../initrdscripts/files/init-install-efi-testfs.sh |  14 +-
 .../initrdscripts/files/init-install-efi.sh        |  14 +-
 .../initrdscripts/files/init-install-testfs.sh     |   4 +-
 .../initrdscripts/files/init-install.sh            |   4 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |  20 +--
 meta/recipes-core/udev/udev-extraconf/mount.sh     |   2 +-
 .../syslinux-fix-parallel-building-issue.patch     |  38 +++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |   3 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   6 +-
 meta/recipes-graphics/pango/pango.inc              |  21 ++-
 meta/recipes-graphics/pango/pango/no-tests.patch   |  15 --
 meta/recipes-graphics/pango/pango/run-ptest        |   3 +
 meta/recipes-graphics/pango/pango_1.36.3.bb        |   2 +-
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 +++++++++++++++++++++
 .../lttng/lttng-modules/fixup_block_driver.patch   | 122 ----------------
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   2 +-
 meta/recipes-support/curl/curl_7.36.0.bb           |   7 +-
 .../libusb/libusb1/obsolete_automake_macros.patch  |  15 --
 meta/recipes-support/libusb/libusb1_1.0.18.bb      |   4 +-
 19 files changed, 260 insertions(+), 192 deletions(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch
 delete mode 100644 meta/recipes-graphics/pango/pango/no-tests.patch
 create mode 100644 meta/recipes-graphics/pango/pango/run-ptest
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
 delete mode 100644 meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch

-- 
1.8.3.1


