Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 17CFE784DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279610"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:52 +0300
Message-Id: <cf2618ffac08d4b56b027daf8c5c2fc16690c41f.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/32] gnomebase.bbclass: add datadir/icons and datadir/appdata to standard FILES list
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:30 -0000

Gnome apps seem to increasingly package those, so let's make it common.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gnomebase.bbclass                 | 2 ++
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb | 2 +-
 meta/recipes-kernel/sysprof/sysprof_3.24.1.bb  | 1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 54aa45f174c..4ccc8e07814 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -14,6 +14,8 @@ FILES_${PN} += "${datadir}/application-registry  \
                 ${datadir}/polkit* \
                 ${datadir}/GConf \
                 ${datadir}/glib-2.0/schemas \
+                ${datadir}/appdata \
+                ${datadir}/icons \
 "
 
 FILES_${PN}-doc += "${datadir}/devhelp"
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
index 75deca800e2..b51f54fced3 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
@@ -19,5 +19,5 @@ do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
 }
 
-FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
+FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
index 0d140838f85..168f2fdfba2 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
@@ -26,7 +26,6 @@ PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-FILES_${PN} += "${datadir}/icons/ ${datadir}/appdata"
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
 
-- 
2.11.0


