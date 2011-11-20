Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RS4BF-000542-56
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 10:59:21 +0100
Received: by wwf25 with SMTP id 25so3628449wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 01:52:53 -0800 (PST)
Received: by 10.180.104.35 with SMTP id gb3mr9992270wib.11.1321782772322;
	Sun, 20 Nov 2011 01:52:52 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z3sm2009056wid.11.2011.11.20.01.52.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 01:52:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 10:52:45 +0100
Message-Id: <1321782765-28952-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus: update to 1.4.16
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
X-List-Received-Date: Sun, 20 Nov 2011 09:59:21 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../dbus/{dbus-1.4.12 => dbus-1.4.16}/dbus-1.init  |    0
 .../dbus/{dbus-1.4.12 => dbus-1.4.16}/tmpdir.patch |    0
 meta/recipes-core/dbus/dbus_1.4.12.bb              |    7 -------
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    5 +++++
 4 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.12 => dbus-1.4.16}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.12 => dbus-1.4.16}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.12.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb

diff --git a/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus_1.4.12.bb b/meta/recipes-core/dbus/dbus_1.4.12.bb
deleted file mode 100644
index 64cfedd..0000000
--- a/meta/recipes-core/dbus/dbus_1.4.12.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include dbus.inc
-
-PR = "r7"
-
-SRC_URI[md5sum] = "104f2ea94c10a896dfb1edecb5714cb1"
-SRC_URI[sha256sum] = "da3c97fd546610558d588799e27c4fa81101e754acbcd34747a42c131f30dbe7"
-
diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
new file mode 100644
index 0000000..f87f266
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.4.16.bb
@@ -0,0 +1,5 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
+SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
+
-- 
1.7.2.5



