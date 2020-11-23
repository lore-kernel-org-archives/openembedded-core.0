Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.35995.1606144024845641793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ncBhQ1wAn/JaN3/C6ctZG6YzKNDRhdz8dxfLe3fUDef+i59irvd7dOPtktBRmCNvCkf5AWWU7K
 vcleXrBh5UEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="159547286"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="159547286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:04 -0800
IronPort-SDR: QbYJYwSfUjAF/AK10QlynUpXBDWHu4w9JXf8ixf24+HAn3PXmF/w5LKbMtqqwh8EsJE2VPdOt5
 D2TC/8BS0GNg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475135"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:03 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/21] linux-yocto/5.8: update to v5.8.16
Date: Mon, 23 Nov 2020 23:06:34 +0800
Message-Id: <c80d6d89e90b119e8fa1b434c35c46448bb2934c.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    c5464f4be19b Linux 5.8.16
    4cadc0dd5ce2 reiserfs: Fix oops during mount
    492f415bb105 reiserfs: Initialize inode keys properly
    27319196d104 USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
    56eff3982215 USB: serial: pl2303: add device-id for HP GC device
    e95645fd1e28 staging: comedi: check validity of wMaxPacketSize of usb endpoints found
    75ea7049c9c6 USB: serial: option: Add Telit FT980-KS composition
    a7f0e37b29f4 USB: serial: option: add Cellient MPL200 card
    d6efa7525a59 media: usbtv: Fix refcounting mixup
    1b7150e1c95e Bluetooth: Disconnect if E0 is used for Level 4
    9e473bae14f3 Bluetooth: MGMT: Fix not checking if BT_HS is enabled
    ffddc73458e8 Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
    a350bfd9a93f Bluetooth: A2MP: Fix not initializing all members
    8fae48c4bf67 crypto: qat - check cipher length for aead AES-CBC-HMAC-SHA
    c4ab0a2944b8 crypto: bcm - Verify GCM/CCM key length in setkey

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 869f4a5edf70a88301646356c8d3faa55996e5a9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index ad93121661..6dd8df6c3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index bee0cebcfa..69c292f275 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "29bb8494265c9b2b4c6263cd182d9698803bca70"
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine_qemuarm ?= "be316733dd181e972379b0c3b69e930c7e3637c5"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index b70319d8d6..8b70ee9283 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3a57eada4ccbc6c770cf1352b60e74b845f01ee8"
-SRCREV_machine_qemuarm64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemumips ?= "c2b7ecc61b0e3dbe394eabc90f7ac681a5a7bfaa"
-SRCREV_machine_qemuppc ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemuriscv64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemux86 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemux86-64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemumips64 ?= "71dc25ebfb9b5860d2d2340a5372958c707a831a"
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine_qemuarm ?= "483273f898cbdd3fa344f1d2f67ac52c991f1cb0"
+SRCREV_machine_qemuarm64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemumips ?= "a87cd0744b74ada1d5f83cccae63c06d5a6e3eec"
+SRCREV_machine_qemuppc ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemuriscv64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemux86 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemux86-64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemumips64 ?= "8cbec349bbcf94a5b37f44a43168db0bbec20af1"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.28.0

