Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BF41C731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378782"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:08 +0300
Message-Id: <275a605c83d68bd3d0abf499a02d5420c9a7b7c7.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/7] librsvg: Upgrade 2.40.15 -> 2.40.16
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
X-List-Received-Date: Wed, 13 Jul 2016 12:55:13 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.15.bb => librsvg_2.40.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.15.bb => librsvg_2.40.16.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.15.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.15.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
index caa6a24..ed54d9d 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.15.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "3a66ab5b4fe1fb43b471708e4ff39a0e"
-SRC_URI[archive.sha256sum] = "d9cac4a123eec6e553a26e120979bab7425def9ae7ce7c079eba5e4a45db05f4"
+SRC_URI[archive.md5sum] = "f474fe37177a2bf8050787df2046095c"
+SRC_URI[archive.sha256sum] = "d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.1.4


