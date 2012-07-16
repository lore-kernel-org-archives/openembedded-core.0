Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhJ-0006sq-1y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:58:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443296"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:06 -0700
Message-Id: <cover.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/30] Fixes and Updates
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
X-List-Received-Date: Mon, 16 Jul 2012 15:58:57 -0000

Richard,

This is a load of tested changes from the last week. It's
been a long time coming since I had tried to pull in Khem's
Eglibc changes with Nitin's automake changes.

I have seperated those out and will test them again as they
were a bit of a moving target last week.

I did have to tweak on of your patches as it did not apply 
correctly.

I have also started to add my own Signed-off-by as noted by a 
couple of people that I should be doing that.

Thanks
	Sau!


The following changes since commit 1b40dac2c501ae8c8d812cf2866fe7917f144a19:

  perf: add perl, python to DEPENDS (2012-07-12 12:51:21 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Amy Fong (1):
  package install failure on systems without /sbin/ldconfig

Andrei Gherzan (3):
  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
    data to file
  image_types.bbclass: Add XZ variable to set number of threads to be
    used while compressing
  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6

Bogdan Marinescu (3):
  linux-libc-headers: updated to 3.4.3
  python-dbus: upgrade to 1.1.0
  gmp: upgrade to 5.0.5

Dennis Lan (1):
  runqemu/mips: adjust runqemu script to support mipsel machine

Khem Raj (4):
  runqemu: Fix running qemu when build without gl
  mirrors: Add debian archive snapshot mirrors to search list
  gdb: Replace struct siginfo with proper siginfo_t
  busybox: Include sys/resource.h for rusage definition

Koen Kooi (1):
  xz: update to 5.1.2alpha

Martin Jansa (1):
  conf/machine: replace TUNE_CONFLICTS with TUNECONFLICTS

Matthew McClintock (2):
  rpm_5.4.9.bb: fix builds on systems with older libc
  sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to
    be defined

Paul Eggleton (1):
  classes/rootfs_deb: use more reliable check for package existence

Peter Seebach (1):
  package.bbclass: Allow overriding of debugedit starting path

Raymond Danks (1):
  mkelfimage: Upstream fixed packaging issue so upgrade to e1e6a91

Richard Purdie (4):
  gconf: Disable gtk support
  sstate.bbclass: Move crosssdk before cross to ensure correct
    variables are set
  python: Fix python-nativesdk variable contamination issue
  crosssdk/nativesdk: Ensure EXTRA_OECONF_FPU is unset

Ross Burton (1):
  base.bbclass: add GNUmakefile to the list of possible makefile names

Roy.Li (1):
  slang: change char type to signed char in macros

Saul Wold (2):
  Update proto -> protocol for recipes
  puzzles: convert to use SVN

Ting Liu (1):
  lsof: define linux C library type when using eglibc

Xin Ouyang (1):
  cpan.bbclass: Fix CCFLAGS.

Zhenhua Luo (1):
  task-core-sdk.bb: add libgomp and libgomp-dev by RECOMMENDS

 meta/classes/base.bbclass                          |    2 +-
 meta/classes/cpan.bbclass                          |    3 +-
 meta/classes/crosssdk.bbclass                      |    3 +
 meta/classes/image_types.bbclass                   |    5 +-
 meta/classes/mirrors.bbclass                       |    4 +-
 meta/classes/nativesdk.bbclass                     |    1 +
 meta/classes/package.bbclass                       |    6 +-
 meta/classes/rootfs_deb.bbclass                    |    2 +-
 meta/classes/sstate.bbclass                        |    4 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |    2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |    2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    2 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    2 +-
 .../busybox/busybox-1.19.4/sys_resource.patch      |   99 +++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   22 +-
 meta/recipes-core/tasks/task-core-sdk.bb           |    6 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    3 +-
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 ++++++++++++++++++++
 .../installer/adt-installer_1.0.bb                 |    2 +-
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    2 +-
 .../{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} |    6 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 meta/recipes-devtools/rpm/rpm/dbconvert.patch      |   27 ++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 meta/recipes-extended/lsof/lsof_4.85.bb            |    7 +-
 ...change-char-type-to-signed-char-in-macros.patch |  202 ++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 .../xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb}      |    7 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    8 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 +
 .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 -
 meta/recipes-sato/puzzles/puzzles_r9561.bb         |   12 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +-
 .../gmp/{gmp_5.0.4.bb => gmp_5.0.5.bb}             |    5 +-
 scripts/runqemu                                    |   19 +-
 scripts/runqemu-internal                           |   30 ++-
 49 files changed, 861 insertions(+), 88 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
 rename meta/recipes-devtools/python/{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} (82%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
 create mode 100644 meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
 rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} (86%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
 rename meta/recipes-support/gmp/{gmp_5.0.4.bb => gmp_5.0.5.bb} (72%)

-- 
1.7.7.6



