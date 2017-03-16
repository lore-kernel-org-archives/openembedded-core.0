Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AD83E60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 16 Mar 2017 02:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="944938461"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2017 02:15:28 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 24E4F2C8001;
	Thu, 16 Mar 2017 02:15:22 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:21 +0200
Message-Id: <cover.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] Remove unused patches, packageconfigs
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:28 -0000

All of the unused patches seem to be unused on purpose (instead of
just being missing from SRC_URI by accident), so have been removed.

Cheers,
 Jussi


The following changes since commit 812fabbd30a062f6e726e6ae0399d87e85bf7fa3:

  bitbake: runqueue: minor typo fix (2017-03-15 17:38:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/obsolete-patches
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/obsolete-patches

Jussi Kukkonen (11):
  qemu: Remove uuid PACKAGECONFIG
  readline: Remove unused patch
  xf86-input-mouse: Remove unused patch
  python3: Remove unused patches
  python: Remove unused patches
  python-native: Remove unused patch
  gcc: Remove unused patch
  opkg-utils: Remove unused patches
  gstreamer1.0-omx: Remove unused patch
  gstreamer1.0-vaapi: Remove unused patch
  kexec-tools: Remove unused patch

 .../readline/files/config-dirent-symbols.patch     |  34 ---
 .../gcc/gcc-6.3/CVE-2016-4490.patch                | 290 ---------------------
 ...e-defined-bindir-and-mandir-as-installati.patch |  30 ---
 ...rnatives-warn-when-multiple-providers-hav.patch |  26 --
 .../avoid_parallel_make_races_on_pgen.patch        |  27 --
 .../python/python/CVE-2016-5636.patch              |  44 ----
 .../python/avoid_parallel_make_races_on_pgen.patch |  27 --
 .../python/python3/CVE-2016-5636.patch             |  44 ----
 .../python/python3/use_packed_importlib.patch      |  31 ---
 meta/recipes-devtools/qemu/qemu.inc                |   3 +-
 .../xorg-driver/xf86-input-mouse/unbreak.patch     |  21 --
 .../kexec/kexec-tools/kexec-x32.patch              |  88 -------
 .../0001-omx-fixed-type-error-in-printf-call.patch |  30 ---
 .../gstreamer1.0-vaapi/install-tests.patch         |  43 ---
 14 files changed, 1 insertion(+), 737 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/config-dirent-symbols.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
 delete mode 100644 meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2016-5636.patch
 delete mode 100644 meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2016-5636.patch
 delete mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch

-- 
2.1.4


