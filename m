Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcP-0000tx-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584234"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:27 -0700
Message-Id: <cover.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL [v2] 00/14] Updated with more Fixes
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:02 -0000

Richard,

Here is a second larger collection of patches from 
the team.

This set address at least 10 of the 1.2 bugs.

Sau!

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (1):
  package.bbclass: needs_ldconfig from linux_so is needed in global
    namespace

Darren Hart (4):
  create-pull-request: Assume remote branch from local branch
  grub-efi: Include GPT partition EXT FS support
  syslinux: Update distro-tracking fields
  hello-mod: Move hello-mod from meta to meta-skeleton

Joshua Lock (1):
  mesa-common: package gl.pc in libgl-dev

Lianhao Lu (1):
  adt-installer: Fixed ppc kernel naming.

Martin Jansa (1):
  gdb: add --with-libexpat-prefix

Robert Yang (2):
  git 1.7.7: remove perl.mak before compile
  meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64

Saul Wold (1):
  at: Fix origin location of install pam.conf from from ${P} -> ${BP}

Scott Garman (1):
  shadow-native: disable logging to syslog

Xiaofeng Yan (1):
  opkg: Add the condition for the content of arch.conf when enable
    multilib

Zhai Edwin (1):
  qemu: Fix gl failure from 64b target on 32b host

 .../recipes-kernel/hello-mod/files/COPYING         |    0
 .../recipes-kernel/hello-mod/files/Makefile        |    0
 .../recipes-kernel/hello-mod/files/hello.c         |    0
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    0
 meta/classes/package.bbclass                       |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |    5 +-
 meta/conf/distro/include/tcmode-default.inc        |    4 +-
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 +-
 meta/recipes-devtools/git/git.inc                  |    6 ++
 .../installer/adt-installer/adt_installer          |    4 +-
 .../installer/adt-installer/adt_installer.conf     |   20 +++---
 .../installer/adt-installer_1.0.bb                 |    2 +-
 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++-
 .../qemu/qemu-0.15.1/opengl-args-copy-fix.patch    |   66 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 meta/recipes-extended/at/at_3.1.13.bb              |    4 +-
 .../shadow/files/disable-syslog.patch              |   34 ++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    5 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 scripts/create-pull-request                        |   11 +++-
 21 files changed, 153 insertions(+), 32 deletions(-)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/COPYING (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/Makefile (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/hello.c (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/hello-mod_0.1.bb (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch
 create mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch

-- 
1.7.7.6



