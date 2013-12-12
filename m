Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9715A6E2C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 07:37:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2013 23:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,876,1378882800"; d="scan'208";a="448804373"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.47])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2013 23:37:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 23:37:09 -0800
Message-Id: <cover.1386833720.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/31]
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
X-List-Received-Date: Thu, 12 Dec 2013 07:37:11 -0000

Richard,

The build still seems to have an issue with x11, we can drop the util-macros
update if you want.

I have already given a head up for the grub-efi change to Darren.

Sau!


The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b46a44:

  libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandra Safta (1):
  udev: Add ptest

Andrei Gherzan (1):
  libav: Use "BP" and "libav" patch directory

Bruce Ashfield (2):
  linux-yocto-dev: allow static SRCREVs via include
  linux-libc-headers: fix MIPS klibc build error

Chen Qi (6):
  image.bbclass: default USE_DEVFS to '1'
  license.bbclass: fix the code of installing and packaging license
    files
  shadow-native: allow for setting password in clear text
  image.bbclass: fix for zap_root_password
  useradd-example: add example for setting clear text password
  libgcrypt: fix compile error with '-O2' in sysroot path

Corneliu Stoicescu (2):
  oe-selftest: implement add_command_to_tearDown method
  oe-selftest: Add track_for_cleanup method to be used in cleanup tasks

Cristian Iorga (5):
  iptables: upgrade to 1.4.21
  iproute2: upgrade to 3.12.0
  bluez5: upgrade to 5.12
  rpcbind: upgrade to 0.2.1
  glib-2.0: upgrade to 2.38.2

Hongxu Jia (1):
  libpthread-stubs: add ALLOW_EMPTY_${PN} = "1"

Jackie Huang (2):
  grub-efi: change to generate EFI image in target package
  grub-efi: allow compilation without large model support

Khem Raj (1):
  systemd-systemctl: Add preset capability

Koen Kooi (3):
  distutils bbclass: delete site.py*
  perl: remove sysroot path leakage into packaged files
  cpan_build bbclass: do not install module into /usr/share

Li Wang (1):
  xinetd: add status of init.d command

Ross Burton (2):
  site: add xorg_cv_malloc0_returns_null
  xorg-lib: remove explicit --enable-malloc0returnsnull

Saul Wold (3):
  util-macros: upgrade to 1.18.0
  dpkg: upgrade to 1.17.4
  cracklib: upgrade to 2.9.1

Wenzong Fan (1):
  rpcbind: fix init status and exit code

 .../recipes-skeleton/useradd/useradd-example.bb    |   3 +-
 meta/classes/core-image.bbclass                    |   2 +-
 meta/classes/cpan_build.bbclass                    |   1 -
 meta/classes/distutils.bbclass                     |   1 +
 meta/classes/grub-efi.bbclass                      |   4 +-
 meta/classes/image.bbclass                         |  16 +-
 meta/classes/license.bbclass                       |  25 ++-
 meta/lib/oeqa/selftest/base.py                     |  33 +++-
 ...allow-a-compilation-without-mcmodel-large.patch | 131 +++++++++++++
 .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  |  44 +++--
 meta/recipes-connectivity/bluez5/bluez5.inc        |  11 +-
 .../bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf  |   0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb    |   5 -
 meta/recipes-connectivity/bluez5/bluez5_5.12.bb    |   5 +
 .../{iproute2_3.11.0.bb => iproute2_3.12.0.bb}     |   4 +-
 .../{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb}     |   4 +-
 .../systemd/systemd-systemctl/systemctl            |  28 ++-
 meta/recipes-core/udev/udev.inc                    |   8 +-
 .../recipes-core/udev/udev/add-install-ptest.patch |  73 ++++++++
 meta/recipes-core/udev/udev/run-ptest              |   3 +
 .../dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb}        |   4 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |  18 +-
 .../{cracklib_2.9.0.bb => cracklib_2.9.1.bb}       |   4 +-
 .../{iptables_1.4.19.1.bb => iptables_1.4.21.bb}   |   4 +-
 .../rpcbind/rpcbind/fix_host_path.patch            |  16 --
 meta/recipes-extended/rpcbind/rpcbind/init.d       |   8 +-
 .../rpcbind/rpcbind/obsolete_automake_macros.patch |  14 --
 .../rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb} |   8 +-
 .../allow-for-setting-password-in-clear-text.patch | 208 +++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |   1 +
 meta/recipes-extended/xinetd/xinetd/xinetd.init    |   9 +-
 .../xorg-lib/libpthread-stubs_0.3.bb               |   1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |   2 -
 ...util-macros_1.17.1.bb => util-macros_1.18.0.bb} |   4 +-
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch |  34 ++++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |   3 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  25 ++-
 .../0001-configure-enable-pic-for-AArch64.patch    |   0
 meta/recipes-multimedia/libav/libav_0.8.9.bb       |   2 +-
 ...ix-building-error-with-O2-in-sysroot-path.patch |  32 ++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   3 +-
 meta/site/common-glibc                             |   3 +
 meta/site/common-uclibc                            |   3 +
 43 files changed, 684 insertions(+), 123 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf (100%)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.12.bb
 rename meta/recipes-connectivity/iproute2/{iproute2_3.11.0.bb => iproute2_3.12.0.bb} (68%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb} (79%)
 create mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 create mode 100644 meta/recipes-core/udev/udev/run-ptest
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb} (75%)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.0.bb => cracklib_2.9.1.bb} (84%)
 rename meta/recipes-extended/iptables/{iptables_1.4.19.1.bb => iptables_1.4.21.bb} (92%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb} (88%)
 create mode 100644 meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
 rename meta/recipes-graphics/xorg-util/{util-macros_1.17.1.bb => util-macros_1.18.0.bb} (75%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
 rename meta/recipes-multimedia/libav/{libav-0.8.9 => libav}/0001-configure-enable-pic-for-AArch64.patch (100%)
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch

-- 
1.8.3.1


