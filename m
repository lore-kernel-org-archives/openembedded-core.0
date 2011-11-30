Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RVdJU-0007g2-B8
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 07:06:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 21:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,595,1315206000"; d="scan'208";a="90460106"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2011 21:58:41 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 13:57:52 +0800
Message-Id: <a9afa90f134542ef604a459363c49da76024d031.1322619553.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
Subject: [PATCH 1/3] iproute2: Upgrade from 3.0.0 to 3.1.0
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
X-List-Received-Date: Wed, 30 Nov 2011 06:06:36 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../configure-cross.patch                          |    0
 .../{iproute2_3.0.0.bb => iproute2_3.1.0.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.0.0 => iproute2-3.1.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.0.0.bb => iproute2_3.1.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.0.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.1.0/configure-cross.patch
similarity index 100%
rename from meta/recipes-connectivity/iproute2/iproute2-3.0.0/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-3.1.0/configure-cross.patch
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
index 8d1db85..0b47046 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
@@ -1,7 +1,7 @@
 require iproute2.inc
 
-#v3.0.0 tag
-SRCREV = "ce691fb5ce78b2c75243c60a757a3990ae09681c"
+#v3.1.0 tag
+SRCREV = "9cbe6bc337a35b91882f92599eefeb161f3e776e"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
            file://configure-cross.patch"
 S = "${WORKDIR}/git"
-- 
1.7.0.4



