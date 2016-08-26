Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC47D770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:43 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525590"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:34 +0300
Message-Id: <ff245633691d2a7c260713751594ebfa61974f10.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/28] json-glib: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
index 1203a6a..8df2a42 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
@@ -13,6 +13,6 @@ DEPENDS = "glib-2.0"
 SRC_URI[archive.md5sum] = "c1daefb8d0fb59612af0c072c8aabb58"
 SRC_URI[archive.sha256sum] = "ea128ab52a824fcd06e5448fbb2bd8d9a13740d51c66d445828edba71321a621"
 
-inherit gnomebase gettext lib_package gobject-introspection
+inherit gnomebase gettext lib_package gobject-introspection gtk-doc
 
 BBCLASSEXTEND = "native"
-- 
2.9.3


