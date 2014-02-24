Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43F1D6F137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:34:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 03:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="488717453"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.62])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2014 03:34:53 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 13:42:42 +0200
Message-Id: <e6e9e1f5d07b0495c0e58b6fe90590045eaca2a3.1393228795.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393228795.git.cristiana.voicu@intel.com>
References: <cover.1393228795.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1393228795.git.cristiana.voicu@intel.com>
References: <cover.1393228795.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/2] pango: upgrade to 1.36.2
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
X-List-Received-Date: Mon, 24 Feb 2014 11:34:57 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../pango/{pango_1.36.1.bb => pango_1.36.2.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.1.bb => pango_1.36.2.bb} (56%)

diff --git a/meta/recipes-graphics/pango/pango_1.36.1.bb b/meta/recipes-graphics/pango/pango_1.36.2.bb
similarity index 56%
rename from meta/recipes-graphics/pango/pango_1.36.1.bb
rename to meta/recipes-graphics/pango/pango_1.36.2.bb
index c6377aa..e682038 100644
--- a/meta/recipes-graphics/pango/pango_1.36.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.2.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://no-tests.patch \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "9e0d3a1ea395172f8c39ba98a4d2081a"
-SRC_URI[archive.sha256sum] = "42e4b51cdc99e6878a9ea2a5ef2b31b79c1033f8518726df738a3c54c90e59f8"
+SRC_URI[archive.md5sum] = "253026c7132c22e52cefd998ba89a742"
+SRC_URI[archive.sha256sum] = "f07f9392c9cf20daf5c17a210b2c3f3823d517e1917b72f20bb19353b2bc2c63"
-- 
1.7.9.5


