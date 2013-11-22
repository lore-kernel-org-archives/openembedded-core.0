Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6E16CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:23:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2013 02:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,751,1378882800"; d="scan'208";a="432027948"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2013 02:23:32 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 12:24:34 +0200
Message-Id: <1385115874-32086-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] pciutils: upgrade to 3.2.1
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
X-List-Received-Date: Fri, 22 Nov 2013 10:23:34 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/configure.patch | 0
 .../recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/guess-fix.patch | 0
 .../pciutils/{pciutils-3.2.0 => pciutils}/lib-build-fix.patch         | 0
 meta/recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/makefile.patch | 0
 meta/recipes-bsp/pciutils/{pciutils_3.2.0.bb => pciutils_3.2.1.bb}    | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/configure.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.2.0 => pciutils}/makefile.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.2.0.bb => pciutils_3.2.1.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.2.0/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.2.0/configure.patch
rename to meta/recipes-bsp/pciutils/pciutils/configure.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.2.0/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.2.0/guess-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.2.0/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.2.0/lib-build-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.2.0/makefile.patch b/meta/recipes-bsp/pciutils/pciutils/makefile.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.2.0/makefile.patch
rename to meta/recipes-bsp/pciutils/pciutils/makefile.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
index 6ff4680..6d45d72 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "d73a1b35e5d5efa70e8476d5917de11f"
-SRC_URI[sha256sum] = "b816943bb06c3338d98e2c705e3b76c9e513830f1f15c76d60e549f965d22a35"
+SRC_URI[md5sum] = "425b1acad6854cc2bbb06ac8e48e76fc"
+SRC_URI[sha256sum] = "12d52b19042e2fd058af12e7d877bbbce72213cb3a0b5ec7ff0703ac09e3dcde"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.3.2


