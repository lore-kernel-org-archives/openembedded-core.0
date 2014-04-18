Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2EB65DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099615"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:38 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:30 +0300
Message-Id: <009965b7570dbe60e79aa05d9b5efb072067f442.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/7] pango: upgrade to 1.36.3
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:37 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../pango/{pango_1.36.2.bb => pango_1.36.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.2.bb => pango_1.36.3.bb} (56%)

diff --git a/meta/recipes-graphics/pango/pango_1.36.2.bb b/meta/recipes-graphics/pango/pango_1.36.3.bb
similarity index 56%
rename from meta/recipes-graphics/pango/pango_1.36.2.bb
rename to meta/recipes-graphics/pango/pango_1.36.3.bb
index e682038..938af34 100644
--- a/meta/recipes-graphics/pango/pango_1.36.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.3.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://no-tests.patch \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "253026c7132c22e52cefd998ba89a742"
-SRC_URI[archive.sha256sum] = "f07f9392c9cf20daf5c17a210b2c3f3823d517e1917b72f20bb19353b2bc2c63"
+SRC_URI[archive.md5sum] = "d9532826e95bdb374355deebc42441bb"
+SRC_URI[archive.sha256sum] = "ad48e32917f94aa9d507486d44366e59355fcfd46ef86d119ddcba566ada5d22"
-- 
1.7.9.5


