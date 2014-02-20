Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 973416F1E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:08:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Feb 2014 23:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,511,1389772800"; d="scan'208";a="484638386"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2014 23:08:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 23:08:33 -0800
Message-Id: <cover.1392879209.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/29] Gstreamer Update and Patches
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
X-List-Received-Date: Thu, 20 Feb 2014 07:08:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This has been run on the Autobuilder and I looked over the contents a couple
of times.  I am not sure about Alex's patch for toaster, so please take a look.

Thanks
	Sau!


The following changes since commit 9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:37:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (1):
  sstate: list missing files for toaster

Chong Lu (1):
  libpcre: enable ptest support

Cristian Iorga (8):
  libvorbis: upgrade to 1.3.4
  gstreamer1.0: upgrade to 1.2.3
  gstreamer1.0-plugins-base: upgrade to 1.2.3
  gstreamer1.0-plugins-good: upgrade to 1.2.3
  gstreamer1.0-plugins-ugly: upgrade to 1.2.3
  gstreamer1.0-plugins-bad: upgrade to 1.2.3
  gstreamer1.0-libav: upgrade to 1.2.3
  gstreamer1.0-plugins-good: removed dependency on gconf

João Henrique Ferreira de Freitas (2):
  kernel-yocto: Add do_diffconfig task
  cml1.bbclass: Add diffconfig task to cml1

Kyle Russell (1):
  image-vmdk.bbclass: Don't force syslinux timeout

Laurentiu Palcu (5):
  image*.bbclass, bootimg.bbclass: add image type dependencies
  lib/oe/image.py: add image dependency mechanism
  package_manager.py: fix installed package list creation for Opkg/Dpkg
  buildhistory.bbclass: fix creation of installed packages list
  populate_sdk_*.bbclass: remove left over bash routines

Martin Jansa (2):
  libxkbcommon: Add PACKAGECONFIG for x11
  package_manager.py: Fix $i -> %s in bb.note

Matthieu Crapet (2):
  image_types: minor, inline CPIO_TOUCH_INIT()
  recipes: convert remaining SUMMARY/DESCRIPTION cosmetic issues (part
    2)

Paul Barker (2):
  opkg: Fix add-exclude.patch
  opkg: Upgrade to v0.2.1

Ross Burton (1):
  avahi: handle SO_REUSEPORT not being available

Steffen Sledz (1):
  lighttpd: introduce /etc/lighttpd.d subdir for config file includes

Tom Zanussi (2):
  wic: Fix exec_native_cmd() path
  wic: Make exec_native_command() fail if a command isn't found

Valentin Popa (1):
  mesa: upgrade to 9.2.5

 meta-hob/recipes-core/meta/hob-toolchain.bb        |   2 +-
 .../recipes-skeleton/service/service_0.1.bb        |   2 +-
 meta/classes/bootimg.bbclass                       |   4 +
 meta/classes/buildhistory.bbclass                  |  21 +-
 meta/classes/cml1.bbclass                          |  33 +++
 meta/classes/image-live.bbclass                    |   3 +
 meta/classes/image-vmdk.bbclass                    |   7 +-
 meta/classes/image_types.bbclass                   |  15 +-
 meta/classes/kernel-yocto.bbclass                  |   2 +
 meta/classes/populate_sdk_deb.bbclass              |  21 --
 meta/classes/populate_sdk_ipk.bbclass              |  20 --
 meta/classes/sstate.bbclass                        |  11 +
 meta/conf/documentation.conf                       |   2 +-
 meta/lib/oe/image.py                               | 282 ++++++++++++++-------
 meta/lib/oe/package_manager.py                     |   8 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |   2 +-
 meta/recipes-bsp/usbutils/usbutils_007.bb          |   2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   1 +
 .../avahi/files/reuseport-check.patch              |  30 +++
 .../bluez/bluez-hcidump_2.5.bb                     |   2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   2 +-
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |   2 +-
 meta/recipes-core/busybox/busybox.inc              |   2 +-
 .../console-tools/console-tools_0.3.2.bb           |   2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   2 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb      |   2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   2 +-
 meta/recipes-core/expat/expat.inc                  |   2 +-
 meta/recipes-core/images/core-image-base.bb        |   2 +-
 meta/recipes-core/images/core-image-minimal.bb     |   2 +-
 meta/recipes-core/jpeg/jpeg_8d.bb                  |   2 +-
 .../packagegroups/packagegroup-base.bb             |   4 +-
 .../packagegroups/packagegroup-core-nfs.bb         |   2 +-
 meta/recipes-core/psplash/psplash_git.bb           |   2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |   2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |   2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |   2 +-
 meta/recipes-devtools/automake/automake.inc        |   2 +-
 meta/recipes-devtools/bison/bison_2.3.bb           |   2 +-
 meta/recipes-devtools/bison/bison_2.7.1.bb         |   2 +-
 meta/recipes-devtools/guile/guile_2.0.9.bb         |   2 +-
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  |   5 +-
 .../opkg/{opkg_0.2.0.bb => opkg_0.2.1.bb}          |   6 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |   2 +-
 .../python/python-distribute_0.6.32.bb             |   2 +-
 meta/recipes-devtools/python/python-mako_0.9.1.bb  |   2 +-
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |   2 +-
 .../python/python3-distribute_0.6.32.bb            |   2 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  12 +-
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   2 +-
 meta/recipes-extended/diffutils/diffutils.inc      |   2 +-
 meta/recipes-extended/findutils/findutils.inc      |   2 +-
 .../lighttpd/lighttpd/lighttpd.conf                |   3 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb  |   3 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |   2 +-
 meta/recipes-extended/msmtp/msmtp_1.4.31.bb        |   2 +-
 .../packagegroups/packagegroup-core-basic.bb       |   2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb |   2 +-
 meta/recipes-extended/wget/wget.inc                |   2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   2 +-
 meta/recipes-gnome/json-glib/json-glib_0.16.2.bb   |   2 +-
 .../packagegroups/packagegroup-toolset-native.bb   |   2 +-
 .../recipes-graphics/images/core-image-directfb.bb |   2 +-
 meta/recipes-graphics/images/core-image-weston.bb  |   2 +-
 meta/recipes-graphics/images/core-image-x11.bb     |   2 +-
 .../mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb}    |   0
 meta/recipes-graphics/mesa/mesa_9.2.2.bb           |  11 -
 meta/recipes-graphics/mesa/mesa_9.2.5.bb           |  19 ++
 meta/recipes-graphics/mesa/mesa_git.bb             |  12 +-
 meta/recipes-graphics/tslib/tslib_1.1.bb           |   2 +-
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb  |   2 +-
 .../xorg-lib/libxkbcommon_0.4.0.bb                 |   3 +
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb   |   2 +-
 meta/recipes-lsb4/perl/libenv-perl_1.04.bb         |   2 +-
 meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb |   2 +-
 ...-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb} |   5 +-
 ..._1.2.2.bb => gstreamer1.0-plugins-bad_1.2.3.bb} |   6 +-
 ...1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} |   4 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   6 +-
 ...1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} |   5 +-
 ...1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} |   6 +-
 ...gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb} |   4 +-
 meta/recipes-multimedia/libav/libav.inc            |   2 +-
 .../libvorbis-1.3.3/obsolete_automake_macros.patch |  15 --
 .../{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb}     |  14 +-
 .../nativesdk-packagegroup-qt-toolchain-host.bb    |   2 +-
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |   2 +-
 .../packagegroups/packagegroup-core-qt.bb          |   2 +-
 .../packagegroup-qt-toolchain-target.bb            |   2 +-
 .../packagegroup-qte-toolchain-target.bb           |   2 +-
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |   2 +-
 meta/recipes-support/libpcre/libpcre/Makefile      | 183 +++++++++++++
 meta/recipes-support/libpcre/libpcre/run-ptest     |   3 +
 meta/recipes-support/libpcre/libpcre_8.34.bb       |  19 +-
 scripts/lib/mic/utils/oe/misc.py                   |  13 +-
 99 files changed, 654 insertions(+), 287 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/reuseport-check.patch
 rename meta/recipes-devtools/opkg/{opkg_0.2.0.bb => opkg_0.2.1.bb} (44%)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.2.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.2.5.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.2.bb => gstreamer1.0-plugins-bad_1.2.3.bb} (75%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} (65%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb} (72%)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb} (66%)
 create mode 100644 meta/recipes-support/libpcre/libpcre/Makefile
 create mode 100644 meta/recipes-support/libpcre/libpcre/run-ptest

-- 
1.8.3.1


