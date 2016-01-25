Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C2585770DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143917"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:16 +0200
Message-Id: <6fc20a592a2e698959c834a7b210df96b85e3acc.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/16] freetype: update to 2.6.2
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:45 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../freetype/{freetype_2.6.bb => freetype_2.6.2.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.6.bb => freetype_2.6.2.bb} (89%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.bb b/meta/recipes-graphics/freetype/freetype_2.6.2.bb
similarity index 89%
rename from meta/recipes-graphics/freetype/freetype_2.6.bb
rename to meta/recipes-graphics/freetype/freetype_2.6.2.bb
index 17ab1c8..63e8ff4 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.2.bb
@@ -15,8 +15,8 @@ SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://use-right-libtool.patch"
-SRC_URI[md5sum] = "5682890cb0267f6671dd3de6eabd3e69"
-SRC_URI[sha256sum] = "8469fb8124764f85029cc8247c31e132a2c5e51084ddce2a44ea32ee4ae8347e"
+SRC_URI[md5sum] = "86109d0c998787d81ac582bad9adf82e"
+SRC_URI[sha256sum] = "baf6bdef7cdcc12ac270583f76ef245efe936267dbecef835f02a3409fcbb892"
 
 BINCONFIG = "${bindir}/freetype-config"
 
@@ -46,7 +46,7 @@ do_configure() {
 }
 
 do_install_append() {
-	oe_multilib_header freetype2/config/ftconfig.h
+	oe_multilib_header freetype2/freetype/config/ftconfig.h
 }
 
 BBCLASSEXTEND = "native"
-- 
2.7.0.rc3


