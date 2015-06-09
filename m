Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72468758A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:38:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2015 12:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,582,1427785200"; d="scan'208";a="724088916"
Received: from kchoi15-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.141.149])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2015 12:26:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  9 Jun 2015 12:26:17 -0700
Message-Id: <1433877977-30094-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2] poky-tiny: Update kernel to 3.19
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
X-List-Received-Date: Tue, 09 Jun 2015 19:38:33 -0000

Additionally, allow PREFERRED_VERSION for linux-yocto-tiny to be overridden

This addresses the warnings from the kernel configcheck:

WARNING: [kernel config]: specified values did not make it into the kernel's final configuration:

Value requested for CONFIG_ATA_PIIX not in final ".config"
Requested value: "CONFIG_ATA_PIIX=y"
Actual value set: ""

Value requested for CONFIG_BRCMFMAC_SDIO not in final ".config"
Requested value: "CONFIG_BRCMFMAC_SDIO=y"
Actual value set: ""

Value requested for CONFIG_NR_CPUS not in final ".config"
Requested value: "CONFIG_NR_CPUS=64"
Actual value set: "CONFIG_NR_CPUS=8"

Value requested for CONFIG_PM not in final ".config"
Requested value: "CONFIG_PM=y"
Actual value set: ""

[YOCTO #7478]

Signed-off-by: Saul Wold <sgw@linux.intel.com>

---
 meta-yocto/conf/distro/poky-tiny.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index aa60e77..f4a772e 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -37,7 +37,7 @@ DISTRO = "poky-tiny"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny = "3.14%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "3.19%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
-- 
2.1.0


