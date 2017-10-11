Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 07A7B78215
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945837"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:26 +0300
Message-Id: <e0db4dcdc73a3babdc9eaa276ef909b47e30b899.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 34/50] shared-mime-info: update to 1.9
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:06 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{shared-mime-info_1.8.bb => shared-mime-info_1.9.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.8.bb => shared-mime-info_1.9.bb} (43%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb
similarity index 43%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb
index 849d9990319..f9b273edc6b 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb
@@ -3,5 +3,5 @@ require shared-mime-info.inc
 SRC_URI += "file://parallelmake.patch \
 	    file://install-data-hook.patch"
 
-SRC_URI[md5sum] = "f6dcadce764605552fc956563efa058c"
-SRC_URI[sha256sum] = "2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9"
+SRC_URI[md5sum] = "45103889b91242850aa47f09325e798b"
+SRC_URI[sha256sum] = "5c0133ec4e228e41bdf52f726d271a2d821499c2ab97afd3aa3d6cf43efcdc83"
-- 
2.14.1


