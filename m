Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 75B3876E01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550251011"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:55 +0300
Message-Id: <9dcb035c541fae6b59911e017cb0976704bf8d69.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] package_regex.inc: updates to improve upstream tracking
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 0c29ade..df384e2 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -43,6 +43,7 @@ REGEX_pn-iputils="iputils-(?P<pver>s\d+).tar"
 REGEX_pn-nettle = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 REGEX_pn-cairo = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
+REGEX_pn-cmake = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
 # Exclude NC versions which lack AES encryption
 REGEX_pn-db = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
@@ -199,6 +200,9 @@ GITTAGREGEX_pn-sgmlspl = "(?P<pver>(\d+(\.\d+)+))"
 # Exclude x.99.x versions
 GITTAGREGEX_pn-mx-1.0 = "(?P<pver>^\d+(\.(?!99)\d+)+)"
 
+# Blacklist a bogus tag
+GITTAGREGEX_pn-file = "FILE(?P<pver>(?!6_23).+)"
+
 # GNOME related.
 #
 # GNOME2_STABLE picks stable releases in the 2.x series (so not 2.90 onwards,
@@ -206,8 +210,8 @@ GITTAGREGEX_pn-mx-1.0 = "(?P<pver>^\d+(\.(?!99)\d+)+)"
 #
 # GNOME_STABLE picks the latest stable release.
 
-GNOME2_STABLE = "(?P<pver>2\.([0-8]*[02468])+\.\d+)"
-GNOME_STABLE = "(?P<pver>\d+\.(\d*[02468])+\.\d+)"
+GNOME2_STABLE = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+GNOME_STABLE = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 REGEX_pn-glib-2.0 = "${GNOME_STABLE}"
 REGEX_pn-atk = "${GNOME_STABLE}"
-- 
2.1.4


