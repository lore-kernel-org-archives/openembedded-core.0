Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhV-0008Qi-Fj
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197491"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:31 -0800
Message-Id: <95087959c81f303d77368687f4aa62a721a51465.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 33/36] tune-ppc*.inc: update to use new default value for TUNE_PKGARCH
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:13 -0000

From: Matthew McClintock <msm@freescale.com>

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/tune-ppc603e.inc   |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc |    2 +-
 meta/conf/machine/include/tune-ppce500.inc   |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 663f220..02cebe7 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
+TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 
 AVAILTUNES = "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index bdca1aa..27ef4a8 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 709e14f..1326720 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 950c46d..51e6f53 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 
 AVAILTUNES = "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 0cbe5af..e7b51c6 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
-- 
1.7.7.6



