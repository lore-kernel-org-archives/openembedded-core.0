Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7C13C6FC0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:50:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2014 05:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,486,1400050800"; d="scan'208";a="556190339"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2014 05:50:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2014 15:54:10 +0300
Message-Id: <42576a77eb0351498982a78b4b28c51dcef5631f.1402923181.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1402923181.git.cristian.iorga@intel.com>
References: <cover.1402923181.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1402923181.git.cristian.iorga@intel.com>
References: <cover.1402923181.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] connman: upgrade to 1.24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jun 2014 12:50:40 -0000

Bug fix release

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/connman/{connman_1.23.bb => connman_1.24.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.23.bb => connman_1.24.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman_1.23.bb b/meta/recipes-connectivity/connman/connman_1.24.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.23.bb
rename to meta/recipes-connectivity/connman/connman_1.24.bb
index 43501af..66a8c58 100644
--- a/meta/recipes-connectivity/connman/connman_1.23.bb
+++ b/meta/recipes-connectivity/connman/connman_1.24.bb
@@ -5,7 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "f835b8137ab198e0af5deab043e2890a"
-SRC_URI[sha256sum] = "1dcac1d059d5303343e544fca0d0e76837cfb32f36e4a607a71c1b65ccf007c5"
+SRC_URI[md5sum] = "dd6e1b4d9b9a28d127edb9f9b58bdec1"
+SRC_URI[sha256sum] = "551df7a5f0c6e4d69523dd2b3aa2c54525b323457d5135f64816215bad3dc24c"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.9.1


