Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3F879AE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 09:26:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jul 2019 02:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,298,1559545200"; d="scan'208";a="368808500"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2019 02:26:51 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 17:28:49 +0800
Message-Id: <20190723092849.3765-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gdk-pixbuf: enable x11 PACKAGECONFIG option
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
X-List-Received-Date: Tue, 23 Jul 2019 09:26:52 -0000

Currently gdk-pixbuf x11 loader is enabled only
for LSB build. But it is needed by other recipes like
Ice window manger(icewm) for X window system.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
index 3145cc2089..eb1adb5050 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
@@ -42,8 +42,7 @@ LIBV = "2.10.0"
 
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
-PACKAGECONFIG ??= "${GDK_PIXBUF_LOADERS}"
-PACKAGECONFIG_linuxstdbase = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
-- 
2.17.1


