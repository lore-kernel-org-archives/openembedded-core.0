Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1R9YMk-0007IC-MY
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:22:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2011 01:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,465,1312182000"; d="scan'208";a="57288674"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 01:16:09 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:16:06 +0800
Message-Id: <9a0fad02293e8762e56762f7d5493ad6743306bb.1317370299.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
Subject: [PATCH 2/4] diffutils: Upgrade from 3.0 to 3.2.
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
X-List-Received-Date: Fri, 30 Sep 2011 08:22:42 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../{diffutils_3.0.bb => diffutils_3.2.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.0.bb => diffutils_3.2.bb} (84%)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.0.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
similarity index 84%
rename from meta/recipes-extended/diffutils/diffutils_3.0.bb
rename to meta/recipes-extended/diffutils/diffutils_3.2.bb
index ecff5cc..174866c 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.0.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -21,5 +21,5 @@ EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
 ALTERNATIVE_PRIORITY = "100"
 
-SRC_URI[md5sum] = "684aaba1baab743a2a90e52162ff07da"
-SRC_URI[sha256sum] = "2fb91f65bbae3c6043b85ba23967f27235b12928da8e406dc91b48b0a589e809"
+SRC_URI[md5sum] = "22e4deef5d8949a727b159d6bc65c1cc"
+SRC_URI[sha256sum] = "2aaaebef615be7dc365306a14caa5d273a4fc174f9f10abca8b60e082c054ed3"
-- 
1.7.0.4



