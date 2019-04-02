Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEDE57D11A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8AC481854D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:08 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 98QLzknGDTpR
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3E4EC18543
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C7541A070
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 217491A06F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 15CB027A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32JV6gP026877
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 21:31:06 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32JV6I5026876
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 21:31:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 21:30:59 +0200
Message-Id: <194589b673e4c6bf2a1079321461e2894b14fd16.1554233389.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1554233389.git.pkj@axis.com>
References: <cover.1554233389.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/6] arch-armv8a.inc: Correct PACKAGE_EXTRA_ARCHS_tune-armv8a-*
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
X-List-Received-Date: Tue, 02 Apr 2019 19:31:08 -0000

The armv8a tune specific PACKAGE_EXTRA_ARCHS contained tune feature
names like "crc" and "crypto" rather than package architecture names
like "armv8a-crc" and "armv8a-crypto".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 44d0ca4557..f810a1e8fc 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -21,9 +21,9 @@ TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
 TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
 TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a"
-PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
-PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-crypto armv8a-crc-crypto"
 BASE_LIB_tune-armv8a                       = "lib64"
 BASE_LIB_tune-armv8a-crc                   = "lib64"
 BASE_LIB_tune-armv8a-crypto                = "lib64"
-- 
2.12.0


