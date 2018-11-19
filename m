Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1E35A6C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:08:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 79so2941992wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RcFWrmJlLy/eQ9PUhD78loy1WjX0Fo4DtTAqhiI5jaA=;
	b=Tqoq6JKV0cjGdJ3vEfMSC4/p63VQZ/xlkv0BUAftF43/82KZsXC4+PBWRwSHHejHmc
	VXq7rppF9ttpYbucM3GaeY5poV5AtdCMeYj0KI/37NMRDuFLritZ3vjtCFU6gt2WmQyq
	2AXM0CTp/ecl/4zgU/8L8KbeuYVdiu6tCt2fhPjMW2unV9IK4ak2GejYBSyAKlw7thLV
	1NuvQRUTJf9M3tJTnZDeBEqCVIvMZKYAykURiNndXQ0+7EwSqKUszP8A2syJJa8skFtt
	/jW1pdzvHN+rNjPJfXnbOiGZY1m//zdKg1VILrbSBSGv4wz25FMAyyyIjXqZdwRDrIPp
	l6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RcFWrmJlLy/eQ9PUhD78loy1WjX0Fo4DtTAqhiI5jaA=;
	b=ioZLq7DaicQI3zOZVMFjOBAs6+WzXnEYzQxVZR7+CsUrObQdqD9hY8CpxboOO96Jv1
	VjrTDFUCB6VXFnhixqoF5PTiU5fsdSJW1WRrBU+/gmJIUmrbhg1hV6AV6vhqvpebkUeS
	WyJgkHbutEp68vkcEiQmM5PyfX1DTh3H+TI62y3p94aYlK50u6gU+tyfr+mtxsrX3ShF
	9vrJqdHgMnFvkzNHR/LrkrD1WMvp41gD6sWRYIti/AAngF+ROTOEUKypAEfRB1kK8R6X
	27/r8+kdA6VPqcQ/fX9/o7jl6z33WFu24yEqDqQswoMrjujwjzKut0ilUuemp3vpsv3x
	KWnQ==
X-Gm-Message-State: AGRZ1gJ1DFURB/QOQ7MwfT/OxuXWufChhtQT80RLqQZOVyCHXgHpX80d
	XEXt4xmBxG0qfxcxdcJkAgx+KEYH
X-Google-Smtp-Source: AFSGD/XPCnId7AG4vYo3KEbuIvAG/VKrFb7SWk67umkq+Z+04Te4Mpx84ZPk7lc6V4nZthBLXv6+Yg==
X-Received: by 2002:a1c:8d86:: with SMTP id
	p128-v6mr8032371wmd.48.1542640097157; 
	Mon, 19 Nov 2018 07:08:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm78042526wmf.22.2018.11.19.07.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:08:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:08:06 +0100
Message-Id: <20181119150810.94381-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119150810.94381-1-alex.kanavin@gmail.com>
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/6] libdnf: update to 0.22.0
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
X-List-Received-Date: Mon, 19 Nov 2018 15:08:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 49 +++++++++++++++++++
 ...or-both-libsolv-and-libsolvext-libdn.patch | 15 +++---
 ...oot-path-to-introspection-tools-path.patch | 36 --------------
 ...ary-installation-directory-correctly.patch | 29 -----------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 17 +++----
 .../{libdnf_0.11.1.bb => libdnf_0.22.0.bb}    |  8 +--
 6 files changed, 66 insertions(+), 88 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.11.1.bb => libdnf_0.22.0.bb} (78%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
new file mode 100644
index 00000000000..7c8131b4be8
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -0,0 +1,49 @@
+From 0d0155c4dd6c0b3305ea2ab0e10b0f84d024a6e1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 6 Nov 2018 13:54:43 +0100
+Subject: [PATCH] Add WITH_TESTS option
+
+This makes a dependency on cppunit optional.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ CMakeLists.txt               | 3 +++
+ python/hawkey/CMakeLists.txt | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b73a03d7..a9e0200f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -36,6 +36,7 @@ OPTION(WITH_MAN "Enables hawkey man page generation" ON)
+ OPTION(WITH_HTML "Enables hawkey HTML generation" ON)
+ 
+ OPTION(WITH_BINDINGS "Enables python/SWIG bindings" ON)
++OPTION(WITH_TESTS "Enables unit tests" ON)
+ 
+ OPTION (ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
+ option (ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
+@@ -122,8 +123,10 @@ IF (WITH_BINDINGS)
+ # ADD_SUBDIRECTORY (bindings/perl)
+ ADD_SUBDIRECTORY (bindings/python)
+ ENDIF()
++IF (WITH_TESTS)
+ ENABLE_TESTING()
+ ADD_SUBDIRECTORY (tests)
++ENDIF()
+ IF (WITH_BINDINGS)
+ ADD_SUBDIRECTORY (python/hawkey)
+ ADD_SUBDIRECTORY (docs/hawkey)
+diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
+index 3c0b3c0c..31466ed9 100644
+--- a/python/hawkey/CMakeLists.txt
++++ b/python/hawkey/CMakeLists.txt
+@@ -49,4 +49,6 @@ TARGET_LINK_LIBRARIES(_hawkeymodule ${PYTHON_LIBRARY})
+ INSTALL(FILES __init__.py DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
+ INSTALL(TARGETS _hawkeymodule LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
+ 
++IF (WITH_TESTS)
+ ADD_SUBDIRECTORY(tests)
++ENDIF()
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index cbd0362c8b0..246db34154a 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,7 +1,7 @@
-From 2bf0666544293dcfac2f67b678e24353acdcd4e7 Mon Sep 17 00:00:00 2001
+From c139a6c929cff93dbb9b8279e97263fc9e055727 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
-Subject: [PATCH 2/2] Get parameters for both libsolv and libsolvext (libdnf is
+Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
 
  using both)
 
@@ -13,18 +13,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ca280f3..6ab9827 100644
+index cd91f08..6422534 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -29,7 +29,7 @@ find_package (PkgConfig REQUIRED)
- SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
+@@ -46,7 +46,7 @@ endif(APPLE)
  PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
+ pkg_check_modules(SMARTCOLS REQUIRED smartcols)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
  set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
  if (ENABLE_RHSM_SUPPORT)
-     pkg_check_modules (RHSM REQUIRED librhsm)
--- 
-2.14.2
-
+     pkg_check_modules (RHSM REQUIRED librhsm>=0.0.3)
diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
deleted file mode 100644
index 7eecc3d0516..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c8211ad99ccaa4af4a75e0ba639527267fcfd69e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:17:19 +0200
-Subject: [PATCH 2/4] Prefix sysroot path to introspection tools path.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libdnf/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libdnf/CMakeLists.txt b/libdnf/CMakeLists.txt
-index 63f07bf..837792b 100644
---- a/libdnf/CMakeLists.txt
-+++ b/libdnf/CMakeLists.txt
-@@ -133,7 +133,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
-         set(GIR_TYPELIB "${GIR_PREFIX}.typelib")
- 
-         add_custom_command(OUTPUT ${GIR_XML}
--            COMMAND env CFLAGS=${CMAKE_C_FLAGS} ${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
-+            COMMAND env CFLAGS=${CMAKE_C_FLAGS} $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
-                     --namespace=Dnf
-                     --nsversion=${DNF_SO_VERSION}.0
-                     --library-path=${CMAKE_CURRENT_BINARY_DIR}
-@@ -153,7 +153,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
-             WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
- 
-         add_custom_command(OUTPUT ${GIR_TYPELIB}
--            COMMAND ${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
-+            COMMAND $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
-                     -o ${GIR_TYPELIB}
-                     ${GIR_XML}
-             DEPENDS ${GIR_XML}
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch b/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
deleted file mode 100644
index 81264094eb4..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8d29879fe3606c78769c1bcdddf0bcfc7191c710 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:20:01 +0200
-Subject: [PATCH 3/4] Set the library installation directory correctly.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d35f0d7..8edb627 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -62,7 +62,9 @@ ADD_DEFINITIONS(-DPACKAGE_VERSION=\\"${LIBDNF_VERSION}\\")
- IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
-   SET (LIB_SUFFIX "64")
- ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
-+
- 
- ADD_SUBDIRECTORY (libdnf)
- ENABLE_TESTING()
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 6cf48a49f36..80b1ed7bf18 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,7 +1,7 @@
-From bcea5c5063a2d5f07dbe6f40aee30370fc4ba656 Mon Sep 17 00:00:00 2001
+From 2bcd0b9f6310bacdc554e077e85319a5e90e5ce0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
-Subject: [PATCH 1/2] Set libsolv variables with pkg-config (cmake's own module
+Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
 
  doesn't work properly).
 
@@ -13,19 +13,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8875bbf..ca280f3 100644
+index 0b405cb..cd91f08 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -29,7 +29,8 @@ find_package (PkgConfig REQUIRED)
- SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
+@@ -46,7 +46,8 @@ endif(APPLE)
  PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
+ pkg_check_modules(SMARTCOLS REQUIRED smartcols)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
--find_package (LibSolv 0.6.21 REQUIRED COMPONENTS ext)
+-find_package (LibSolv 0.6.30 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
  if (ENABLE_RHSM_SUPPORT)
-     pkg_check_modules (RHSM REQUIRED librhsm)
+     pkg_check_modules (RHSM REQUIRED librhsm>=0.0.3)
      include_directories (${RHSM_INCLUDE_DIRS})
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.22.0.bb
similarity index 78%
rename from meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.22.0.bb
index 4fc1d6defef..61ebcd821cc 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.22.0.bb
@@ -4,22 +4,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
-           file://0002-Prefix-sysroot-path-to-introspection-tools-path.patch \
-           file://0003-Set-the-library-installation-directory-correctly.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
+           file://0001-Add-WITH_TESTS-option.patch \
            "
 
-SRCREV = "60f979bd8db651229c559c1412f1eb880257127d"
+SRCREV = "fe14ad928f60890fa28b412639c88cd47889635e"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc"
+DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
 
 inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
+                  -DWITH_TESTS=OFF \
                 "
 EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
-- 
2.17.1


