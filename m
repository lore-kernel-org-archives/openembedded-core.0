Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EACF860655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:58:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973325"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:37 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:39 +0300
Message-Id: <88e1f142e7682941abc00e5ed5666e4cedebe624.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] libxtst: Updated from 1.2.1 to 1.2.2
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
X-List-Received-Date: Fri, 28 Jun 2013 15:58:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

License md5 changed in 1.2.2, "Copyright © 1992 by UniSoft Group Ltd.",
"Copyright © 1992, 1994, 1995 X Consortium" and Copyright 1994 Network
Computing Devices, Inc. has been added
---
 .../xorg-lib/{libxtst_1.2.1.bb => libxtst_1.2.2.bb}              |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.1.bb => libxtst_1.2.2.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
index 88ba088..d87bd6e 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
@@ -7,7 +7,7 @@ extensions required to completely test the X11 server with no user \
 intervention."
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cba677ca25c42ad29ee8ff351b50ece8 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=bb4f89972c3869f617f61c1a79ad1952 \
                     file://src/XTest.c;beginline=2;endline=32;md5=b1c8c9dff842b4d5b89ca5fa32c40e99"
 
 DEPENDS += "libxext recordproto inputproto libxi"
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXtst"
 
-SRC_URI[md5sum] = "e8abc5c00c666f551cf26aa53819d592"
-SRC_URI[sha256sum] = "7eea3e66e392aca3f9dad6238198753c28e1c32fa4903cbb7739607a2504e5e0"
+SRC_URI[md5sum] = "25c6b366ac3dc7a12c5d79816ce96a59"
+SRC_URI[sha256sum] = "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c8309f6d9"
-- 
1.7.10.4


