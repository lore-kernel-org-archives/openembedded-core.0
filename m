Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id D19BA7603D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:51:11 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id CC057100CDA;
	Wed, 20 Jun 2018 04:51:55 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:50:43 +0800
Message-Id: <20180619195046.13424-4-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180619195046.13424-1-ayaka@soulik.info>
References: <20180619195046.13424-1-ayaka@soulik.info>
Subject: [PATCH v5 3/6] tune-cortexa32: add tunes for ARM Cortex-A32
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
X-List-Received-Date: Tue, 19 Jun 2018 19:51:12 -0000

https://developer.arm.com/products/processors/cortex-a/cortex-a32

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/conf/machine/include/tune-cortexa32.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa32.inc

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
new file mode 100644
index 0000000000..22f303fae9
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "cortexa32"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa32 cortexa32-crypto"
+ARMPKGARCH_tune-cortexa32             = "cortexa32"
+ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
+TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-- 
2.14.4


