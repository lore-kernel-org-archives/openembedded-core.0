Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQWca-0003re-7B
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 05:24:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 May 2011 20:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,288,1304319600"; 
   d="scan'208";a="3492594"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 28 May 2011 20:21:44 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2011 20:22:10 -0700
Message-Id: <13d3629b27cf8ff25cfedb522ad524a7d2bc67f6.1306545413.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cb06560885d759a1f7bd36b1bf1b62f70102de8f.1306545413.git.nitin.a.kamble@intel.com>
References: <cb06560885d759a1f7bd36b1bf1b62f70102de8f.1306545413.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306545413.git.nitin.a.kamble@intel.com>
References: <cover.1306545413.git.nitin.a.kamble@intel.com>
Subject: [upgrades 4/4] genttext-0.16.1: mark upstream status for gplv2 recipe's patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 03:24:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gettext/gettext-0.16.1/disable_java.patch      |    2 ++
 .../gettext-0.16.1/fix_aclocal_version.patch       |    2 ++
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |    2 ++
 .../gettext/gettext-0.16.1/fixchicken.patch        |    2 ++
 .../gettext/gettext-0.16.1/getline.m4.patch        |    2 ++
 .../gettext-autoconf-lib-link-no-L.patch           |    2 ++
 .../gettext-error_print_progname.patch             |    2 ++
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |    2 ++
 .../gettext-0.16.1/hardcode_macro_version.patch    |    2 ++
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    2 ++
 10 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
index cf7dc55..d414e50 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
index 3796052..7402bbb 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 This patch updates the required version number from 2.61 to the 
 current 2.65 version of aclocal, this will need to be updated 
 when we update aclocal
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
index 8b42f1b..0b12722 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 This patch removes the circular dependency on AC_GNU_SOURCE in
 AC_USE_SYSTEM_EXTENSIONS.
 
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
index ef51056..f9aca2a 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
index f71d0e1..e489fee 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
index e8bb2f6..df09ea1 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
index 96a2196..f27ed5b 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
index 62420b7..2c1a289 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
index ef57dc2..85355f3 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 This patch hardcodes in version 0.17 for the GETTEXT_MACRO_VERSION,
 the version check is only part of 0.17 and will not affect any 0.16.1
 operations
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
index 2b805c9..2669879 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
-- 
1.7.2.2



