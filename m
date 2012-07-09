Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMf-000659-5C
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292867"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:16 -0700
Message-Id: <f6e025e02cf4a42a00abe77f0307b48aa0fcdd13.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/41] directfb-examples: upgrade to 1.6.0
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:09 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...xamples_1.5.3.bb => directfb-examples_1.6.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.5.3.bb => directfb-examples_1.6.0.bb} (77%)

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
similarity index 77%
rename from meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb
rename to meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
index 8eec7ba..b19cd89 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
@@ -16,5 +16,5 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools
 
-SRC_URI[md5sum] = "f2a5dac3bf1eb8bc0f766525831ac467"
-SRC_URI[sha256sum] = "7ceb9539a39e4221d838a3b8e8a3834c0c254ecdb34afc27e9bbcf55027cbbb1"
+SRC_URI[md5sum] = "27619d31e8a647fdd3023a0c1779b63d"
+SRC_URI[sha256sum] = "b08293697c211b690856f76a25ad7acd4ca458b4132851e0a1e471d0bf23c821"
-- 
1.7.7.6



