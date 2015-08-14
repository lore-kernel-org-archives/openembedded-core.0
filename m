Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1985763F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2015 03:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726463"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:41 +0300
Message-Id: <8654f3ae878ceb4421a61e96091dd403e94c2f47.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/22] distro: update include files related to webkitgtk and epiphany addition
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:28 -0000

This commit fixes recipe metadata in distro_alias, package_regex and
upstream_tracking includes.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc      | 2 +-
 meta/conf/distro/include/package_regex.inc     | 8 +++++---
 meta/conf/distro/include/upstream_tracking.inc | 2 --
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index ec8570d..bd3da9c 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -472,7 +472,7 @@ DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 DISTRO_PN_ALIAS_pn-videoproto = "Meego=xorg-x11-proto-videoproto"
 DISTRO_PN_ALIAS_pn-waffle = "OE-Core"
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
-DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk Ubuntu=libwebkit"
+DISTRO_PN_ALIAS_pn-webkitgtk = "Fedora=webkitgtk Ubuntu=libwebkit"
 DISTRO_PN_ALIAS_pn-web-webkit = "OpenedHand"
 DISTRO_PN_ALIAS_pn-weston = "Fedora=weston OpenSuSE=weston"
 DISTRO_PN_ALIAS_pn-weston-init = "OE-Core"
diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 037fdaa..8a24f50 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -25,9 +25,6 @@ COMMON_REGEX = "(?P<pver>(\d+[\.\-_]*)+)"
 REGEX_URI_pn-wireless-tools = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
 REGEX_pn-wireless-tools = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
 
-REGEX_URI_pn-midori="http://midori-browser.org/download/source/"
-REGEX_pn-midori="midori_(?P<pver>((\d+[\.\-_]*)+))_all_\.tar\.bz2"
-
 REGEX_URI_pn-sqlite3="http://www.sqlite.org/"
 REGEX_pn-sqlite3="releaselog/${COMMON_REGEX}.html"
 
@@ -92,6 +89,7 @@ REGEX_URI_pn-python-smartpm="https://launchpad.net/smart/trunk/"
 REGEX_URI_pn-lsof = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
 REGEX_URI_pn-pbzip2 = "http://compression.ca/pbzip2/"
 REGEX_URI_pn-quicky = "http://qt-apps.org/content/download.php?content=80325&id=1&tan=10417482"
+REGEX_URI_pn-libwebp = "http://downloads.webmproject.org/releases/webp/index.html"
 
 # The engine tries to use directory versioning but is a false-positive
 REGEX_URI_pn-intltool = "https://launchpad.net/intltool/trunk/"
@@ -224,6 +222,10 @@ REGEX_pn-clutter-1.0 = "${GNOME_STABLE}"
 REGEX_pn-clutter-gtk-1.0 = "${GNOME_STABLE}"
 REGEX_pn-clutter-gst-3.0 = "${GNOME_STABLE}"
 REGEX_pn-cogl-1.0 = "${GNOME_STABLE}"
+REGEX_pn-epiphany = "${GNOME_STABLE}"
+REGEX_pn-webkitgtk = "${GNOME_STABLE}"
+REGEX_pn-p11-kit = "${GNOME_STABLE}"
+REGEX_pn-gnome-desktop3 = "${GNOME_STABLE}"
 
 # not GNOME related but uses same even-minor-release-is-stable logic
 REGEX_pn-dbus = "${GNOME_STABLE}"
diff --git a/meta/conf/distro/include/upstream_tracking.inc b/meta/conf/distro/include/upstream_tracking.inc
index 996d9e0..a9b33f1 100644
--- a/meta/conf/distro/include/upstream_tracking.inc
+++ b/meta/conf/distro/include/upstream_tracking.inc
@@ -31,8 +31,6 @@ CHECK_DATE_pn-unfs3 = "Jun 10, 2015"
 RECIPE_NO_UPDATE_REASON_pn-base-passwd = "Version 3.5.38 requires cdebconf for update-passwd utility"
 RECIPE_NO_UPDATE_REASON_pn-chkconfig = "Version 1.5 requires selinux"
 RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
-RECIPE_NO_UPDATE_REASON_pn-jpeg = "webkit-gtk 1.8.3 doesn't work with jpeg 9"
 RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "2.x depends on fontforge package, which is not yet provided in oe-core"
 RECIPE_NO_UPDATE_REASON_pn-pkgconfig = "removes glib-conf, adds circular depends"
 RECIPE_NO_UPDATE_REASON_pn-python-pygobject = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
-RECIPE_NO_UPDATE_REASON_pn-webkit-gtk = ">= 1.10.2 needs ruby"
-- 
2.1.4


