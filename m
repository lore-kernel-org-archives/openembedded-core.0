Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgM-0000J5-Sm
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860436"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:00 -0700
Message-Id: <c4c23693cfeb1bd3a823899c1a6939c195533f5e.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:24:18 +0800
Date: Thu, 12 May 2011 19:00:57 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 09/54] matchbox-desktop: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:52 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../files/dso_linking_change_build_fix.patch       |    2 ++
 .../matchbox-desktop/files/window-resize-fix.patch |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
index 54f3670..0edb55e 100644
--- a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
@@ -11,6 +11,8 @@ This patch avoids this linking error:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
+
 Index: matchbox-desktop-2/configure.ac
 ===================================================================
 --- matchbox-desktop-2.orig/configure.ac
diff --git a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
index 87fbd50..8970ac8 100644
--- a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
+++ b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
@@ -16,6 +16,8 @@ Date:   Sun Mar 6 17:58:45 2011 +0800
     
     Signed-off-by: Yu Ke <ke.yu@intel.com>
 
+Upstream-Status: Pending
+
 diff --git a/src/desktop.c b/src/desktop.c
 index d4fc2fb..5aa2cfc 100644
 --- a/src/desktop.c
-- 
1.7.1



