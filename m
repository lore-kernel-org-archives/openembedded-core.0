Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 07EA772027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 22:51:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2015 14:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,733,1413270000"; d="scan'208";a="635157217"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.248.119])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2015 14:51:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 14:51:37 -0800
Message-Id: <cover.1420843293.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] Patch and Upgrades
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
X-List-Received-Date: Fri, 09 Jan 2015 22:51:57 -0000

Ross, Richard:

Here is another round of updates, these are cleaned up from the 
first batch.

libaio, blktrace and ltp do not build correctly with LSB and the -pie 
and -fpie so that patch is there.

Sau!

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 2d305cab23e64b83ce9a0e0922c24143c4305992
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (5):
  usbutils: Add version 008
  gnu-efi: Upgrade to 3.0.1
  security_flags: disable pie support for libaio, blktrace and ltp
  libaio: Upgrade to 0.3.110
  glibc: Fix up minimal build with libc-libm

 meta/conf/distro/include/security_flags.inc        |    3 +
 .../gnu-efi/gnu-efi/parallel-make.patch            |   22 -
 .../gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb}  |   17 +-
 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch |   41 +
 meta/recipes-bsp/usbutils/usbutils_008.bb          |   28 +
 .../glibc/glibc/eglibc-use-option-groups.patch     | 1379 ++++++++++----------
 meta/recipes-core/glibc/glibc_2.20.bb              |    3 +
 .../recipes-extended/libaio/libaio/00_arches.patch |  208 +--
 .../libaio/libaio/libaio-aarch64.patch             |   28 -
 .../libaio/libaio/libaio_fix_for_mips64.patch      |   68 +-
 .../recipes-extended/libaio/libaio/toolchain.patch |   27 -
 .../{libaio_0.3.109.bb => libaio_0.3.110.bb}       |   11 +-
 12 files changed, 838 insertions(+), 997 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb} (55%)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
 create mode 100644 meta/recipes-bsp/usbutils/usbutils_008.bb
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/toolchain.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.109.bb => libaio_0.3.110.bb} (74%)

-- 
2.1.0


