Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF433606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 13:23:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2015 06:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="743673465"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2015 06:23:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 16:23:43 +0300
Message-Id: <1434374623-7671-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk+: Upgrade 2.24.27 -> 2.24.28
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
X-List-Received-Date: Mon, 15 Jun 2015 13:23:38 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+_2.24.27.bb => gtk+_2.24.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.27.bb => gtk+_2.24.28.bb} (90%)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
similarity index 90%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
index 4f664e4..e343773 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
 	  "
 
-SRC_URI[md5sum] = "b1e890e15602c5bcb40d85b13fe046fd"
-SRC_URI[sha256sum] = "20cb10cae43999732a9af2e9aac4d1adebf2a9c2e1ba147050976abca5cd24f4"
+SRC_URI[md5sum] = "bfacf87b2ea67e4e5c7866a9003e6526"
+SRC_URI[sha256sum] = "b2c6441e98bc5232e5f9bba6965075dcf580a8726398f7374d39f90b88ed4656"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.1.4


