Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D927E60593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:56:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2013 06:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="275780774"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2013 06:56:19 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:58:51 +0300
Message-Id: <ea512bcc7a936c989827e6b0a22041550ba9fe8d.1375278766.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e63ad84faf8021c7d5b964e0c3c220b044fe8072.1375278766.git.ionutx.radu@intel.com>
References: <e63ad84faf8021c7d5b964e0c3c220b044fe8072.1375278766.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1375278766.git.ionutx.radu@intel.com>
References: <cover.1375278766.git.ionutx.radu@intel.com>
Subject: [PATCH 2/2] apt: Upgrade from 0.9.8.2 to 0.9.9.4
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
X-List-Received-Date: Wed, 31 Jul 2013 13:56:25 -0000

makerace.patch: adapted to the new version

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../disable-configure-in-makefile.patch                    |    0
 .../fix-gcc-4.6-null-not-defined.patch                     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch        |   12 ++++++------
 .../{apt-0.9.8.2 => apt-0.9.9.4}/no-ko-translation.patch   |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch           |    0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/truncate-filename.patch   |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch        |    0
 .../apt/{apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb}   |    0
 .../apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb}                 |    4 ++--
 11 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch (66%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb} (74%)

diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/disable-configure-in-makefile.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/fix-gcc-4.6-null-not-defined.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/makerace.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch
similarity index 66%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/makerace.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch
index 403711f..46e3161 100644
--- a/meta/recipes-devtools/apt/apt-0.9.8.2/makerace.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch
@@ -8,16 +8,16 @@ RP 2012/3/19
 
 Upstream-Status: Pending
 
-Index: apt-0.7.14/buildlib/library.mak
+Index: apt-0.9.9.4/buildlib/library.mak
 ===================================================================
---- apt-0.7.14.orig/buildlib/library.mak
-+++ apt-0.7.14/buildlib/library.mak
-@@ -61,7 +61,7 @@ $(LIB)/lib$(LIBRARY)$(LIBEXT).so.$(MAJOR
+--- apt-0.9.9.4.orig/buildlib/library.mak	2013-07-31 15:45:07.320440575 +0300
++++ apt-0.9.9.4/buildlib/library.mak	2013-07-31 15:46:49.440440561 +0300
+@@ -61,7 +61,7 @@
  
  # Compilation rules
  vpath %.cc $(SUBDIRS)
--$(OBJ)/%.opic: %.cc
-+$(OBJ)/%.opic: %.cc $($(LOCAL)-HEADERS)
+-$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS)
++$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS) $($(LOCAL)-HEADERS)
  	echo Compiling $< to $@
  	$(CXX) -c $(INLINEDEPFLAG) $(CPPFLAGS) $(CXXFLAGS) $(PICFLAGS) -o $@ $<
  	$(DoDep)
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/no-ko-translation.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/nodoc.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/nodoc.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/truncate-filename.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/use-host.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.2/use-host.patch
rename to meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
diff --git a/meta/recipes-devtools/apt/apt-native_0.9.8.2.bb b/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt-native_0.9.8.2.bb
rename to meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
diff --git a/meta/recipes-devtools/apt/apt_0.9.8.2.bb b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
similarity index 74%
rename from meta/recipes-devtools/apt/apt_0.9.8.2.bb
rename to meta/recipes-devtools/apt/apt_0.9.9.4.bb
index 12952a9..ae9ed6c 100644
--- a/meta/recipes-devtools/apt/apt_0.9.8.2.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
@@ -3,8 +3,8 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-SRC_URI[md5sum] = "956bb906224a5662111d353ab11a0347"
-SRC_URI[sha256sum] = "cb0360e218490d875dc1e9e15c4e0ba0b53c7f512a6c98253f2eb07877be5106"
+SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
+SRC_URI[sha256sum] = "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
 
 require apt-package.inc
 
-- 
1.7.10.4


