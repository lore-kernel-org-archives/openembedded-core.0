Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF266E951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785157"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:42 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:24 +0200
Message-Id: <e5715603ba199cd773f2383dfade132ff621c530.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/13] xtrans: upgrade to 1.3.3
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
X-List-Received-Date: Thu, 06 Feb 2014 15:29:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.3.3.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.3.3.bb
index 7ddc841..9895ea3 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.3.bb
@@ -20,5 +20,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "050eb8f1d41e254f508bab72f1c10d6e"
-SRC_URI[sha256sum] = "94177c89b74f594bcddc6a12825e9b464e17ab1977de671d25f67a4ea922cb87"
+SRC_URI[md5sum] = "2f14c31ab556fc91039f51a113b38aa2"
+SRC_URI[sha256sum] = "622db4adce224581a44fbe41321bbb0bdc0c78aec586ba83548f1f1c6e8a09bf"
-- 
1.7.9.5


