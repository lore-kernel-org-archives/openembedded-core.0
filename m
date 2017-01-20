Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 660C3719AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:10:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jan 2017 05:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,258,1477983600"; d="scan'208";a="811249561"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2017 05:10:04 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9D9116A4006;
	Fri, 20 Jan 2017 05:09:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:09:38 +0200
Message-Id: <1484917778-4178-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] epiphany: Fix dependencies for recipe specific sysroot
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
X-List-Received-Date: Fri, 20 Jan 2017 13:10:04 -0000

gettext and glib-2.0 tools are required during build.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This should fix the build issues epiphany is having with the RSS
patchset.

 meta/recipes-gnome/epiphany/epiphany_3.22.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
index 9803a16..78a5bc7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.3.bb
@@ -3,9 +3,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
-	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
+	   gsettings-desktop-schemas gnome-desktop3 libxml2-native \
+	   intltool-native glib-2.0 glib-2.0-native"
 
-inherit gnomebase gsettings distro_features_check upstream-version-is-even
+inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-- 
2.1.4


