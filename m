Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4655973D1B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187205"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:23 +0300
Message-Id: <6429a70a1a164b87f6c6ce561cc61b1a221ca755.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/7] atk: Upgrade to 2.16.0
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:47 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/atk/{atk_2.14.0.bb => atk_2.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.14.0.bb => atk_2.16.0.bb} (79%)

diff --git a/meta/recipes-support/atk/atk_2.14.0.bb b/meta/recipes-support/atk/atk_2.16.0.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.14.0.bb
rename to meta/recipes-support/atk/atk_2.16.0.bb
index e0e9be3..e29469b 100644
--- a/meta/recipes-support/atk/atk_2.14.0.bb
+++ b/meta/recipes-support/atk/atk_2.16.0.bb
@@ -14,8 +14,8 @@ inherit gnomebase gtk-doc
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "ecb7ca8469a5650581b1227d78051b8b"
-SRC_URI[archive.sha256sum] = "2875cc0b32bfb173c066c22a337f79793e0c99d2cc5e81c4dac0d5a523b8fbad"
+SRC_URI[archive.md5sum] = "c7c5002bd6e58b4723a165f1bf312116"
+SRC_URI[archive.sha256sum] = "095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562"
 
 BBCLASSEXTEND = "native"
 
-- 
2.1.4


