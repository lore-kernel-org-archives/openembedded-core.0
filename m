Return-Path: <ionutx.radu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1A76AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:48:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 07:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="375930870"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 07:48:50 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 17:51:07 +0300
Message-Id: <b7e0e3a2b3e7a485e80d3028a28bdcab1046941a.1374763279.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1374763279.git.ionutx.radu@intel.com>
References: <cover.1374763279.git.ionutx.radu@intel.com>
Subject: [v2 6/6] videoproto: Update from 2.3.1 to 2.3.2
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
X-List-Received-Date: Thu, 25 Jul 2013 14:48:50 -0000

LIC_FILES_CHECKSUM changed (some trailing spaces have been removed)

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-proto/{videoproto_2.3.1.bb => videoproto_2.3.2.bb}     |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{videoproto_2.3.1.bb => videoproto_2.3.2.bb} (53%)

diff --git a/meta/recipes-graphics/xorg-proto/videoproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb
similarity index 53%
rename from meta/recipes-graphics/xorg-proto/videoproto_2.3.1.bb
rename to meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb
index 5113243..53aa759 100644
--- a/meta/recipes-graphics/xorg-proto/videoproto_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-proto/videoproto_2.3.2.bb
@@ -6,10 +6,9 @@ DESCRIPTION = "This package provides the wire protocol for the X Video \
 extension.  This extension alows for accerlated drawing of videos."
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59d089e37bf57b5206602da38f58ca5d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ce3472a119a864085fa4155cb0979a7b"
 
-PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "c3b348c6e2031b72b11ae63fc7f805c2"
-SRC_URI[sha256sum] = "3ec76d24931d1e08c6c8d0b89a25e32dc44bc8f87d1dcb3fe201e3c99f89635a"
+SRC_URI[md5sum] = "e658641595327d3990eab70fdb55ca8b"
+SRC_URI[sha256sum] = "8dae168cb820fcd32f564879afb3f24d27c176300d9af66819a18265539bd4b6"
-- 
1.7.10.4


