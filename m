Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 304E0605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:50:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2015 06:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="483689896"
Received: from heimdall.fi.intel.com ([10.237.72.110])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 06:49:50 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 16:49:41 +0300
Message-Id: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1429623703.git.jussi.kukkonen@intel.com>
References: <cover.1429623703.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] hicolor-icon-theme: Upgrade to 0.15
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
X-List-Received-Date: Tue, 21 Apr 2015 13:50:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{hicolor-icon-theme_0.14.bb => hicolor-icon-theme_0.15.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.14.bb => hicolor-icon-theme_0.15.bb} (74%)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.14.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.15.bb
similarity index 74%
rename from meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.14.bb
rename to meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.15.bb
index 9cb8056..a704632 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.14.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.15.bb
@@ -6,8 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "56d2c6c3a9df5a0acd332430e3f3ae3e"
-SRC_URI[sha256sum] = "7bed06e6ef316318274bda0fdaf39fce960e4222a0165c968d84acb428902ecd"
+SRC_URI[md5sum] = "6aa2b3993a883d85017c7cc0cfc0fb73"
+SRC_URI[sha256sum] = "9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc"
 
 inherit allarch autotools
 
-- 
2.1.4


