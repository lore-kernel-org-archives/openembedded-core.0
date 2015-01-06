Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B754D601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183805"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:10 -0800
Message-Id: <cover.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 00/12] Package Updates
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ross, Richard:

Here is another set up updates, built and tested on both Autobuilder and locally. 
This address the issues with libgpg-error for fsl also.

Sau!


The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 5149fba599906379ad08516e540c8b3e6f467e2f
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

André Draszik (1):
  openssl: fix hard paths in native openssl

Saul Wold (11):
  usbutils: Add version 008
  gnupg: Upgrade to 2.1.0
  syslinux: Update to 6.0.3
  gnu-efi: Upgrade to 3.0w
  json-c: Upgrade to 0.12
  lsbinitscripts: Upgrade to 9.60
  libffi: Upgrade to 3.2.1
  libassuan: Upgrade to 2.2.0
  libksba: Upgrade to 1.3.2
  liburcu: Upgrade to 0.8.6
  libgpg-error: Update to 1.17

 .../gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0w.bb}   |   1 +
 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch |  41 ++
 meta/recipes-bsp/usbutils/usbutils_008.bb          |  35 ++
 meta/recipes-connectivity/openssl/openssl.inc      |   9 +-
 .../json-c/{json-c_0.11.bb => json-c_0.12.bb}      |   6 +-
 ...dd-SMT_TERMINAL-a-last-resort-region-type.patch |  50 ---
 ...an-build-a-linked-list-of-memory-scanners.patch | 450 ---------------------
 .../0003-PXELINUX-Add-bios-memscan-function.patch  |  87 ----
 ...s_fbm-and-real_base_mem-to-calculate-free.patch |  65 ---
 .../isohybrid-fix-overflow-on-32-bit-system.patch  |  40 --
 .../syslinux-fix-parallel-building-issue.patch     |  17 +-
 .../syslinux-libupload-depend-lib.patch            |   0
 .../syslinux/syslinux-remove-clean-script.patch    |  17 +
 .../{syslinux_6.01.bb => syslinux_6.03.bb}         |  12 +-
 ...nitscripts_9.56.1.bb => lsbinitscripts_9.60.bb} |   6 +-
 .../libffi/{libffi_3.1.bb => libffi_3.2.1.bb}      |   4 +-
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |  16 +
 meta/recipes-support/gnupg/gnupg/pkgconfig.patch   |  24 +-
 .../use-pkgconfig-instead-of-npth-config.patch     |  72 ++++
 .../gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb}      |  16 +-
 .../{libassuan_2.1.2.bb => libassuan_2.2.0.bb}     |   4 +-
 .../pkgconfig.patch                                |  67 +--
 .../{libgpg-error_1.12.bb => libgpg-error_1.17.bb} |  35 +-
 .../libksba/{libksba_1.3.1.bb => libksba_1.3.2.bb} |   4 +-
 .../liburcu/{files => liburcu}/aarch64.patch       |   0
 .../liburcu/{liburcu_0.8.5.bb => liburcu_0.8.6.bb} |   4 +-
 26 files changed, 311 insertions(+), 771 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0w.bb} (99%)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
 create mode 100644 meta/recipes-bsp/usbutils/usbutils_008.bb
 rename meta/recipes-devtools/json-c/{json-c_0.11.bb => json-c_0.12.bb} (75%)
 delete mode 100644 meta/recipes-devtools/syslinux/files/0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0002-memscan-build-a-linked-list-of-memory-scanners.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0003-PXELINUX-Add-bios-memscan-function.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/isohybrid-fix-overflow-on-32-bit-system.patch
 rename meta/recipes-devtools/syslinux/{files => syslinux}/syslinux-fix-parallel-building-issue.patch (75%)
 rename meta/recipes-devtools/syslinux/{files => syslinux}/syslinux-libupload-depend-lib.patch (100%)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
 rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.03.bb} (84%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.56.1.bb => lsbinitscripts_9.60.bb} (78%)
 rename meta/recipes-gnome/libffi/{libffi_3.1.bb => libffi_3.2.1.bb} (88%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb} (70%)
 rename meta/recipes-support/libassuan/{libassuan_2.1.2.bb => libassuan_2.2.0.bb} (86%)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.12 => libgpg-error}/pkgconfig.patch (70%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.12.bb => libgpg-error_1.17.bb} (40%)
 rename meta/recipes-support/libksba/{libksba_1.3.1.bb => libksba_1.3.2.bb} (86%)
 rename meta/recipes-support/liburcu/{files => liburcu}/aarch64.patch (100%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.5.bb => liburcu_0.8.6.bb} (83%)

-- 
2.1.0


