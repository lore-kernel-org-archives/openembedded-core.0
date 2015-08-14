Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B3F2272A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:42:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2015 03:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="748520688"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2015 03:42:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:43:16 +0300
Message-Id: <91658fa21372a54534a6eff10ecaaf747c484697.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/5] package_regex.inc: fix regexes for adwaita-icon-theme, cairo and dhcp
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
X-List-Received-Date: Fri, 14 Aug 2015 10:42:03 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 037fdaa..0c29ade 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -32,7 +32,7 @@ REGEX_URI_pn-sqlite3="http://www.sqlite.org/"
 REGEX_pn-sqlite3="releaselog/${COMMON_REGEX}.html"
 
 REGEX_URI_pn-dhcp = "ftp://ftp.isc.org/isc/dhcp/"
-REGEX_pn-dhcp="(?P<pver>\d+\.\d+\.(\d+?))"
+REGEX_pn-dhcp="(?P<pver>\d+\.\d+\.(\d+?))/"
 
 REGEX_pn-foomatic-filters = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
 REGEX_pn-xdg-utils = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
@@ -42,6 +42,8 @@ REGEX_pn-libtheora = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 REGEX_pn-iputils="iputils-(?P<pver>s\d+).tar"
 REGEX_pn-nettle = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
+REGEX_pn-cairo = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
+
 # Exclude NC versions which lack AES encryption
 REGEX_pn-db = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
 
@@ -224,6 +226,7 @@ REGEX_pn-clutter-1.0 = "${GNOME_STABLE}"
 REGEX_pn-clutter-gtk-1.0 = "${GNOME_STABLE}"
 REGEX_pn-clutter-gst-3.0 = "${GNOME_STABLE}"
 REGEX_pn-cogl-1.0 = "${GNOME_STABLE}"
+REGEX_pn-adwaita-icon-theme = "${GNOME_STABLE}"
 
 # not GNOME related but uses same even-minor-release-is-stable logic
 REGEX_pn-dbus = "${GNOME_STABLE}"
-- 
2.1.4


