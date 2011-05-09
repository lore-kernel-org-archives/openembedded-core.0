Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUB-0003hN-AA
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2011 23:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="432782634"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2011 23:59:45 -0700
Message-Id: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Sun, 8 May 2011 23:57:03 -0700
Date: Sun, 08 May 2011 23:59:45 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/20] Consolidated Pull for 5/8/2011
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
X-List-Received-Date: Mon, 09 May 2011 07:02:31 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

Here is a batch of changes from last week.

This contains a fix for gnu-config that is a workaround
for a Bernard Bug that we need to back port.

I have test built for x86, arm and the toolchains

Sau!




Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Darren Hart (1):
  u-boot: correct COPYING MD5SUM

Dexuan Cui (1):
  gnu-config-native: add dependency on perl-native

Khem Raj (2):
  conf/layer.conf: Use .= to append to BBPATH and += for BBFILES
  gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF
    instead of +=

Koen Kooi (2):
  git: make it work on the target
  package.bbclass: convert unpackaged file message from 'info' to
    'warn' so that it shows up on the console

Nitin A Kamble (8):
  libpcre: update upstream status for patches
  patch-2.6.1: update patch upstream status
  patch: update upstream status for patches
  python-imaging: update upstream status for patches
  subversion: update upstream status for patches
  sat-solver: fix compilation issue with gcc 4.6.0
  gcc-4.5.1: update upstream status of patches
  binutils: update upstream status of patches

Saul Wold (2):
  clutter-gst-1.4: Add missing patch
  gtkhtml2, web: Sync version for API Change

Tom Rini (4):
  gcc-package-target: Switch to TARGET_PREFIX in symlinks
  binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
  sysstat.inc: Switch to inherit gettext
  bash.inc: Add bison-native to DEPENDS

 meta/classes/gettext.bbclass                       |    6 +-
 meta/classes/package.bbclass                       |    4 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/layer.conf                               |    5 +-
 meta/recipes-bsp/uboot/u-boot_git.bb               |    4 +-
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    2 +
 .../binutils-2.21/binutils-2.19.1-ld-sysroot.patch |    2 +
 .../binutils/binutils-2.21/binutils-poison.patch   |    2 +
 .../binutils-uclibc-100-uclibc-conf.patch          |    2 +
 meta/recipes-devtools/binutils/binutils.inc        |   10 +-
 .../gcc/gcc-4.5.1/100-uclibc-conf.patch            |    2 +
 .../gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch |    2 +
 .../gcc/gcc-4.5.1/200-uclibc-locale.patch          |    2 +
 .../gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch    |    2 +
 .../gcc-4.5.1/204-uclibc-locale-wchar_fix.patch    |    2 +
 .../gcc/gcc-4.5.1/205-uclibc-locale-update.patch   |    2 +
 .../gcc/gcc-4.5.1/301-missing-execinfo_h.patch     |    2 +
 .../gcc/gcc-4.5.1/302-c99-snprintf.patch           |    2 +
 .../gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch  |    2 +
 .../gcc/gcc-4.5.1/304-index_macro.patch            |    2 +
 .../gcc-4.5.1/305-libmudflap-susv3-legacy.patch    |    2 +
 .../gcc/gcc-4.5.1/306-libstdc++-namespace.patch    |    2 +
 .../gcc/gcc-4.5.1/307-locale_facets.patch          |    2 +
 .../gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch |    2 +
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |    2 +
 .../gcc/gcc-4.5.1/740-sh-pr24836.patch             |    2 +
 .../gcc/gcc-4.5.1/800-arm-bigendian.patch          |    2 +
 .../gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch |    2 +
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +
 .../gcc/gcc-4.5.1/arm-nolibfloat.patch             |    2 +
 .../gcc/gcc-4.5.1/arm-softfloat.patch              |    2 +
 meta/recipes-devtools/gcc/gcc-package-target.inc   |   10 +-
 meta/recipes-devtools/git/git.inc                  |   32 +++++-
 meta/recipes-devtools/git/git_1.7.4.3.bb           |    2 +-
 .../gnu-config/config-guess-uclibc.patch           |    2 +
 .../gnu-config/gnu-config_20080123.bb              |    6 +-
 .../patch/patch-2.6.1/global-reject-file.diff      |    2 +
 meta/recipes-devtools/patch/patch/debian.patch     |    2 +
 .../patch/patch/global-reject-file.diff            |    2 +
 meta/recipes-devtools/patch/patch/install.patch    |    2 +
 .../patch/patch/unified-reject-files.diff          |    2 +
 .../python/python-imaging/path.patch               |    2 +
 .../subversion/disable-revision-install.patch      |    2 +
 .../subversion/subversion/libtool2.patch           |    2 +
 .../subversion/subversion/neon-detection.patch     |    2 +
 meta/recipes-extended/bash/bash.inc                |    2 +-
 .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |  115 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    5 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    4 +-
 meta/recipes-extended/sysstat/sysstat_9.1.5.bb     |    2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 .../clutter/clutter-gst/enable_tests-1.4.patch     |   15 +++
 meta/recipes-sato/web/web_svn.bb                   |    2 +-
 .../libpcre/files/fix-pcre-name-collision.patch    |    1 +
 .../recipes-support/libpcre/files/pcre-cross.patch |    2 +
 55 files changed, 267 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch



