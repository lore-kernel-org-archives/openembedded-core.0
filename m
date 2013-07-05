Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6848B6B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059501"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:27 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:25 +0300
Message-Id: <b9fda0a395827f8e907f302ceb4c22e372da9d98.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 08/10] libxv: Updated from 1.0.8 to 1.0.9
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:27 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../recipes-graphics/xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb
index 1654bb8..f46bc2d 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.9.bb
@@ -12,9 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=827da9afab1f727f2a66574629e0f39c"
 
 DEPENDS += "libxext videoproto"
 
-PR = "r0"
-
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "224dadca53d9c88f8a2b8945babcea70"
-SRC_URI[sha256sum] = "4f00eb5347390909cea4e53a69425839d2a6a44e0e0613321d59e7e4aeaf73d7"
+SRC_URI[md5sum] = "3f642e1d868a2289769b983cf346e7bb"
+SRC_URI[sha256sum] = "a874dbf864d0271bbe795af67ef5b3f20096c92fc11eacbf0d2af00e32bc5b4b"
-- 
1.7.10.4


