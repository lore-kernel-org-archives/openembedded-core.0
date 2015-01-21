Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85D5371637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:36:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 11:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443320757"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.118])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 11:17:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 11:30:23 -0800
Message-Id: <1421868625-22382-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
References: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3] mkfontscale: Upgrade to 1.1.2
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
X-List-Received-Date: Wed, 21 Jan 2015 19:36:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{mkfontscale_1.1.1.bb => mkfontscale_1.1.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.1.bb => mkfontscale_1.1.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
index 65f74c2..31cf186 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
@@ -14,5 +14,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "03de3f15db678e277f5ef9c013aca1ad"
-SRC_URI[sha256sum] = "244017992477ced2397a44fd0ddcfb0f1d9899128613f5c4db81471163b0b731"
+SRC_URI[md5sum] = "9bdd6ebfa62b1bbd474906ac86a40fd8"
+SRC_URI[sha256sum] = "8c6d5228af885477b9aec60ca6f172578e7d2de42234357af62fb00439453f20"
-- 
2.1.0


