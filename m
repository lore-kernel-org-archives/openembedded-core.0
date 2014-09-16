Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7DB71480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 07:18:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga103.fm.intel.com with ESMTP; 16 Sep 2014 00:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,533,1406617200"; d="scan'208";a="477796942"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by azsmga001.ch.intel.com with ESMTP; 16 Sep 2014 00:18:03 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 10:18:00 +0300
Message-Id: <e6c2b4fd9a85463a7a41590fad213d83af8ec6d6.1410851846.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410851846.git.cristian.iorga@intel.com>
References: <cover.1410851846.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1410851846.git.cristian.iorga@intel.com>
References: <cover.1410851846.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: remove hardwired path
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
X-List-Received-Date: Tue, 16 Sep 2014 07:18:09 -0000

Remove wrong absolute hardwired path
for the VM disk image.

Fixes [YOCTO #6728].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
index 7da9c52..6472e87 100644
--- a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
@@ -7,7 +7,7 @@ memsize = "4096"
 mem.hotadd = "TRUE"
 sata0.present = "TRUE"
 sata0:0.present = "TRUE"
-sata0:0.fileName = "/mnt/Yo/yoctoproject/VMs/BA/Yocto_Build_Appliance.vmdk"
+sata0:0.fileName = "Yocto_Build_Appliance.vmdk"
 ethernet0.present = "TRUE"
 ethernet0.virtualDev = "e1000"
 ethernet0.wakeOnPcktRcv = "FALSE"
-- 
1.9.1


