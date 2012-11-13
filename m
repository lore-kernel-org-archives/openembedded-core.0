Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TYKTF-0007EQ-4t
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:40:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 09:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="248489753"
Received: from unknown (HELO localhost) ([10.255.12.144])
	by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2012 09:26:25 -0800
From: tom.zanussi@intel.com
To: ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 11:26:18 -0600
Message-Id: <ccd02e26cf74bc2a04b5aed45784f350a788ca34.1352826909.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1352826909.git.tom.zanussi@intel.com>
References: <cover.1352826909.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1352826909.git.tom.zanussi@intel.com>
References: <cover.1352826909.git.tom.zanussi@intel.com>
Subject: [PATCH 2/3] lttng-2.0: fix srcrev/pv to match the recipe filenames
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 17:40:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
didn't get updated, so they were still building old versions.

(From OE-Core rev: b3bffb0d34f99f31b65ddb886d80f71786120bbf)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb | 7 +++----
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   | 4 ++--
 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
index 4c78f36..baae25f 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
@@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
-PV = "2.0.pre11+git${SRCREV}"
+SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
+PV = "2.0.5"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
index e7f1016..0bafcb3 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
 
 DEPENDS = "liburcu popt lttng2-ust"
 
-SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
-PV = "v2.0.1+git${SRCREV}"
+SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
+PV = "v2.0.4"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
index 8f650a4..0574fe9 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
@@ -12,8 +12,8 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
-SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
-PV = "2.0.2+git${SRCPV}"
+SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
+PV = "2.0.5"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
-- 
1.7.11.4



