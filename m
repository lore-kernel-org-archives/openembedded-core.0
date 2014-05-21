Return-Path: <valentin.popa@intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE6D6AE86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:50:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 May 2014 09:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="535554005"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 09:50:30 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 19:50:00 +0300
Message-Id: <8ffea2ad4055c2c673f0c3404d6c473c4a8c48a0.1400690725.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
Subject: [PATCH 2/4] libxshmfence: add it to oe-core
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
X-List-Received-Date: Wed, 21 May 2014 16:50:55 -0000

mesa 10+ depends on this (if the user builds mesa
with dri3 support enabled). So add it to oe-core.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
new file mode 100644
index 0000000..7dff0d4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Shared memory 'SyncFence' synchronization primitive"
+
+DESCRIPTION = "This library offers a CPU-based synchronization primitive compatible \
+with the X SyncFence objects that can be shared between processes \
+using file descriptor passing."
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
+
+DEPENDS += "virtual/libx11"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "2dd10448c1166e71a176206a8dfabe6d"
+SRC_URI[sha256sum] = "dbc2db2925ca9f216fd1e9c63d0974db9f4d49aaf5877ffb606d2d8d7e58cebe"
-- 
1.9.1


