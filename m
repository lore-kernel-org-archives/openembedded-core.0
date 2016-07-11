Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F239D73169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642448"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:48 +0300
Message-Id: <1468247633-24172-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/8] desktop-file-utils-native: update to 0.23
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:51 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...op-file-utils-native_0.22.bb => desktop-file-utils-native_0.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.22.bb => desktop-file-utils-native_0.23.bb} (78%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb
similarity index 78%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb
index f899cd2..54daabe 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb
@@ -8,8 +8,8 @@ DEPENDS = "glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c6b9f9aac1ea143091178c23437e6cd0"
-SRC_URI[sha256sum] = "843532672692f98e9b2d6ae6cc8658da562dfde1606c7f33d9d227a344de56c5"
+SRC_URI[md5sum] = "599133d51cc9a41bfec186414906b6f1"
+SRC_URI[sha256sum] = "6c094031bdec46c9f621708f919084e1cb5294e2c5b1e4c883b3e70cb8903385"
 
 inherit autotools native
 
-- 
2.8.1


