Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: g1qK5I9D6u/NEzKv2PWtkrw1XX+cz2uzecUiS3WL3F78NduSoUxNY2epUx9t1oVcR4oK4waVhr
 sCxOUQkuhWEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177983"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:33 -0800
IronPort-SDR: SKuyFxrxSLinJj4HAPiap5XXSxpLpd5aeB6W5jcf+uoP3KnoS8a61uLYcBdJjo3SJa9o3pPY1f
 SO6fjbBiWb3Q==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269191"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] json-glib: upgrade 1.6.0 -> 1.6.2
Date: Thu, 18 Feb 2021 12:24:13 +0800
Message-Id: <20210218042418.281245-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...num-types.c.in-fix-build-reproducibi.patch | 30 -------------------
 ...{json-glib_1.6.0.bb => json-glib_1.6.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.0.bb => json-glib_1.6.2.bb} (85%)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch b/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
deleted file mode 100644
index 0eb7244186..0000000000
--- a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0f06c4cb4a57083c08312144b03c8346cf620be6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Oct 2020 22:15:29 +0000
-Subject: [PATCH] json-glib/json-enum-types.c.in: fix build reproducibility
-
-Changes the comment and include to reference the file basename
-instead of the full path. This ensures that the generated file is
-reproducible when it is included in source packages meant for debugging.
-
-Upstream-Status: Backport [6f3842abd5dff68b6ee5f2ef48a4ebf1cbebf434]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- json-glib/json-enum-types.c.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/json-glib/json-enum-types.c.in b/json-glib/json-enum-types.c.in
-index da07c46..7b39290 100644
---- a/json-glib/json-enum-types.c.in
-+++ b/json-glib/json-enum-types.c.in
-@@ -9,8 +9,8 @@
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- 
- /*** END file-production ***/
- 
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
similarity index 85%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
index 59b0609900..fdf3b245e8 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
@@ -19,9 +19,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += "file://run-ptest \
-            file://0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch"
-SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "a33d66c6d038bda46b910c6c6d59c4e15db014e363dc997a0414c2e07d134f24"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.29.2

