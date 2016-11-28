Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 658C471AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:39 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412292"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:28 +0200
Message-Id: <9b62ae1e7ac3b9664f582b9f66261b963301679a.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/18] epiphany: update to 3.22.3
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.22.1.bb => epiphany_3.22.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.1.bb => epiphany_3.22.3.bb} (82%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
similarity index 82%
rename from meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
index 2a9d200..9803a16 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
@@ -9,8 +9,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "9b9b73601a32f5b11c02411952cec27a"
-SRC_URI[archive.sha256sum] = "aab162ede54d71e583e382ab5e3567f28d81e0cd42719a11cad8008b56c5cc0e"
+SRC_URI[archive.md5sum] = "bfb6347acb91163aec3883bb3397372f"
+SRC_URI[archive.sha256sum] = "a11fe3495009f776e354bcafac3ab8fc52788f5bdb9d5ee2c2f1f2f021fb49c2"
 
 EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
 
-- 
2.10.2


