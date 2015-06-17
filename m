Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC4F758DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205466"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:48 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:23 +0300
Message-Id: <1434547172-24620-14-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/22] Add a recipe for gcr
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:50 -0000

gcr is a dependency of epiphany

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.16.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr_3.16.0.bb

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
new file mode 100644
index 0000000..8b5b6e4
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A library for bits of crypto UI and parsing etc"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
+
+inherit autotools gnomebase gtk-icon-cache gtk-doc
+
+SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
+SRC_URI[archive.sha256sum] = "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-3 \
+"
-- 
2.1.4


