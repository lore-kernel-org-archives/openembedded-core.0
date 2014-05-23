Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 463E06B8B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 17:48:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2014 10:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="545646110"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.174])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2014 10:48:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 10:48:09 -0700
Message-Id: <cover.1400867127.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/18] More patches!
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
X-List-Received-Date: Fri, 23 May 2014 17:48:14 -0000

Richard,

We are catching up, here are some more patches and updates that
have been run throught the Autobuilder.
I am including Robert's initramfs chance as it's ok standalone,
I believe he will address the other parts of removing the 40_custom
next week.

Thanks
	Sau!
The following changes since commit f1727bb18f35ff01e53d3d442a6ff3c613639fa6:

  guile: Update to 2.0.11 version (2014-05-21 10:50:37 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cristian Iorga (1):
  bluez5: upgrade to 5.19

Peter Seebach (1):
  pseudo: handle fchmodat better, mask out unwanted write bits

Philip Balister (1):
  python-native : Add patch to fix configure error with gcc 4.8.

Richard Purdie (1):
  taglib: Force a disable of the floating dependency on boost

Robert Yang (1):
  initramfs-live-install: avoid using grub.d/40_custom

Ross Burton (1):
  perl: stop perl-modules recommending perl-ptest

Roy Li (2):
  lttng-tools: fix alignment issue
  babeltrace: fix alignment issue

Sebastian Wiegand (1):
  distro_features_check.bbclass: fix searching whole list

Tim Orling (4):
  mirrors.bbclass: add ${CPAN_MIRROR} option
  bitbake.conf: add default ${CPAN_MIRROR}
  wayland: upgrade to 1.5.0
  weston: upgrade to 1.5.0

Valentin Popa (4):
  dri3proto: add it to oe-core
  libxshmfence: add it to oe-core
  mesa: upgrade to 10.1.3
  eglinfo: updated to compile with mesa10+

yanjun.zhu (1):
  perl: fix for CVE-2010-4777

 meta/classes/distro_features_check.bbclass         |   6 +-
 meta/classes/mirrors.bbclass                       |   2 +
 meta/conf/bitbake.conf                             |   1 +
 meta/recipes-connectivity/bluez5/bluez5_5.18.bb    |   3 -
 meta/recipes-connectivity/bluez5/bluez5_5.19.bb    |   3 +
 .../initrdscripts/files/init-install.sh            |  15 ++-
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |  45 +++++++++
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |   3 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |  10 +-
 .../pseudo/files/pseudo-fchmodat-permissions.patch | 107 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |   3 +-
 .../recipes-devtools/python/python-native_2.7.3.bb |   1 +
 meta/recipes-graphics/eglinfo/eglinfo.inc          |   2 +-
 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |   0
 meta/recipes-graphics/mesa/mesa.inc                |  36 ++++---
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |   4 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   4 +-
 ...disable-macro-checks-not-used-for-scanner.patch |   2 +-
 .../wayland/wayland/just-scanner.patch             |  49 ----------
 .../wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} |   7 +-
 ...emove-dependence-on-wayland-scanner-flags.patch |  30 ------
 .../weston/disable-wayland-scanner-pkg-check.patch |  13 +++
 .../wayland/weston/make-lcms-configurable.patch    |  22 +++++
 .../wayland/{weston_1.4.0.bb => weston_1.5.0.bb}   |  13 ++-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb |  17 ++++
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  |  14 +++
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |  54 +++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |   4 +-
 ...nt-problems-on-targets-not-supporting-una.patch |  47 +++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb     |   1 +
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |   1 +
 meta/recipes-support/taglib/taglib_1.9.1.bb        |   2 +
 32 files changed, 396 insertions(+), 125 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.18.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.19.bb
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/just-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} (89%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.4.0.bb => weston_1.5.0.bb} (88%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch

-- 
1.8.3.1


