Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF18F65DF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099622"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:40 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:32 +0300
Message-Id: <30b2872f90f8c1d8373abb1db3264464a761faff.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
Subject: [PATCH 3/7] atk: upgrade to 2.12.0
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:39 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../atk/{atk_2.10.0.bb => atk_2.12.0.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.10.0.bb => atk_2.12.0.bb} (79%)

diff --git a/meta/recipes-support/atk/atk_2.10.0.bb b/meta/recipes-support/atk/atk_2.12.0.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.10.0.bb
rename to meta/recipes-support/atk/atk_2.12.0.bb
index 538d614..9112bbb 100644
--- a/meta/recipes-support/atk/atk_2.10.0.bb
+++ b/meta/recipes-support/atk/atk_2.12.0.bb
@@ -14,8 +14,8 @@ inherit gnomebase gtk-doc
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "e77833d4445ebe6842e9f9a0667b0be7"
-SRC_URI[archive.sha256sum] = "636917a5036bc851d8491194645d284798ec118919a828be5e713b6ecc5b50b0"
+SRC_URI[archive.md5sum] = "930238dec55fdbf8eda9975b44f07b76"
+SRC_URI[archive.sha256sum] = "48a8431974639c5a59c24fcd3ece1a19709872d5dfe78907524d9f5e9993f18f"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.9.5


