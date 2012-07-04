Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJv-00056y-Sn
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055183"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:33 +0300
Message-Id: <c2cb7d829680af50f50863c46f3648f16b2539db.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/8] directfb-examples: upgrade to 1.6.0
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:00 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...xamples_1.5.3.bb => directfb-examples_1.6.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
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
1.7.9.5



