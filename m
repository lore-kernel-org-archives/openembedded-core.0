Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7A02173BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 10:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2015 03:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="765568294"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2015 03:56:34 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 13:56:42 +0300
Message-Id: <cover.1437043973.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/3] qemu upgrade to 2.4.0-rc0
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
X-List-Received-Date: Thu, 16 Jul 2015 10:56:38 -0000

There is a long list of issues affecting qemu 2.3.0 (current version) in
combination with tests performed on YP autobuilders, situation that seriously
impacts the way our project evolves and can be managed.
As such, we are proposing an upgrade to qemu 2.4.0 RC0, as much better
behavior has been seen with this upgrade.

Patchset V3 adds a proper upgrade versioning scheme for qemu, so that
the upgrade to final version won't hinder the upgrade path for it.

Patchset V2 adds a better commit message for
"runqemu-internal: add temporary disk interface to qemuarm64" fix.

The following changes since commit ba07a69f3dc8fb798e372130bf665d059fed9d42:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:47:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/qemu-upg-3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/qemu-upg-3

Cristian Iorga (3):
  qemu: upgrade to 2.4.0-rc0
  runqemu-internal: add temporary disk interface to qemuarm64
  bitbake.conf: fix qemu user mode linux for qemuarm64

 meta/conf/bitbake.conf                             |  1 +
 meta/recipes-devtools/qemu/qemu.inc                |  3 --
 .../qemu/qemu/larger_default_ram_size.patch        | 22 ---------------
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           | 32 ----------------------
 meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb       | 22 +++++++++++++++
 scripts/runqemu-internal                           |  2 +-
 6 files changed, 24 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_2.3.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb

-- 
2.1.4


