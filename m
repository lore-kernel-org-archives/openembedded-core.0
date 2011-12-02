Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RWOAl-0005q6-1G
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:08:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 00:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81422779"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 00:00:54 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 15:55:55 +0800
Message-Id: <0553d7132a6c6b4d733b63f1d161148197f0b017.1322812458.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
Subject: [PATCH 1/4] libfm: Upgrade to 0.1.17
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
 .../configure_fix.patch                            |    0
 .../libfm/{libfm_0.1.16.bb => libfm_0.1.17.bb}     |    7 +++----
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libfm/{libfm-0.1.16 => libfm-0.1.17}/configure_fix.patch (100%)
 rename meta/recipes-support/libfm/{libfm_0.1.16.bb => libfm_0.1.17.bb} (67%)

diff --git a/meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch b/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
similarity index 100%
rename from meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
rename to meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
diff --git a/meta/recipes-support/libfm/libfm_0.1.16.bb b/meta/recipes-support/libfm/libfm_0.1.17.bb
similarity index 67%
rename from meta/recipes-support/libfm/libfm_0.1.16.bb
rename to meta/recipes-support/libfm/libfm_0.1.17.bb
index 293937f..efb54d0 100644
--- a/meta/recipes-support/libfm/libfm_0.1.16.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.17.bb
@@ -12,10 +12,9 @@ DEPENDS = "gtk+ menu-cache intltool-native"
 
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
-           file://configure_fix.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c09bce415ff6dc2dd835e28aeddeabe3"
-SRC_URI[sha256sum] = "ed49365319b941757c155b3790a2adf73f5072227c578d9bcba7329c6f9fcd3b"
+SRC_URI[md5sum] = "a97e03d973e6ac727f28d0934d6c9ad5"
+SRC_URI[sha256sum] = "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15bc7131b"
 
 inherit autotools pkgconfig
-- 
1.7.1



