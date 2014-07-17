Return-Path: <Daniel.Bornaz@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AF01F70633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 12:44:43 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 17 Jul 2014 14:44:42 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4483)	id 6FB99288F32;
	Thu, 17 Jul 2014 14:44:42 +0200 (CEST)
From: Daniel BORNAZ <daniel.bornaz@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:44:37 +0200
Message-ID: <1405601077-13831-1-git-send-email-daniel.bornaz@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: daniel.bornaz@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v2] dbus: dbus update to 1.8.6
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
X-List-Received-Date: Thu, 17 Jul 2014 12:44:52 -0000
Content-Type: text/plain

dbus: dbus update to 1.8.6

Dbus and dbus-test updated to version 1.8.6, dbus-glib updated to
version 0.102. Removed recipes and files from previous version(s).

Current version fixes two DoS vulnerabilities in dbus-daemon (CVE-2014-3532).

Upstream-Status: Submitted

Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>

	renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch -> meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
	renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch -> meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
	renamed:    meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch -> meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
	deleted:    meta/recipes-core/dbus/dbus-glib_0.100.2.bb
	new file:   meta/recipes-core/dbus/dbus-glib_0.102.bb
	renamed:    meta/recipes-core/dbus/dbus-test_1.8.2.bb -> meta/recipes-core/dbus/dbus-test_1.8.6.bb
	deleted:    meta/recipes-core/dbus/dbus_1.8.2.bb
	new file:   meta/recipes-core/dbus/dbus_1.8.6.bb
---
 .../dbus/{dbus-glib-0.100.2 => dbus-glib-0.102}/no-examples.patch | 0
 .../obsolete_automake_macros.patch                                | 0
 .../test-install-makefile.patch                                   | 0
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb                       | 5 -----
 meta/recipes-core/dbus/dbus-glib_0.102.bb                         | 8 ++++++++
 meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.6.bb} | 3 +--
 meta/recipes-core/dbus/dbus_1.8.2.bb                              | 4 ----
 meta/recipes-core/dbus/dbus_1.8.6.bb                              | 4 ++++
 8 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib-0.102}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib-0.102}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib-0.102}/test-install-makefile.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.6.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.6.bb

diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch
rename to meta/recipes-core/dbus/dbus-glib-0.102/no-examples.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch b/meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
rename to meta/recipes-core/dbus/dbus-glib-0.102/obsolete_automake_macros.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch
rename to meta/recipes-core/dbus/dbus-glib-0.102/test-install-makefile.patch
diff --git a/meta/recipes-core/dbus/dbus-glib_0.100.2.bb b/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
deleted file mode 100644
index c1bb06a..0000000
--- a/meta/recipes-core/dbus/dbus-glib_0.100.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dbus-glib.inc
-
-
-SRC_URI[md5sum] = "ad0920c7e3aad669163bb59171cf138e"
-SRC_URI[sha256sum] = "a5bb42da921f51c28161e0e54a5a8241d94a1c0499a14007150e9ce743da6ac5"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.102.bb b/meta/recipes-core/dbus/dbus-glib_0.102.bb
new file mode 100644
index 0000000..28e8a72
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.102.bb
@@ -0,0 +1,8 @@
+require dbus-glib.inc
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
+           file://no-examples.patch \
+"
+
+SRC_URI[md5sum] = "f76b8558fd575d0106c3a556eaa49184"
+SRC_URI[sha256sum] = "6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c"
diff --git a/meta/recipes-core/dbus/dbus-test_1.8.2.bb b/meta/recipes-core/dbus/dbus-test_1.8.6.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.8.2.bb
rename to meta/recipes-core/dbus/dbus-test_1.8.6.bb
index e19d2e9..53c5d9a 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.6.bb
@@ -18,8 +18,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "d6f709bbec0a022a1847c7caec9d6068"
-SRC_URI[sha256sum] = "5689f7411165adc953f37974e276a3028db94447c76e8dd92efe910c6d3bae08"
+SRC_URI[md5sum] = "6a08ba555d340e9dfe2d623b83c0eea8"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.8.2.bb b/meta/recipes-core/dbus/dbus_1.8.2.bb
deleted file mode 100644
index 37ebed2..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "d6f709bbec0a022a1847c7caec9d6068"
-SRC_URI[sha256sum] = "5689f7411165adc953f37974e276a3028db94447c76e8dd92efe910c6d3bae08"
diff --git a/meta/recipes-core/dbus/dbus_1.8.6.bb b/meta/recipes-core/dbus/dbus_1.8.6.bb
new file mode 100644
index 0000000..2fd630f
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.6.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "6a08ba555d340e9dfe2d623b83c0eea8"
+SRC_URI[sha256sum] = "eded83ca007b719f32761e60fd8b9ffd0f5796a4caf455b01b5a5ef740ebd23f"
-- 
1.9.1


