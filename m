Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA587391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 04:12:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jul 2015 21:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,477,1432623600"; d="scan'208";a="762725445"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2015 21:12:16 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 20:07:09 +0000
Message-Id: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: leonardo.sandoval.gonzalez@intel.com
Subject: [PATCH V3 0/3] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Wed, 15 Jul 2015 04:12:22 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These patches include:

    1. iasl recipe taken from luv-yocto repository into OE-Core (the only 
       change done was the LICENSE, from Intel-ACPI to BSD | GPLv2)
    2. OVMF recipe (taken from luv-yocto repository) into OE-Core
    3. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT, 
    so the OVMF BIOS can be found.

[YOCTO #5654]

  bitbake: cooker: Improve DATE/TIME handling (2015-07-08 00:06:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/efi-qemux86
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/efi-qemux86

Leonardo Sandoval (3):
  iasl: Recipe taken from the luv-yocto repository
  ovmf: Recipe taken from luv-yocto repository
  runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot

 ...s-Force-tools-variables-to-host-toolchain.patch | 48 +++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 | 61 ++++++++++++++++++++++
 meta/recipes-extended/iasl/iasl_20150515.bb        | 27 ++++++++++
 scripts/runqemu                                    | 13 ++++-
 4 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb

-- 
1.8.4.5


