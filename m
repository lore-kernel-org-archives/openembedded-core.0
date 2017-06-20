Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63A577806D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:51:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 23:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,367,1493708400"; d="scan'208";a="870166557"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2017 23:50:56 -0700
From: Choong YinThong <yin.thong.choong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:41:13 -0700
Message-Id: <1498002073-168422-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498002073-168422-1-git-send-email-yin.thong.choong@intel.com>
References: <1498002073-168422-1-git-send-email-yin.thong.choong@intel.com>
Cc: paul.eggleton@intel.com, core-dev@eclists.intel.com, saul.wold@intel.com
Subject: [PATCH] script/yocto-bsp: Fail to add kernel feature in custom linux kernel
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
X-List-Received-Date: Wed, 21 Jun 2017 06:51:05 -0000

Missing file {machine}-user-feature.scc on
yocto-bsp custom linux kernel creation
and causes failure in yocto-kernel feature add.

[YOCTO #11585]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 .../target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb        | 1 +
 .../recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc    | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc

diff --git a/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb
index fda955b..3ba4226 100644
--- a/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb
@@ -42,6 +42,7 @@ SRC_URI += "file://{{=machine}}.scc \
             file://{{=machine}}.cfg \
             file://{{=machine}}-user-config.cfg \
             file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
            "
 
 {{ if kernel_choice == "custom" and custom_kernel_need_kbranch == "y" and custom_kernel_kbranch and custom_kernel_kbranch != "master": }}
diff --git a/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc
new file mode 100644
index 0000000..85be26d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc
@@ -0,0 +1 @@
+# yocto-bsp-filename {{=machine}}-user-features.scc
\ No newline at end of file
-- 
2.7.4


