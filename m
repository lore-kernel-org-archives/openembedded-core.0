Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9A665F99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 14:59:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 07:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1044,1389772800"; d="scan'208";a="431533204"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 07:59:32 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 17:59:10 +0300
Message-Id: <0cec75215980adf042dba1e396ba10b9a235a587.1399993010.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
Subject: [PATCH 2/3] libxshmfence: add it to oe-core
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
X-List-Received-Date: Tue, 13 May 2014 14:59:34 -0000

mesa 10+ depends on this. So add it oe-core.

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


