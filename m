Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDE57C697
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 19:41:56 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x1GJfve2009839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 20:41:57 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.33.63])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x1GJfvkw017120;
	Sat, 16 Feb 2019 20:41:57 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C27AD98F566;
	Sat, 16 Feb 2019 20:41:56 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 20:40:47 +0100
Message-Id: <20190216194048.6256-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <20190215082252.2726-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
Subject: [PATCH v2 1/2] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sat, 16 Feb 2019 19:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- update to last stable version 1.30.1
- remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |  0
 ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ----------------------
 ...-testsuite-check-uudecode-before-using-it.patch |  6 +-
 .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |  5 +-
 4 files changed, 5 insertions(+), 89 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
 rename meta/recipes-core/busybox/{busybox_1.29.3.bb => busybox_1.30.1.bb} (89%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.29.3.bb b/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.29.3.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
deleted file mode 100644
index 9b96eeeae5..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From b09db631e77c63ebe733c69b00108f043f1f1d85 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 21 Nov 2018 10:00:29 +0800
-Subject: [PATCH] testsuite: check CONFIG_DESKTOP before using 'od -t'
-
-The '-t' option for od is enabled by CONFIG_DESKTOP. So
-check this config before using 'od -t' in test cases.
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086895.html]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- testsuite/echo/echo-prints-dash        | 1 +
- testsuite/echo/echo-prints-non-opts    | 1 +
- testsuite/echo/echo-prints-slash-zero  | 2 +-
- testsuite/echo/echo-prints-slash_00041 | 2 +-
- testsuite/echo/echo-prints-slash_0041  | 2 +-
- testsuite/echo/echo-prints-slash_041   | 2 +-
- testsuite/echo/echo-prints-slash_41    | 2 +-
- 7 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/testsuite/echo/echo-prints-dash b/testsuite/echo/echo-prints-dash
-index ddcdbad..f1f31a0 100644
---- a/testsuite/echo/echo-prints-dash
-+++ b/testsuite/echo/echo-prints-dash
-@@ -1 +1,2 @@
-+# FEATURE: CONFIG_DESKTOP
- test "`busybox echo - | od -t x1 | head -n 1`" = "0000000 2d 0a"
-diff --git a/testsuite/echo/echo-prints-non-opts b/testsuite/echo/echo-prints-non-opts
-index c7d1e20..4e642a1 100644
---- a/testsuite/echo/echo-prints-non-opts
-+++ b/testsuite/echo/echo-prints-non-opts
-@@ -1 +1,2 @@
-+# FEATURE: CONFIG_DESKTOP
- test "`busybox echo -neEZ | od -t x1 | head -n 1`" = "0000000 2d 6e 65 45 5a 0a"
-diff --git a/testsuite/echo/echo-prints-slash-zero b/testsuite/echo/echo-prints-slash-zero
-index d97ed8e..948f899 100644
---- a/testsuite/echo/echo-prints-slash-zero
-+++ b/testsuite/echo/echo-prints-slash-zero
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -e -n 'msg\n\0' | od -t x1 | head -n 1`" = "0000000 6d 73 67 0a 00"
-diff --git a/testsuite/echo/echo-prints-slash_00041 b/testsuite/echo/echo-prints-slash_00041
-index 9cffabd..7ea217b 100644
---- a/testsuite/echo/echo-prints-slash_00041
-+++ b/testsuite/echo/echo-prints-slash_00041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\00041z' | od -t x1 | head -n 1`" = "0000000 04 31 7a"
-diff --git a/testsuite/echo/echo-prints-slash_0041 b/testsuite/echo/echo-prints-slash_0041
-index b07429d..941faca 100644
---- a/testsuite/echo/echo-prints-slash_0041
-+++ b/testsuite/echo/echo-prints-slash_0041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\0041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
-diff --git a/testsuite/echo/echo-prints-slash_041 b/testsuite/echo/echo-prints-slash_041
-index 1d70cec..60cbfca 100644
---- a/testsuite/echo/echo-prints-slash_041
-+++ b/testsuite/echo/echo-prints-slash_041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
-diff --git a/testsuite/echo/echo-prints-slash_41 b/testsuite/echo/echo-prints-slash_41
-index 6d8999b..afd7c36 100644
---- a/testsuite/echo/echo-prints-slash_41
-+++ b/testsuite/echo/echo-prints-slash_41
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\41z' | od -t x1 | head -n 1`" = "0000000 21 7a"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
index 2d9856fb61..25472f0bbd 100644
--- a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
@@ -35,11 +35,11 @@ index af53de9..3b45ece 100755
  rm foo.zip
  
  # File containing some damaged encrypted stream
--optional FEATURE_UNZIP_CDF
-+optional FEATURE_UNZIP_CDF UUDECODE
+-optional FEATURE_UNZIP_CDF CONFIG_UNICODE_SUPPORT
++optional FEATURE_UNZIP_CDF CONFIG_UNICODE_SUPPORT UUDECODE
  testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
  "Archive:  bad.zip
-   inflating: ]3j½r«IK-%Ix
+   inflating: ]3j½r«I??K-%Ix
 -- 
 2.7.4
 
diff --git a/meta/recipes-core/busybox/busybox_1.29.3.bb b/meta/recipes-core/busybox/busybox_1.30.1.bb
similarity index 89%
rename from meta/recipes-core/busybox/busybox_1.29.3.bb
rename to meta/recipes-core/busybox/busybox_1.30.1.bb
index a3e68cdc77..164f3ab3c3 100644
--- a/meta/recipes-core/busybox/busybox_1.29.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.30.1.bb
@@ -44,9 +44,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
-           file://0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "0a367e19cdfd157e8258d87f893ee516"
-SRC_URI[tarball.sha256sum] = "97648636e579462296478e0218e65e4bc1e9cd69089a3b1aeb810bff7621efb7"
+SRC_URI[tarball.md5sum] = "4f72fc6abd736d5f4741fc4a2485547a"
+SRC_URI[tarball.sha256sum] = "3d1d04a4dbd34048f4794815a5c48ebb9eb53c5277e09ffffc060323b95dfbdc"
-- 
2.11.0


