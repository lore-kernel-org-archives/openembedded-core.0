Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 19E4574C60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254260"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:31 +0300
Message-Id: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 01/14] gobject-introspection: update to 1.56.1
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
X-List-Received-Date: Fri, 04 May 2018 12:38:38 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-giscanner-add-a-lib-dirs-envvar-option.patch             | 8 ++++----
 ...ct-introspection_1.56.0.bb => gobject-introspection_1.56.1.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.56.0.bb => gobject-introspection_1.56.1.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
index 232480f3f56..4aa2e3cb2b8 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -1,4 +1,4 @@
-From 06ebdaa5c8f9721acf93cc3e75a877a3c963867f Mon Sep 17 00:00:00 2001
+From 3875175563df28813c22b1de6bda260285f65cb0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 3 Jan 2018 17:02:01 +0200
 Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index a8bd5b1..6cf25d5 100644
+index d10327c..47f57c6 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
 @@ -109,7 +109,7 @@ class CCompiler(object):
@@ -35,8 +35,8 @@ index a8bd5b1..6cf25d5 100644
          if os.name == 'nt':
              runtime_path_envvar = ['LIB', 'PATH']
          else:
--            runtime_path_envvar = ['LD_LIBRARY_PATH']
-+            runtime_path_envvar = ['LD_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
+-            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH']
++            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
              # Search the current directory first
              # (This flag is not supported nor needed for Visual C++)
              args.append('-L.')
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
index 8f84f832b03..8d055669497 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            "
-SRC_URI[md5sum] = "8064b5cd8fa02feeab850a0f6ef72b0f"
-SRC_URI[sha256sum] = "0d7059fad7aa5ec50d9678aea4ea139acab23737e9cf9ca0d86c615cecbaa0f8"
+SRC_URI[md5sum] = "62e5f5685b8d9752fdeaf17c057d53d1"
+SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
-- 
2.16.1


