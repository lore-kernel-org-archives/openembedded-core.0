Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4705B60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873432"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:22:55 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:40 +0300
Message-Id: <01f52b417bb2af6d80ee416bd43f3fa46d2ff8fc.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/13] pango: Upgrade 1.38.1 -> 1.40.1
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
X-List-Received-Date: Mon, 16 May 2016 13:22:55 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/pango/{pango_1.38.1.bb => pango_1.40.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.38.1.bb => pango_1.40.1.bb} (92%)

diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.40.1.bb
similarity index 92%
rename from meta/recipes-graphics/pango/pango_1.38.1.bb
rename to meta/recipes-graphics/pango/pango_1.40.1.bb
index 756dac4..6e1e6c9 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.1.bb
@@ -16,9 +16,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
 "
-
-SRC_URI[archive.md5sum] = "7fde35d4a127b55ce8bbcefe109bc80d"
-SRC_URI[archive.sha256sum] = "1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7"
+SRC_URI[archive.md5sum] = "6fc88c6529890d6c8e03074d57a3eceb"
+SRC_URI[archive.sha256sum] = "e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.1.4


