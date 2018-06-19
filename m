Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 380DC755A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:30:13 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id F30B31025B1;
	Wed, 20 Jun 2018 04:30:57 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:29:45 +0800
Message-Id: <20180619192945.9168-10-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180619192945.9168-1-ayaka@soulik.info>
References: <20180619192945.9168-1-ayaka@soulik.info>
Subject: [PATCH v4 6/6] tune-cortexa72: add tunes for ARM Cortex-A72
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
X-List-Received-Date: Tue, 19 Jun 2018 19:30:13 -0000

It looks that the Cryptography engine is mandatory in this
platform.

https://developer.arm.com/products/processors/cortex-a/cortex-a72

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72.inc

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
new file mode 100644
index 0000000000..8055492b8e
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -0,0 +1,12 @@
+DEFAULTTUNE ?= "cortexa72"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa72"
+ARMPKGARCH_tune-cortexa72             = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-- 
2.14.4


