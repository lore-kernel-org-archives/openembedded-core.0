Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMOD-0003Fz-9m
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2011 06:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="23267055"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2011 06:03:23 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:17 +0800
Message-Id: <98274ba6a2993cab1789a6f6f45fa26735e23379.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Subject: [PATCH 5/5] distro_tracking_field: update the manually check field
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jul 2011 13:07:09 -0000

sqlite3
qemugl
console-tools
gconf-dbus

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ad64581..5af3c73 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -492,11 +492,12 @@ RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
 RECIPE_LAST_UPDATE_pn-sqlite3 = "Nov 24, 2010"
 RECIPE_MAINTAINER_pn-sqlite3 = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
-RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.3"
+RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.7.1"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sqlite3 = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "10/2010"
 RECIPE_COMMENTS_pn-sqlite3 = ""
+RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Jul 01, 2011"
 
 RECIPE_STATUS_pn-libpthread-stubs = "green"
 RECIPE_LAST_UPDATE_pn-libpthread-stubs = "Jul 6, 2010"
@@ -1249,6 +1250,7 @@ RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-console-tools = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Jul 01, 2011"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
@@ -1463,6 +1465,7 @@ RECIPE_INTEL_SECTION_pn-gconf-dbus = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gconf-dbus = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-gconf-dbus = "n/a"
 RECIPE_COMMENTS_pn-gconf-dbus = "difficult to identify official site and current status"
+RECIPE_MANUAL_CHECK_DATE_pn-gconf-dbus = "Jul 01, 2011"
 
 RECIPE_STATUS_pn-elfutils ="green" # no update needed
 RECIPE_LAST_UPDATE_pn-elfutils = "Jul 16, 2010"
@@ -3359,6 +3362,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Yu Ke <ke.yu@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Jul 01, 2011"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
-- 
1.7.0.4



