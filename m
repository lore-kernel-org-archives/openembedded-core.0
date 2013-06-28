Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 596AD6041E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:53:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973238"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:24 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:33 +0300
Message-Id: <9057f3b6744e02fd322eba1d9ea756dd7da5f03f.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 01/12] libxext: Update from 1.3.1 to 1.3.2
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
X-List-Received-Date: Fri, 28 Jun 2013 15:53:26 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

Line "Copyright (c) 1999, 2005, 2006, Oracle and/or its affiliates. All rights reserved."
in COPYING was changed into "Copyright (c) 1999, 2005, 2006, 2013, Oracle and/or its affiliates. All rights reserved."
in 1.3.2
---
 .../xorg-lib/{libxext_1.3.1.bb => libxext_1.3.2.bb}             |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.1.bb => libxext_1.3.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.2.bb
index 82333dd..ec66175 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.2.bb
@@ -11,17 +11,16 @@ extensions."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f69eb72f85ce548e12791d049d81bc52"
+LIC_FILES_CHKSUM = "file://COPYING;md5=879ce266785414bd1cbc3bc2f4d9d7c8"
 
 DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
 PROVIDES = "xext"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXext"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "71251a22bc47068d60a95f50ed2ec3cf"
-SRC_URI[sha256sum] = "56229c617eb7bfd6dec40d2805bc4dfb883dfe80f130d99b9a2beb632165e859"
+SRC_URI[md5sum] = "4376101e51bb2c6c44d9ab14344e85ad"
+SRC_URI[sha256sum] = "f829075bc646cdc085fa25d98d5885d83b1759ceb355933127c257e8e50432e0"
-- 
1.7.10.4


