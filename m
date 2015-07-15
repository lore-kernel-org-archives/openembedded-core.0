Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4C9675877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:17:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2015 06:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="606677307"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2015 06:17:14 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 16:16:59 +0300
Message-Id: <cover.1436965937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] qemu upgrade to 2.4.0-rc0
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
X-List-Received-Date: Wed, 15 Jul 2015 13:17:14 -0000

There is a long list of issues affecting qemu 2.3.0 (current version) in
combination with tests performed on YP autobuilders, situation that seriously
impacts the way our project evolves and can be managed.
As such, we are proposing an upgrade to qemu 2.4.0 RC0, as much better
behavior has been seen with this upgrade.
 
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
 meta/recipes-devtools/qemu/qemu.inc                |  3 ---
 .../qemu/qemu/larger_default_ram_size.patch        | 22 ----------------------
 .../qemu/{qemu_2.3.0.bb => qemu_2.4.0-rc0.bb}      | 15 ++-------------
 scripts/runqemu-internal                           |  2 +-
 5 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
 rename meta/recipes-devtools/qemu/{qemu_2.3.0.bb => qemu_2.4.0-rc0.bb} (42%)

-- 
2.1.4


