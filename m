Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 320407320F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103264"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:36 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:56 +0200
Message-Id: <43fd2218a31617808738903ee467fccac44dcf05.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 8/9] menu-cache: upgrade to 1.0.1
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:37 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../menu-cache/{menu-cache_1.0.0.bb => menu-cache_1.0.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/menu-cache/{menu-cache_1.0.0.bb => menu-cache_1.0.1.bb} (79%)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb
similarity index 79%
rename from meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
rename to meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb
index 5d46e89..eb80cd3 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.0.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 intltool-native libfm-extra"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4a8e6c1a86d5e64ec725d850a4abfbad"
-SRC_URI[sha256sum] = "ff7df437bbfd3119c5f662c6d209b98f15de03a7203308c6b56a4c1e1d419aaf"
+SRC_URI[md5sum] = "a856ba860b16fdc8c69ee784bc4ade36"
+SRC_URI[sha256sum] = "0ac72649919946070258320aafc320467dd040bcef7b3a225e2ab7241ddffd59"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
 
-- 
2.1.4


