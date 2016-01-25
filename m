Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AC18E7706D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143885"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:12 +0200
Message-Id: <9e88b80c32f11e18190b1ac0335b2f5e7f9fe119.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/16] at-spi2-core: update to 2.18.3
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../atk/{at-spi2-core_2.18.1.bb => at-spi2-core_2.18.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.18.1.bb => at-spi2-core_2.18.3.bb} (85%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.18.1.bb b/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
similarity index 85%
rename from meta/recipes-support/atk/at-spi2-core_2.18.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.18.3.bb
index bade3c6..f22bb83 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
@@ -8,8 +8,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "5f13ba8cfd97cf817261954ef49ebd48"
-SRC_URI[sha256sum] = "57d555be4cc64905454687bf9bb7dc1e68531bee93befa77222d94ea083f01cf"
+SRC_URI[md5sum] = "fc18801e56f6ce6914126f837d42f556"
+SRC_URI[sha256sum] = "ada26add94155f97d0f601a20cb7a0e3fd3ba1588c3520b7288316494027d629"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
-- 
2.7.0.rc3


