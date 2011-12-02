Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RWOAl-0005qD-Na
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:08:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 00:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81422783"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 00:00:55 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 15:55:56 +0800
Message-Id: <f6e44530b52af64780290d94d2f05b3d5f620413.1322812458.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
Subject: [PATCH 2/4] pcmanfm: Upgrade to 0.9.10
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
X-List-Received-Date: Fri, 02 Dec 2011 08:08:43 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{pcmanfm_0.9.9.bb => pcmanfm_0.9.10.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.9.bb => pcmanfm_0.9.10.bb} (88%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
similarity index 88%
rename from meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
index af283f6..e62cb0d 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
@@ -24,8 +24,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 
 SRC_URI_append_poky = " file://owl-window-menu.patch"
 
-SRC_URI[md5sum] = "f31ed6defb600f7046a456220d8efa3a"
-SRC_URI[sha256sum] = "bc48af4ade638b47e4207cc274f6e38c2bd3786a811d20da47c3df9907c6fb6c"
+SRC_URI[md5sum] = "d34a3530a6c5dcd674d23021d71c3e95"
+SRC_URI[sha256sum] = "f133c6f207f719d1fc69fe8bc07b2de6883c6937ffa87448df42e3b1a30e0298"
 
 inherit autotools pkgconfig
 
-- 
1.7.1



