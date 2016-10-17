Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 067A171BBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649330"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:50 +0300
Message-Id: <4ae82ed174b5d56698a7e1dae0798adf907027e2.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/23] json-glib: enable optional building of manpages
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
index 8df2a42..4e272be 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
@@ -13,6 +13,8 @@ DEPENDS = "glib-2.0"
 SRC_URI[archive.md5sum] = "c1daefb8d0fb59612af0c072c8aabb58"
 SRC_URI[archive.sha256sum] = "ea128ab52a824fcd06e5448fbb2bd8d9a13740d51c66d445828edba71321a621"
 
-inherit gnomebase gettext lib_package gobject-introspection gtk-doc
+inherit gnomebase gettext lib_package gobject-introspection gtk-doc manpages
+
+PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
 
 BBCLASSEXTEND = "native"
-- 
2.9.3


