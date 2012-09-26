Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0IA-0005vP-NB
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:41:18 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so279267wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aVBwaYNTAKrw1JkCkhTHcmEj1wu6Dw3LX/Xheq/LjFs=;
	b=HFqOKwy6y4OYDpI0wGNCRM5ou2tvtEZpGI4nqCXBzxsQYorTBhnBPUJOvOeFB6ZVVk
	vxmCD8AHaBSreb2Fk1GT1OEkNMYOsM+GnDFRH7GQT/itIptB1uuYjZCtcRo82rehIrmw
	qST0wo0O+YhIlr21n5HaIpJZZX/dvMOSI9zgTtaZp8k1Dg+5zbItUpPzeXLWQ/z13CZA
	5quLipUZohwKkNn9SKaVY6suODq1sYNAlzatYiqoyX0u8PTgVlqpeEYU1IISsDR2KnnT
	TzPxrQPHdWZR4R2oMycJ3FD+4AoNza3XbfnOX7eJZNUxyjKxcGuys2V8/+si/aftEoT/
	0a1g==
Received: by 10.180.33.111 with SMTP id q15mr4004783wii.20.1348698509857;
	Wed, 26 Sep 2012 15:28:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm9504192wiy.11.2012.09.26.15.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:28:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:15 +0200
Message-Id: <78d078c48e5f4440e6bebe93851a56e0721d2804.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/10] qt4: upgrade to 4.8.3
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
X-List-Received-Date: Wed, 26 Sep 2012 22:41:18 -0000

* rebased patches, 3 patches are resolved upstream:
  0016-configure-eval-QMAKE_CXX.patch
    resolved in upstream commit 68c7f80a672e1d6d2710e49548a7c83b105d8d5f
  0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
    resolved in upstream commit 7ac8d8597db1f58b11338f91fb27f6ad8696b34b
  0022-webkit-fix-conflicting-types.patch
    resolved in upstream commit929b4443d53fcf3a7ad1cb9f3af5569e41ef56f1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...tools_4.8.1.bb => nativesdk-qt4-tools_4.8.3.bb} |  6 +--
 .../qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch  | 34 ----------------
 ...ore-Fix-compile-error-when-using-toolchai.patch | 46 ----------------------
 .../0022-webkit-fix-conflicting-types.patch        | 39 ------------------
 .../qt4/{qt4-4.8.1.inc => qt4-4.8.3.inc}           | 15 +++----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  6 +--
 ...tty_qws-fix-build-with-old-kernel-headers.patch |  6 +--
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  4 +-
 ...make-is-already-built-in-qt4-tools-native.patch |  8 ++--
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  8 ++--
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  8 ++--
 ...-const-usage-that-causes-compile-failure-.patch |  6 +--
 ...llow-building-a-separate-qmake-for-the-ta.patch |  4 +-
 ...e-fix-source-file-references-in-qmake.pri.patch |  6 +--
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  8 ++--
 .../0011-freetype-host-includes.patch              |  4 +-
 .../0012-Add-2bpp-support.patch                    | 14 +++----
 .../0013-configure-add-crossarch-option.patch      | 20 +++++-----
 ...tions-fix-phony-translation-linking-error.patch |  4 +-
 ...-configure-add-nostrip-for-debug-packages.patch |  8 ++--
 ...sure-we-identify-the-compiler-as-g-in-co.patch} |  8 ++--
 ...re-make-pulseaudio-a-configurable-option.patch} | 10 ++---
 ...es-for-gcc-4.7.0-particularly-on-qemux86.patch} |  4 +-
 ...019-webkit-disable-the-fuse-ld-gold-flag.patch} |  4 +-
 .../qt4/{qt4-4.8.1 => qt4-4.8.3}/g++.conf          |  0
 .../qt4/{qt4-4.8.1 => qt4-4.8.3}/linux.conf        |  0
 .../recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/qte.sh |  0
 ...qt4-embedded_4.8.1.bb => qt4-embedded_4.8.3.bb} |  2 +-
 meta/recipes-qt/qt4/qt4-native_4.8.1.bb            | 12 ------
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |  8 ++++
 ...qt4-x11-free_4.8.1.bb => qt4-x11-free_4.8.3.bb} |  2 +-
 31 files changed, 89 insertions(+), 215 deletions(-)
 rename meta/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.1.bb => nativesdk-qt4-tools_4.8.3.bb} (41%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
 rename meta/recipes-qt/qt4/{qt4-4.8.1.inc => qt4-4.8.3.inc} (79%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (88%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch (73%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch (80%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (83%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch (87%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch (83%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (91%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch (87%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0011-freetype-host-includes.patch (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0012-Add-2bpp-support.patch (97%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0013-configure-add-crossarch-option.patch (63%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0014-translations-fix-phony-translation-linking-error.patch (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/0015-configure-add-nostrip-for-debug-packages.patch (78%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch => qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch} (84%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch => qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch} (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch => qt4-4.8.3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch} (96%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch => qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch} (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.1 => qt4-4.8.3}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.1.bb => qt4-embedded_4.8.3.bb} (87%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.1.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.3.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.1.bb => qt4-x11-free_4.8.3.bb} (88%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
similarity index 41%
rename from meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
rename to meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
index 6d9800d..51afe13 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
@@ -1,8 +1,8 @@
 require nativesdk-qt4-tools.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
 
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
deleted file mode 100644
index 8b9b3bf..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3893ad264f85e4a0eec64017d515dddf9ee9ef88 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:47:08 +0200
-Subject: [PATCH 16/22] configure: eval QMAKE_CXX
-
-Allow expansion of $(...) references in QMAKE_CXX (currently its value
-is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
-which allows WebKit to be enabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 5cc755e..1e6c910 100755
---- a/configure
-+++ b/configure
-@@ -3329,7 +3329,8 @@ else
-     CFG_FRAMEWORK=no
- fi
- 
--QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
-+QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg' | tail -1`
-+QMAKE_CONF_COMPILER=`eval "echo $QMAKE_CONF_COMPILER"`
- TEST_COMPILER="$CXX"
- 
- [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
deleted file mode 100644
index 13229d4..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4811267206e20e5409df0500c02d7fe77caf5293 Mon Sep 17 00:00:00 2001
-From: Ken Werner <ken.werner@linaro.org>
-Date: Wed, 26 Sep 2012 20:53:35 +0200
-Subject: [PATCH 19/22] javascriptcore: Fix compile error when using
- toolchains based on GCC 4.7.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h   | 4 +---
- .../javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h       | 3 +--
- 2 files changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-index 7c20272..917c0ff 100644
---- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-+++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-@@ -57,9 +57,7 @@ namespace JSC {
-     
-     class JSGlobalObject : public JSVariableObject {
-     protected:
--        using JSVariableObject::JSVariableObjectData;
--
--        struct JSGlobalObjectData : public JSVariableObjectData {
-+        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
-             // We use an explicit destructor function pointer instead of a
-             // virtual destructor because we want to avoid adding a vtable
-             // pointer to this struct. Adding a vtable pointer would force the
-diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-index 2542878..637f62c 100644
---- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-+++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-@@ -32,8 +32,7 @@ namespace JSC{
-     
-     class JSStaticScopeObject : public JSVariableObject {
-     protected:
--        using JSVariableObject::JSVariableObjectData;
--        struct JSStaticScopeObjectData : public JSVariableObjectData {
-+        struct JSStaticScopeObjectData : public JSVariableObjectData::JSVariableObjectData {
-             JSStaticScopeObjectData()
-                 : JSVariableObjectData(&symbolTable, &registerStore + 1)
-             {
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
deleted file mode 100644
index bdd5d4f..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5cc08e33ea7ab5d32b6a14ccb23a366d56e50ea1 Mon Sep 17 00:00:00 2001
-From: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: Wed, 26 Sep 2012 20:56:33 +0200
-Subject: [PATCH 22/22] webkit: fix conflicting types
-
-This patch fixes the type mismatch fixing this compile issue:
-
-|
-/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7:
-error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
-| In file included from ./wtf/Platform.h:1217:0,
-|                  from ./config.h:30,
-|                  from wtf/gobject/GOwnPtr.cpp:19:
-| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously
-declared here
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-index c7f7ac4..f00e9cf 100644
---- a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-+++ b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-@@ -52,7 +52,7 @@ typedef struct _GFile GFile;
- typedef struct _GHashTable GHashTable;
- typedef struct _GInputStream GInputStream;
- typedef struct _GList GList;
--typedef struct _GMutex GMutex;
-+typedef union _GMutex GMutex;
- typedef struct _GPatternSpec GPatternSpec;
- typedef struct _GPollableOutputStream GPollableOutputStream;
- typedef struct _GSocketClient GSocketClient;
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1.inc b/meta/recipes-qt/qt4/qt4-4.8.3.inc
similarity index 79%
rename from meta/recipes-qt/qt4/qt4-4.8.1.inc
rename to meta/recipes-qt/qt4/qt4-4.8.3.inc
index 4cf1222..e009c08 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.3.inc
@@ -16,19 +16,16 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0013-configure-add-crossarch-option.patch \
            file://0014-translations-fix-phony-translation-linking-error.patch \
            file://0015-configure-add-nostrip-for-debug-packages.patch \
-           file://0016-configure-eval-QMAKE_CXX.patch \
-           file://0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch \
-           file://0018-configure-make-pulseaudio-a-configurable-option.patch \
-           file://0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch \
-           file://0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
-           file://0021-webkit-disable-the-fuse-ld-gold-flag.patch \
-           file://0022-webkit-fix-conflicting-types.patch \
+           file://0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch \
+           file://0017-configure-make-pulseaudio-a-configurable-option.patch \
+           file://0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
+           file://0019-webkit-disable-the-fuse-ld-gold-flag.patch \
            file://g++.conf \
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index a3a8dae..b844a4e 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 51c37481a0c0ea946567ea2344107428e6d71590 Mon Sep 17 00:00:00 2001
+From 89349d565cf03f3a2c09fe235ac6c75e415859bd Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 01/22] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 01/19] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 2862c2c..3a36b01 100644
+index 91d2dfc..41045b3 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -54,6 +54,7 @@
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
index 021a6de..a473e8e 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
@@ -1,7 +1,7 @@
-From 419b6a19d3d506880fa705682613eaaeb7dcd9cf Mon Sep 17 00:00:00 2001
+From fe15b966616cc2d2f2f071474a3414fd03ee473e Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 26 Sep 2012 20:18:08 +0200
-Subject: [PATCH 02/22] qkbdtty_qws: fix build with old kernel headers
+Subject: [PATCH 02/19] qkbdtty_qws: fix build with old kernel headers
 
 This issue is that with C++ compiler process an old version of kernel
 header file, coincidently that file has a variable named 'new':
@@ -21,7 +21,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
-index f4b8461..4cee2e7 100644
+index c629fa3..47fd3f7 100644
 --- a/src/gui/embedded/qkbdtty_qws.cpp
 +++ b/src/gui/embedded/qkbdtty_qws.cpp
 @@ -54,8 +54,20 @@
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
index 859a037..718db07 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
@@ -1,7 +1,7 @@
-From 96bee73bdf663ddeb2a5d48cab9c5e4df65ba295 Mon Sep 17 00:00:00 2001
+From f7eb6d336d30da7b8193f1d1ab6142293e3966da Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 May 2012 07:48:15 +0200
-Subject: [PATCH 03/22] webkit2: set OUTPUT_DIR value if empty
+Subject: [PATCH 03/19] webkit2: set OUTPUT_DIR value if empty
 
 Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
 now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
similarity index 73%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
index e147375..9affadb 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
@@ -1,7 +1,7 @@
-From aa1788b0ec0b9b7c0e1a7c6bd9ef5c9555361014 Mon Sep 17 00:00:00 2001
+From 53a20e5f7f790d047b67b1631e1d4acc9a86906a Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Wed, 26 Sep 2012 20:24:20 +0200
-Subject: [PATCH 04/22] configure: qmake is already built in qt4-tools-native,
+Subject: [PATCH 04/19] configure: qmake is already built in qt4-tools-native,
  so disable it
 
 Upstream-Status: Inappropriate [configuration]
@@ -12,10 +12,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index a706908..00b072a 100755
+index d19f443..59bdb63 100755
 --- a/configure
 +++ b/configure
-@@ -4816,7 +4816,7 @@ END {
+@@ -4899,7 +4899,7 @@ setBootstrapVariable()
  }
  
  # build qmake
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
similarity index 80%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
index 9171fa7..be7887b 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
@@ -1,7 +1,7 @@
-From 1602cdf7f3bb548e63fca40b5bff8b9a75a144c5 Mon Sep 17 00:00:00 2001
+From 5641d763180e7f848f5d39588417292b6b8df88e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
 Date: Wed, 26 Sep 2012 20:27:44 +0200
-Subject: [PATCH 05/22] configure: set LFLAGS to pick up zlib from staging
+Subject: [PATCH 05/19] configure: set LFLAGS to pick up zlib from staging
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 00b072a..b1ba542 100755
+index 59bdb63..cc08b71 100755
 --- a/configure
 +++ b/configure
-@@ -611,7 +611,7 @@ fi
+@@ -690,7 +690,7 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
similarity index 83%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
index 51a6cfc..6d20c8c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
@@ -1,7 +1,7 @@
-From 074881d57e5d7ad23a7a784a75f4ffebf091e543 Mon Sep 17 00:00:00 2001
+From fa9e376ff72f488608c8fc635ec669fc00c3c1ea Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:29:09 +0200
-Subject: [PATCH 06/22] configure: Use OE_QMAKE_* values to specify Qt utility
+Subject: [PATCH 06/19] configure: Use OE_QMAKE_* values to specify Qt utility
  paths
 
 Upstream-Status: Inappropriate [configuration]
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure b/configure
-index b1ba542..0231b7d 100755
+index cc08b71..958b884 100755
 --- a/configure
 +++ b/configure
-@@ -8517,11 +8517,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
+@@ -8612,11 +8612,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
  QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
  
  #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
index 0105758..465c237 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
@@ -1,7 +1,7 @@
-From ff6a714f8256c6d98234066ba1788bee234b25a1 Mon Sep 17 00:00:00 2001
+From db3c7b5710ee14280b51c355487dabe21eff60b4 Mon Sep 17 00:00:00 2001
 From: Pavel Heimlich <tropikhajma@gmail.com>
 Date: Wed, 26 Sep 2012 20:31:10 +0200
-Subject: [PATCH 07/22] dbus: Remove "const" usage that causes compile failure
+Subject: [PATCH 07/19] dbus: Remove "const" usage that causes compile failure
  building nativesdk-qt4-tools
 
 Patch has apparently been rejected upstream, not because it is invalid
@@ -17,7 +17,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dbus/qdbusintegrator.cpp b/src/dbus/qdbusintegrator.cpp
-index 5d97a8e..5014b8b 100644
+index 0bf62de..e53620f 100644
 --- a/src/dbus/qdbusintegrator.cpp
 +++ b/src/dbus/qdbusintegrator.cpp
 @@ -72,7 +72,7 @@ QT_BEGIN_NAMESPACE
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
similarity index 83%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
index 57071c7..5d294b1 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
@@ -1,7 +1,7 @@
-From 049f44c260fb8956f0acf18355e3403638d2a084 Mon Sep 17 00:00:00 2001
+From dacee47b11fc7cf89cdb8ddeeac9e6b64320ec8b Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:32:41 +0200
-Subject: [PATCH 08/22] qmake.pro: Allow building a separate qmake for the
+Subject: [PATCH 08/19] qmake.pro: Allow building a separate qmake for the
  target
 
 Upstream-Status: Inappropriate [config]
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
similarity index 91%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
index 43072e0..87d6397 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
@@ -1,7 +1,7 @@
-From e863f35a80b130d8b520cdb7c81112a601157c44 Mon Sep 17 00:00:00 2001
+From 08ec0f7ac7438e6f5b506b23fb52fe086078308b Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:33:49 +0200
-Subject: [PATCH 09/22] qmake: fix source file references in qmake.pri
+Subject: [PATCH 09/19] qmake: fix source file references in qmake.pri
 
 Fix duplicate entries in SOURCES and HEADERS, and fix the source file
 list for the split of qlocale.cpp.
@@ -15,7 +15,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index f2a3705..2d4e94c 100644
+index 31f67f4..9081669 100644
 --- a/qmake/qmake.pri
 +++ b/qmake/qmake.pri
 @@ -22,8 +22,7 @@ SOURCES += project.cpp property.cpp main.cpp generators/makefile.cpp \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
index 38e3cdf..99e7419 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
@@ -1,7 +1,7 @@
-From 64c70ae60b96c940805ab50be3ce724df094eddc Mon Sep 17 00:00:00 2001
+From d9544b4a079f3c66d15f973c5d1526df2fe49d40 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 20:36:38 +0200
-Subject: [PATCH 10/22] configure: Hack to not use the pg_config of the host
+Subject: [PATCH 10/19] configure: Hack to not use the pg_config of the host
  system which will add /usr/include
 
 pg_config is a native binary so using that when cross compiling
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 0231b7d..9650199f6 100755
+index 958b884..24cbb2a 100755
 --- a/configure
 +++ b/configure
-@@ -5362,10 +5362,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+@@ -5441,10 +5441,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
          psql)
              if [ "$CFG_SQL_psql" != "no" ]; then
                  # Be careful not to use native pg_config when cross building.
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
index 7f6ff32..f0be174 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
@@ -1,7 +1,7 @@
-From 9b05106d0bdfa84e8406633d71206ef1defaade8 Mon Sep 17 00:00:00 2001
+From 95cbbdaaf543bb5747b535b5e4b02114f3d821d6 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH 11/22] freetype host includes
+Subject: [PATCH 11/19] freetype host includes
 
 Host include path should not be used in cross compiling case.
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
similarity index 97%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
index 580ba4c..098b270 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
@@ -1,7 +1,7 @@
-From 69ff4de0f06ba112a5ca531957937dd860d0f3f8 Mon Sep 17 00:00:00 2001
+From a8233fddb36592361910d967664e5b546ac4cc3e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
 Date: Wed, 26 Sep 2012 20:39:21 +0200
-Subject: [PATCH 12/22] Add 2bpp support
+Subject: [PATCH 12/19] Add 2bpp support
 
 Submitted upstream but rejected as being "out of scope":
 http://bugreports.qt.nokia.com/browse/QTBUG-3468
@@ -16,10 +16,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  3 files changed, 216 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 9650199f6..7028ecf 100755
+index 24cbb2a..cd66d05 100755
 --- a/configure
 +++ b/configure
-@@ -6917,6 +6917,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+@@ -6999,6 +6999,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
      echo "Choose pixel-depths to support:"
      echo
      echo "   1. 1bpp, black/white"
@@ -27,7 +27,7 @@ index 9650199f6..7028ecf 100755
      echo "   4. 4bpp, grayscale"
      echo "   8. 8bpp, paletted"
      echo "  12. 12bpp, rgb 4-4-4"
-@@ -6935,11 +6936,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+@@ -7017,11 +7018,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
  fi
  if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
      if [ "$CFG_QWS_DEPTHS" = "all" ]; then
@@ -42,7 +42,7 @@ index 9650199f6..7028ecf 100755
  	esac
      done
 diff --git a/src/gui/embedded/qscreen_qws.cpp b/src/gui/embedded/qscreen_qws.cpp
-index d6c614d..504f3d3 100644
+index d2ad851..d25fc87 100644
 --- a/src/gui/embedded/qscreen_qws.cpp
 +++ b/src/gui/embedded/qscreen_qws.cpp
 @@ -469,6 +469,58 @@ static void solidFill_gray4(QScreen *screen, const QColor &color,
@@ -299,7 +299,7 @@ index d6c614d..504f3d3 100644
      } else if(d==4) {
          return true;
 diff --git a/src/gui/embedded/qscreenlinuxfb_qws.cpp b/src/gui/embedded/qscreenlinuxfb_qws.cpp
-index 3fe9713..933f489 100644
+index 04abcd4..06dea6d 100644
 --- a/src/gui/embedded/qscreenlinuxfb_qws.cpp
 +++ b/src/gui/embedded/qscreenlinuxfb_qws.cpp
 @@ -466,8 +466,8 @@ bool QLinuxFbScreen::connect(const QString &displaySpec)
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
similarity index 63%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
index c1ec3b5..45a058e 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
@@ -1,7 +1,7 @@
-From 8ddc1820a8678fda3a9bf3da4fc256c22fbd9b51 Mon Sep 17 00:00:00 2001
+From 8785f376533ffdcf4c32b53274e8c40f567d7fd5 Mon Sep 17 00:00:00 2001
 From: Michael Lauer <mickey@vanille-media.de>
 Date: Wed, 26 Sep 2012 20:41:32 +0200
-Subject: [PATCH 13/22] configure: add "-crossarch" option
+Subject: [PATCH 13/19] configure: add "-crossarch" option
 
 Upstream-Status: Pending
 
@@ -11,21 +11,21 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 7028ecf..8eb138f 100755
+index cd66d05..f2c0725 100755
 --- a/configure
 +++ b/configure
-@@ -1059,7 +1059,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1141,7 +1141,7 @@ while [ "$#" -gt 0 ]; do
          shift
          VAL=$1
          ;;
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot|-crossarch)
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          shift
          VAL="$1"
-@@ -1601,6 +1601,9 @@ while [ "$#" -gt 0 ]; do
-         case "$XPLATFORM" in *symbian*) XPLATFORM_SYMBIAN=yes;; esac
-         case "$XPLATFORM" in symbian-sbsv2) XPLATFORM_SYMBIAN_SBSV2=yes;; esac
+@@ -1697,6 +1697,9 @@ while [ "$#" -gt 0 ]; do
+         DEV_VAL=`echo $VAL | sed "s,^.*=\(.*\),\1,"`
+         DeviceVar set $DEV_VAR $DEV_VAL
          ;;
 +	crossarch)
 +		CROSSARCH="$VAL"
@@ -33,7 +33,7 @@ index 7028ecf..8eb138f 100755
      debug-and-release)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_DEBUG_RELEASE="$VAL"
-@@ -3200,6 +3203,8 @@ arm*)
+@@ -3297,6 +3300,8 @@ arm*)
      ;;
  esac
  
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
index b788a68..e4bd91e 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
@@ -1,7 +1,7 @@
-From 306e0987cfdc67db11abc7071c48b0d196e84c8e Mon Sep 17 00:00:00 2001
+From 851eb73f7c2d3fa8dc017c3fb4f448b522cd9873 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 26 Sep 2012 20:45:10 +0200
-Subject: [PATCH 14/22] translations: fix phony translation linking error
+Subject: [PATCH 14/19] translations: fix phony translation linking error
 
   | .../usr/lib/crt1.o: In function `_start':
   | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
similarity index 78%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
index 027633d..7d791dc 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
@@ -1,7 +1,7 @@
-From c7ee6896f4894626986956cc8892a13fa9f7c2aa Mon Sep 17 00:00:00 2001
+From 1c42c9c5f02845ea4c5b82638b7b2ed4d3dca0ff Mon Sep 17 00:00:00 2001
 From: Fathi Boudra <fabo@debian.org>
 Date: Wed, 26 Sep 2012 20:46:14 +0200
-Subject: [PATCH 15/22] configure: add nostrip for debug packages
+Subject: [PATCH 15/19] configure: add nostrip for debug packages
 
 Qt is built in release mode and strip files by default.
 Set CONFIG+=nostrip to avoid the stripping and
@@ -15,10 +15,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 8eb138f..5cc755e 100755
+index f2c0725..d1a0dfd 100755
 --- a/configure
 +++ b/configure
-@@ -631,6 +631,8 @@ mkdir -p "$outpath/config.tests"
+@@ -710,6 +710,8 @@ mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
  cp "$QMAKE_VARS_FILE" "$outpath/config.tests/.qmake.cache"
  
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
similarity index 84%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
index 32649b4..f85f534 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
@@ -1,7 +1,7 @@
-From 965068125d1e83699442fca83f0c9fe05ecee564 Mon Sep 17 00:00:00 2001
+From 8f4a0ccc89a43f8cc1a4e71c6f3d350d3b3b687c Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:48:37 +0200
-Subject: [PATCH 17/22] configure: ensure we identify the compiler as g++ in
+Subject: [PATCH 16/19] configure: ensure we identify the compiler as g++ in
  configure
 
 Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
@@ -28,10 +28,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/configure b/configure
-index 1e6c910..0edaad9 100755
+index d1a0dfd..1d8d8f5 100755
 --- a/configure
 +++ b/configure
-@@ -7444,6 +7444,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
+@@ -7525,6 +7525,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
  else
      COMPILER=`echo $PLATFORM | cut -f 2- -d-`
  fi
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch
index 4d91560..f84b737 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From d93ea994bf2ecee4775c68de645eac0cab248ac2 Mon Sep 17 00:00:00 2001
+From 6c06728b714a9864a7fe0ce576b015d726613e1e Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 18/22] configure: make pulseaudio a configurable option
+Subject: [PATCH 17/19] configure: make pulseaudio a configurable option
 
 Allows disabling pulseaudio support within phonon at configure time.
 (This is the Qt 4.8.0 version.)
@@ -15,10 +15,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 0edaad9..3a63734 100755
+index 1d8d8f5..4fb234b 100755
 --- a/configure
 +++ b/configure
-@@ -1045,7 +1045,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1127,7 +1127,7 @@ while [ "$#" -gt 0 ]; do
          VAL=no
          ;;
      #Qt style yes options
@@ -27,7 +27,7 @@ index 0edaad9..3a63734 100755
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          VAL=yes
          ;;
-@@ -2005,6 +2005,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2101,6 +2101,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
similarity index 96%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
index b763ac1..0e8454e 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
@@ -1,7 +1,7 @@
-From fb89f23c25363ac7b138fdba2bf5a9cdcaa7e840 Mon Sep 17 00:00:00 2001
+From 3f49a22ef042948689b5b60f8cc69c9d65c37610 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 26 Sep 2012 20:54:38 +0200
-Subject: [PATCH 20/22] Fixes for gcc 4.7.0, particularly on qemux86
+Subject: [PATCH 18/19] Fixes for gcc 4.7.0, particularly on qemux86
 
 Origin: upstream, http://trac.webkit.org/changeset/93631
 Origin: upstream, http://trac.webkit.org/changeset/113848
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
rename to meta/recipes-qt/qt4/qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch
index 05dc806..a841c2d 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch
@@ -1,7 +1,7 @@
-From 3a74f5cf7f92ff6bf6b69c7cf76f54516573abb7 Mon Sep 17 00:00:00 2001
+From 156a0936d6e37fa000a92131832b4f762605d81e Mon Sep 17 00:00:00 2001
 From: Ken Werner <ken.werner@linaro.org>
 Date: Wed, 26 Sep 2012 20:55:21 +0200
-Subject: [PATCH 21/22] webkit: disable the -fuse-ld=gold flag
+Subject: [PATCH 19/19] webkit: disable the -fuse-ld=gold flag
 
 This option is a Debian/Ubuntu specific extension to the g++ and causes upstream GCC to throw an error.
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
rename to meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
rename to meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
rename to meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
index 5a3dc65..187de73 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
@@ -1,7 +1,7 @@
 require qt4-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
deleted file mode 100644
index c09e6df..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt4-native.inc
-
-PR = "${INC_PR}.1"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
-
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
new file mode 100644
index 0000000..afae0ae
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
@@ -0,0 +1,8 @@
+require qt4-native.inc
+
+PR = "${INC_PR}.0"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
index 9b03ff2..bedd201 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.12



