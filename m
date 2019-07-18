Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E63B07EEAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:16:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169720374"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:16:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:16:05 +0800
Message-Id: <20190718021606.3560-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718021606.3560-1-anuj.mittal@intel.com>
References: <20190718021606.3560-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] glib-2.0: upgrade 2.60.4 -> 2.60.5
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
X-List-Received-Date: Thu, 18 Jul 2019 02:16:14 -0000
Content-Transfer-Encoding: 8bit

Changes:
https://github.com/GNOME/glib/blob/glib-2-60/NEWS

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch    | 2 +-
 .../glib-2.0/{glib-2.0_2.60.4.bb => glib-2.0_2.60.5.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.4.bb => glib-2.0_2.60.5.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 2d698a67c8..380bee086c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 17ca85e329bf39c004b73a02e94b597dac41ddfe Mon Sep 17 00:00:00 2001
+From 9c5d6e6ce5254a5f050bba2118a4a1807292c02a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb
index f7280090bb..bcb1fdb9a6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb
@@ -21,5 +21,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "87e2c4973470811dfed3d6746c961488"
-SRC_URI[sha256sum] = "2b941ec5dcb92e5ea83fe42f9eb55a827bc8a12c153ad2489d551c31d04733dd"
+SRC_URI[md5sum] = "7dced27cfa79419dc6cc82c02190c457"
+SRC_URI[sha256sum] = "3edf1df576ee82b2ecb8ba85c343644e48ee62e68290e71e6084b00d6ba2622e"
-- 
2.20.1


