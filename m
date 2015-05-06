Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2ABA73D48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:21:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2015 08:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="567210784"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 06 May 2015 08:21:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 18:21:45 +0300
Message-Id: <cover.1430925667.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] qemu 2.3.0 upgrade
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
X-List-Received-Date: Wed, 06 May 2015 15:21:50 -0000

The following changes since commit b2b59b14ecfe13ba794d92f97d1403d6503c7407:

  poky.conf: remove SVK mirror (2015-05-05 22:18:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/qemu-upg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=Ciorga/qemu-upg

Cristian Iorga (2):
  qemu: upgrade to 2.3.0
  runqemu-internal: correctly set format for root FS as raw

 ...-Arm-versatilepb-Add-memory-size-checking.patch | 22 ++++----
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch | 59 ----------------------
 .../qemu/{qemu_2.2.0.bb => qemu_2.3.0.bb}          |  5 +-
 scripts/runqemu-internal                           |  4 +-
 5 files changed, 17 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
 rename meta/recipes-devtools/qemu/{qemu_2.2.0.bb => qemu_2.3.0.bb} (76%)

-- 
2.1.0


