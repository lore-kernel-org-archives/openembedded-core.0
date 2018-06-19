Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 1590D7602C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:30:06 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id C0828100CDA;
	Wed, 20 Jun 2018 04:30:50 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:29:40 +0800
Message-Id: <20180619192945.9168-5-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180619192945.9168-1-ayaka@soulik.info>
References: <20180619192945.9168-1-ayaka@soulik.info>
Subject: [PATCH v4 3/5] tune-cortexa35: add tunes for ARM Cortex-A35
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
X-List-Received-Date: Tue, 19 Jun 2018 19:30:06 -0000

https://developer.arm.com/products/processors/cortex-a/cortex-a35

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/conf/machine/include/tune-cortexa35.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc

diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
new file mode 100644
index 0000000000..c5fc2e948e
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "cortexa35"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa35 cortexa35-crypto"
+ARMPKGARCH_tune-cortexa35             = "cortexa35"
+ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
+TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa35"
+TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35-crypto"
-- 
2.14.4


