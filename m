Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66D277215B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7oDaG026331
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:13 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:12 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:34 +0800
Message-ID: <645730f9c5b84b490eb8f1c0480322126bb09e80.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] dbus-glib: Upgrade to 0.102
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:12 -0000
Content-Type: text/plain

Remove obsolete_automake_macros.patch, since upstream has merged it.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../obsolete_automake_macros.patch                 | 15 ------
 meta/recipes-core/dbus/dbus-glib.inc               |  1 -
 .../no-examples.patch                              |  0
 .../test-install-makefile.patch                    | 57 +++++++++++++---------
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |  5 --
 meta/recipes-core/dbus/dbus-glib_0.102.bb          |  5 ++
 6 files changed, 38 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/test-install-makefile.patch (66%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb

diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch b/meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
deleted file mode 100644
index 40e3b12..0000000
--- a/meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=59003]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd dbus-glib-0.100/configure.ac dbus-glib-0.100/configure.ac
---- dbus-glib-0.100/configure.ac	2012-06-25 19:26:39.000000000 +0300
-+++ dbus-glib-0.100/configure.ac	2013-01-03 04:53:22.314976758 +0200
-@@ -8,7 +8,7 @@
-
- AM_INIT_AUTOMAKE([1.9])
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- # Honor aclocal flags
- ACLOCAL="$ACLOCAL $ACLOCAL_FLAGS"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 6c60d9e..abd0132 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -13,7 +13,6 @@ DEPENDS_class-native = "glib-2.0-native dbus-native"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
            file://test-install-makefile.patch \
-           file://obsolete_automake_macros.patch \
 "
 
 inherit autotools pkgconfig gettext
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100.2/no-examples.patch
rename to meta/recipes-core/dbus/dbus-glib/no-examples.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
similarity index 66%
rename from meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch
rename to meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
index 2e8e178..027c82b 100644
--- a/meta/recipes-core/dbus/dbus-glib-0.100.2/test-install-makefile.patch
+++ b/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
@@ -3,26 +3,46 @@ Change Makefile.am to install regression tests for test package purpose.
 Upstream-Status: Inappropriate [test not install is for purpose from upstream]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ test/Makefile.am            | 3 ++-
+ test/core/Makefile.am       | 3 ++-
+ test/interfaces/Makefile.am | 3 ++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/test/Makefile.am b/test/Makefile.am
-index 7ba11a8..249f0e7 100644
+index 379c8c3..6580927 100644
 --- a/test/Makefile.am
 +++ b/test/Makefile.am
-@@ -13,7 +13,8 @@ else
- TEST_BINARIES=
- endif
+@@ -48,7 +48,8 @@ TESTS = \
+ 	$(test_scripts) \
+ 	$(NULL)
  
--noinst_PROGRAMS= $(TEST_BINARIES)
+-noinst_PROGRAMS = \
 +testdir = $(datadir)/@PACKAGE@/tests
-+test_PROGRAMS= $(TEST_BINARIES)
++test_PROGRAMS = \
+ 	$(test_programs) \
+ 	$(test_related_programs) \
+ 	$(NULL)
+diff --git a/test/core/Makefile.am b/test/core/Makefile.am
+index e4bceb4..54b077d 100644
+--- a/test/core/Makefile.am
++++ b/test/core/Makefile.am
+@@ -64,7 +64,8 @@ endif
  
- test_service_SOURCES=				\
- 	test-service.c
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = \
++testdir = $(datadir)/@PACKAGE@/tests/core
++test_PROGRAMS = \
+ 	test-dbus-glib \
+ 	test-error-mapping \
+ 	test-service-glib \
 diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
-index 3cb2c39..e6de67d 100644
+index a94d08d..707dcac 100644
 --- a/test/interfaces/Makefile.am
 +++ b/test/interfaces/Makefile.am
-@@ -39,7 +39,8 @@ if DBUS_BUILD_TESTS
+@@ -57,7 +57,8 @@ if DBUS_BUILD_TESTS
  
  ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
  ## build even when not doing "make check"
@@ -32,17 +52,6 @@ index 3cb2c39..e6de67d 100644
  
  test_service_SOURCES = \
  	test-interfaces.c \
-diff --git a/test/core/Makefile.am b/test/core/Makefile.am
-index ef6cb26..9786c3a 100644
---- a/test/core/Makefile.am
-+++ b/test/core/Makefile.am
-@@ -46,7 +46,8 @@ endif
- 
- ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
- ## build even when not doing "make check"
--noinst_PROGRAMS = \
-+testdir = $(datadir)/@PACKAGE@/tests/core
-+test_PROGRAMS = \
- 	test-dbus-glib \
- 	test-service-glib \
- 	$(THREAD_APPS) \
+-- 
+1.9.1
+
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
index 0000000..d798ebf
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.102.bb
@@ -0,0 +1,5 @@
+require dbus-glib.inc
+
+
+SRC_URI[md5sum] = "f76b8558fd575d0106c3a556eaa49184"
+SRC_URI[sha256sum] = "6964ed585bb8149a14ab744b5ded5e77cf71ec5446e6dcc5fcf5eebcc52df29c"
-- 
1.9.1


