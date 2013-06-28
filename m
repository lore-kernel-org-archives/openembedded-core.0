Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A1EA060655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:00:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973379"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:43 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:43 +0300
Message-Id: <55f42776c7a2f09f2481984e287ae859148edb55.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 11/12] apt: Updated from 0.9.8.1 to 0.9.8.2
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
X-List-Received-Date: Fri, 28 Jun 2013 16:00:32 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../disable-configure-in-makefile.patch                            |    0
 .../fix-gcc-4.6-null-not-defined.patch                             |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch                |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-ko-translation.patch       |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch             |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch             |    0
 meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/truncate-filename.patch       |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch                |    0
 .../apt/{apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb}           |    0
 meta/recipes-devtools/apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb}       |    4 ++--
 11 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb} (74%)

diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/disable-configure-in-makefile.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/disable-configure-in-makefile.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/disable-configure-in-makefile.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/fix-gcc-4.6-null-not-defined.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/fix-gcc-4.6-null-not-defined.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/fix-gcc-4.6-null-not-defined.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/makerace.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/makerace.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/no-ko-translation.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/no-ko-translation.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/no-ko-translation.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/no-nls-dpkg.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/noconfigure.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/noconfigure.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/nodoc.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/nodoc.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/truncate-filename.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.8.1/use-host.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/use-host.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.8.1/use-host.patch
rename to meta/recipes-devtools/apt/apt-0.9.8.2/use-host.patch
diff --git a/meta/recipes-devtools/apt/apt-native_0.9.8.1.bb b/meta/recipes-devtools/apt/apt-native_0.9.8.2.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt-native_0.9.8.1.bb
rename to meta/recipes-devtools/apt/apt-native_0.9.8.2.bb
diff --git a/meta/recipes-devtools/apt/apt_0.9.8.1.bb b/meta/recipes-devtools/apt/apt_0.9.8.2.bb
similarity index 74%
rename from meta/recipes-devtools/apt/apt_0.9.8.1.bb
rename to meta/recipes-devtools/apt/apt_0.9.8.2.bb
index 445d14c..12952a9 100644
--- a/meta/recipes-devtools/apt/apt_0.9.8.1.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.8.2.bb
@@ -3,8 +3,8 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-SRC_URI[md5sum] = "85781bb39901d6fb79c37ca307929594"
-SRC_URI[sha256sum] = "dcef6fc33948d5e430d337ad6326bf7ac3d06b14d99ede176809461ac12b4c6f"
+SRC_URI[md5sum] = "956bb906224a5662111d353ab11a0347"
+SRC_URI[sha256sum] = "cb0360e218490d875dc1e9e15c4e0ba0b53c7f512a6c98253f2eb07877be5106"
 
 require apt-package.inc
 
-- 
1.7.10.4


