Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qdc5q-0006k6-Bh
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 07:53:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2011 22:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="22323855"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2011 22:49:25 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 14:04:37 +0800
Message-Id: <b3419c910365bddec4f8700ba2093bbdc2c8eb7e.1309707957.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309707957.git.lei.mei@intel.com>
References: <cover.1309707957.git.lei.mei@intel.com>
In-Reply-To: <cover.1309707957.git.lei.mei@intel.com>
References: <cover.1309707957.git.lei.mei@intel.com>
Subject: [PATCH 1/2] coreutils: Upgrade from 8.9 to 8.12
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
X-List-Received-Date: Mon, 04 Jul 2011 05:53:14 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../{coreutils_8.9.bb => coreutils_8.12.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.9.bb => coreutils_8.12.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils_8.9.bb b/meta/recipes-core/coreutils/coreutils_8.12.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.9.bb
rename to meta/recipes-core/coreutils/coreutils_8.12.bb
index 7f96c6e..00746b9 100644
--- a/meta/recipes-core/coreutils/coreutils_8.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.12.bb
@@ -15,8 +15,8 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "36909ae68840d73a800120cf74af794a"
-SRC_URI[sha256sum] = "aa991fa4296b22ff929a31a5cb5528bb783c84cdef4503c4ff311cfbeaebf50a"
+SRC_URI[md5sum] = "fce7999953a67243d00d75cc86dbcaa6"
+SRC_URI[sha256sum] = "9e233a62c98a3378a7b0483d2ae3d662dbaf6cd3917d3830d3514665e12a85c8"
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
-- 
1.6.3.3



