Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7676AB81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 17:07:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2013 10:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,953,1363158000"; d="scan'208";a="360592375"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.111])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2013 10:07:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 10:07:21 -0700
Message-Id: <cover.1372352179.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/24] Update GCC to 4.8 & misc fixes
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
X-List-Received-Date: Thu, 27 Jun 2013 17:07:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Richard,

This pulls the big switch for GCC 4.8!

There are a number of other smaller patches.

Sau!

The following changes since commit 099063f353a7a18720c92d87400726a49eed432f:

  sanity.bbclass: Fix COREBASE sanity tests (2013-06-27 12:48:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Adrian Dudau (1):
  dbus-ptest: Install missing files

Alex Olson (1):
  udev: only use devtmpfs for udev

Björn Stenberg (1):
  bzip2: Add ptest

Bruce Ashfield (4):
  linux-yocto/3.4: allow kernel feature _appends to be overriden
  linux-yocto/3.8: add USB screen configuration and net sched options
  linux-yocto/3.4: ltsi: sync to LTSI commit 5f05247ed
  linux-yocto-dev: bump version to 3.10+

Enrico Scholz (1):
  image_types.bbclass: set 'filetype' ext4 feature

Hongxu Jia (5):
  init-live.sh: fix automount failed occasionally
  lsbtest: sync test suite packages version
  adt_installer_internal: fix perl modules relocated failed on older
    distributions
  adt_installer_internal:fix perl lib version mismatch
  adt_installer_internal:add sudo when permission deny on installation
    directory

Jonathan Liu (1):
  libx11: enable Xcms by default

Khem Raj (1):
  gcc-4.8: Fix ICE on ppc/spe targets

Mark Hatle (1):
  sanity.bbclass: Check for the known broken version of make

Martin Jansa (1):
  boost: Limit PARALLEL_MAKE by -j 64

Mikhail Durnev (2):
  shadow-native: Add --root option in groupmems
  useradd.bbclass: Add members to a group

Otavio Salvador (1):
  alsa-tools: Pass ACLOCAL_FLAGS so aclocal uses the right params

Roy.Li (1):
  autotools.bbclass: force copy Makefile.in.in to ${S}/po/

Saul Wold (2):
  systemd: Ensure that we mount devtmpfs
  tcmode-default: Set GCC 4.8 as default

Zhenhua Luo (1):
  groff: correct the install path of man.local

 meta/classes/autotools.bbclass                     |  2 +-
 meta/classes/image_types.bbclass                   |  2 +-
 meta/classes/sanity.bbclass                        | 37 +++++++++++
 meta/classes/useradd.bbclass                       | 68 ++++++++++++++++++--
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 meta/recipes-core/dbus/dbus-1.6.8/ptest.patch      | 20 ++++--
 meta/recipes-core/dbus/dbus-ptest_1.6.8.bb         |  1 +
 meta/recipes-core/initrdscripts/files/init-live.sh |  4 +-
 meta/recipes-core/systemd/systemd/init             |  6 +-
 meta/recipes-core/udev/udev/init                   |  6 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  5 +-
 ....8-PR56797.patch => 0037-gcc-4.8-PR56797.patch} |  0
 ...ld-args.patch => 0038-gcc-4.8-build-args.patch} |  0
 .../gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch         | 23 +++++++
 .../adt-installer/scripts/adt_installer_internal   | 15 +++--
 .../recipes-extended/bzip2/bzip2-1.0.6/Makefile.am | 30 +++++++++
 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest  |  2 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  7 +-
 ...off-1.22.2-correct-man.local-install-path.patch | 32 +++++++++
 meta/recipes-extended/groff/groff_1.22.2.bb        |  6 +-
 meta/recipes-extended/lsb/lsbtest/packages_list    | 38 +++++------
 .../shadow/files/add_root_cmd_groupmems.patch      | 75 ++++++++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |  1 +
 .../recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |  2 +
 meta/recipes-graphics/xorg-lib/libx11.inc          |  4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 17 ++---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |  2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |  2 +-
 meta/recipes-support/boost/boost.inc               | 18 +++++-
 34 files changed, 370 insertions(+), 69 deletions(-)
 rename meta/recipes-devtools/gcc/gcc-4.8/{gcc-4.8-PR56797.patch => 0037-gcc-4.8-PR56797.patch} (100%)
 rename meta/recipes-devtools/gcc/gcc-4.8/{gcc-4.8-build-args.patch => 0038-gcc-4.8-build-args.patch} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest
 create mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
 create mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch

-- 
1.8.1.4


