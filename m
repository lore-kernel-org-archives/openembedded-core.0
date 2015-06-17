Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1C965C63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:47:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2015 07:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,633,1427785200"; d="scan'208";a="745181139"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2015 07:47:30 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 06:43:09 +0000
Message-Id: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: matt.fleming@intel.com, ricardo.neri@intel.com
Subject: [PATCH 0/2] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Wed, 17 Jun 2015 14:47:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two patches include:

    1. Recipe: Including the OVMF recipe (taken from luv-yocto repository) on Poky
    2. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT, 
    so the OVMF BIOS can be found.

[YOCTO #5654]

The following changes since commit 062678c4ab88fa94ed38efa6520c3b4e2d88ca73:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/efi-qemux86
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/efi-qemux86

Leonardo Sandoval (2):
  ovmf: Recipe taken from luv-yocto repository
  runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot

 ...s-Force-tools-variables-to-host-toolchain.patch | 50 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 | 61 ++++++++++++++++++++++
 scripts/runqemu                                    | 13 ++++-
 3 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb

-- 
1.8.4.5


