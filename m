Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A786F6B7B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 14:28:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2013 07:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="365580592"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2013 07:28:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 07:28:04 -0700
Message-Id: <cover.1377008073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/25] Final Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 14:28:06 -0000

Richard,

This has been ACK'ed by Ross and Paul, I re-ordered the tune file
usage patches and will create a patch to clean up the comment that
Ross mentions.

I agree with Ross on the texinfo patch, his name is there in the
email.

Thanks
	Sau!

The following changes since commit fd9e591f266e1a6c183e77f24e50d31e0d52bdd5:

  cronie: fix out of tree build (2013-08-19 11:24:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (2):
  linux-yocto-3.8/meta: update drm and intel power management settings
  linux-yocto-3.8/meta: enable ALTIVEC for qemuppc

Chen Qi (4):
  useradd.bbclass: add missing functions to preinst
  init-install.sh: improve hard drive searching process
  init-install.sh: fix to handle the boot partition correctly
  initscripts: remove obsolete device_table.txt

Chunrong Guo (1):
  genext2fs: fix memory corruption on powerpc

Jackie Huang (1):
  texinfo: handle correctly @enumerate specification greater than 10

Joe Slater (2):
  coreutils: add PACKAGECONFIG info for acl support
  coreutils: allow for acl support

Khem Raj (3):
  tune-ppc7400.inc: Add tune file
  qemuppc: Change default tune to 74xx
  uclibc: Upgrade to latest on git

Mark Hatle (1):
  prelink: update to latest cross-prelink

Marko Lindqvist (6):
  glib-2.0: use trim_version() to get the source directory
  pixman: update to upstream version 0.30.2
  curl: update to upstream version 7.32.0
  glib-2.0: update to upstream version 2.36.4
  gtk+: update to upstream version 2.24.20
  gettext: update to upstream version 0.18.3

Otavio Salvador (2):
  default-distrovars.inc: Add 'DISTRO_FEATURES_DEFAULT' variable
  linux-dtb.inc: Fix dtb generation for kernels newer than 3.8

Paul Eggleton (1):
  tslib: update to 1.1

Yang Shi (2):
  Revert "hello-mod: Ensure the produced package name begins with
    kernel-module-"
  hello-mod: Add comment for kernel module package naming

 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |   9 +-
 meta/classes/useradd.bbclass                       |   3 +
 meta/conf/distro/include/default-distrovars.inc    |   3 +-
 meta/conf/machine/include/tune-ppc7400.inc         |  14 +
 meta/conf/machine/qemuppc.conf                     |   2 +-
 meta/recipes-bsp/grub/grub-2.00/40_custom          |   2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  11 +
 meta/recipes-core/coreutils/coreutils_8.21.bb      |  12 +-
 .../parallel.patch                                 |   0
 .../gettext/gettext-minimal-0.18.2/aclocal.tgz     | Bin 37504 -> 0 bytes
 .../COPYING                                        |   0
 .../Makefile.in.in                                 |   3 +-
 .../Makevars.template                              |   0
 .../gettext/gettext-minimal-0.18.3/aclocal.tgz     | Bin 0 -> 37586 bytes
 .../config.rpath                                   |   2 +-
 .../remove-potcdate.sin                            |   0
 ..._0.18.2.bb => gettext-minimal-native_0.18.3.bb} |   0
 .../{gettext_0.18.2.bb => gettext_0.18.3.bb}       |   5 +-
 .../{glib-2.0_2.36.3.bb => glib-2.0_2.36.4.bb}     |   6 +-
 .../initrdscripts/files/init-install.sh            | 160 ++--
 .../initscripts/initscripts-1.0/device_table.txt   | 197 -----
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 -
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +-
 meta/recipes-core/uclibc/uclibc.inc                |   2 +-
 .../fix-memory-corruption-on-powerpc.patch         |  76 ++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |   3 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   3 +-
 .../texinfo-5.1/enumerate_greater_than_ten.patch   |  51 ++
 meta/recipes-extended/texinfo/texinfo_5.1.bb       |   1 +
 ...utton-do-not-prelight-in-touchscreen-mode.patch |   0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   0
 .../cellrenderer-cairo.patch                       |   0
 .../configure-nm.patch                             |   0
 .../configurefix.patch                             |   0
 .../{gtk+-2.24.18 => gtk+-2.24.20}/doc-fixes.patch |   0
 .../entry-cairo.patch                              |   0
 .../hardcoded_libtool.patch                        |   0
 .../{gtk+-2.24.18 => gtk+-2.24.20}/no-demos.patch  |   0
 .../run-iconcache.patch                            |   0
 .../toggle-font.diff                               |   0
 .../{gtk+-2.24.18 => gtk+-2.24.20}/xsettings.patch |   0
 .../gtk+/{gtk+_2.24.18.bb => gtk+_2.24.20.bb}      |   8 +-
 .../tslib/0001-Link-plugins-against-libts.patch    |  57 --
 .../tslib/tslib/32bitBE-support.patch              |  55 --
 .../recipes-graphics/tslib/tslib/fix_version.patch |  34 -
 meta/recipes-graphics/tslib/tslib/multievent.patch | 845 ---------------------
 .../tslib/tslib/obsolete_automake_macros.patch     |  15 -
 .../tslib/set-open-mode-for-ts_calibrate_c.patch   |  30 -
 .../tslib/{tslib_1.0.bb => tslib_1.1.bb}           |  14 +-
 .../{pixman_0.30.0.bb => pixman_0.30.2.bb}         |   4 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |  12 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   2 +-
 .../curl/{curl_7.31.0.bb => curl_7.32.0.bb}        |   4 +-
 55 files changed, 292 insertions(+), 1362 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppc7400.inc
 rename meta/recipes-core/gettext/{gettext-0.18.2 => gettext-0.18.3}/parallel.patch (100%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/Makefile.in.in (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/Makevars.template (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.2.bb => gettext-minimal-native_0.18.3.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.2.bb => gettext_0.18.3.bb} (96%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.3.bb => glib-2.0_2.36.4.bb} (88%)
 delete mode 100644 meta/recipes-core/initscripts/initscripts-1.0/device_table.txt
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.18.bb => gtk+_2.24.20.bb} (90%)
 delete mode 100644 meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/fix_version.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/multievent.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch
 rename meta/recipes-graphics/tslib/{tslib_1.0.bb => tslib_1.1.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.30.0.bb => pixman_0.30.2.bb} (89%)
 rename meta/recipes-support/curl/{curl_7.31.0.bb => curl_7.32.0.bb} (93%)

-- 
1.8.3.1


