Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6457D20B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 179E918543
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:11 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ocbh_2wYhdVr
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DCF781857C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BD141A06B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80F8B1A06D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 75A0327A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32JV7P5026905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 21:31:07 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32JV7Mj026904
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 21:31:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 21:31:04 +0200
Message-Id: <2965f81a8f9cf330a2f9d811ae704ba16e12f394.1554233389.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1554233389.git.pkj@axis.com>
References: <cover.1554233389.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 6/6] arm-tunes: Add armv8a to TUNE_FEATURES as appropriate
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
X-List-Received-Date: Tue, 02 Apr 2019 19:31:10 -0000

This adds the armv8a tuning for Cortex-A32, Cortex-A35, Cortex-A53 and
Cortex-A72. This matches the other ARM tunes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/tune-cortexa32.inc | 9 ++++-----
 meta/conf/machine/include/tune-cortexa35.inc | 4 ++--
 meta/conf/machine/include/tune-cortexa53.inc | 8 ++++----
 meta/conf/machine/include/tune-cortexa72.inc | 4 ++--
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index c50470203c..a150540845 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -1,6 +1,5 @@
 DEFAULTTUNE ?= "cortexa32"
 
-
 TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
 TUNE_CCARGS_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
 
@@ -8,10 +7,10 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
 AVAILTUNES += "cortexa32 cortexa32-crypto"
-ARMPKGARCH_tune-cortexa32             = "cortexa32"
-ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "aarch64 cortexa32 crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "aarch64 cortexa32 crc crypto"
+ARMPKGARCH_tune-cortexa32            ?= "cortexa32"
+ARMPKGARCH_tune-cortexa32-crypto     ?= "cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
+TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
 BASE_LIB_tune-cortexa32               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index 0b082ce259..f57b0bd6e9 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa35 cortexa35-crypto"
 ARMPKGARCH_tune-cortexa35             = "cortexa35"
 ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
-TUNE_FEATURES_tune-cortexa35-crypto   = "aarch64 cortexa35 crc crypto"
+TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa35"
+TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
 BASE_LIB_tune-cortexa35               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index b3bd8bbc4e..48de368328 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -7,10 +7,10 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
 AVAILTUNES += "cortexa53 cortexa53-crypto"
-ARMPKGARCH_tune-cortexa53             = "cortexa53"
-ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
-TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
-TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
+ARMPKGARCH_tune-cortexa53            ?= "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto     ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa53"
+TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-armv8a-crc-crypto}cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 BASE_LIB_tune-cortexa53               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 1ed456f1a9..b527c5abaf 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -7,7 +7,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
 AVAILTUNES += "cortexa72"
-ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
+ARMPKGARCH_tune-cortexa72            ?= "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
-- 
2.12.0


