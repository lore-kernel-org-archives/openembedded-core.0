Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7172373133
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302199"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:10 +0200
Message-Id: <c8dbccfc1a699151f5f945c2b5b1ffb061b29276.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/24] epiphany: update to 3.22.6
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.22.3.bb => epiphany_3.22.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.3.bb => epiphany_3.22.6.bb} (83%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.6.bb
similarity index 83%
rename from meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.22.6.bb
index 78a5bc77527..651fef1bf08 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.6.bb
@@ -10,8 +10,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even gette
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "bfb6347acb91163aec3883bb3397372f"
-SRC_URI[archive.sha256sum] = "a11fe3495009f776e354bcafac3ab8fc52788f5bdb9d5ee2c2f1f2f021fb49c2"
+SRC_URI[archive.md5sum] = "e08762c6bb01c4d291b3d22c7adb1a65"
+SRC_URI[archive.sha256sum] = "de7ea87dc450702bde620033f9e2ce807859727d007396d86b09f2b82397fcc2"
 
 EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
 
-- 
2.11.0


