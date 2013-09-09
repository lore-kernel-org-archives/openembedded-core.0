Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 79CFA6BE64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 14:58:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Sep 2013 07:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,866,1371106800"; d="scan'208";a="357896268"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.38])
	by azsmga001.ch.intel.com with ESMTP; 09 Sep 2013 07:58:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  9 Sep 2013 07:58:39 -0700
Message-Id: <b565e6a583265fb63e66d3572af44551df7ac505.1378738373.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <c5ef7706ea79bf327809ef89d054ed439ba36256.1378738373.git.sgw@linux.intel.com>
References: <c5ef7706ea79bf327809ef89d054ed439ba36256.1378738373.git.sgw@linux.intel.com>
In-Reply-To: <cover.1378738373.git.sgw@linux.intel.com>
References: <cover.1378738373.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] yocto-bsp: remove apm as a default MACHINE_FEATURE
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
X-List-Received-Date: Mon, 09 Sep 2013 14:58:41 -0000

APM is not only obsolete, but also requires a kernel config enabled, which is not enabled by default

[YOCTO #5121]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
index ce9a58f..744486e 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
@@ -90,4 +90,4 @@ UBOOT_ENTRYPOINT = "{{=uboot_entrypoint}}"
 {{ input type:"edit" name:"uboot_loadaddress" prio:"40" msg:"Please specify a value for UBOOT_LOADADDRESS:" default:"0x80008000" }}
 UBOOT_LOADADDRESS = "{{=uboot_loadaddress}}"
 
-MACHINE_FEATURES = "apm usbgadget usbhost vfat alsa"
+MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
-- 
1.8.3.1


