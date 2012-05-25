Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXqIy-0003Yh-QG
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 10:55:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 01:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104189554"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by AZSMGA002.ch.intel.com with ESMTP; 25 May 2012 01:45:16 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 11:50:57 +0300
Message-Id: <8fa66adb9fb21a130b73955d517383ecefe25ceb.1337868781.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337868781.git.radu.moisan@intel.com>
References: <cover.1337868781.git.radu.moisan@intel.com>
In-Reply-To: <cover.1337868781.git.radu.moisan@intel.com>
References: <cover.1337868781.git.radu.moisan@intel.com>
Subject: [PATCH 3/3] dbus: Update to version 1.5.12
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
X-List-Received-Date: Fri, 25 May 2012 08:55:29 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../dbus/{dbus-1.4.16 => dbus-1.5.12}/dbus-1.init  |    0
 .../dbus/{dbus-1.4.16 => dbus-1.5.12}/tmpdir.patch |    0
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    7 -------
 meta/recipes-core/dbus/dbus_1.5.12.bb              |    7 +++++++
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.12}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.12}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb

diff --git a/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
deleted file mode 100644
index 3cf8bb8..0000000
--- a/meta/recipes-core/dbus/dbus_1.4.16.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include dbus.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
-SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
-
diff --git a/meta/recipes-core/dbus/dbus_1.5.12.bb b/meta/recipes-core/dbus/dbus_1.5.12.bb
new file mode 100644
index 0000000..e73c948
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.5.12.bb
@@ -0,0 +1,7 @@
+include dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ddf18c86fd86ca0d766e18a514e368fd"
+SRC_URI[sha256sum] = "5d3e09a831259ca64b15357cfa1c60a5a7ab06ef469d5b82c2308de9cadf1094"
+
-- 
1.7.9.5



