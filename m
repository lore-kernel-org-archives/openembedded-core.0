Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6532E73193
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739816"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:37 +0200
Message-Id: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 00/17] Recipe version updates
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:20 -0000

Here's another bunch of version updates; this time everything that is assigned
to me has been updated (except the webkit/epiphany related recipes which will
be handled separately). I also updated recipes that don't have a listed maintainer.

The following changes since commit 6544bed72142c9ff07b55f41d66e137b1b453f7b:

  valgrind: update to 3.11.0 (2015-12-16 15:14:27 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (17):
  cryptodev: update to 1.8
  gptfdisk: update to 1.0.1
  ifupdown: update to 0.8.2
  pytnon-pexpect: update to 4.0.1
  python3-pip: update to 7.1.2
  trace-cmd: update to 2.6
  liburcu: update to 0.9.1
  msmtp: update to 1.6.3
  libassuan: update to 2.4.2
  tiff: update to 4.0.6
  lighttpd: update to 1.4.38
  kexec-tools: update to 2.0.11
  nss: update to 3.21
  iso-codes: update to 3.63
  btrfs-tools: update to 4.3.1
  icu: fix upstream version check
  mobile-broadband-provider-info: update to tagged release 20151214

 .../mobile-broadband-provider-info_git.bb          |   4 +-
 .../{ifupdown_0.7.48.1.bb => ifupdown_0.8.2.bb}    |   9 +-
 .../{btrfs-tools_4.1.2.bb => btrfs-tools_4.3.1.bb} |   2 +-
 .../fdisk/{gptfdisk_1.0.0.bb => gptfdisk_1.0.1.bb} |   4 +-
 ...thon-pexpect_3.3.bb => python-pexpect_4.0.1.bb} |   6 +-
 .../{python3-pip_6.1.1.bb => python3-pip_7.1.2.bb} |   4 +-
 .../{lighttpd_1.4.36.bb => lighttpd_1.4.38.bb}     |   4 +-
 .../msmtp/{msmtp_1.6.2.bb => msmtp_1.6.3.bb}       |   4 +-
 ...yptodev-linux_1.7.bb => cryptodev-linux_1.8.bb} |   2 +-
 ...todev-module_1.7.bb => cryptodev-module_1.8.bb} |   3 +-
 ...yptodev-tests_1.7.bb => cryptodev-tests_1.8.bb} |   3 +-
 .../cryptodev/{cryptodev_1.7.inc => cryptodev.inc} |   4 +-
 .../files/0001-ioctl.c-Fix-build-on-3.19.patch     |  29 ----
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch |  29 ----
 ...kexec-tools_2.0.10.bb => kexec-tools_2.0.11.bb} |   4 +-
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        |   6 +-
 .../libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb}       |   4 +-
 meta/recipes-support/icu/icu_56.1.bb               |   2 +
 .../{iso-codes_3.58.bb => iso-codes_3.63.bb}       |   4 +-
 .../{libassuan_2.2.1.bb => libassuan_2.4.2.bb}     |   4 +-
 ...cify-complete-types-for-atomic-function-c.patch | 158 ---------------------
 ...evert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch |  47 ------
 meta/recipes-support/liburcu/liburcu/aarch64.patch |  19 ---
 .../liburcu/{liburcu_0.8.7.bb => liburcu_0.9.1.bb} |   9 +-
 .../nss/{nss_3.19.2.bb => nss_3.21.bb}             |   6 +-
 25 files changed, 41 insertions(+), 329 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.7.48.1.bb => ifupdown_0.8.2.bb} (81%)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.1.2.bb => btrfs-tools_4.3.1.bb} (94%)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.0.bb => gptfdisk_1.0.1.bb} (86%)
 rename meta/recipes-devtools/python/{python-pexpect_3.3.bb => python-pexpect_4.0.1.bb} (69%)
 rename meta/recipes-devtools/python/{python3-pip_6.1.1.bb => python3-pip_7.1.2.bb} (90%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.36.bb => lighttpd_1.4.38.bb} (94%)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.2.bb => msmtp_1.6.3.bb} (86%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.7.bb => cryptodev-linux_1.8.bb} (91%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.7.bb => cryptodev-module_1.8.bb} (83%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.7.bb => cryptodev-tests_1.8.bb} (79%)
 rename meta/recipes-kernel/cryptodev/{cryptodev_1.7.inc => cryptodev.inc} (66%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.10.bb => kexec-tools_2.0.11.bb} (87%)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb} (92%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.58.bb => iso-codes_3.63.bb} (76%)
 rename meta/recipes-support/libassuan/{libassuan_2.2.1.bb => libassuan_2.4.2.bb} (86%)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
 delete mode 100644 meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
 delete mode 100644 meta/recipes-support/liburcu/liburcu/aarch64.patch
 rename meta/recipes-support/liburcu/{liburcu_0.8.7.bb => liburcu_0.9.1.bb} (61%)
 rename meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} (97%)

-- 
2.6.2


