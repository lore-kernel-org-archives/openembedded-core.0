Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Re7yA-0004O6-4j
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:27:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2011 08:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99722906"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2011 08:20:33 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 00:35:18 +0800
Message-Id: <730a89487990ac89b5cf86063d083d23a5501188.1324657801.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
In-Reply-To: <cover.1324657801.git.shane.wang@intel.com>
References: <cover.1324657801.git.shane.wang@intel.com>
Subject: [PATCH 08/14] dbus: upgrade to 1.5.8
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
X-List-Received-Date: Fri, 23 Dec 2011 16:27:42 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../dbus/{dbus-1.4.16 => dbus-1.5.8}/dbus-1.init   |    0
 .../dbus/{dbus-1.4.16 => dbus-1.5.8}/tmpdir.patch  |    0
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    5 -----
 meta/recipes-core/dbus/dbus_1.5.8.bb               |    6 ++++++
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.8}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.8}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.5.8.bb

diff --git a/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.8/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.5.8/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.5.8/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.5.8/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
deleted file mode 100644
index f87f266..0000000
--- a/meta/recipes-core/dbus/dbus_1.4.16.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
-SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
-
diff --git a/meta/recipes-core/dbus/dbus_1.5.8.bb b/meta/recipes-core/dbus/dbus_1.5.8.bb
new file mode 100644
index 0000000..d50999e
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.5.8.bb
@@ -0,0 +1,6 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "87fee7d4de53d88abf93d4915a77a2c1"
+SRC_URI[sha256sum] = "6e1cd5248562b5362e9a1ad8314459fe2f60ee3b9622ce0afd68cc9df8ae7c5e"
+
+
-- 
1.7.6



