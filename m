Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R4-0004yb-Io
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2011 08:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="17648285"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2011 08:48:53 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:31 +0800
Message-Id: <29f71487caaa430c4277c6cd4469b6d3c2599623.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 06/13] resourceproto: upgrade from 1.1.1 to the latest version 1.2.0
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:19 -0000

Update LIC_FILES_CHKSUM due to the only change:
+ Copyright (c) 2002  XFree86 Inc

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...sourceproto_1.1.1.bb => resourceproto_1.2.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{resourceproto_1.1.1.bb => resourceproto_1.2.0.bb} (61%)

diff --git a/meta/recipes-graphics/xorg-proto/resourceproto_1.1.1.bb b/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
similarity index 61%
rename from meta/recipes-graphics/xorg-proto/resourceproto_1.1.1.bb
rename to meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
index fa13970..92c37c6 100644
--- a/meta/recipes-graphics/xorg-proto/resourceproto_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
@@ -7,13 +7,13 @@ Resource extension.  XRes provides an interface that allows X clients to \
 see and monitor X resource usage of various clients."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=604859305e662503077240fee8c77d97"
 
 CONFLICTS = "resourceext"
 
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "8ff0525ae7502b48597b78d00bc22284"
-SRC_URI[sha256sum] = "8579818e99aa881c00c04eb5f96fcbeec463816ca8e3cda9d3d25562f7a4b8c6"
+SRC_URI[md5sum] = "cfdb57dae221b71b2703f8e2980eaaf4"
+SRC_URI[sha256sum] = "3c66003a6bdeb0f70932a9ed3cf57cc554234154378d301e0c5cfa189d8f6818"
 
-- 
1.7.1



