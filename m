Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E327E75D8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 16:25:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2015 09:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,432,1432623600"; d="scan'208";a="602437083"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 08 Jul 2015 09:25:13 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 08:20:25 +0000
Message-Id: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: matt.fleming@intel.com, ricardo.neri@intel.com
Subject: [PATCH V2 0/2] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Wed, 08 Jul 2015 16:25:21 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two patches include:

    1. Recipe: Including the OVMF recipe (taken from luv-yocto repository) into OE-Core
    2. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT, 
    so the OVMF BIOS can be found.

[YOCTO #5654]

The following changes since commit 0aaa67a790ab211b35eed58173efa115ceb6e243:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:09:28 +0100)

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


