Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 17A3D76798
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724745"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:41 +0300
Message-Id: <9cf223f2de41924e1ecc32ec0f7a27ec202e3439.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/7] fotowall: update SRC_URI to use github instead of qt-apps.org
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:49 -0000

GitHub is where upstream development is happening, so we are more likely
to find out about new releases from there

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-qt/qt-apps/fotowall_0.9.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 48dcc02..3af0265 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -10,14 +10,12 @@ SECTION = "x11/apps"
 
 PR = "r4"
 
-SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
+SRCREV = "06d5a4142c599604d9a9fd64727b6945eb8cd3da"
+SRC_URI = "git://github.com/enricoros/fotowall.git \
            file://ExportWizard-depends-on-ui_wizard.patch \
            "
 
-SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
-SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
-
-S = "${WORKDIR}/Fotowall-${PV}"
+S = "${WORKDIR}/git"
 
 inherit qt4x11
 
-- 
2.1.4


