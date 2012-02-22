Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S04zR-0004uy-Cs
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 06:43:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 21:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109294426"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 21:34:18 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 13:33:42 +0800
Message-Id: <b7613743bd7777e0d89595be3a672965f04feb59.1329888524.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
Subject: [PATCH 1/3] quicky: Fix for multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 05:43:45 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-qt/qt-apps/quicky_0.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index 20c04f8..73d3e99 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -17,5 +17,5 @@ inherit qmake2 pkgconfig
 
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/${PN} ${D}${bindir}
+	install -m 0755 ${S}/${BPN} ${D}${bindir}
 }
-- 
1.7.1



