Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9726D606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187166"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:21 +0300
Message-Id: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/7] glib-networking: Upgrade to 2.44.0
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:45 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-yocto/conf/distro/include/upstream_tracking.inc                  | 1 -
 .../{glib-networking_2.38.0.bb => glib-networking_2.44.0.bb}          | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.38.0.bb => glib-networking_2.44.0.bb} (88%)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index b36ad36..8b95ebb 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -57,7 +57,6 @@ RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hol
 RECIPE_NO_UPDATE_REASON_pn-db= "API compatibility issue"
 RECIPE_NO_UPDATE_REASON_pn-dbus = "D-BUS 1.9.x is the development version, not stable."
 RECIPE_NO_UPDATE_REASON_pn-gawk = "Version 4.1.0 requires Automake 1.13, but have 1.12.6"
-RECIPE_NO_UPDATE_REASON_pn-glib-networking = "Pending Glib-2.0 Update"
 RECIPE_NO_UPDATE_REASON_pn-gnome-desktop = "waiting for the sato gtk3 port"
 RECIPE_NO_UPDATE_REASON_pn-gnome-icon-theme = "waiting for the sato gtk3 port"
 RECIPE_NO_UPDATE_REASON_pn-gnome-keyring = "waiting for the sato gtk3 port"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
index b9ba2d6..848bf53 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 intltool-native"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "a22907deed3d956860d83aa3233e86ff"
-SRC_URI[archive.sha256sum] = "a43eacbf721b475cf6ba0cd2eab02a332014f71a4c41d0b44bd7bbf8ed1f840d"
+SRC_URI[archive.md5sum] = "6989b20cf3b26dd5ae272e04a9acb0b3"
+SRC_URI[archive.sha256sum] = "8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.1.4


