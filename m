Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQa-0006gd-Tj
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772205"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:43 -0700
Message-Id: <115c07441913b7ceeb25e268eed501c619f8d161.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/36] resolvconf: Update to 1.65
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
X-List-Received-Date: Thu, 03 May 2012 02:05:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.64.bb => resolvconf_1.65.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.64.bb => resolvconf_1.65.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.64.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.64.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb
index d2d5183..9b7553d 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.64.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "56140b756b6303d94e7463f376300a09"
-SRC_URI[sha256sum] = "6cdf23d4b530a183bfade3b64ccb3660983a0a7428a443af3f099f88390512c3"
+SRC_URI[md5sum] = "8411411956f986a43021fa7e71d1bae8"
+SRC_URI[sha256sum] = "3876a50a71c5e3e08373b7e41d5ca9a6cf19cf48e9decb3ab0a7c67261d58785"
 
 inherit allarch
 
-- 
1.7.7.6



