Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R94F9-0001Dx-4v
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 02:12:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 17:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,458,1312182000"; d="scan'208";a="21629674"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 17:07:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 17:07:14 -0700
Message-Id: <8c7df2c58ce029a4861bd362e9fafc4a3c1384fb.1317254761.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317254761.git.sgw@linux.intel.com>
References: <cover.1317254761.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317254761.git.sgw@linux.intel.com>
References: <cover.1317254761.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] glew: update to 1.7.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2011 00:12:51 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glew/{glew_1.6.0.bb => glew_1.7.0.bb}          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.6.0.bb => glew_1.7.0.bb} (80%)

diff --git a/meta/recipes-graphics/glew/glew_1.6.0.bb b/meta/recipes-graphics/glew/glew_1.7.0.bb
similarity index 80%
rename from meta/recipes-graphics/glew/glew_1.6.0.bb
rename to meta/recipes-graphics/glew/glew_1.7.0.bb
index 8824667..e65663d 100644
--- a/meta/recipes-graphics/glew/glew_1.6.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.7.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
           "
 
-SRC_URI[md5sum] = "7dfbb444b5a4e125bc5dba0aef403082"
-SRC_URI[sha256sum] = "bea2a7e9bb97a7a5054d4a65d16aaeedeaa091719359ad3fcd9bfdb0fe8eb7fa"
+SRC_URI[md5sum] = "fb7a8bb79187ac98a90b57f0f27a3e84"
+SRC_URI[sha256sum] = "1653a63fb1e1a518c4b5ccbaf1a617f1a0b4c1c29d39ae4e2583844d98365c09"
 
 inherit autotools lib_package
-- 
1.7.6



