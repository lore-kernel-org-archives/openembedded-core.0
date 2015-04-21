Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F95C6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:50:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2015 06:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="483689901"
Received: from heimdall.fi.intel.com ([10.237.72.110])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 06:49:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 16:49:42 +0300
Message-Id: <042451eb3b4d7761688542bca26ac3526aa2fa3d.1429623703.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
References: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1429623703.git.jussi.kukkonen@intel.com>
References: <cover.1429623703.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] json-glib: Upgrade 1.0.2 -> 1.0.4
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
X-List-Received-Date: Tue, 21 Apr 2015 13:50:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../json-glib/{json-glib_1.0.2.bb => json-glib_1.0.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.0.2.bb => json-glib_1.0.4.bb} (79%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
similarity index 79%
rename from meta/recipes-gnome/json-glib/json-glib_1.0.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
index 0c25dec..4d2b613 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "e43efaf6852958207982e79141bf371e"
-SRC_URI[archive.sha256sum] = "887bd192da8f5edc53b490ec51bf3ffebd958a671f5963e4f3af32c22e35660a"
+SRC_URI[archive.md5sum] = "3131b0417ecde3da1ae72acceaa375cf"
+SRC_URI[archive.sha256sum] = "80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd"
 
 inherit gnome gettext lib_package
 
-- 
2.1.4


