Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12AP-0004pj-84
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:17 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 205BA30426
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:41 -0700
Message-Id: <cover.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 205BA30426.D36DD
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 00/32] denzil pull request1
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:17 -0000

Hello,

This is my first pull request for denzil since the 1.2.1 release was made.

It has been run through the autobuilder, which is having some issues with
running sanity tests and buildhistory, so if the build succeeded for
everything except for those steps, I note it as "Green with known AB
issues" below.

Note that these tests were run with a poky-based branch.

Autobuilder Test Report: sgarman/denzil-next-pull1

eclipse-plugin: Green
http://autobuilder.yoctoproject.org:8010/builders/eclipse-plugin/builds/491

nightly-x86: Green with known AB issues
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/633

nightly-x86-64: Green with known AB issues
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/572

nightly-arm: Red: see below
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/571
connman-gnome do_configure failed
	configure: error: dbus-glib > = 0.73 is required

nightly-mips: Green with known AB issues
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips

nightly-ppc: Green with known AB issues
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/527

nightly-world: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/221

nightly-non-gpl3: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/204

nightly-multilib: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/205

nightly-tiny: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/185

Scott


The following changes since commit 741146fa90f28f7ce8d82ee7f7e254872d519724:

  gconf.bbclass: don't register schemas in the install stage (2012-06-29 15:03:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull1

Enrico Scholz (1):
  libtool: fixed parallel build related race

Khem Raj (1):
  xserver-xorg: Fix build on powerpc

Martin Donnelly (1):
  augeas: Add libxml2 dependency

Matthew McClintock (12):
  libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong
    CC/LD/etc
  qemu-0.15.1: add patch to fix compilatation problems on powerpc
  packagedata.py: Fix get_subpkgedata_fn for multilib
  dtc.inc: fix for libdir == /usr/lib64
  openjade-native_1.3.2.bb: fix typo and change the deps exclusion to
    correct var
  gcc-configure-common.inc: use --with-long-double-128 on powerpc to
    comply with ABI
  gcc: gcc-cross-canadian: use correct location for libraries for
    powerpc64
  libgomp: add libgomp (openmp) library, and build for powerpc targets
    by default
  sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to
    be defined
  gcc-package-runtime.inc: Fix QA warning
  task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b
    parts
  u-boot.inc: update linker arguments to pass --sysroot arg

Nitin A Kamble (1):
  tcl: fix target recipe build issue on older distros

Otavio Salvador (2):
  shadow-native: use 'users' group by default
  shadow: use 'users' group by default

Paul Eggleton (4):
  classes/rootfs_*: fix splitting package dependency strings
  buildhistory_analysis: fix error when version specifier missing
  scripts/buildhistory-diff: add GitPython version check
  classes/license: fix manifest to work with deb

Richard Purdie (1):
  utils.bbclass: add helper function to add all multilib variants of a
    specific package

Saul Wold (4):
  xinetd: Update to 2.3.15
  curl: enable ssl support
  curl: Use gnutls for target and openssl for native
  foomatic: fix perl path for target

Scott Garman (1):
  kernel.bbclass: Copy bounds.h only if it exists, needed for 2.6.x.

Ting Liu (2):
  lsof: define linux C library type when using eglibc
  image_types.bbclass: redefine EXTRA_IMAGECMD_jffs2 to leverage
    siteinfo

Zhenhua Luo (2):
  linux-dtb: add multi-dtb build support
  task-core-sdk.bb: add libgomp and libgomp-dev by RECOMMENDS

 meta/classes/image_types.bbclass                   |    7 +-
 meta/classes/kernel.bbclass                        |    5 +
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/rootfs_deb.bbclass                    |    4 +-
 meta/classes/rootfs_ipk.bbclass                    |    4 +-
 meta/classes/utils.bbclass                         |    9 ++
 meta/lib/oe/buildhistory_analysis.py               |    2 +-
 meta/lib/oe/packagedata.py                         |    8 ++
 meta/recipes-bsp/u-boot/u-boot.inc                 |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |    2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   22 +++-
 meta/recipes-core/tasks/task-core-sdk.bb           |    6 +-
 .../recipes-core/tasks/task-core-tools-testapps.bb |    1 +
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 +
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    7 ++
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |    4 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   13 +++
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    3 +-
 .../openjade/openjade-native_1.3.2.bb              |    2 +-
 .../perl/libxml-parser-perl_2.41.bb                |   11 +-
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 +++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 .../tcl/fix_issue_with_old_distro_glibc.patch      |  109 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    5 +-
 meta/recipes-extended/augeas/augeas.inc            |    2 +-
 .../foomatic/foomatic-filters_4.0.7.bb             |    3 +-
 meta/recipes-extended/lsof/lsof_4.85.bb            |    7 +-
 .../shadow/shadow-native_4.1.4.3.bb                |    5 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 .../xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb}  |    6 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +-
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++
 meta/recipes-kernel/dtc/dtc.inc                    |    4 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   36 +++++--
 meta/recipes-support/curl/curl_7.24.0.bb           |   11 +-
 scripts/buildhistory-diff                          |    8 +-
 38 files changed, 362 insertions(+), 52 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
 create mode 100644 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
 rename meta/recipes-extended/xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb} (90%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch

-- 
1.7.9.5



