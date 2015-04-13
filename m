Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18B076AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 02:17:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3D2HJBi001193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 19:17:19 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 19:17:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 10:17:19 +0800
Message-ID: <cover.1428891074.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] linux-firmware: fix the mess of licenses
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
X-List-Received-Date: Mon, 13 Apr 2015 02:17:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

linux-firmware includes many firmwares and each firmware has their own license,
previously the LICENSE is set to "Proprietary" and some firmware is split out
to separate package such as linux-firmware-radeon and LICENSE_linux-firmware-radeon
is set to "Firmware-radeon", but there is no license file in the common-licenses,
so we got a lot warnings like:

WARNING: The license listed Firmware-radeon was not in the licenses collected for linux-firmware

These include adding the missing license files and re-orgnize the codes to fix the warnings and
avoid the mess.

--
The following changes since commit 7fb6a6e907e5803597b2e12ba7047c46e57dba26:

  upstream_tracking.inc: Add no-update reason for gdk-pixbuf (2015-04-09 10:01:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/y_firmware_license_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/y_firmware_license_1

Jackie Huang (2):
  common-licenses: Add common license files for linux-firmware
  linux-firmware: fix the mess of licenses

 meta/files/common-licenses/Firmware-Abilis         |  22 +
 meta/files/common-licenses/Firmware-Marvell        |  18 +
 meta/files/common-licenses/Firmware-OLPC           |  33 ++
 meta/files/common-licenses/Firmware-agere          |  77 ++++
 meta/files/common-licenses/Firmware-amd-ucode      |  64 +++
 .../common-licenses/Firmware-atheros_firmware      |  38 ++
 .../common-licenses/Firmware-broadcom_bcm43xx      |  65 +++
 meta/files/common-licenses/Firmware-ca0132         |  47 +++
 .../common-licenses/Firmware-chelsio_firmware      |  27 ++
 meta/files/common-licenses/Firmware-cw1200         |  35 ++
 meta/files/common-licenses/Firmware-dib0700        |  22 +
 meta/files/common-licenses/Firmware-ene_firmware   |  14 +
 meta/files/common-licenses/Firmware-fw_sst_0f28    |  40 ++
 meta/files/common-licenses/Firmware-go7007         | 457 +++++++++++++++++++++
 meta/files/common-licenses/Firmware-i2400m         |  43 ++
 meta/files/common-licenses/Firmware-ibt_firmware   |  39 ++
 meta/files/common-licenses/Firmware-it913x         |  17 +
 .../common-licenses/Firmware-iwlwifi_firmware      |  39 ++
 meta/files/common-licenses/Firmware-mwl8335        |  52 +++
 .../common-licenses/Firmware-myri10ge_firmware     |  28 ++
 meta/files/common-licenses/Firmware-phanfw         |  32 ++
 .../common-licenses/Firmware-qat_dh895xcc_firmware |  39 ++
 meta/files/common-licenses/Firmware-qla2xxx        |  31 ++
 meta/files/common-licenses/Firmware-r8a779x_usb3   |  26 ++
 meta/files/common-licenses/Firmware-radeon         |  51 +++
 .../files/common-licenses/Firmware-ralink-firmware |  39 ++
 .../Firmware-ralink_a_mediatek_company_firmware    |  39 ++
 .../common-licenses/Firmware-rtlwifi_firmware      |  39 ++
 .../common-licenses/Firmware-tda7706-firmware      |  48 +++
 .../files/common-licenses/Firmware-ti-connectivity |  46 +++
 .../common-licenses/Firmware-ueagle-atm4-firmware  |  39 ++
 meta/files/common-licenses/Firmware-via_vt6656     |  25 ++
 meta/files/common-licenses/Firmware-wl1251         |  59 +++
 meta/files/common-licenses/Firmware-xc4000         |  23 ++
 meta/files/common-licenses/Firmware-xc5000         |  23 ++
 meta/files/common-licenses/Firmware-xc5000c        |  23 ++
 .../linux-firmware/linux-firmware_git.bb           | 308 ++++++++++----
 37 files changed, 1978 insertions(+), 89 deletions(-)
 create mode 100644 meta/files/common-licenses/Firmware-Abilis
 create mode 100644 meta/files/common-licenses/Firmware-Marvell
 create mode 100644 meta/files/common-licenses/Firmware-OLPC
 create mode 100644 meta/files/common-licenses/Firmware-agere
 create mode 100644 meta/files/common-licenses/Firmware-amd-ucode
 create mode 100644 meta/files/common-licenses/Firmware-atheros_firmware
 create mode 100644 meta/files/common-licenses/Firmware-broadcom_bcm43xx
 create mode 100644 meta/files/common-licenses/Firmware-ca0132
 create mode 100644 meta/files/common-licenses/Firmware-chelsio_firmware
 create mode 100644 meta/files/common-licenses/Firmware-cw1200
 create mode 100644 meta/files/common-licenses/Firmware-dib0700
 create mode 100644 meta/files/common-licenses/Firmware-ene_firmware
 create mode 100644 meta/files/common-licenses/Firmware-fw_sst_0f28
 create mode 100644 meta/files/common-licenses/Firmware-go7007
 create mode 100644 meta/files/common-licenses/Firmware-i2400m
 create mode 100644 meta/files/common-licenses/Firmware-ibt_firmware
 create mode 100644 meta/files/common-licenses/Firmware-it913x
 create mode 100644 meta/files/common-licenses/Firmware-iwlwifi_firmware
 create mode 100644 meta/files/common-licenses/Firmware-mwl8335
 create mode 100644 meta/files/common-licenses/Firmware-myri10ge_firmware
 create mode 100644 meta/files/common-licenses/Firmware-phanfw
 create mode 100644 meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
 create mode 100644 meta/files/common-licenses/Firmware-qla2xxx
 create mode 100644 meta/files/common-licenses/Firmware-r8a779x_usb3
 create mode 100644 meta/files/common-licenses/Firmware-radeon
 create mode 100644 meta/files/common-licenses/Firmware-ralink-firmware
 create mode 100644 meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
 create mode 100644 meta/files/common-licenses/Firmware-rtlwifi_firmware
 create mode 100644 meta/files/common-licenses/Firmware-tda7706-firmware
 create mode 100644 meta/files/common-licenses/Firmware-ti-connectivity
 create mode 100644 meta/files/common-licenses/Firmware-ueagle-atm4-firmware
 create mode 100644 meta/files/common-licenses/Firmware-via_vt6656
 create mode 100644 meta/files/common-licenses/Firmware-wl1251
 create mode 100644 meta/files/common-licenses/Firmware-xc4000
 create mode 100644 meta/files/common-licenses/Firmware-xc5000
 create mode 100644 meta/files/common-licenses/Firmware-xc5000c

-- 
1.9.1


