Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D526730E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 05:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="1133341410"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2017 05:02:45 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4861F6A4080;
	Wed, 22 Feb 2017 05:02:44 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:35 +0200
Message-Id: <63f3754d1575d4976a296e1c9598e769c642e85b.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/6] menu-cache: Upgrade 1.0.1 -> 1.0.2
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:44 -0000

Small bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../menu-cache/{menu-cache_1.0.1.bb => menu-cache_1.0.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/menu-cache/{menu-cache_1.0.1.bb => menu-cache_1.0.2.bb} (79%)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb
similarity index 79%
rename from meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb
rename to meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb
index a1a8e26..71540cf 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.0.2.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 libfm-extra"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a856ba860b16fdc8c69ee784bc4ade36"
-SRC_URI[sha256sum] = "0ac72649919946070258320aafc320467dd040bcef7b3a225e2ab7241ddffd59"
+SRC_URI[md5sum] = "8dde7a3f5bd9798d0129d1979a5d7640"
+SRC_URI[sha256sum] = "6f83edf2de34f83e701dcb52145d755250a5677580cd413476cc4d7f2d2012d5"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
 
-- 
2.1.4


