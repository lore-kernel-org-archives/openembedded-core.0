Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CC28D71C23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21267002"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:54 +0300
Message-Id: <611275eed029517e303645fb2cd5dd2c32c03d75.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/19] epiphany: update to 3.22.1
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../epiphany/{epiphany_3.20.3.bb => epiphany_3.22.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.20.3.bb => epiphany_3.22.1.bb} (77%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
similarity index 77%
rename from meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
index eba480b..57784ae 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
@@ -10,10 +10,10 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "31822b6b199f724f212ae9200bc055f1"
-SRC_URI[archive.sha256sum] = "4d9de1bdb44c14adf25aa6dc02ea3de60925cff5eb01fe89545e6032c9b424a2"
+SRC_URI[archive.md5sum] = "9b9b73601a32f5b11c02411952cec27a"
+SRC_URI[archive.sha256sum] = "aab162ede54d71e583e382ab5e3567f28d81e0cd42719a11cad8008b56c5cc0e"
 
-EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
 
 do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
-- 
2.9.3


