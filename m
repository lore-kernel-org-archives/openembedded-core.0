Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CAE5777394
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:02:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659219998"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:18 +0200
Message-Id: <1c536f17651331b0442ded33ddd0c78d322f65b6.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/19] epiphany: update to 3.18.4
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.18.3.bb => epiphany_3.18.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.18.3.bb => epiphany_3.18.4.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.18.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
index 73fcd93..12d3b07 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
@@ -10,8 +10,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "5ed8b4506666f301949a2e12d39f2b4d"
-SRC_URI[archive.sha256sum] = "cd4e9ce588c4c66109547d93999d9740d338c3f9dbfbc2143cf2cbb74260def9"
+SRC_URI[archive.md5sum] = "172b78256100e8d3c629764abd0e1495"
+SRC_URI[archive.sha256sum] = "be699d484371111abae754e669187215df73e21533f461e513b79537d7a1c1c1"
 
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
 
-- 
2.7.0


