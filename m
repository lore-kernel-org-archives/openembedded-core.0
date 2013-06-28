Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6201C6A543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:55:01 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973256"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:28 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:34 +0300
Message-Id: <0d0fcde61d186951f5e408097c54c874ea0d52ab.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 02/12] libxcursor: Update from 1.1.13 to 1.1.14
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
X-List-Received-Date: Fri, 28 Jun 2013 15:55:01 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb}       |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
index 4388596..a8e4f24 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
@@ -14,10 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
 DEPENDS += "libxrender libxfixes"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "52efa81b7f26c8eda13510a2fba98eea"
-SRC_URI[sha256sum] = "f78827de4a1b7ce8cceca24a9ab9d1b1d2f6a61362f505166ffc19b07c0bad8f"
+SRC_URI[md5sum] = "1e7c17afbbce83e2215917047c57d1b3"
+SRC_URI[sha256sum] = "9bc6acb21ca14da51bda5bc912c8955bc6e5e433f0ab00c5e8bef842596c33df"
-- 
1.7.10.4


