Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A648361144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:06:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="256519692"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 16:06:18 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:06:00 -0800
Message-Id: <20200227000603.14252-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Cc: Tim Orling <timonty.t.orling@linux.intel.com>
Subject: [PATCH 1/4] atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Thu, 27 Feb 2020 00:06:18 -0000
Content-Transfer-Encoding: 8bit

From: Tim Orling <timonty.t.orling@linux.intel.com>

Patch no longer applies (nor is needed) upstream.

Release notes:
https://gitlab.gnome.org/GNOME/atk/-/raw/633bde11f93ee971ba8902c6fadbc29c121f71af/NEWS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...able-introspection-for-cross-compile.patch | 29 -------------------
 .../atk/{atk_2.32.0.bb => atk_2.34.1.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
 rename meta/recipes-support/atk/{atk_2.32.0.bb => atk_2.34.1.bb} (73%)

diff --git a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
deleted file mode 100644
index d1b08bc04b..0000000000
--- a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 44d46baa5e1519c6c3df7e4d34fb333e247b5bc8 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Fri, 6 Apr 2018 12:04:00 +0800
-Subject: [PATCH] meson.build: enable introspection for cross-compile
-
-It works fine in OE-core and doesn't need to be disabled. Let the user decide
-if it should be disabled or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- atk/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atk/meson.build b/atk/meson.build
-index 0ad67e5..1d2a49c 100644
---- a/atk/meson.build
-+++ b/atk/meson.build
-@@ -137,7 +137,7 @@ libatk_dep = declare_dependency(link_with: libatk,
-                                 dependencies: glib_dep,
-                                 sources: atk_enum_h)
- 
--if not meson.is_cross_build() and get_option('introspection')
-+if get_option('introspection')
-   gnome.generate_gir(libatk,
-                      sources: atk_sources + atk_headers + [ atk_enum_h ] + [ atk_version_h ],
-                      namespace: 'Atk',
diff --git a/meta/recipes-support/atk/atk_2.32.0.bb b/meta/recipes-support/atk/atk_2.34.1.bb
similarity index 73%
rename from meta/recipes-support/atk/atk_2.32.0.bb
rename to meta/recipes-support/atk/atk_2.34.1.bb
index 67223729e9..277397c694 100644
--- a/meta/recipes-support/atk/atk_2.32.0.bb
+++ b/meta/recipes-support/atk/atk_2.34.1.bb
@@ -14,9 +14,8 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI += " file://0001-meson.build-enable-introspection-for-cross-compile.patch"
-SRC_URI[archive.md5sum] = "c10b0b2af3c199e42caa6275b845c49d"
-SRC_URI[archive.sha256sum] = "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc"
+SRC_URI[archive.md5sum] = "f60bbaf8bdd08b93d98736b54b2fc8e9"
+SRC_URI[archive.sha256sum] = "d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.24.0


