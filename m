Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TvpZQ-0004FV-5G
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 14:31:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2013 05:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="273242442"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2013 05:16:27 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 15:16:37 +0200
Message-Id: <1358428597-20086-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus: upgrade to 1.6.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 13:31:54 -0000

dbus, dbus-ptest upgraded to v1.6.8

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/dbus-1.init    |    0
 meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/ptest.patch    |    0
 meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/run-ptest      |    0
 .../dbus/{dbus-1.6.4 => dbus-1.6.8}/test-run-path.patch          |    0
 meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/tmpdir.patch   |    0
 .../dbus/{dbus-ptest_1.6.4.bb => dbus-ptest_1.6.8.bb}            |    4 ++--
 meta/recipes-core/dbus/dbus_1.6.4.bb                             |    6 ------
 meta/recipes-core/dbus/dbus_1.6.8.bb                             |    6 ++++++
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/ptest.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/run-ptest (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/test-run-path.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/tmpdir.patch (100%)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.4.bb => dbus-ptest_1.6.8.bb} (91%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.4.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.8.bb

diff --git a/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.8/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.6.8/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/ptest.patch b/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.4/ptest.patch
rename to meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/run-ptest b/meta/recipes-core/dbus/dbus-1.6.8/run-ptest
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.4/run-ptest
rename to meta/recipes-core/dbus/dbus-1.6.8/run-ptest
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch b/meta/recipes-core/dbus/dbus-1.6.8/test-run-path.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
rename to meta/recipes-core/dbus/dbus-1.6.8/test-run-path.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.6.8/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.4/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.6.8/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.4.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
similarity index 91%
rename from meta/recipes-core/dbus/dbus-ptest_1.6.4.bb
rename to meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
index dbfa638..fd7ce7d 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.4.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "5ec43dc4554cba638917317b2b4f7640"
-SRC_URI[sha256sum] = "5fba6b7a415d761a843fb8e0aee72db61cf13057a9ef8cdc795e5d369dc74cf1"
+SRC_URI[md5sum] = "3bf059c7dd5eda5f539a1b7cfe7a14a2"
+SRC_URI[sha256sum] = "fc1370ef38abeeb13f55c905ec002e60705fb0bfde3b8d21c8d6eb8056c11bac"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESPATH = "${FILE_DIRNAME}/dbus-${PV}"
diff --git a/meta/recipes-core/dbus/dbus_1.6.4.bb b/meta/recipes-core/dbus/dbus_1.6.4.bb
deleted file mode 100644
index 179097d..0000000
--- a/meta/recipes-core/dbus/dbus_1.6.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include dbus.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "5ec43dc4554cba638917317b2b4f7640"
-SRC_URI[sha256sum] = "5fba6b7a415d761a843fb8e0aee72db61cf13057a9ef8cdc795e5d369dc74cf1"
diff --git a/meta/recipes-core/dbus/dbus_1.6.8.bb b/meta/recipes-core/dbus/dbus_1.6.8.bb
new file mode 100644
index 0000000..facc02e
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.6.8.bb
@@ -0,0 +1,6 @@
+include dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "3bf059c7dd5eda5f539a1b7cfe7a14a2"
+SRC_URI[sha256sum] = "fc1370ef38abeeb13f55c905ec002e60705fb0bfde3b8d21c8d6eb8056c11bac"
-- 
1.7.10.4



