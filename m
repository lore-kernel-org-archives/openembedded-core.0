Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E06E4607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1076033582"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 06:27:59 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 558286A4006;
	Wed, 26 Oct 2016 06:27:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:42 +0300
Message-Id: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/14] pango: Upgrade 1.40.1 -> 1.40.3
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:16 -0000

Bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/pango/{pango_1.40.1.bb => pango_1.40.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.40.1.bb => pango_1.40.3.bb} (92%)

diff --git a/meta/recipes-graphics/pango/pango_1.40.1.bb b/meta/recipes-graphics/pango/pango_1.40.3.bb
similarity index 92%
rename from meta/recipes-graphics/pango/pango_1.40.1.bb
rename to meta/recipes-graphics/pango/pango_1.40.3.bb
index f9f344a..338ef4a 100644
--- a/meta/recipes-graphics/pango/pango_1.40.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.3.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.md5sum] = "6fc88c6529890d6c8e03074d57a3eceb"
-SRC_URI[archive.sha256sum] = "e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40"
+SRC_URI[archive.md5sum] = "17c26720f5a862a12f7e1745e2f1d966"
+SRC_URI[archive.sha256sum] = "abba8b5ce728520c3a0f1535eab19eac3c14aeef7faa5aded90017ceac2711d3"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.1.4


