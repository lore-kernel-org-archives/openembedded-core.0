Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2r7-0005rb-UF
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250207"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:42 -0700
Message-Id: <008f4a4fc9bfbb6a69cc773e3b19f1e6d93338ab.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/27] gcc-configure-sdk: Point sysroot to correct location
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:10 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index de80870..f130b47 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -4,10 +4,10 @@ require gcc-configure-common.inc
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
-EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
+EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_exec_prefix} \
                       --with-gxx-include-dir=${target_includedir}/c++ \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-                      --with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS} \
+                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 #
-- 
1.7.6.4



