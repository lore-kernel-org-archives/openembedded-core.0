Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 584FA7F43A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q12so6808054wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rnlESEuT5lzn9rBRSpWvtHsYZkdWBD0G2sQ0c6mgHEU=;
	b=IyWyi2Ls5Adz6sLi2RcDJJ2J0u1ZaTOcVCTGCVS+NjyOmDRxKurdsNiKI4B9/47SLp
	a4YH2kGZtRnRiwttP18NOXtVBQ9rsoHPvFQF0VMnF5/i15yBOoi1FRyapxJDzy6DNkjf
	SagCzrCnfygL092PzAXl41haoGZWObvIRJJgMp/d7RJZYLXqb5L62CSTjNbGZzR3CcEN
	/Os7bozSHybGKNuD8yp5inoH1Tf0E7GfdkC/BKr38CxkVl0aFCVbGVsBQ8zSVzGCfp4N
	yiNAsbNidFGD90tKJhx1rgnnlBhZWIWj5XAqWtQBLxAIZAhx/NzOCCYS3x9OYoyZKL1b
	kH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rnlESEuT5lzn9rBRSpWvtHsYZkdWBD0G2sQ0c6mgHEU=;
	b=F190l0EWCLsvx+mymvnfVgjAf8Xjx6RHQI4h/GkkuB3Qw4x39omDuKjxPyF9WAS1BA
	F326MeFEa2Id9S0emc7yJVtOxceCXum2qd5m1JwrZhAWj79Q3UAL6DURadXnXhuc6xkb
	CPgii2KwKvv0RsF/Po6PKvDqRBBw1jaP50Tvj3asKZeGa/urQZzj7sw0v67aBB3x08UT
	3fFlz6xpuotMnkE35CDx/17/gZtHsrVRR8/zG7SFcZoPrVJ7Gf51IsY1uiYEPVehzXXV
	0qgCU7lt4W07YhVgeRLXjLCiqWXTJUVr1u9cRUuiROz+xhngvx4rWCJO5pZrJFl76CEo
	yvug==
X-Gm-Message-State: APjAAAV7LMkvEhUIj2gnlHTipY16oqF2tq0kpnLWttW0o7MnhIgDJhWt
	QKKOPDegn3fJUZuOHEBkkf/fzW/t
X-Google-Smtp-Source: APXvYqxFygWZiKZMRJqObxZiuB3TBkHGEqHUnKxNR/EkDppnqHozh/Dih1ihk+CCBT5phnYY2oWitQ==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr18508661wrr.105.1567169416729;
	Fri, 30 Aug 2019 05:50:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:58 +0200
Message-Id: <c7df4467cce6381fb4380869754c1368dcae4efa.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 13/13] webkitgtk: update 2.24.3 -> 2.24.4
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:16 -0000

In particular this brings an important fix for builds with py3:
"Fix build issue which would cause media controls to disappear when Python 3.x was used during the build process."

https://webkitgtk.org/2019/08/28/webkitgtk2.24.4-released.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tings-so-that-gtkdoc-generation-work.patch | 10 +++---
 ...uild-failure-https-bugs.webkit.org-s.patch | 33 -------------------
 ...ebkitgtk_2.24.3.bb => webkitgtk_2.24.4.bb} |  5 ++-
 3 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.24.3.bb => webkitgtk_2.24.4.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index 664cea9c759..e7c668c0406 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,4 +1,4 @@
-From d3796ad1a19233ee5d3492a5560d7ede882f89cf Mon Sep 17 00:00:00 2001
+From 4b5e02212a31b82fc9b3becad90542274816fc29 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
 Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
@@ -17,23 +17,23 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Source/cmake/GtkDoc.cmake b/Source/cmake/GtkDoc.cmake
-index 2ee05550..6cb6313d 100644
+index b0fb31ca..6cb6313d 100644
 --- a/Source/cmake/GtkDoc.cmake
 +++ b/Source/cmake/GtkDoc.cmake
 @@ -4,7 +4,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
      add_custom_command(
          OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
          DEPENDS ${DocumentationDependencies}
--        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LDFLAGS=${CMAKE_EXE_LINKER_FLAGS}" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
 +        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
          COMMAND touch ${_stamp_name}
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
          VERBATIM
 diff --git a/Tools/gtkdoc/gtkdoc.py b/Tools/gtkdoc/gtkdoc.py
-index 81ee8cdc..3e11c2f0 100644
+index 054cafa1..416de7d1 100644
 --- a/Tools/gtkdoc/gtkdoc.py
 +++ b/Tools/gtkdoc/gtkdoc.py
-@@ -317,9 +317,9 @@ class GTKDoc(object):
+@@ -320,9 +320,9 @@ class GTKDoc(object):
                      additional_ldflags = '%s %s' % (additional_ldflags, arg)
              ldflags = ' "-L%s" %s ' % (self.library_path, additional_ldflags) + ldflags
              current_ld_library_path = env.get('LD_LIBRARY_PATH')
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
deleted file mode 100644
index e550a0d4579..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4bc241539246f7a17d07357257ab47cb96bc4b69 Mon Sep 17 00:00:00 2001
-From: "ysuzuki@apple.com" <ysuzuki@apple.com>
-Date: Thu, 18 Apr 2019 07:30:18 +0000
-Subject: [PATCH] Unreviewed, fix build failure
- https://bugs.webkit.org/show_bug.cgi?id=195938
-
-Including <array>.
-
-* bmalloc/AvailableMemory.cpp:
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@244422 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/84c111dc0d83b5acf60706ef49bc2f5e91112471]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/bmalloc/bmalloc/AvailableMemory.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/bmalloc/bmalloc/AvailableMemory.cpp b/Source/bmalloc/bmalloc/AvailableMemory.cpp
-index 595889fe..b72000d5 100644
---- a/Source/bmalloc/bmalloc/AvailableMemory.cpp
-+++ b/Source/bmalloc/bmalloc/AvailableMemory.cpp
-@@ -32,6 +32,7 @@
- #include "PerProcess.h"
- #include "Scavenger.h"
- #include "Sizes.h"
-+#include <array>
- #include <mutex>
- #if BOS(DARWIN)
- #if BPLATFORM(IOS_FAMILY)
--- 
-2.22.0
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
index 71082421688..8c695ce9e75 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
@@ -23,11 +23,10 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://0001-gstreamer-add-a-missing-format-string.patch \
-           file://0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch \
            "
 
-SRC_URI[md5sum] = "e2a5bbd09a217eba096a2d1562143e35"
-SRC_URI[sha256sum] = "940d746d7e82c357222feb5b3f44c4b201e81df7d81ddca5ca2bf3ae0acf6c51"
+SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"
+SRC_URI[sha256sum] = "8668b129c026624ec226a4cccf4995f9d26f3e88fc28ab75b0e965f3c32b7dd8"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


