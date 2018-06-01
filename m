Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 38BC074FAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 19:23:20 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 0A74C100D35;
	Sat,  2 Jun 2018 04:15:03 +0900 (JST)
From: ayaka <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 03:14:10 +0800
Message-Id: <20180601191410.4795-4-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180601191410.4795-1-ayaka@soulik.info>
References: <20180601191410.4795-1-ayaka@soulik.info>
Subject: [PATCH 3/3] tune-cortexa17: add tunes for ARM Cortex-A35
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
X-List-Received-Date: Fri, 01 Jun 2018 19:23:21 -0000

https://developer.arm.com/products/processors/cortex-a/cortex-a35

Signe-off-by: ayaka <ayaka@soulik.info>
---
 meta/conf/machine/include/tune-cortexa35.inc | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc

diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
new file mode 100644
index 0000000000..62570e0943
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "armv8ahf-crypto"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa35 cortexa35-crypto"
+ARMPKGARCH_tune-cortexa35             = "cortexa35"
+ARMPKGARCH_tune-cortexa35t-crypto     = "cortexa35"
+TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a} cortexa35"
+TUNE_FEATURES_tune-cortexa35t-crypto  = "${TUNE_FEATURES_tune-armv8a-crypto} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-cortexa35} cortexa35-crypto"
+
+# HF Tunes
+AVAILTUNES += "cortexa35hf cortexa35hf-crypto"
+ARMPKGARCH_tune-cortexa35hf             = "cortexa35"
+ARMPKGARCH_tune-cortexa35hf-crypto      = "cortexa35"
+TUNE_FEATURES_tune-cortexa35hf             = "${TUNE_FEATURES_tune-armv8ahf} cortexa35"
+TUNE_FEATURES_tune-cortexa35hf-crypto      = "${TUNE_FEATURES_tune-armv8ahf-crypto} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35hf         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} cortexa35hf"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35hf-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto} cortexa35hf-crypto"
-- 
2.14.3


