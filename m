Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgO-0000MC-G4
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860441"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:01 -0700
Message-Id: <6e4dd889c55032dbcbea293ee37a0515d679f42c.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:32:43 +0800
Date: Thu, 12 May 2011 19:00:58 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 10/54] matchbox-keyboard: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:53 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-keyboard/files/configure_fix.patch    |    2 ++
 .../matchbox-keyboard/files/single-instance.patch  |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch b/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
index 52cea0e..800bf3b 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
+++ b/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: matchbox-window-manager/configure.ac
 ===================================================================
 --- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
diff --git a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
index d0adc47..18b6c41 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
+++ b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
@@ -9,6 +9,7 @@ on demand.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
 
 Index: matchbox-keyboard/matchbox-keyboard.desktop
 ===================================================================
-- 
1.7.1



