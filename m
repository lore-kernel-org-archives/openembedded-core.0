Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QAbkl-0004j8-9D
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 07:39:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2011 22:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,216,1301900400"; d="scan'208";a="909898290"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2011 22:37:06 -0700
Message-Id: <045d0a8302ad3bcc3461c48797063ca96a01445b.1302846043.git.ke.yu@intel.com>
In-Reply-To: <cover.1302846043.git.ke.yu@intel.com>
References: <cover.1302846043.git.ke.yu@intel.com>
Old-Date: Thu, 7 Apr 2011 17:15:46 +0800
Date: Fri, 15 Apr 2011 13:44:28 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 5/9] evieext: upgrade from 1.1.0 to 1.1.1
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
X-List-Received-Date: Fri, 15 Apr 2011 05:39:36 -0000

From: Yu Ke <ke.yu@intel.com>

- also change license checksum, the license is still MIT-X, but corp name
  is changed from SUN to Oracle

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../{evieext_1.1.0.bb => evieext_1.1.1.bb}         |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{evieext_1.1.0.bb => evieext_1.1.1.bb} (54%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 4966bd9..1230693 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -9,7 +9,7 @@ PREFERRED_VERSION_bigreqsproto-nativesdk ?= "1.1.1"
 PREFERRED_VERSION_compositeproto ?= "0.4.2"
 PREFERRED_VERSION_damageproto ?= "1.2.1"
 PREFERRED_VERSION_dmxproto ?= "2.3.1"
-PREFERRED_VERSION_evieext ?= "1.1.0"
+PREFERRED_VERSION_evieext ?= "1.1.1"
 PREFERRED_VERSION_fixesproto ?= "4.1.2"
 PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
 PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
diff --git a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
similarity index 54%
rename from meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
rename to meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
index 5800af1..271398d 100644
--- a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
@@ -6,10 +6,10 @@ DESCRIPTION = "This package provides the wire protocol for the X Event \
 Interception Extension.  This extension allows the interception of \
 keyboard and mouse events."
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=6cf85dc8217152304ac976db1e240ebe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4db9fc6a58e873c6392eec53082d89b5"
 
-SRC_URI[md5sum] = "5c74f61d6f77b2e6a083b2b31000be42"
-SRC_URI[sha256sum] = "47881a52a8d9da1e41e4f028ed32a8b44f738afbead819c0a07253fdc1641885"
+SRC_URI[md5sum] = "98bd86a13686f65f0873070fdee6efc7"
+SRC_URI[sha256sum] = "1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe"
-- 
1.7.0.4



