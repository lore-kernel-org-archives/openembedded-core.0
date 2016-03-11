Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 750F26612D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:44:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2BIiqEa017053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Mar 2016 10:44:55 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 11 Mar 2016 10:44:51 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 11 Mar 2016 13:44:51 -0500
Message-ID: <1457721891-28398-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.1: usb backports for Apollo Lake/Broxton
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
X-List-Received-Date: Fri, 11 Mar 2016 18:44:55 -0000
Content-Type: text/plain

Importing a series of mainline backports to support USB on a couple of
Intel platforms:

   bbce8fe2cc42 usb: dwc3: pci: add support for Intel Broxton SOC
   e734e1d9f827 usb: dwc3: pci: Set enblslpm quirk for Synopsys platforms
   1c6bb6694d50 usb: dwc3: Add dis_enblslpm_quirk
   1c6be99e56b8 usb: dwc3: pci: trivial: Formatting
   2f2b89764b97 usb: dwc3: pci: passing forward the ACPI companion
   ea4b3c72d976 usb: dwc3: core: convert to unified device property interface
   dc670b52c69a usb: common: of_usb_get_dr_mode to usb_get_dr_mode
   586fc5174649 usb: dwc3: st: prepare the driver for generic usb_get_dr_mode function
   0624bd9af7ef usb: common: of_usb_get_maximum_speed to usb_get_maximum_speed
   e65bc5467e07 usb: dwc3: Add frame length adjustment quirk
   a90954c5d267 usb: musb: dsps: control musb speed based on dts setting
   b48ff160a993 usb: renesas_usbhs: Allow an OTG PHY driver to provide VBUS
   d1c59752195e usb: chipidea: set usb otg capabilities
   733eada2cdec usb: common: add API to update usb otg capabilities by device tree
   7ab2108dd82b usb: dwc3: core: avoid NULL pointer dereference
   1aedb48b7dc9 usb: dwc3: add ULPI interface support
   07e42a29fb7e usb: dwc3: pci: add quirk for Baytrails
   065917252622 usb: dwc3: add hsphy_interface property
   b2bb32a363a3 usb: dwc3: setup phys earlier
   bf6bb0a6ebb5 usb: dwc3: soft reset to it's own function
   d481da949476 usb: dwc3: cache hwparams earlier
   9ac66262a201 usb: dwc3: store driver data earlier
   5f940588938c usb: dwc3: ULPI or UTMI+ select
   04fdce097f83 usb: dwc3: USB2 PHY register access bits
   b7209213cc05 usb: add bus type for USB ULPI

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4a6928a7d1fe..438e8bd866ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "2a4c22b03d434f7695e607b6ad30f77671985a6d"
-SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
+SRCREV_machine ?= "3df00817776c649f6b9518a3d12cf8a01cecfbfa"
+SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 41a79f17b7f1..1148b99c2f04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
+SRCREV_machine ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9663966d8e17..9bd6c0f0788c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "96b21aab2adf2c9396f8cf579420a2e497923eae"
-SRCREV_machine_qemuarm64 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_machine_qemumips ?= "e0a6ffb62a4d28659e0e1be7b1a42a8ef499aa3b"
-SRCREV_machine_qemuppc ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_machine_qemux86 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_machine_qemux86-64 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_machine_qemumips64 ?= "1b1349ca5a642086d4b92347fb9d1de1c6eab742"
-SRCREV_machine ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
-SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
+SRCREV_machine_qemuarm ?= "f8452287eab4c1d11d38a831f0d13ce09c314888"
+SRCREV_machine_qemuarm64 ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_machine_qemumips ?= "0919df9a4a3b3fc23682605631ba4f32ac177f52"
+SRCREV_machine_qemuppc ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_machine_qemux86 ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_machine_qemux86-64 ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_machine_qemumips64 ?= "8c34d0644c7cb0140c4ff010a8a59af2cde2d9a2"
+SRCREV_machine ?= "bbce8fe2cc42c3f8424d42f50b537833897b6d53"
+SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


