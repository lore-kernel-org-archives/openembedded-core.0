Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id A90BB731F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 07:57:47 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D460F43EC7F;
	Mon, 15 Feb 2016 08:57:45 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
	George McCollister <george.mccollister@gmail.com>
Date: Mon, 15 Feb 2016 08:57:31 +0100
Message-Id: <1294129ed4ff4f49f2d2088e8aa6fa51f5ed9a1d.1455522891.git.maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] dbus-glib: 0.104 -> 0.106
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
X-List-Received-Date: Mon, 15 Feb 2016 07:57:49 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/dbus/dbus-glib_0.104.bb | 4 ----
 meta/recipes-core/dbus/dbus-glib_0.106.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.104.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.106.bb

diff --git a/meta/recipes-core/dbus/dbus-glib_0.104.bb b/meta/recipes-core/dbus/dbus-glib_0.104.bb
deleted file mode 100644
index c1263c0aff5377a2c130e28570933bdb765dfa5c..0000000000000000000000000000000000000000
--- a/meta/recipes-core/dbus/dbus-glib_0.104.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dbus-glib.inc
-
-SRC_URI[md5sum] = "5497d2070709cf796f1878c75a72a039"
-SRC_URI[sha256sum] = "bfc1f1a82bfc3ec3ecafe04d0e87bab7e999f50dce4f4a34d0b89caf6bd821f6"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.106.bb b/meta/recipes-core/dbus/dbus-glib_0.106.bb
new file mode 100644
index 0000000000000000000000000000000000000000..0ae848e4009882e7b9976fa39fbb3fff88ad52b0
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.106.bb
@@ -0,0 +1,4 @@
+require dbus-glib.inc
+
+SRC_URI[md5sum] = "2eea0b7f52b49f600a07abfd8535d4e4"
+SRC_URI[sha256sum] = "b38952706dcf68bad9c302999ef0f420b8cf1a2428227123f0ac4764b689c046"
-- 
2.5.0


