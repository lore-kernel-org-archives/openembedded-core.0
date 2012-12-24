Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iV-0003rc-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440694"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:05 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:23 +0200
Message-Id: <5c7e7d0a4bc1397bf6c0f3116459742e87778f7a.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 11/15] matchbox-panel-2: fix PV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 08:49:00 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 9678713..dbe1fad 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -12,8 +12,8 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
-PV = "0.0+git${SRCPV}"
-PR = "r6"
+PV = "2.0+git${SRCPV}"
+PR = "r0"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
-- 
1.7.11.7



