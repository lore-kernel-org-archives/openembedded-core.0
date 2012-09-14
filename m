Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCQ8q-0005HX-Rh
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 09:16:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 00:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,421,1344236400"; d="scan'208";a="192663550"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 00:04:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 00:04:08 -0700
Message-Id: <cover.1347605994.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/26] Update Fixes (cover only)
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
X-List-Received-Date: Fri, 14 Sep 2012 07:16:45 -0000

Richard,

THis is a continuation of yesterday's Fix list. It includes
some patches for some AB related issues such as the MPC8315 
and Multilib (really license.bbclass failure).

I have also included the patch you suggested for the SRCPV 
issue in sstate hash, it does change now, that commit message
might need somemore info from you since I just tried it.

Hope you can pull most of these during your day!

Sau!

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:

  rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  libffi upgrade to 3.0.11

Andrei Gherzan (2):
  image_types.bbclass: Round up ROOTFS_SIZE after base_size check
  taglib: Update to v1.8

Bruce Ashfield (3):
  kernel-yocto: fix kernel configuration audit for custom yocto kernels
  linux-yocto: virtio and KVM guest configuration
  linux-yocto/3.4: make uprobes select perf events

Constantin Musca (1):
  patch.bbclass: Use one TMPDIR per patching process

Jack Mitchell (1):
  git: define NO_PYTHON=1 to stop git requiring python as a dependancy

Khem Raj (4):
  kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
  uclibc: Revert systemd regressing patch from upsteam uclibc and uprev
    SRCREV
  runqemu: Explicitly specify MACHINE when calling bitbake
  binutils-2.22: Backport PR fixes from 2.22 branch

Matthew McClintock (1):
  valgrind_3.7.0.bb: fix missing leading space on _append

Paul Eggleton (3):
  gst-fluendo-mpegdemux: add LICENSE_FLAGS
  scripts/combo-layer: use last_revision if specified in init
  scripts/combo-layer: ensure we validate branch/revision on init

Peter Seebach (1):
  pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems

Richard Purdie (1):
  opkg: Fix package dependency issue for preinsts

Ross Burton (4):
  connman: remove trailing whitespace
  librsvg: --disable-gnome-vfs doesn't exist anymore, remove
  librsvg: remove spurious popt dependency
  libx11: update patch to a backport from upstream git

Saul Wold (4):
  oprofileui: Add Icons to oprofileui-viewer package
  kernelshark: add missing ${D}
  license: Ensure we find multilib packages also
  bitbake.conf: Assign SRCPV so that it will be tracked in siginfo

 meta/classes/image_types.bbclass                   |    6 +-
 meta/classes/kernel-arch.bbclass                   |   13 +
 meta/classes/kernel-yocto.bbclass                  |    7 +-
 meta/classes/kernel.bbclass                        |   16 +-
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/module-base.bbclass                   |   16 -
 meta/classes/patch.bbclass                         |   11 +
 meta/conf/bitbake.conf                             |    1 +
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 ++
 meta/recipes-devtools/binutils/binutils-2.22.inc   |   16 +-
 ...print_insn_micromips-Rename-local-variabl.patch |  634 +++
 .../binutils/binutils/0019-PR-ld-13468.patch       |   46 +
 .../binutils/0028-Backport-from-mainline.patch     |  139 +
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |   47 +
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |  214 +
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch | 1068 ++++
 ...opy-from-mainline-to-binutils-2.22-branch.patch | 1944 +++++++
 ...elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch |   49 +
 .../binutils/binutils/0052-gas.patch               |   83 +
 ...55-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch |  176 +
 .../binutils/binutils/0078-PR-binutils-13622.patch |   48 +
 .../binutils/0144-timer.cc-include-unistd.h.patch  |   32 +
 ...-2012-04-27-Doug-Kwan-dougkwan-google.com.patch |  169 +
 .../binutils/binutils/0182-PR-ld-13991.patch       | 1617 ++++++
 meta/recipes-devtools/git/git.inc                  |    6 +-
 .../opkg/opkg/fix_installorder.patch               |    2 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |    8 +
 meta/recipes-devtools/pseudo/pseudo_1.4.bb         |    8 -
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    4 +-
 .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 +
 .../libffi/{libffi_3.0.10.bb => libffi_3.0.11.bb}  |    9 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    6 +-
 .../xorg-lib/libx11/keysymdef_include.patch        |   35 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   14 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    4 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    5 +-
 .../gstreamer/gst-fluendo-mpegdemux_0.10.71.bb     |    1 +
 .../taglib/taglib-1.6.3/configuretweak.patch       |   73 -
 .../taglib/taglib-1.6.3/nolibtool.patch            | 5916 --------------------
 .../taglib/{taglib_1.6.3.bb => taglib_1.8.bb}      |   17 +-
 scripts/combo-layer                                |   31 +-
 scripts/runqemu                                    |    2 +-
 48 files changed, 6902 insertions(+), 6108 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0006-mips-dis.c-print_insn_micromips-Rename-local-variabl.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-PR-ld-13468.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0036-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0037-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0038-Copy-from-mainline-to-binutils-2.22-branch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0039-emulparams-elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0052-gas.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0055-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0078-PR-binutils-13622.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0144-timer.cc-include-unistd.h.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0182-PR-ld-13991.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb
 create mode 100644 meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
 rename meta/recipes-gnome/libffi/{libffi_3.0.10.bb => libffi_3.0.11.bb} (72%)
 delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
 delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
 rename meta/recipes-support/taglib/{taglib_1.6.3.bb => taglib_1.8.bb} (56%)

-- 
1.7.7.6



