Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C5E636E890
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 06:52:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Feb 2014 22:52:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,517,1389772800"; d="scan'208";a="485317018"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2014 22:52:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 22:52:02 -0800
Message-Id: <cover.1392965335.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/10] Mostly Bugfixes
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
X-List-Received-Date: Fri, 21 Feb 2014 06:52:07 -0000

Richard,

Ran this through the AB with Khem's systemd 209, but it had issues, so 
sending you a sub-set of what was in MUT.

Sau!


The following changes since commit 43ac6e3216c5d985d6f90a28e727e397df616267:

  wic: Make exec_native_command() fail if a command isn't found (2014-02-20 14:28:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chong Lu (1):
  insserv: enable ptest support

Dave Lerner (1):
  valgrind: integration of regression tests to ptest

Fathi Boudra (1):
  git: update to 1.9.0 release

Kai Kang (1):
  update-rc.d.bbclass: fix inhibit check

Khem Raj (1):
  uclibc: Add new functionality needed for systemd 209

Koen Kooi (1):
  openssh: enable PAM at runtime based on DISTRO_FEATURES

Ross Burton (1):
  libglade: don't use gnome.bbclass

Saul Wold (2):
  runqemu: Ensure ROOTFS path is absolute
  psmisc: Update to 22.21

Valentin Popa (1):
  gtk+3: upgrade to 3.10.7

 meta/classes/update-rc.d.bbclass                   |   2 +-
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |   4 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
 .../0001-Add-eventfd_read-and-eventfd_write.patch  | 120 +++++++
 .../uclibc-git/0002-wire-setns-syscall.patch       |  68 ++++
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch | 377 +++++++++++++++++++++
 .../git/{git_1.8.5.2.bb => git_1.9.0.bb}           |   4 +-
 meta/recipes-devtools/insserv/files/run-ptest      |  17 +
 meta/recipes-devtools/insserv/insserv_1.14.0.bb    |  14 +-
 .../valgrind/valgrind/add-ptest.patch              | 205 +++++++++++
 .../valgrind/valgrind/force-nostabs.patch          |  42 +++
 .../valgrind/remove-arm-variant-specific.patch     |  67 ++++
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 ++++
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |  11 +
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  56 ++-
 .../psmisc/{psmisc_22.20.bb => psmisc_22.21.bb}    |   4 +-
 .../fix-build-when-wayland-backend-enabled.patch   |  43 +++
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |  32 --
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |  42 ---
 .../gtk+/{gtk+3_3.8.2.bb => gtk+3_3.10.7.bb}       |   9 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |   2 +-
 scripts/runqemu                                    |   4 +-
 22 files changed, 1111 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
 rename meta/recipes-devtools/git/{git_1.8.5.2.bb => git_1.9.0.bb} (67%)
 create mode 100644 meta/recipes-devtools/insserv/files/run-ptest
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 create mode 100755 meta/recipes-devtools/valgrind/valgrind/run-ptest
 rename meta/recipes-extended/psmisc/{psmisc_22.20.bb => psmisc_22.21.bb} (44%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.8.2.bb => gtk+3_3.10.7.bb} (61%)

-- 
1.8.3.1


