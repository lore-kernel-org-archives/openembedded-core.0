Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E298D60C12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 09:23:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBO9Nck4002368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Dec 2013 01:23:38 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 24 Dec 2013 01:23:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Dec 2013 04:23:34 -0500
Message-ID: <cover.1387876683.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [dora-next][PATCH 00/40] fixes for dora-next (cover letter only)
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
X-List-Received-Date: Tue, 24 Dec 2013 09:23:39 -0000
Content-Type: text/plain

Note:
These are the patches for oe-core only, if you want to see the patches for
poky, please vist:

  git://git.pokylinux.org/poky-contrib robert/dora-next

// Robert

The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:

  libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/dora-next-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/dora-next-oecore

Andreas Oberritter (1):
  cogl-1.0: explicitly disable cairo

Bruce Ashfield (1):
  linux-libc-headers: fix MIPS klibc build error

Chen Qi (1):
  subversion: fix build problem when sysroot contains '-D' or '-I'

Christopher Larson (4):
  python, python-native: fix PARALLEL_MAKEINST failure
  cairo: add/use packageconfig for valgrind support
  pulseaudio: fix RDEPENDS traversal for consolekit
  xz: make the LICENSE info more accurate

Cristiana Voicu (1):
  babeltrace: correct PV variable

Enrico Scholz (1):
  bluez4: added dependency on 'libsndfile1'

Hongxu Jia (5):
  kconfig-frontends: add python to kconfig-frontends's RDEPENDS
  qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+,
    libcap-ng
  qemu: add bash and python to qemu's RDEPENDS
  license.bbclass: fix copying license directories failed
  nativesdk.bbclass: support nativesdk to override with the
    PACKAGES_DYNAMIC statement

Jackie Huang (1):
  grub: add explicit dependency on bison-native

Kai Kang (1):
  x264: install libraries to right directory when enable multilib

Krzysztof Sywula (1):
  Minicom depends on libiconv

Li Wang (1):
  xinetd: CVE-2013-4342

Martin Jansa (3):
  avahi: add leading space to RRECOMMENDS append
  xinput-calibrator: add formfactor to RDEPENDS
  base.bbclass: Set umask 022 also for do_unpack task

Ming Liu (2):
  qemu: use PACKAGECONFIG to address xfsprogs dependency
  qemu: explicitly disable xen support

Nick D'Ademo (1):
  libav: install libraries to right directory when multilib is enabled

Paul Eggleton (1):
  linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package

Richard Purdie (4):
  base/gcc-common: Ensure umask setting is consistent for shared
    workdir
  image.bbclass: Depend on virtual/kernel:do_deploy
  gcc-cross-canadian: Fix fortran build
  gcc-crosssdk.inc: Fix missing dependencies (such as libmpc-native)

Robert Yang (2):
  coreutils 6.9: fix coreutils.texi
  gcc-4.8/libstdc++-v3: disable sdt

Ross Burton (2):
  ptest: ensure do_install_ptest_base task runs in fakeroot context
  useradd.bbclass: add dependency on base-files

Roy Li (1):
  multilib: Ensure we map the SYSTEMD_PACKAGES variable

Scott Garman (1):
  runqemu: remove core-image-* whitelist

Yue Tao (3):
  python: do not replace ccache in the middle of a path
  acpid: CVE-2011-1159
  icu: CVE-2013-2924

mykhani (1):
  openssl.inc: Install c_rehash utility with openssl

yzhu1 (1):
  populate_sdk: verify executable or dynamically linked library

 meta/classes/base.bbclass                          |    9 +-
 meta/classes/image.bbclass                         |    2 +
 meta/classes/license.bbclass                       |    7 +-
 meta/classes/multilib.bbclass                      |    1 +
 meta/classes/nativesdk.bbclass                     |    1 +
 meta/classes/populate_sdk_base.bbclass             |    2 +-
 meta/classes/ptest.bbclass                         |    5 +
 meta/classes/useradd.bbclass                       |    2 +
 meta/recipes-bsp/acpid/acpid.inc                   |    3 +-
 .../acpid/acpid/set_socket_noblock.patch           |   10 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    4 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |    2 +-
 meta/recipes-connectivity/openssl/openssl.inc      |    7 +-
 .../coreutils-6.9/coreutils-fix-texinfo.patch      |  375 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    1 +
 .../gcc/gcc-4.8/0031-Disable-sdt.patch             |   80 ++++-
 meta/recipes-devtools/gcc/gcc-common.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    1 +
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    2 +-
 .../kconfig-frontends_3.10.0.0.bb                  |    1 +
 .../recipes-devtools/python/python-native_2.7.3.bb |    1 +
 .../python/parallel-makeinst-create-bindir.patch   |   19 +
 meta/recipes-devtools/python/python_2.7.3.bb       |    3 +-
 meta/recipes-devtools/qemu/qemu.inc                |   19 +-
 .../neon.m4-fix-includes-and-cflags.patch          |   32 ++
 .../subversion/subversion_1.7.10.bb                |    1 +
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |    2 +-
 .../xinetd/xinetd/xinetd-CVE-2013-4342.patch       |   32 ++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
 meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   17 +-
 meta/recipes-graphics/cairo/cairo.inc              |    1 +
 meta/recipes-graphics/cogl/cogl-1.0.inc            |    1 +
 .../xinput-calibrator/xinput-calibrator_git.bb     |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    2 +-
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch |   34 ++
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |    3 +
 meta/recipes-kernel/lttng/babeltrace_1.1.1.bb      |    2 +-
 meta/recipes-multimedia/libav/libav.inc            |    2 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    6 +-
 meta/recipes-multimedia/x264/x264_git.bb           |    1 +
 ...fer_length_check_to_UTF_16_or_32_detector.patch |   33 ++
 meta/recipes-support/icu/icu_51.2.bb               |    1 +
 scripts/runqemu                                    |   17 +-
 44 files changed, 707 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-texinfo.patch
 create mode 100644 meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
 create mode 100644 meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch

-- 
1.7.10.4


