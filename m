Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnc-0001zv-19
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720800"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:13 -0800
Message-Id: <c62e100efd2f02ed2cd34cdd53f4c9e7162bc4fc.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 13/26] xf86-input-synaptics: Update to 1.5.0
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:16 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...tics_1.4.0.bb => xf86-input-synaptics_1.5.0.bb} |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.4.0.bb => xf86-input-synaptics_1.5.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
index a75d051..57180a2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
 PR = "${INC_PR}.0"
 
+SRC_URI[md5sum] = "41ee749ecbfef98f7fba708cb2afae87"
+SRC_URI[sha256sum] = "95cc5399fc49c9a35b02c2272cd99b8438f4609b219278c66a79e74c916a1c4e"
+
 DEPENDS += "libxi"
 
 #
@@ -20,5 +23,3 @@ DEPENDS += "libxi"
 #
 EXTRA_OEMAKE += " sdkdir=${STAGING_INCDIR}/xorg "
 
-SRC_URI[md5sum] = "cbe487f9d22237d1e39c7d0b5812ab7e"
-SRC_URI[sha256sum] = "5874d979f028636dbddf14fffb84b496b006e63d5ea8dfa120820e58642812c2"
-- 
1.7.6.4



