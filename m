Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3026173166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 21:37:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 16 Sep 2016 14:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,346,1470726000"; 
   d="scan'208";a="9836640"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.26.249])
	by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2016 14:37:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 16 Sep 2016 14:37:47 -0700
Message-Id: <1474061867-31162-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] linux-firmware: Add missing ralink-firmware License
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
X-List-Received-Date: Fri, 16 Sep 2016 21:37:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ed0c6ec..c432d4f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -577,6 +577,7 @@ LICENSE_${PN} = "\
     & Firmware-r8a779x_usb3 \
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
+    & Firmware-ralink-firmware \
     & Firmware-siano \
     & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
-- 
2.7.4


