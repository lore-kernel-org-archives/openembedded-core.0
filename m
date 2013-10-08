Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E68476CEF2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 09:10:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Oct 2013 02:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1056,1371106800"; d="scan'208";a="371307835"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by azsmga001.ch.intel.com with ESMTP; 08 Oct 2013 02:10:22 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 12:14:55 +0300
Message-Id: <1381223695-26573-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] separatebuilddir: remove entries for imake and xorg-cf-files
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
X-List-Received-Date: Tue, 08 Oct 2013 09:10:22 -0000

Imake and the associated xorg-cf-files recipes were removed.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 8f2ebfa..c067183 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -234,8 +234,6 @@ B_pn-help2man-native = "${SEPB}"
 B_pn-icon-naming-utils-native = "${SEPB}"
 B_pn-icu = "${SEPB}"
 B_pn-icu-native = "${SEPB}"
-B_pn-imake = "${SEPB}"
-B_pn-imake-native = "${SEPB}"
 B_pn-inputproto = "${SEPB}"
 B_pn-inputproto-native = "${SEPB}"
 B_pn-intltool = "${SEPB}"
@@ -753,8 +751,6 @@ B_pn-xkbcomp = "${SEPB}"
 B_pn-xkbcomp-native = "${SEPB}"
 B_pn-xkeyboard-config = "${SEPB}"
 B_pn-xmodmap = "${SEPB}"
-B_pn-xorg-cf-files = "${SEPB}"
-B_pn-xorg-cf-files-native = "${SEPB}"
 B_pn-xprop = "${SEPB}"
 B_pn-xproto = "${SEPB}"
 B_pn-xproto-native = "${SEPB}"
-- 
1.7.9.5


