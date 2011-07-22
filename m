Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABc-0008Se-4b
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084121"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:48 -0700
Message-Id: <cover.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/16] July 22, 2011
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:16 -0000

Richard,

This contains more uclibc updates from Khem along with Bruce's
3.0 Updates.

There are a couple of small updates for .gitignore and other recipes.

Thanks
	Sau!


The following changes since commit f175e4f28aa835abef8c3d5e2065054416692418:

  libiconv: Fix build failure on 1.13.1 (2011-07-21 22:50:06 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (4):
  linux-yocto: kernel-3.0 support recipe
  kernel: copy defconfig to {B} vs {S}
  linux-yocto: update LICENSE to GPLv2
  kern-tools: update SRCREV

Khem Raj (6):
  mesa-xlib, mesa-dri: Probe for newlocale() before using it.
  task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
  uclibc: Add patch header for sync_file_range2.patch
  strace: Define own sigmask macro if not defined already in signal.h
  util-linux: Replace sigsetmask with posix compliant functions
  tclibc-uclibc: Fix TARGET_OS for powerpc

Kumar Gala (1):
  .gitignore: Update build ignores to have wildcard

Mei Lei (1):
  dhcp: Fix libdir issue for multilib

Nitin A Kamble (3):
  glib-2.0: fix a compilation issue due to dtrace
  python: fix security vulnerability
  fix Upstream-Status line for few patches

Saul Wold (1):
  default-versions: Update pulseaudio as arm no longer needs a seperate
    backport

 .gitignore                                         |   12 +-
 meta/classes/kernel-yocto.bbclass                  |    6 -
 meta/classes/kernel.bbclass                        |    4 +-
 meta/conf/distro/include/default-versions.inc      |    4 +-
 meta/conf/distro/include/tclibc-uclibc.inc         |    2 +-
 .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |   14 +-
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |    3 +-
 meta/recipes-core/tasks/task-core-tools.bb         |   11 +-
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |    7 +
 .../util-linux-2.19.1/remove_sigsetmark.patch      |   35 ++++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    3 +-
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |    2 +-
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |    2 +-
 .../elfutils/elfutils/fix_for_gcc-4.7.patch        |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/security_issue_2254_fix.patch    |  184 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    1 +
 .../strace/strace-4.5.20/sigmask.patch             |   22 +++
 meta/recipes-devtools/strace/strace_4.5.20.bb      |    6 +-
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch   |   40 +++++
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    6 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    5 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   47 +++++
 27 files changed, 387 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch
 create mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch
 create mode 100644 meta/recipes-devtools/strace/strace-4.5.20/sigmask.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb

-- 
1.7.3.4



