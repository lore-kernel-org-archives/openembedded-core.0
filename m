Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C6E7E7F8CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:52:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:06 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061754"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:49 +0800
Message-Id: <20191118085149.19903-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118085149.19903-1-anuj.mittal@intel.com>
References: <20191118085149.19903-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] glib-2.0: upgrade 2.62.1 -> 2.62.2
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
X-List-Received-Date: Mon, 18 Nov 2019 08:52:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glib-2.0/{glib-2.0_2.62.1.bb => glib-2.0_2.62.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.1.bb => glib-2.0_2.62.2.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb
index 7897170a7d..27a15a9b1d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb
@@ -20,5 +20,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "64c14b4fe46c478992560c2f48a5b649"
-SRC_URI[sha256sum] = "3dd9024e1d0872a6da7ac509937ccf997161b11d7d35be337c7e829cbae0f9df"
+SRC_URI[md5sum] = "bed3a70397a019965efac0c49f9c8164"
+SRC_URI[sha256sum] = "698824a413f76df039739c2a78f45b10939d526ae7495bab4e694e6730deb3f1"
-- 
2.21.0


