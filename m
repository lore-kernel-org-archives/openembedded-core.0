Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF15p-0002R4-Mq
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:40:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 04:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="303796160"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 04:23:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:24:21 +0200
Message-Id: <1363001062-18854-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
References: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/3] build-appliance-image: ethernet connection type is now bridged
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:41:23 -0000

For network/internet connectivity, Build Appliance uses
a NAT virtual network adapter. While using NAT, inside
Build Appliance network proxies won't provide a network
connection to the outside world.

Basically, connectivity is not provided if network proxies
are needed in order to acces the internet.

The solution is to use bridged ethernet connection type.

Fixes [YOCTO #3998].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../images/build-appliance-image/Yocto_Build_Appliance.vmx           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
index b38127a..b04a1b6 100644
--- a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
@@ -41,7 +41,7 @@ scsi0.virtualDev = "lsilogic"
 scsi0.present = "TRUE"
 ethernet0.present = "TRUE"
 ethernet0.virtualDev = "e1000"
-ethernet0.connectionType = "nat"
+ethernet0.connectionType = "bridged"
 ethernet0.startConnected = "TRUE"
 ethernet0.addressType = "generated"
 sound.present = "TRUE"
-- 
1.7.10.4



