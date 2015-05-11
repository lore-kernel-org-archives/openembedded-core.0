Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6827860043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 23691600669
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 09:40:34 +0100
Message-Id: <cover.1431326066.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
Subject: [PATCH 00/70] Proposed changes for fido
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
X-List-Received-Date: Mon, 11 May 2015 08:40:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider the following changes for the fido stable branch.

Regards,

Joshua

The following changes since commit cd3da9c95f48899e134a5b7ed1754fd18985df4f:

  curl: several security fixes (2015-04-27 15:25:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Andre McCurdy (2):
  libpcap.inc: remove obsolete libnl1 PACKAGECONFIG
  busybox: remove CVE-2014-9645 patch (already upstream in 1.23.x)

Aníbal Limón (2):
  lzop: Fix build using x32 ABI
  nss: Fix build in x32 ABI

Armin Kuster (1):
  crypto: use bigint in x86-64 perl

Bruno Bottazzini (1):
  systemd 219 -> system 219-stable

Bryan Evenson (1):
  util-linux: Add lastb to alternatives

Carlos Rafael Giani (1):
  u-boot.inc: make sure all counter variables are properly unset

Chen Qi (5):
  shadow: fix `su' behaviour
  uninative-tarball: delete the packagedata task
  populate_sdk_base: avoid executing empty function
  util-linux: split out util-linux-sulogin
  shadow: add 'util-linux-sulogin' to RDEPENDS

Christopher Larson (1):
  oe.sstatesig: align swspec handling with sstate.bbclass

Chunrong Guo (1):
  groff: add runtime dependency on sed

Cristian Iorga (1):
  oeqa/selftest/toaster: fix bad indent

Denys Dmytriyenko (1):
  security_flags.inc: elfutils on ARM fails with PIE flags

Dmitry Eremin-Solenikov (2):
  lsb: provide lsb-core-ARCH
  bitbake.conf: add sed-native to ASSUME_PROVIDED

Gary Thomas (2):
  libgpg-error: Fix native build on i686
  gst-player: Fix typo

Jean-Benoit MARTIN (1):
  package_manager: RpmPM: Fix scriptlet for rpm 4

Joe Slater (1):
  nss: generate debug info

Joshua Lock (1):
  systemd: remove unused patches

Jukka Rissanen (1):
  connman: Create connman.service at proper moment

Jun Zhu (1):
  meta/lib/oe/utils.py: Corrected the return value of both_contain()

Junling Zheng (3):
  uclibc: fix undefinition of '_dl_strchr' in libdl.a
  elfutils: fix an incorrect patch for 0.161
  less: fix CVE-2014-9488

Ken Sharp (2):
  udev-cache: Remove unnecessary tar read from stdin
  udev-cache: improve error handling

Khem Raj (4):
  bluez4: Fix encrypt symbol namespace collision
  libusb-compat: Include sys/types.h in usb.h
  libffi: Use proper compiler define for linux platform
  ppp: Add extra include dirs

Koen Kooi (5):
  gst-ffmpeg: fix internal-libav builds with inherit autotools-brokensep
  gst-ffmpeg: remove bogus patch that leads to build failures
  gst-ffmpeg: fix libav-9.patch
  libgpg-error 1.18: simplify tupple handling and add armv8b support
  strace: fix build for aarch64

Krishnanjanappa, Jagadeesh (2):
  dpkg: add triplet entry to fix build error for armeb
  ghostscript: add objarch.h for armeb

Li Zhou (5):
  xorg-server: Security Advisory - xorg-server - CVE-2015-0255
  libarchive: Security Advisory - libarchive - CVE-2015-2304
  libxfont: Security Advisory - libxfont - CVE-2015-1802
  libxfont: Security Advisory - libxfont - CVE-2015-1803
  libxfont: Security Advisory - libxfont - CVE-2015-1804

Mariano Lopez (1):
  kexec-tools: Add support for build with x32 ABI in x86_64

Mario Domenech Goulart (1):
  useradd_base.bbclass: typo fixes (s/scucess/success/)

Martin Jansa (2):
  pango: fix postinst
  tzdata: fix postinst

Matt Madison (1):
  shadow: split files needed for PAM use into separate package

Matthieu Crapet (1):
  util-linux: add lastb.1 and nologin.8 to update-alternatives

Mike Looijmans (1):
  alsa-utils: Remove double dependency on udev

Nathan Rossi (1):
  python: Change python 2.7.9 to use libffi from the system

Paul Eggleton (4):
  devtool: force use of bash when running build within extensible SDK
  classes/populate_sdk_ext: disable network connectivity check
  mkefidisk.sh: use script mode when running parted
  mkefidisk.sh: fix hanging on non-writeable device

Reinette Chatre (1):
  init-install-efi.sh: fix gummiboot entry installation

Richard Purdie (1):
  autotools: Fix find races on source directory

Robert Yang (5):
  pcmciautils: fix for parallel build
  aspell: inherit binconfig-disabled
  cracklib: add python support back
  gnu-efi: fix parallel issue
  kernel-devsrc: depends on virtual/kernel:do_install

Ross Burton (1):
  systemd: bring back the patch to customise root's $HOME

Roy Li (1):
  rsync: backport a patch to fix CVE-2014-9512

Wenzong Fan (1):
  perl: module overload rdpends on overloading

tprrt (1):
  image: zap_empty_root_password doesn't handle passwd file in shadow
    case

 meta/classes/autotools.bbclass                     |   8 +-
 meta/classes/image.bbclass                         |   3 +-
 meta/classes/populate_sdk_base.bbclass             |   4 +-
 meta/classes/populate_sdk_ext.bbclass              |   3 +
 meta/classes/useradd_base.bbclass                  |  14 +-
 meta/conf/bitbake.conf                             |   1 +
 meta/conf/distro/include/security_flags.inc        |   1 +
 meta/lib/oe/package_manager.py                     |   6 +-
 meta/lib/oe/sstatesig.py                           |   8 +-
 meta/lib/oe/utils.py                               |   2 +-
 meta/lib/oeqa/selftest/_toaster.py                 |   2 +-
 .../gnu-efi/lib-Makefile-fix-parallel-issue.patch  |  38 ++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb          |   1 +
 .../Makefile-fix-for-parallel-build.patch          |  10 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   5 +
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 +++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   1 +
 meta/recipes-connectivity/connman/connman.inc      |   6 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |   1 -
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  35 +++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |   1 +
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |   6 +-
 ..._busybox_reject_module_names_with_slashes.patch |  41 ------
 meta/recipes-core/busybox/busybox_1.23.1.bb        |   1 -
 .../initrdscripts/files/init-install-efi.sh        |   6 +-
 meta/recipes-core/meta/uninative-tarball.bb        |   1 +
 ...iles-avoid-creating-duplicate-acl-entries.patch | 134 ------------------
 ...ietly-ignore-ACLs-on-unsupported-filesyst.patch |  86 ------------
 ...0-Make-root-s-home-directory-configurable.patch |   3 +-
 ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |  37 -----
 meta/recipes-core/systemd/systemd_219.bb           |   9 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   2 +-
 ...ldso-limited-support-for-ORIGIN-in-rpath.patch} |  92 +++++++++----
 meta/recipes-core/udev/udev/udev-cache             |  10 +-
 meta/recipes-core/util-linux/util-linux.inc        |  18 ++-
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        |  38 ++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         |   1 +
 .../uclibc-support-for-elfutils-0.148.patch}       |   0
 .../uclibc-support-for-elfutils-0.161.patch        | 106 +++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.161.bb   |   2 +-
 .../recipes-devtools/perl/perl-rdepends_5.20.0.inc |   1 +
 meta/recipes-devtools/python/python_2.7.9.bb       |   4 +-
 ...-an-inc-recursive-path-is-not-right-for-i.patch | 135 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.1.bb         |   4 +-
 .../0001-Add-linux-aarch64-arch_regs.h.patch       |  25 ++++
 meta/recipes-devtools/strace/strace_4.9.bb         |   1 +
 meta/recipes-extended/cracklib/cracklib_2.9.2.bb   |  28 +++-
 .../ghostscript/ghostscript/armeb/objarch.h        |  40 ++++++
 meta/recipes-extended/groff/groff_1.22.2.bb        |   1 +
 ...ossible-buffer-overrun-with-invalid-UTF-8.patch |  49 +++++++
 meta/recipes-extended/less/less_471.bb             |   4 +-
 ...IVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch | 151 +++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |   1 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |   5 +
 .../0001-su.c-fix-to-exec-command-correctly.patch  |  25 ----
 meta/recipes-extended/shadow/shadow.inc            |  27 +++-
 meta/recipes-extended/tzdata/tzdata.inc            |   4 +-
 ...ps-Use-compiler-internal-define-for-linux.patch |  32 +++++
 meta/recipes-gnome/libffi/libffi_3.2.1.bb          |   4 +-
 meta/recipes-graphics/pango/pango.inc              |  10 +-
 ...acters-bailout-if-a-char-s-bitmap-cannot-.patch |  40 ++++++
 ...acters-ensure-metrics-fit-into-xCharInfo-.patch |  80 +++++++++++
 ...erties-property-count-needs-range-check-C.patch |  38 ++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |   5 +
 ...Check-strings-length-against-request-size.patch | 145 ++++++++++++++++++++
 ...wap-XkbSetGeometry-data-in-the-input-buff.patch | 109 +++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |   2 +
 .../kexec/kexec-tools/kexec-x32.patch              | 113 +++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb     |   3 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         |   2 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb  |   2 +-
 ...check-width-more-completely-avoid-out-of-.patch |  30 ----
 .../gstreamer/gst-ffmpeg-0.10.13/libav-9.patch     |   2 +-
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   3 +-
 .../gstreamer/gst-player/gst-player.desktop        |   2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |   4 +-
 .../libgpg-error/libgpg-error_1.18.bb              |  10 +-
 .../0001-usb.h-Include-sys-types.h.patch           |  30 ++++
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |   4 +-
 .../lzop/lzop/x32_abi_miniacc_h.patch              |  36 +++++
 meta/recipes-support/lzop/lzop_1.03.bb             |   3 +-
 meta/recipes-support/nss/nss.inc                   |  17 ++-
 scripts/contrib/mkefidisk.sh                       |  21 +--
 scripts/lib/devtool/__init__.py                    |   5 +
 85 files changed, 1634 insertions(+), 478 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
 rename meta/recipes-core/uclibc/uclibc-git/{orign_path.patch => 0001-ldso-limited-support-for-ORIGIN-in-rpath.patch} (63%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
 rename meta/recipes-devtools/elfutils/{elfutils/uclibc-support.patch => elfutils-0.148/uclibc-support-for-elfutils-0.148.patch} (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch
 create mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
 create mode 100644 meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
 create mode 100644 meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
 create mode 100644 meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch

-- 
2.1.0


