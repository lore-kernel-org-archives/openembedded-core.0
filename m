Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2647707F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 06:03:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9R63LxG008159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Oct 2015 23:03:22 -0700
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 23:03:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 27 Oct 2015 14:03:16 +0800
Message-ID: <65d2e8fd5a9323eabfe080478c81683d4b0646ed.1445925650.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445925650.git.hongxu.jia@windriver.com>
References: <cover.1445925650.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-firmware: Package Marvell pci8897 and usb8897 firmware
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
X-List-Received-Date: Tue, 27 Oct 2015 06:03:23 -0000
Content-Type: text/plain

From: Ng Wei Tee <wei.tee.ng@intel.com>

Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Cherry pick from OE-Core(dizzy) rev: 86106da1068ec802ec9e1dd7bcdd9baf78182cb7
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4939ca6..3d50801 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -164,7 +164,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-radeon-license ${PN}-radeon \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 ${PN}-pcie8897 ${PN}-usb8897 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
@@ -256,6 +256,19 @@ LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 
+LICENSE_${PN}-pcie8897 = "Firmware-Marvell"
+FILES_${PN}-pcie8897 = " \
+  /lib/firmware/mrvl/pcie8897_uapsta.bin \
+"
+RDEPENDS_${PN}-pcie8897 += "${PN}-marvell-license"
+
+LICENSE_${PN}-usb8897 = "Firmware-Marvell"
+FILES_${PN}-usb8897 = " \
+  /lib/firmware/mrvl/usb8897_uapsta.bin \
+"
+RDEPENDS_${PN}-usb8897 += "${PN}-marvell-license"
+
+
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
-- 
1.9.1


