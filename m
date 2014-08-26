Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2493470F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:08:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 Aug 2014 09:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="581923992"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2014 09:08:28 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:08:24 +0300
Message-Id: <fdd8a756896b56c4f2573dc4462f50ad7ce5628f.1409069262.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409069262.git.roxana.ciobanu@intel.com>
References: <cover.1409069262.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409069262.git.roxana.ciobanu@intel.com>
References: <cover.1409069262.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] hicolor-icon-theme: Upgrade to 0.13
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
X-List-Received-Date: Tue, 26 Aug 2014 16:08:57 -0000

From: Roxana Ciobanu <roxana.ciobanu@intel.com>

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 .../{hicolor-icon-theme_0.12.bb => hicolor-icon-theme_0.13.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.12.bb => hicolor-icon-theme_0.13.bb} (80%)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
similarity index 80%
rename from meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
rename to meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
index 4441e04..9df81cb 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
@@ -13,8 +13,8 @@ PR = "r1"
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
         file://index.theme"
 
-SRC_URI[md5sum] = "55cafbcef8bcf7107f6d502149eb4d87"
-SRC_URI[sha256sum] = "9edca690617eaa19054951ca53501c802180262be8880ed84754ac46c93bec73"
+SRC_URI[md5sum] = "21d0f50aa6b8eef02846cda9e5e9324c"
+SRC_URI[sha256sum] = "a38b038915480d1ddd4e3c421562560a14d42ace0449a5acc07c50f57f9c3406"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
1.9.1


