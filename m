Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 54B4671F3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 17:48:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 31 Oct 2014 10:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="599892846"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2014 10:44:31 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 19:44:26 +0200
Message-Id: <d7c6c373d184809276e792ef416fe9fc367d2298.1414777407.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1414777407.git.cristian.iorga@intel.com>
References: <cover.1414777407.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1414777407.git.cristian.iorga@intel.com>
References: <cover.1414777407.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] connman: upgrade to 1.26
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
X-List-Received-Date: Fri, 31 Oct 2014 17:48:19 -0000

- WiFi P2P support in ConnMan has been significantly improved;
- Applications can now register WiFi Display, UPnP or Bonjour P2P services;
- Various bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/connman/{connman_1.25.bb => connman_1.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.25.bb => connman_1.26.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman_1.25.bb b/meta/recipes-connectivity/connman/connman_1.26.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.25.bb
rename to meta/recipes-connectivity/connman/connman_1.26.bb
index 1758c95..b93f1cd 100644
--- a/meta/recipes-connectivity/connman/connman_1.25.bb
+++ b/meta/recipes-connectivity/connman/connman_1.26.bb
@@ -5,7 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "a449d2e49871494506e48765747e6624"
-SRC_URI[sha256sum] = "c1d266d6be18d2f66231f3537a7ed17b57637ca43c27328bc13c508cbeacce6e"
+SRC_URI[md5sum] = "ba05b110b7c81e5fa14e8b402ef37a9e"
+SRC_URI[sha256sum] = "7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
2.1.0


