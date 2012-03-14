Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmf-0004Xg-Kt
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551602"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:12 -0700
Message-Id: <1a93ad99eb4ce19b45e5f2b61902f1f2936bddff.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 01/14] owl-video: Fix unpackaged file warning
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:13 -0000

WARNING: For recipe owl-video, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/video
WARNING:   /usr/share/video/gtk-fullscreen.png
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index 3ecb82e..bc63273 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libowl-av"
 
 SRCREV = "f133472318970796fae1ea3e98ac062156768baf"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -39,3 +39,5 @@ do_install_append () {
 	install -d ${D}/${datadir}/applications
 	install -m 0644 ${WORKDIR}/owl-video-widget.desktop ${D}/${datadir}/applications
 }
+
+FILES_${PN} += "${datadir}/video"
-- 
1.7.7.6



