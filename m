Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 24FCF758EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205416"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:15 +0300
Message-Id: <1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:38 -0000

New webkit requires at least version 0.7

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libnotify/{libnotify_0.6.0.bb => libnotify_0.7.6.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.6.0.bb => libnotify_0.7.6.bb} (66%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
similarity index 66%
rename from meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
index e6ee89b..e9363e8 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -5,15 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-DEPENDS = "dbus gtk+ dbus-glib"
+DEPENDS = "dbus gtk+3 dbus-glib"
 
-inherit gnomebase distro_features_check
+inherit gnomebase distro_features_check gtk-doc
 
 # Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
-SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
+SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
+SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
 
 do_configure_prepend() {
     sed -i /GTK3/d ${S}/configure.ac
-- 
2.1.4


