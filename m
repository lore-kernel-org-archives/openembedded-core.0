Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D9EA777E89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 18:47:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2017 11:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,378,1491289200"; d="scan'208";a="90367944"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2017 11:47:09 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:47:02 -0700
Message-Id: <20170522184702.14841-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170522184702.14841-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170522184702.14841-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] nfs-utils: upgrade to 2.1.1
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
X-List-Received-Date: Mon, 22 May 2017 18:47:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../nfs-utils/{nfs-utils_1.3.4.bb => nfs-utils_2.1.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.4.bb => nfs-utils_2.1.1.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
index 4ca9ab2a3de..bdf0efa3302 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
@@ -33,8 +33,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
 "
 
-SRC_URI[md5sum] = "54e4119043ec8507a2a0e054cf2889a4"
-SRC_URI[sha256sum] = "b42a5bc0a8d80d04650030ceb9a11f08f4acfbcb1ee297f657fb94e339c45975"
+SRC_URI[md5sum] = "59dfcb2e6254b129f901f40c86086b13"
+SRC_URI[sha256sum] = "0faeb54c70b84e6bd3b9b6901544b1f6add8d246f35c1683e402daf4e0c719ef"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.12.0


