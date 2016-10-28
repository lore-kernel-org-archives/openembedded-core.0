Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 14A2871B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:07 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878683"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:13 +0300
Message-Id: <5fa512032a6768cfa040c818a8cf64242a9562eb.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 10/26] json-glib: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:07 -0000

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


