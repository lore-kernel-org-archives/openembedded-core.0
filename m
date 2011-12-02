Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWJsc-0007AL-Dq
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:33:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 19:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="91362715"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2011 19:26:58 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:27:00 +0800
Message-Id: <fc31496239fe842ecd7017ac7228d554d25b175b.1322796369.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
Subject: [PATCH 1/3] libxfont: remove the unused no-scalable-crash.patch
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
X-List-Received-Date: Fri, 02 Dec 2011 03:33:42 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../xorg-lib/libxfont/no-scalable-crash.patch      |   24 --------------------
 1 files changed, 0 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch b/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
deleted file mode 100644
index b3c58af..0000000
--- a/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
---- /tmp/fontdir.c	2006-08-01 16:17:22.000000000 +0200
-+++ libXfont-1.2.0/src/fontfile/fontdir.c	2006-08-01 16:20:37.248306000 +0200
-@@ -695,6 +695,11 @@
-      */
-     if (isscale)
-     {
-+	/* If the fontname says it is scalable, make sure that the
-+  	 * renderer supports OpenScalable and GetInfoScalable.
-+	 */
-+       if (renderer->OpenScalable && renderer->GetInfoScalable)
-+       {
- 	if (vals.values_supplied & SIZE_SPECIFY_MASK)
- 	{
- 	    bzero((char *)&zeroVals, sizeof(zeroVals));
-@@ -794,6 +799,7 @@
-                                            bitmap->name.name);
-             }
- 	}
-+       }
-     }
-     return TRUE;
- }
-- 
1.7.6



