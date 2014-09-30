Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D063E6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 22:02:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2014 14:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,629,1406617200"; d="scan'208";a="611167268"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.60])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2014 15:01:34 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 17:01:24 -0500
Message-Id: <1412114484-21269-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] apt: apt-key binary was not being installed, including it in the installation
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
X-List-Received-Date: Tue, 30 Sep 2014 22:02:12 -0000

[YOCTO #6476]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 0897d3a..a553aa2 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -42,6 +42,7 @@ FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 do_install () {
 	set -x
 	install -d ${D}${bindir}
+	install -m 0755 bin/apt-key ${D}${bindir}/
 	install -m 0755 bin/apt-cdrom ${D}${bindir}/
 	install -m 0755 bin/apt-get ${D}${bindir}/
 	install -m 0755 bin/apt-config ${D}${bindir}/
-- 
1.9.1


