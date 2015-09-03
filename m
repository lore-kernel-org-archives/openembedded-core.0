Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3B977002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539752"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:21 +0300
Message-Id: <f0ac5cca612d235155303a1904312a849fb1e662.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/12] package_regex.inc: various updates to improve RRS accuracy
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index df384e2..8fc112c 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -44,6 +44,8 @@ REGEX_pn-nettle = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 REGEX_pn-cairo = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
 REGEX_pn-cmake = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
+REGEX_pn-libsdl = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
+REGEX_pn-libxslt = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
 # Exclude NC versions which lack AES encryption
 REGEX_pn-db = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
@@ -171,9 +173,8 @@ REGEX_URI_pn-libpng12 = "http://sourceforge.net/projects/libpng/files/libpng12/"
 REGEX_pn-libpng12 = "/libpng12/${COMMON_REGEX}/"
 REGEX_URI_pn-docbook-dsssl-stylesheets = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
 REGEX_pn-docbook-dsssl-stylesheets = "/docbook-dsssl/${COMMON_REGEX}/"
-REGEX_URI_pn-openjade = "http://sourceforge.net/projects/openjade/files/openjade/"
-REGEX_pn-openjade = "/openjade/${COMMON_REGEX}/"
 
+REGEX_URI_pn-openjade = "http://openjade.sourceforge.net/download.html"
 REGEX_URI_pn-libpfm4 = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 REGEX_URI_pn-liba52 = "http://liba52.sourceforge.net/downloads.html"
 REGEX_URI_pn-mpeg2dec = "http://libmpeg2.sourceforge.net/downloads.html"
@@ -202,6 +203,10 @@ GITTAGREGEX_pn-mx-1.0 = "(?P<pver>^\d+(\.(?!99)\d+)+)"
 
 # Blacklist a bogus tag
 GITTAGREGEX_pn-file = "FILE(?P<pver>(?!6_23).+)"
+GITTAGREGEX_pn-xinetd = "xinetd-(?P<pver>(?!20030122).+)"
+
+# Blacklist debian-specific tags
+GITTAGREGEX_pn-xf86-video-omapfb = "(?P<pver>\d+(\.\d+)+)(?!-)"
 
 # GNOME related.
 #
@@ -231,6 +236,7 @@ REGEX_pn-clutter-gtk-1.0 = "${GNOME_STABLE}"
 REGEX_pn-clutter-gst-3.0 = "${GNOME_STABLE}"
 REGEX_pn-cogl-1.0 = "${GNOME_STABLE}"
 REGEX_pn-adwaita-icon-theme = "${GNOME_STABLE}"
+REGEX_pn-vte = "${GNOME_STABLE}"
 
 # not GNOME related but uses same even-minor-release-is-stable logic
 REGEX_pn-dbus = "${GNOME_STABLE}"
@@ -249,7 +255,7 @@ REGEX_pn-gstreamer1.0-rtsp-server = "${GNOME_STABLE}"
 REGEX_pn-perl = "${GNOME_STABLE}"
 
 # Keep old gcc versions at their major versions
-REGEX_pn-gcc-source-4.9.2 = "gcc-(?P<pver>4\.9\.\d+).tar"
+REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
 REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
 
 # these packages are taken from snapshots.debian.org; that source is static and goes stale
@@ -267,6 +273,4 @@ DEBIAN_PATCH_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz
 REGEX_pn-net-tools = "${DEBIAN_PATCH_REGEX}"
 REGEX_pn-apmd = "${DEBIAN_PATCH_REGEX}"
 REGEX_pn-blktool = "${DEBIAN_PATCH_REGEX}"
-# mailx is fetched from launchpad
-REGEX_URI_pn-mailx = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/"
 REGEX_pn-mailx = "${DEBIAN_PATCH_REGEX}"
-- 
2.1.4


