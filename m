Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1DE7D930
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y13so21355415wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YLFa9ED2OywNV+vWi+yNk3kPgk6aAfYwi+D6Va89t0I=;
	b=k/ICe7q6Hd7j42Z2nEgC3Eac8/DvsBfPbEadhtfoMhRWaNil3wekFzhxZsAKbYS0mf
	nFhOFGZtGhaXjQ3F9pyQLVC8LJYxYz8UAtru3QFUQlanAbaYN/z2M+P3QyLtVVBhNf2M
	8u2xdjxPRHtHEuaSzLki4yEJEgECrPbRZCxCWZQD8k4St7DixO0V3tpprT9rB14+nhxQ
	mBy/Y3gLpPMCjHcpuyX56CXxIZ+9+pz3oHmKokZeyVodEo/pQPE2JV/sDF9vhBW0bwTE
	fTEiQOd4EzVt8mSIpWsf8Iav7bqf1D63nAA4RK+pWK084tkGH3AFa3lyK+QMUR147x3t
	Tb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YLFa9ED2OywNV+vWi+yNk3kPgk6aAfYwi+D6Va89t0I=;
	b=fZTncOXddjd1MpsBP0EHWW6rXpOZMQFNfKrU1ceOGe8arA3T34vfqHBWK1K65WixAc
	YvNy+qPN/+BtB0Mx4S5z2A1g5BxeX/64GKicRWwFCEBWKZ3IPagNKp2Q2sV+hgLfMnRx
	AUyGnhvrUhG7KYLkO9YMQZOqfasJb0hDvaF3EkJ6cn3dQnhVIhS22oqFCPUloE8Ajbh8
	tVgKQ4ggTRtHpe0P3zZ8hP3xzEFnaytNEnZ81UfQEHtz0dIy1y2EB/Br0OgFoNL+6iZv
	fcllhrVuoaIGEEEj4alMYv3xxdv0wBg5Y/XP007WDf0LJLcL+yhT5SlmSaVDs59wMJOF
	FUaw==
X-Gm-Message-State: APjAAAWi6ETd3bIMl4PtXzHaodro1Xy14E4lPo00+hWo80DZK6SyeEJa
	uv8+nt0rABEB3YwtpVJfHvYLQCzrcDM=
X-Google-Smtp-Source: APXvYqxAl+oJT/OQczPwpOurF/aO4wS2lK+viDeNEcOmC2y8i7jOSJSbknip9HUCkrsipE0PQqT/rA==
X-Received: by 2002:adf:9427:: with SMTP id 36mr48449216wrq.128.1555325705538; 
	Mon, 15 Apr 2019 03:55:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:41 +0200
Message-Id: <20190415105457.57067-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/19] webkitgtk: update to 2.24.0
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:05 -0000

Drop bad_optional_access.patch, as the code it tweaks has
been removed upstream.

Rebase other patches.

Add an option for jpeg2000 support.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkitgtk/0001-Fix-build-with-musl.patch  | 12 +++---
 ...tings-so-that-gtkdoc-generation-work.patch | 37 +++++++++----------
 ...acros-Append-to-I-and-not-to-isystem.patch | 32 ++++++++--------
 .../webkitgtk/bad_optional_access.patch       | 35 ------------------
 ...ebkitgtk_2.22.7.bb => webkitgtk_2.24.0.bb} |  6 +--
 5 files changed, 42 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.22.7.bb => webkitgtk_2.24.0.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
index d9a18e0ce93..0c145c7ebd7 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 322966273a8e085829261a397af37de0fbf51aad Mon Sep 17 00:00:00 2001
+From c4d4d9f1aa74addefdad40294cf16d9e0b3dd6ec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Oct 2017 17:00:08 +0300
 Subject: [PATCH] Fix build with musl
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
-index 836d755..7665d25 100644
+index 823964c2..00841146 100644
 --- a/Source/JavaScriptCore/runtime/MachineContext.h
 +++ b/Source/JavaScriptCore/runtime/MachineContext.h
 @@ -188,7 +188,7 @@ static inline void*& stackPointerImpl(mcontext_t& machineContext)
@@ -61,12 +61,12 @@ index 836d755..7665d25 100644
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
 diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index a841946..1e5c7dd 100644
+index 34f7cb14..32ad9150 100644
 --- a/Source/WTF/wtf/Platform.h
 +++ b/Source/WTF/wtf/Platform.h
-@@ -701,7 +701,7 @@
- #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
- #endif
+@@ -714,7 +714,7 @@
+ 
+ #endif /* OS(DARWIN) */
  
 -#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
 +#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__linux__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index 83fd5129a01..664cea9c759 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,8 +1,8 @@
-From 9b09974003097c9a408bbeea568996768efe705b Mon Sep 17 00:00:00 2001
+From d3796ad1a19233ee5d3492a5560d7ede882f89cf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
-Subject: [PATCH 05/10] Tweak gtkdoc settings so that gtkdoc generation works
- under OpenEmbedded build system
+Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
+ OpenEmbedded build system
 
 This requires setting a few environment variables so that the transient
 binary is build and linked correctly, and disabling the tweaks to RUN
@@ -12,28 +12,28 @@ Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Source/PlatformGTK.cmake | 2 +-
- Tools/gtk/gtkdoc.py      | 4 ++--
+ Source/cmake/GtkDoc.cmake | 2 +-
+ Tools/gtkdoc/gtkdoc.py    | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
-index 50b5393..7a31db5 100644
---- a/Source/PlatformGTK.cmake
-+++ b/Source/PlatformGTK.cmake
-@@ -24,7 +24,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
+diff --git a/Source/cmake/GtkDoc.cmake b/Source/cmake/GtkDoc.cmake
+index 2ee05550..6cb6313d 100644
+--- a/Source/cmake/GtkDoc.cmake
++++ b/Source/cmake/GtkDoc.cmake
+@@ -4,7 +4,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
      add_custom_command(
          OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
          DEPENDS ${DocumentationDependencies}
--        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
-+        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc -v ${_extra_args}
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
++        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
          COMMAND touch ${_stamp_name}
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
          VERBATIM
-diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
-index 03c8e8e..34fbaff 100644
---- a/Tools/gtk/gtkdoc.py
-+++ b/Tools/gtk/gtkdoc.py
-@@ -318,9 +318,9 @@ class GTKDoc(object):
+diff --git a/Tools/gtkdoc/gtkdoc.py b/Tools/gtkdoc/gtkdoc.py
+index 81ee8cdc..3e11c2f0 100644
+--- a/Tools/gtkdoc/gtkdoc.py
++++ b/Tools/gtkdoc/gtkdoc.py
+@@ -317,9 +317,9 @@ class GTKDoc(object):
                      additional_ldflags = '%s %s' % (additional_ldflags, arg)
              ldflags = ' "-L%s" %s ' % (self.library_path, additional_ldflags) + ldflags
              current_ld_library_path = env.get('LD_LIBRARY_PATH')
@@ -45,6 +45,3 @@ index 03c8e8e..34fbaff 100644
                  env['LD_LIBRARY_PATH'] = self.library_path
  
          if ldflags:
--- 
-2.15.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
index b31026448c3..e71905d26a1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -1,4 +1,4 @@
-From e1c6540f7984bd48e1e2d80d965fa82c70de3c20 Mon Sep 17 00:00:00 2001
+From d1634e56a2589ec62325011bf77d480a67123b52 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 17 Apr 2016 12:35:41 -0700
 Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
@@ -28,10 +28,10 @@ Upstream-Status: Pending
  6 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
-index b3c7e0b..88446de 100644
+index 87153e35..cd0beed4 100644
 --- a/Source/JavaScriptCore/shell/CMakeLists.txt
 +++ b/Source/JavaScriptCore/shell/CMakeLists.txt
-@@ -35,7 +35,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+@@ -36,7 +36,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
  WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
  WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
  include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES} ${JavaScriptCore_PRIVATE_INCLUDE_DIRECTORIES})
@@ -41,10 +41,10 @@ index b3c7e0b..88446de 100644
  target_link_libraries(jsc ${JSC_LIBRARIES})
  
 diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
-index f7d8d70a..3c27b8bc 100644
+index e0dd9cd9..a2997f3e 100644
 --- a/Source/WebCore/PlatformGTK.cmake
 +++ b/Source/WebCore/PlatformGTK.cmake
-@@ -157,7 +157,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+@@ -164,7 +164,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
      target_include_directories(WebCorePlatformGTK2 PRIVATE
          ${WebCore_INCLUDE_DIRECTORIES}
      )
@@ -53,7 +53,7 @@ index f7d8d70a..3c27b8bc 100644
          ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
          ${GTK2_INCLUDE_DIRS}
          ${GDK2_INCLUDE_DIRS}
-@@ -183,7 +183,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
+@@ -190,7 +190,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
  target_include_directories(WebCorePlatformGTK PRIVATE
      ${WebCore_INCLUDE_DIRECTORIES}
  )
@@ -62,7 +62,7 @@ index f7d8d70a..3c27b8bc 100644
      ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
      ${GTK_INCLUDE_DIRS}
      ${GDK_INCLUDE_DIRS}
-@@ -199,7 +199,7 @@ include_directories(
+@@ -206,7 +206,7 @@ include_directories(
      "${WEBCORE_DIR}/bindings/gobject/"
  )
  
@@ -72,10 +72,10 @@ index f7d8d70a..3c27b8bc 100644
  )
  
 diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index 8c6ebb5..772c243 100644
+index 693bbdfe..20e3802f 100644
 --- a/Source/WebKit/PlatformGTK.cmake
 +++ b/Source/WebKit/PlatformGTK.cmake
-@@ -655,7 +655,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+@@ -664,7 +664,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
      target_include_directories(WebKitPluginProcess2 PRIVATE
          ${WebKitCommonIncludeDirectories}
      )
@@ -85,10 +85,10 @@ index 8c6ebb5..772c243 100644
           ${GTK2_INCLUDE_DIRS}
           ${GDK2_INCLUDE_DIRS}
 diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
-index a1e7e8f..ce24274 100644
+index 6d58d57e..976e2362 100644
 --- a/Source/cmake/WebKitMacros.cmake
 +++ b/Source/cmake/WebKitMacros.cmake
-@@ -134,7 +134,7 @@ macro(WEBKIT_FRAMEWORK _target)
+@@ -152,7 +152,7 @@ macro(WEBKIT_FRAMEWORK _target)
          ${${_target}_SOURCES}
      )
      target_include_directories(${_target} PUBLIC "$<BUILD_INTERFACE:${${_target}_INCLUDE_DIRECTORIES}>")
@@ -98,10 +98,10 @@ index a1e7e8f..ce24274 100644
      target_link_libraries(${_target} ${${_target}_LIBRARIES})
      set_target_properties(${_target} PROPERTIES COMPILE_DEFINITIONS "BUILDING_${_target}")
 diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
-index dc2b61e..0128dca 100644
+index a0d32059..f259ade2 100644
 --- a/Tools/MiniBrowser/gtk/CMakeLists.txt
 +++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
-@@ -57,7 +57,7 @@ endif ()
+@@ -59,7 +59,7 @@ endif ()
  add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
  
  include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
@@ -111,10 +111,10 @@ index dc2b61e..0128dca 100644
  target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
  
 diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
-index 4aef695..a14b163 100644
+index 8dd0e146..d037fc35 100644
 --- a/Tools/TestWebKitAPI/PlatformGTK.cmake
 +++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
-@@ -20,7 +20,7 @@ include_directories(
+@@ -22,7 +22,7 @@ include_directories(
      ${WEBKIT_DIR}/UIProcess/API/gtk
  )
  
@@ -122,4 +122,4 @@ index 4aef695..a14b163 100644
 +include_directories(
      ${GDK3_INCLUDE_DIRS}
      ${GLIB_INCLUDE_DIRS}
-     ${GTK3_INCLUDE_DIRS}
+     ${GSTREAMER_INCLUDE_DIRS}
diff --git a/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch b/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch
deleted file mode 100644
index 9d0d50b79e5..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/bad_optional_access.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-unbreak build with libc++ 7
-
-based on
-https://svnweb.freebsd.org/ports/head/www/webkit2-gtk3/files/patch-Source_WTF_wtf_Optional.h?view=markup&pathrev=477812
-
-Fixes
-
-/usr/include/c++/v1/optional:171:29: error: redefinition of 'bad_optional_access'
-class _LIBCPP_EXCEPTION_ABI bad_optional_access
-                            ^
-DerivedSources/ForwardingHeaders/wtf/Optional.h:295:7: note: previous definition is here
-class bad_optional_access : public std::logic_error {
-      ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/Source/WTF/wtf/Optional.h
-+++ b/Source/WTF/wtf/Optional.h
-@@ -276,14 +276,14 @@ struct nullopt_t
- };
- constexpr nullopt_t nullopt{nullopt_t::init()};
- 
--
-+# if !defined(_LIBCPP_VERSION) || _LIBCPP_VERSION < 7000
- // 20.5.8, class bad_optional_access
- class bad_optional_access : public std::logic_error {
- public:
-   explicit bad_optional_access(const std::string& what_arg) : std::logic_error{what_arg} {}
-   explicit bad_optional_access(const char* what_arg) : std::logic_error{what_arg} {}
- };
--
-+# endif // _LIBCPP_VERSION < 7000
- 
- template <class T>
- union storage_t
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
index 301bf10ceac..4a82dae9ef6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
@@ -20,11 +20,10 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
-           file://bad_optional_access.patch \
            "
 
-SRC_URI[md5sum] = "47386c10a9c3975f933c85404f35ff3b"
-SRC_URI[sha256sum] = "4be6f7d605cd0a690fd26e8aa83b089a33ad9d419148eafcfb60580dd2af30ff"
+SRC_URI[md5sum] = "576d69c598b3e36c73441052d02466de"
+SRC_URI[sha256sum] = "2e4ad1503fe482ceb5a83cf70ac9cd42f37eb718555a4d6844fe4c59a9214407"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -56,6 +55,7 @@ PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 # Source is at https://github.com/google/woff2
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
+PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
-- 
2.17.1


