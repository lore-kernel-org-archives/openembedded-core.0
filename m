Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgd-0000Rv-6q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704391"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:20 -0700
Message-Id: <350345f916e1e04b86451922aa5f6c43936ab3bb.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:15:05 +0800
Date: Thu, 12 May 2011 19:01:18 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 25/54] eee-acpi-scripts: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:08 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../eee-acpi-scripts/files/powerbtn.patch          |    2 ++
 .../eee-acpi-scripts/files/remove-doc-check.patch  |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch b/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
index 3f79c3e..403e556 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
+++ b/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
@@ -3,6 +3,8 @@
  events/powerbtn  |    2 ++
  2 files changed, 5 insertions(+)
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: git/events/powerbtn
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
index 3e80b7f..fc2c291 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
+++ b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
@@ -5,6 +5,8 @@
  actions/volume.sh     |    3 ---
  4 files changed, 12 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/eeepc-acpi-scripts/hotkey.sh
 ===================================================================
 --- git.orig/eeepc-acpi-scripts/hotkey.sh	2010-11-28 16:02:17.000000000 +0800
-- 
1.7.1



