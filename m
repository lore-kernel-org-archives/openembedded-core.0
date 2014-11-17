Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D4F5970A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 20:10:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2014 12:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,404,1413270000"; d="scan'208";a="609301524"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2014 12:09:37 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 22:09:29 +0200
Message-Id: <b9699cb15d4d308112bba4127591f3d2fc924ed4.1416254938.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] netbase: upgrade to 5.3
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
X-List-Received-Date: Mon, 17 Nov 2014 20:10:03 -0000

- switched to tar.xz archive.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/netbase/{netbase_5.2.bb => netbase_5.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.2.bb => netbase_5.3.bb} (76%)

diff --git a/meta/recipes-core/netbase/netbase_5.2.bb b/meta/recipes-core/netbase/netbase_5.3.bb
similarity index 76%
rename from meta/recipes-core/netbase/netbase_5.2.bb
rename to meta/recipes-core/netbase/netbase_5.3.bb
index ab7ae65..4ac0221 100644
--- a/meta/recipes-core/netbase/netbase_5.2.bb
+++ b/meta/recipes-core/netbase/netbase_5.3.bb
@@ -6,11 +6,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.xz \
            file://hosts"
 
-SRC_URI[md5sum] = "3a01bfce6a28e1743412198abd241262"
-SRC_URI[sha256sum] = "d62ba56d62b9b121664828175c2a237a7014ef32df8a4116ea33cff332de3307"
+SRC_URI[md5sum] = "2637a27fd3de02a278d2b5be7e6558c1"
+SRC_URI[sha256sum] = "81f6c69795044d62b8ad959cf9daf049d0545fd466c52860ad3f933b1e97b88b"
 
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
-- 
2.1.0


