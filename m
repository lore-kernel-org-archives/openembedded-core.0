Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6BE3759ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:20:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205563"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:20:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:32 +0300
Message-Id: <1434547172-24620-23-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/22] poky: update distro files related to webkitgtk update and epiphany addition
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
X-List-Received-Date: Wed, 17 Jun 2015 13:20:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-yocto/conf/distro/include/distro_alias.inc            | 2 +-
 meta-yocto/conf/distro/include/maintainers.inc             | 4 ++--
 meta-yocto/conf/distro/include/package_regex.inc           | 5 ++---
 meta-yocto/conf/distro/include/poky-floating-revisions.inc | 1 -
 meta-yocto/conf/distro/include/recipe_color.inc            | 1 -
 meta-yocto/conf/distro/include/upstream_tracking.inc       | 2 --
 6 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
index 0f8ed55..53386f3 100644
--- a/meta-yocto/conf/distro/include/distro_alias.inc
+++ b/meta-yocto/conf/distro/include/distro_alias.inc
@@ -473,7 +473,7 @@ DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 DISTRO_PN_ALIAS_pn-videoproto = "Meego=xorg-x11-proto-videoproto"
 DISTRO_PN_ALIAS_pn-waffle = "OE-Core"
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
-DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk Ubuntu=libwebkit"
+DISTRO_PN_ALIAS_pn-webkitgtk = "Fedora=webkitgtk Ubuntu=libwebkit"
 DISTRO_PN_ALIAS_pn-web-webkit = "OpenedHand"
 DISTRO_PN_ALIAS_pn-weston = "Fedora=weston OpenSuSE=weston"
 DISTRO_PN_ALIAS_pn-weston-init = "OE-Core"
diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index fdeb7f7..aab66d8 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -156,6 +156,7 @@ RECIPE_MAINTAINER_pn-eglibc-scripts = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-enchant = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-expat = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-file = "Robert Yang <liezhi.yang@windriver.com>"
@@ -444,7 +445,6 @@ RECIPE_MAINTAINER_pn-mesa-gl = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-meta-ide-support = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_MAINTAINER_pn-meta-toolchain-qte = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-meta-toolchain = "Jessica Zhang <jessica.zhang@intel.com>"
-RECIPE_MAINTAINER_pn-midori = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-mingetty = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_MAINTAINER_pn-minicom = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-mini-x-session = "Saul Wold <sgw@linux.intel.com>"
@@ -680,7 +680,7 @@ RECIPE_MAINTAINER_pn-vte = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-wayland = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-webkit-gtk = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-web-webkit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-weston = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-wget = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta-yocto/conf/distro/include/package_regex.inc b/meta-yocto/conf/distro/include/package_regex.inc
index 4aeae89..d36e116 100644
--- a/meta-yocto/conf/distro/include/package_regex.inc
+++ b/meta-yocto/conf/distro/include/package_regex.inc
@@ -21,9 +21,6 @@ COMMON_REGEX = "(?P<pver>(\d+[\.-_]*)+)"
 REGEX_URI_pn-wireless-tools = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
 REGEX_pn-wireless-tools = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
 
-REGEX_URI_pn-midori="http://midori-browser.org/download/source/"
-REGEX_pn-midori="midori_(?P<pver>((\d+[\.-_]*)+))_all_\.tar\.bz2"
-
 REGEX_URI_pn-sqlite3="http://www.sqlite.org/"
 REGEX_pn-sqlite3="${COMMON_REGEX}"
 
@@ -157,3 +154,5 @@ REGEX_pn-gtk-engines = "${GNOME2_STABLE}"
 REGEX_pn-glib-networking = "${GNOME_STABLE}"
 REGEX_pn-librsvg = "${GNOME_STABLE}"
 REGEX_pn-libsoup-2.4 = "${GNOME_STABLE}"
+REGEX_pn-epiphany = "${GNOME_STABLE}"
+REGEX_pn-webkitgtk = "${GNOME_STABLE}"
diff --git a/meta-yocto/conf/distro/include/poky-floating-revisions.inc b/meta-yocto/conf/distro/include/poky-floating-revisions.inc
index 5b8c3a0..b11f2cd 100644
--- a/meta-yocto/conf/distro/include/poky-floating-revisions.inc
+++ b/meta-yocto/conf/distro/include/poky-floating-revisions.inc
@@ -41,7 +41,6 @@ SRCREV_pn-clutter ?= "${AUTOREV}"
 SRCREV_pn-clutter-gst ?= "${AUTOREV}"
 SRCREV_pn-gaku ?= "${AUTOREV}"
 SRCREV_pn-gypsy ?= "${AUTOREV}"
-#SRCREV_pn-webkit-gtk ?= "${AUTOREV}"
 SRCREV_pn-aaina ?= "${AUTOREV}"
 SRCREV_pn-clutter-cairo ?= "${AUTOREV}"
 SRCREV_pn-table ?= "${AUTOREV}"
diff --git a/meta-yocto/conf/distro/include/recipe_color.inc b/meta-yocto/conf/distro/include/recipe_color.inc
index 7e50500..f998154 100644
--- a/meta-yocto/conf/distro/include/recipe_color.inc
+++ b/meta-yocto/conf/distro/include/recipe_color.inc
@@ -397,7 +397,6 @@ RECIPE_COLOR_pn-valgrind = "yellow"
 RECIPE_COLOR_pn-videoproto = "yellow"
 RECIPE_COLOR_pn-watchdog = "yellow"
 RECIPE_COLOR_pn-wbxml2 = "red"
-RECIPE_COLOR_pn-webkit-gtk = "yellow"
 RECIPE_COLOR_pn-web-webkit = "yellow"
 RECIPE_COLOR_pn-which = "yellow"
 RECIPE_COLOR_pn-wireless-tools="yellow"
diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index 96ca06c..6842df1 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -56,7 +56,6 @@ RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hol
 RECIPE_NO_UPDATE_REASON_pn-db= "API compatibility issue"
 RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 RECIPE_NO_UPDATE_REASON_pn-bash = "The latest version in yocto is 4.3.30"
-RECIPE_NO_UPDATE_REASON_pn-jpeg = "webkit-gtk 1.8.3 doesn't work with jpeg 9"
 RECIPE_NO_UPDATE_REASON_pn-kernelshark = "0.2 is the latest version."
 RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "2.00.0 - fontforge package required "
 RECIPE_NO_UPDATE_REASON_pn-nettle = "3.0.0 breaks gnutls, api changes"
@@ -65,6 +64,5 @@ RECIPE_NO_UPDATE_REASON_pn-python-distribute = "0.7.3 only upgrades 0.6.32, can'
 RECIPE_NO_UPDATE_REASON_pn-python-pygobject = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
 RECIPE_NO_UPDATE_REASON_pn-syslinux="Waiting for 4.06 for 3.3 kernel headers support"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
-RECIPE_NO_UPDATE_REASON_pn-webkit-gtk = ">= 1.10.2 needs ruby"
 RECIPE_NO_UPDATE_REASON_pn-xdg-utils = "only release candidates available "
 RECIPE_NO_UPDATE_REASON_pn-tremor = "Same revision on different SVN modules"
-- 
2.1.4


