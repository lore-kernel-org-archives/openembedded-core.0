Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKM-0004Cw-GX
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472079"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:21 -0800
Message-Id: <cover.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 00/33] patches and staticdev fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 09:30:39 -0000

Richard,

Here is a batch of fixes from the community along with some
staticdev patches (long overdue).

Thanks
	Sau!

The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:

  package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  xinput: add utility for configuring and testing XInput devices.

Andrei Gherzan (3):
  busybox: defconfig modified in order to activate
    CONFIG_EXPR_MATH_SUPPORT_64
  chkconfig: Update package from v1.3.55 to v1.3.57
  libsoup: Update package from v2.2.100 to v2.2.105

Bruce Ashfield (1):
  linux-yocto: restore WORKDIR as a patch source directory

Joshua Lock (6):
  busybox: drop MARKINT option from init script and syslog-startup.conf
  busybox: remove incorrect comments from syslog-startup.conf
  busybox: enable log level configuration in syslog-startup.conf and
    script
  busybox: change syslog default to log to a file
  busybox: enable dropping of duplicates in syslog, off by default
  distro-tracking-fields: claim responsibility for udev, dpkg, apt,
    v86d

Khem Raj (4):
  gnutls: Fix compilation on uclibc
  uclibc: Upgrade to latest master
  e2fsprogs_1.42.bb: Fix build fallout for uclibc
  gnutls: Fix configure issue wrt to rm

Lianhao Lu (1):
  adt-installer: install autoconf(/automake)-nativesdk

Nitin A Kamble (7):
  site/ix86-common: fix an error
  bdwgc: new recipe for autogen
  libunistring: new recipe for autogen
  guile: new recipe for autogen
  autogen-native: new recipe for grub-efi-native
  grub-efi-native: fix errors with automake 1.11.2
  distro-tracking: add data for newer recipes

Saul Wold (10):
  m4: A better refactoring
  pango.inc: fix /etc/pango -> /${sysconfdir}/pango/*
  pkgconfig: Move pkg.m4 from -dev to  package
  gst-openmax: refactor packages for staticdev
  liba52: refactor packages for staticdev
  attr/acl: refactor packages for staticdev
  db: refactor packages for staticdev
  js: refactor packages for staticdev
  boost: refactor packages for staticdev
  enchant: refactor packages for staticdev

 meta/classes/kernel-yocto.bbclass                  |    2 +
 .../conf/distro/include/distro_tracking_fields.inc |   59 +-
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5808 --------------------
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    4 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 meta/recipes-core/busybox/files/syslog             |    9 +-
 .../recipes-core/busybox/files/syslog-startup.conf |    9 +-
 .../uclibc/uclibc-git/cross_compile_check.patch    |   13 +
 .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   83 +
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
 .../uclibc/uclibc-git/orign_path.patch             |  183 -
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |    6 +
 .../uclibc-git/remove_attribute_optimize_Os.patch  |    5 +
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  216 -
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |    5 +
 .../uclibc/uclibc-git/uclibc-execvpe.patch         |    3 +
 .../uclibc-git/uclibc_enable_log2_test.patch       |    5 +
 .../uclibc-git/uclibc_scheduler_update.patch       |  455 --
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   10 +-
 .../autogen/autogen-native_5.12.bb                 |   24 +
 .../e2fsprogs/e2fsprogs-1.42/fallocate.patch       |   22 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    3 +-
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 +
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 +
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 +
 .../guile/files/opensuse/guile-64bit.patch         |   38 +
 .../files/opensuse/guile-turn-off-gc-test.patch    |   48 +
 meta/recipes-devtools/guile/guile_2.0.3.bb         |   79 +
 .../adt-installer/scripts/adt_installer_internal   |   18 +-
 .../installer/adt-installer_1.0.bb                 |    2 +-
 meta/recipes-devtools/m4/m4-1.4.16.inc             |   14 +
 meta/recipes-devtools/m4/m4-1.4.9.inc              |   13 +
 meta/recipes-devtools/m4/m4-native_1.4.16.bb       |    2 +-
 meta/recipes-devtools/m4/m4-native_1.4.9.bb        |    4 +-
 meta/recipes-devtools/m4/m4.inc                    |   11 +-
 meta/recipes-devtools/m4/m4_1.4.16.bb              |    2 +-
 meta/recipes-devtools/m4/m4_1.4.9.bb               |   19 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |    2 +
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |    2 +-
 .../{chkconfig_1.3.55.bb => chkconfig_1.3.57.bb}   |    4 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |   14 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    5 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   12 +-
 meta/recipes-support/bdwgc/bdwgc_20110107.bb       |   37 +
 meta/recipes-support/boost/boost.inc               |    7 +-
 meta/recipes-support/db/db_5.1.19.bb               |    6 +-
 meta/recipes-support/enchant/enchant_1.6.0.bb      |    5 +-
 .../correct_rpl_gettimeofday_signature.patch       |   57 +
 meta/recipes-support/gnutls/gnutls.inc             |    4 +-
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    6 +-
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    3 +-
 .../dprintf_conflict_with_eglibc.patch             | 1184 ++++
 .../{libsoup_2.2.100.bb => libsoup_2.2.105.bb}     |    9 +-
 .../libunistring/libunistring_0.9.3.bb             |   28 +
 meta/site/ix86-common                              |    2 +-
 62 files changed, 1893 insertions(+), 6778 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
 create mode 100644 meta/recipes-devtools/autogen/autogen-native_5.12.bb
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
 create mode 100644 meta/recipes-devtools/guile/guile_2.0.3.bb
 create mode 100644 meta/recipes-devtools/m4/m4-1.4.16.inc
 create mode 100644 meta/recipes-devtools/m4/m4-1.4.9.inc
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.55.bb => chkconfig_1.3.57.bb} (84%)
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
 create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
 rename meta/recipes-support/libsoup/{libsoup_2.2.100.bb => libsoup_2.2.105.bb} (57%)
 create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb

-- 
1.7.6.5



