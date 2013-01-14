Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tum0T-0001KQ-92
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 16:31:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2013 07:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="246401896"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2013 07:16:04 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 17:16:41 +0200
Message-Id: <8041a48d0b66bae5608e8cdc5fbbeb75dc17de45.1358175955.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
Subject: [PATCH v2 6/6] tune-ppc603e: add BASE_LIB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 15:31:34 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/conf/machine/include/tune-ppc603e.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 6557c1d..2cfd342 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -7,6 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+BASE_LIB_tune-ppc603e = "lib"
 TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
-- 
1.7.11.7



