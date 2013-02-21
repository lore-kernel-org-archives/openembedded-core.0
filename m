Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U8ZIn-0001E4-Px
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 17:47:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Feb 2013 08:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,710,1355126400"; d="scan'208";a="288857598"
Received: from unknown (HELO swold-linux.nomadix.com) ([10.255.12.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Feb 2013 08:31:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2013 08:31:04 -0800
Message-Id: <cover.1361464203.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/41] Selected Updates and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 16:47:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a set of patches and updates that has been reviewed
and built on the autobuilder.

Please consider them for oe-core.

Thanks
	Sau!

The following changes since commit a5362de60c0051f16b88a40bd9cb41915bee0b0f:

  rootfs_ipkg: fix BAD_RECOMMENDATIONS handling (2013-02-19 14:37:44 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Roxell (2):
  zlib: Add ptest
  linux-dtc: Make KERNEL_DEVICETREE_FLAGS configurable

Björn Stenberg (4):
  ptest: Add missed .debug path
  bzip2: Add ptest
  openssh: Add ptest
  openssl: Add ptest

Chen Qi (1):
  hwclock.sh: check for the existence of /etc/default/rcS

Constantin Musca (5):
  gnome-common: upgrade to 3.7.4
  augeas: upgrade to 1.0.0
  cairo: upgrade to 1.12.14
  shared-mime-info: upgrade to 1.1
  groff: upgrade to 1.22.2

Cristian Iorga (3):
  sbc: SBC audio codec
  pulseaudio: upgrade to 3.0
  libtirpc: upgrade to 0.2.3

Daniel Dai (1):
  busybox: Add ptest

Hongxu Jia (1):
  base-passwd.preinst:fix creating passwd and group error

Jason Wessel (1):
  genext2fs.inc: Add nativesdk build capability

Jeremy Stashluk (1):
  gst-plugins-gl: add package recipe

Kang Kai (4):
  external-python-tarball: code refactoring
  rpm: redirect output of post install script
  dpkg: redirect output of postinstall script
  opkg: save output of postinst scripts

Laurentiu Palcu (3):
  xrandr: upgrade to 1.4.0
  xvinfo: upgrade to 1.1.2
  gconf.bbclass: make postinstall fail silently when running offline

Mark Hatle (2):
  rootfs_rpm.bbclass: Reorder feed priority based on multilib image
    setting
  man: Remove wildcard from SRC_URI

Marko Lindqvist (4):
  webkit-gtk: replace obsolete automake macros with working ones
  gtk-sato-engine: update to git repository head
  oprofileui-server: replace obsolete automake macros with working ones
  curl: update to upstream version 7.29.0

MiLo (1):
  util-linux: Add package for libmount

Rick.Yang (1):
  acl: Add ptest

Ross Burton (6):
  matchbox-keyboard: general clean up
  matchbox-keyboard: add RRECOMMENDS to matchbox-keyboard-applet
  matchbox-session-sato: start the keyboard applet if we have no
    keyboard
  package_deb: check CONFFILES exist before adding them to metadata
  xserver-xf86-config: don't ship empty xorg.conf
  xserver-xf86-config: empty generic xorg.conf

Saul Wold (1):
  sbc: Fix PN -> BPN for multilib

 meta/classes/gconf.bbclass                         |  10 +-
 meta/classes/package_deb.bbclass                   |   3 +-
 meta/classes/populate_sdk_rpm.bbclass              |  11 +-
 meta/classes/ptest.bbclass                         |   3 +-
 meta/classes/rootfs_rpm.bbclass                    |  13 ++-
 .../add-test-support-for-busybox.patch             |  61 ++++++++++
 .../openssh/openssh-6.1p1/run-ptest                |   7 ++
 meta/recipes-connectivity/openssh/openssh_6.1p1.bb |  11 +-
 .../openssl/openssl-1.0.0j/Makefiles-ptest.patch   |  74 ++++++++++++
 .../openssl/openssl-1.0.0j/run-ptest               |   2 +
 meta/recipes-connectivity/openssl/openssl.inc      |  19 +++-
 .../recipes-connectivity/openssl/openssl_1.0.0j.bb |   2 +
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |   3 +-
 meta/recipes-core/busybox/busybox.inc              |   2 +-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |  10 ++
 meta/recipes-core/busybox/files/hwclock.sh         |   2 +-
 meta/recipes-core/busybox/files/run-ptest          |   7 ++
 meta/recipes-core/meta/external-python-tarball.bb  |  67 +----------
 meta/recipes-core/util-linux/util-linux.inc        |   3 +
 meta/recipes-core/util-linux/util-linux_2.22.2.bb  |   2 +-
 .../zlib/zlib-1.2.7/Makefile-runtests.patch        |  38 +++++++
 meta/recipes-core/zlib/zlib-1.2.7/run-ptest        |   7 ++
 meta/recipes-core/zlib/zlib_1.2.7.bb               |  22 ++++
 .../dpkg/dpkg/redirect-output.patch                |  37 ++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.9.bb          |   8 +-
 meta/recipes-devtools/genext2fs/genext2fs.inc      |   2 +-
 .../opkg/opkg/redirect-output.patch                |  29 +++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |   6 +-
 .../recipes-devtools/rpm/rpm/redirect-output.patch |  38 +++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   6 +-
 meta/recipes-extended/augeas/augeas.inc            |   2 +-
 .../0001-Add-missing-argument-to-escape.patch      |  29 -----
 .../augeas/add-missing-argz-conditional.patch      |  20 ++++
 .../augeas/augeas/remove-gets.patch                |  20 ----
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |   8 --
 meta/recipes-extended/augeas/augeas_1.0.0.bb       |   6 +
 .../recipes-extended/bzip2/bzip2-1.0.6/Makefile.am |  32 ++++++
 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest  |   2 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  10 +-
 .../groff/{groff_1.20.1.bb => groff_1.22.2.bb}     |  16 ++-
 .../libtirpc-0.2.2-rpc-des-prot.patch              |  39 -------
 .../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch |  17 ---
 .../libtirpc-0.2.1-fortify.patch                   |   0
 .../obsolete_automake_macros.patch                 |   0
 .../remove-des-uclibc.patch                        |   0
 .../{libtirpc_0.2.2.bb => libtirpc_0.2.3.bb}       |   8 +-
 .../man/man/man-1.5m2-multiple.patch               |  22 ----
 .../man/man/man-1.6e-lzma+xz-support.patch         | 124 ---------------------
 meta/recipes-extended/man/man_1.6g.bb              |  47 ++++----
 .../gnome/gnome-common-2.28.0/omf.patch            |  15 ---
 ...nome-common_2.28.0.bb => gnome-common_3.7.4.bb} |  13 +--
 .../cairo/{cairo_1.12.12.bb => cairo_1.12.14.bb}   |   4 +-
 .../xorg-app/{xrandr_1.3.5.bb => xrandr_1.4.0.bb}  |   6 +-
 .../xorg-app/{xvinfo_1.1.1.bb => xvinfo_1.1.2.bb}  |   4 +-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |  26 -----
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |  10 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   2 +-
 .../obsolete_automake_macros.patch                 |  20 ++++
 .../oprofile/oprofileui-server_git.bb              |   6 +-
 ...-conditional-gl-framebuffer-undefined-use.patch |  35 ++++++
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |  19 ++++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   4 +-
 .../{pulseaudio_2.1.bb => pulseaudio_3.0.bb}       |   9 +-
 meta/recipes-multimedia/sbc/sbc_1.0.bb             |  18 +++
 .../gtk-engines/gtk-sato-engine_git.bb             |   4 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |  21 ++--
 .../matchbox-sato/matchbox-session-sato/session    |   9 +-
 .../obsolete_automake_macros.patch                 |  14 +++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   3 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |  21 ++++
 .../attr/files/add-runtest-target.patch            |  26 +++++
 meta/recipes-support/attr/files/run-ptest          |   8 ++
 .../dont_override_ac_config_macro_dir.patch        |  30 -----
 .../curl-7.28.1/obsolete_automake_macros.patch     |  14 ---
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |  25 ++---
 .../curl/{curl_7.28.1.bb => curl_7.29.0.bb}        |   8 +-
 ...ed-mime-info_1.0.bb => shared-mime-info_1.1.bb} |   4 +-
 77 files changed, 765 insertions(+), 520 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.1p1/add-test-support-for-busybox.patch
 create mode 100755 meta/recipes-connectivity/openssh/openssh-6.1p1/run-ptest
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles-ptest.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest
 create mode 100644 meta/recipes-core/busybox/files/run-ptest
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/run-ptest
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/redirect-output.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/redirect-output.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/redirect-output.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.10.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.0.0.bb
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest
 rename meta/recipes-extended/groff/{groff_1.20.1.bb => groff_1.22.2.bb} (79%)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.2.bb => libtirpc_0.2.3.bb} (81%)
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-multiple.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-lzma+xz-support.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
 rename meta/recipes-gnome/gnome/{gnome-common_2.28.0.bb => gnome-common_3.7.4.bb} (48%)
 rename meta/recipes-graphics/cairo/{cairo_1.12.12.bb => cairo_1.12.14.bb} (92%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.3.5.bb => xrandr_1.4.0.bb} (70%)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.1.bb => xvinfo_1.1.2.bb} (72%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.1.bb => pulseaudio_3.0.bb} (62%)
 create mode 100644 meta/recipes-multimedia/sbc/sbc_1.0.bb
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/attr/files/add-runtest-target.patch
 create mode 100644 meta/recipes-support/attr/files/run-ptest
 delete mode 100644 meta/recipes-support/curl/curl-7.28.1/dont_override_ac_config_macro_dir.patch
 delete mode 100644 meta/recipes-support/curl/curl-7.28.1/obsolete_automake_macros.patch
 rename meta/recipes-support/curl/{curl_7.28.1.bb => curl_7.29.0.bb} (88%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.0.bb => shared-mime-info_1.1.bb} (45%)

-- 
1.8.0.2



