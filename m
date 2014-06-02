Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 29F6760196
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 13:29:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 06:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,957,1392192000"; d="scan'208";a="521453509"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 06:29:34 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 16:33:07 +0300
Message-Id: <cover.1401715767.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] qemu: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 02 Jun 2014 13:29:36 -0000

QEmu upgrade to 2.0.0

Tested with all qemu machines.

Due to updated SeaBIOS, for x86* architectures, 
a fix for v86d is also needed.

The following changes since commit ae642d3fadb83f641034148d833a5c1deb3a1f10:

  socat: upgrade to 1.7.2.4 (2014-06-01 14:30:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/qemu_upg_20
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/qemu_upg_20

Cristian Iorga (2):
  v86d: fix for SeaBIOS VGA BIOS compatibility
  qemu: upgrade to 2.0.0

 .../v86d/v86d/Update-x86emu-from-X.org.patch       | 21766 +++++++++++++++++++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |     3 +-
 .../recipes-devtools/qemu/qemu/fxrstorssefix.patch |    31 -
 .../qemu/{qemu_1.7.0.bb => qemu_2.0.0.bb}          |     9 +-
 4 files changed, 21772 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fxrstorssefix.patch
 rename meta/recipes-devtools/qemu/{qemu_1.7.0.bb => qemu_2.0.0.bb} (70%)

-- 
1.9.1


