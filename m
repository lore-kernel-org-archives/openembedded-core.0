Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7474A706B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:38:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9cAZh014791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 02:38:10 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 02:38:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Thu, 23 Apr 2015 17:38:14 +0800
Message-ID: <cover.1429781137.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] license.bbclass/linux-firmware: add an approach for non-generic license
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
X-List-Received-Date: Thu, 23 Apr 2015 09:38:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* An approach for non-generic license is added in license.bbclass.
* Revert the commit that added common license files for linux-firmware and
  use the new approach.

--
The following changes since commit 781165b071babb888f46a4e1d15880df924c65f6:

  bison: don't depend on help2man (2015-04-21 13:59:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/y_firmware_license_150423_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/y_firmware_license_150423_0

Jackie Huang (3):
  license.bbclass: allow copying license not in common licenses
  Revert "common-licenses: Add common license files for linux-firmware"
  linux-firmware: add NO_GENERIC_LIC for all licenses

 meta/classes/license.bbclass                       |  12 +-
 meta/files/common-licenses/Firmware-Abilis         |  22 -
 meta/files/common-licenses/Firmware-Marvell        |  18 -
 meta/files/common-licenses/Firmware-OLPC           |  33 --
 meta/files/common-licenses/Firmware-agere          |  77 ----
 meta/files/common-licenses/Firmware-amd-ucode      |  64 ---
 .../common-licenses/Firmware-atheros_firmware      |  38 --
 .../common-licenses/Firmware-broadcom_bcm43xx      |  65 ---
 meta/files/common-licenses/Firmware-ca0132         |  47 ---
 .../common-licenses/Firmware-chelsio_firmware      |  27 --
 meta/files/common-licenses/Firmware-cw1200         |  35 --
 meta/files/common-licenses/Firmware-dib0700        |  22 -
 meta/files/common-licenses/Firmware-ene_firmware   |  14 -
 meta/files/common-licenses/Firmware-fw_sst_0f28    |  40 --
 meta/files/common-licenses/Firmware-go7007         | 457 ---------------------
 meta/files/common-licenses/Firmware-i2400m         |  43 --
 meta/files/common-licenses/Firmware-ibt_firmware   |  39 --
 meta/files/common-licenses/Firmware-it913x         |  17 -
 .../common-licenses/Firmware-iwlwifi_firmware      |  39 --
 meta/files/common-licenses/Firmware-mwl8335        |  52 ---
 .../common-licenses/Firmware-myri10ge_firmware     |  28 --
 meta/files/common-licenses/Firmware-phanfw         |  32 --
 .../common-licenses/Firmware-qat_dh895xcc_firmware |  39 --
 meta/files/common-licenses/Firmware-qla2xxx        |  31 --
 meta/files/common-licenses/Firmware-r8a779x_usb3   |  26 --
 meta/files/common-licenses/Firmware-radeon         |  51 ---
 .../files/common-licenses/Firmware-ralink-firmware |  39 --
 .../Firmware-ralink_a_mediatek_company_firmware    |  39 --
 .../common-licenses/Firmware-rtlwifi_firmware      |  39 --
 .../common-licenses/Firmware-tda7706-firmware      |  48 ---
 .../files/common-licenses/Firmware-ti-connectivity |  46 ---
 .../common-licenses/Firmware-ueagle-atm4-firmware  |  39 --
 meta/files/common-licenses/Firmware-via_vt6656     |  25 --
 meta/files/common-licenses/Firmware-wl1251         |  59 ---
 meta/files/common-licenses/Firmware-xc4000         |  23 --
 meta/files/common-licenses/Firmware-xc5000         |  23 --
 meta/files/common-licenses/Firmware-xc5000c        |  23 --
 .../linux-firmware/linux-firmware_git.bb           |  39 ++
 38 files changed, 50 insertions(+), 1760 deletions(-)
 delete mode 100644 meta/files/common-licenses/Firmware-Abilis
 delete mode 100644 meta/files/common-licenses/Firmware-Marvell
 delete mode 100644 meta/files/common-licenses/Firmware-OLPC
 delete mode 100644 meta/files/common-licenses/Firmware-agere
 delete mode 100644 meta/files/common-licenses/Firmware-amd-ucode
 delete mode 100644 meta/files/common-licenses/Firmware-atheros_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-broadcom_bcm43xx
 delete mode 100644 meta/files/common-licenses/Firmware-ca0132
 delete mode 100644 meta/files/common-licenses/Firmware-chelsio_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-cw1200
 delete mode 100644 meta/files/common-licenses/Firmware-dib0700
 delete mode 100644 meta/files/common-licenses/Firmware-ene_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-fw_sst_0f28
 delete mode 100644 meta/files/common-licenses/Firmware-go7007
 delete mode 100644 meta/files/common-licenses/Firmware-i2400m
 delete mode 100644 meta/files/common-licenses/Firmware-ibt_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-it913x
 delete mode 100644 meta/files/common-licenses/Firmware-iwlwifi_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-mwl8335
 delete mode 100644 meta/files/common-licenses/Firmware-myri10ge_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-phanfw
 delete mode 100644 meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-qla2xxx
 delete mode 100644 meta/files/common-licenses/Firmware-r8a779x_usb3
 delete mode 100644 meta/files/common-licenses/Firmware-radeon
 delete mode 100644 meta/files/common-licenses/Firmware-ralink-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-rtlwifi_firmware
 delete mode 100644 meta/files/common-licenses/Firmware-tda7706-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-ti-connectivity
 delete mode 100644 meta/files/common-licenses/Firmware-ueagle-atm4-firmware
 delete mode 100644 meta/files/common-licenses/Firmware-via_vt6656
 delete mode 100644 meta/files/common-licenses/Firmware-wl1251
 delete mode 100644 meta/files/common-licenses/Firmware-xc4000
 delete mode 100644 meta/files/common-licenses/Firmware-xc5000
 delete mode 100644 meta/files/common-licenses/Firmware-xc5000c

-- 
1.9.1


