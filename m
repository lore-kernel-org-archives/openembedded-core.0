Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0248D7C708
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 20:12:57 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id xdfNgnb2Ax6b6xdfOgRGar; Sat, 23 Feb 2019 20:12:58 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=CFTnQlWoA9kA:10 a=-An2I_7KAAAA:8 a=UD57Xu5YTielNQHPnhoA:9
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gxdfM-0007du-Nd; Sat, 23 Feb 2019 20:12:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 20:12:37 +0000
Message-Id: <20190223201237.28957-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOL9Zd5aUHKvwfNcMvygk2NeItP0UIWa+fNaECXUlvqQyv5nBJLRtti4sOL/3YPWeuEmHeZOtf+Sn3FtO5htRq1VUHe0KiaVHrrmYNni6mE4bB1WFu0d
	gIrLLmEYqfPjUKtJUacE7aPXD6GVXsabdiI=
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] arch-armv8a.inc: Add missing BASE_LIB tune overrides
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
X-List-Received-Date: Sat, 23 Feb 2019 20:12:58 -0000
Content-Transfer-Encoding: 8bit

For multilib to work correctly, BASE_LIB overrides must be provided for
each new tune added in this file.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 323d0d7f0f..22064559be 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -26,3 +26,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
+BASE_LIB_tune-armv8a                       = "lib64"
+BASE_LIB_tune-armv8a-crc                   = "lib64"
+BASE_LIB_tune-armv8a-crypto                = "lib64"
+BASE_LIB_tune-armv8a-crc-crypto            = "lib64"
-- 
2.20.1


