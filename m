Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbz-0005N8-Ah
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233744"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:13 -0800
Message-Id: <f4eb12559a199b1be90789dfda8404c608041848.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/26] libdrm: Upgrade to 2.4.29
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../drm/{libdrm_2.4.27.bb => libdrm_2.4.29.bb}     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.27.bb => libdrm_2.4.29.bb} (54%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.27.bb b/meta/recipes-graphics/drm/libdrm_2.4.29.bb
similarity index 54%
rename from meta/recipes-graphics/drm/libdrm_2.4.27.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.29.bb
index 473520e..d02b914 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.27.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.29.bb
@@ -2,9 +2,9 @@ require libdrm.inc
 
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
-SRC_URI += "file://installtests.patch"
+PR = "r0"
 
-SRC_URI[md5sum] = "0fba4f42735cd3d24dd7a8cde0023fbd"
-SRC_URI[sha256sum] = "ea6b04dd3298e36c7a43aadd5f80f48baeafe4caaabcf78b01dc919c5c757973"
+SRC_URI += "file://installtests.patch"
 
-PR = "r0"
+SRC_URI[md5sum] = "96d5e3e9edd55f4b016fe3b5dd0a1953"
+SRC_URI[sha256sum] = "e2432dc93e933479132123a1dca382294c30f55bc895bb737b6bdd6f2b8c452e"
-- 
1.7.6.4



