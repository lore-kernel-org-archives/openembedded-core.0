Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA7D75C60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984546"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:21 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:09 +0300
Message-Id: <23c9533525e4ebe1b73808bcf23b8d499a266bb6.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/9] gnome-themes-standard: Upgrade 3.18.0 -> 3.20.2
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...nome-themes-standard_3.18.0.bb => gnome-themes-standard_3.20.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.18.0.bb => gnome-themes-standard_3.20.2.bb} (90%)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb
similarity index 90%
rename from meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb
rename to meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb
index 523253e..c98d870 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb
@@ -16,8 +16,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "4d17bc62e4d0c5440fc4eda3d9271367"
-SRC_URI[sha256sum] = "e646eb04c225282b7df7fff65741adaad4cf9ed2c12616b7310e7edd27d2bacb"
+SRC_URI[md5sum] = "adc3b1d57330561fea524842d0c0b485"
+SRC_URI[sha256sum] = "9d0d9c4b2c9f9008301c3c1878ebb95859a735b7fd4a6a518802b9637e4a7915"
 
 EXTRA_OECONF = "--disable-gtk3-engine"
 
-- 
2.1.4


