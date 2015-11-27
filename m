Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D9D4C6082D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460907"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:15 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:38 +0200
Message-Id: <c0cf1605d54be1f646da46b7f5f09e9aec19adca.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/10] gnome-common: Upgrade 3.14.0 -> 3.18.0
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:14 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gnome/{gnome-common_3.14.0.bb => gnome-common_3.18.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-common_3.14.0.bb => gnome-common_3.18.0.bb} (71%)

diff --git a/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
similarity index 71%
rename from meta/recipes-gnome/gnome/gnome-common_3.14.0.bb
rename to meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
index 80b7033..06f3bb3 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "x11/gnome"
 inherit gnomebase allarch
 
-SRC_URI[archive.md5sum] = "ba58c61d0d81b7c3ff8452c620513a9d"
-SRC_URI[archive.sha256sum] = "4c00242f781bb441289f49dd80ed1d895d84de0c94bfc2c6818a104c9e39262c"
+SRC_URI[archive.md5sum] = "933258d9c23e218eb6eec9cc1951b053"
+SRC_URI[archive.sha256sum] = "22569e370ae755e04527b76328befc4c73b62bfd4a572499fde116b8318af8cf"
 
 EXTRA_AUTORECONF = ""
 DEPENDS = ""
-- 
2.1.4


