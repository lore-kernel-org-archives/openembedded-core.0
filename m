Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27B8A6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:54:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D3sBUl012593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 20:54:11 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 20:54:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 Oct 2014 23:53:58 -0400
Message-ID: <99d1c326cf5b6255fec74e2d581102a41edbff4b.1413172183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1413172183.git.bruce.ashfield@windriver.com>
References: <cover.1413172183.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.17: v3.17 release and config
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
X-List-Received-Date: Mon, 13 Oct 2014 03:54:16 -0000
Content-Type: text/plain

Updating the SRCREVs to incoroprate the full 3.17 release, and also
updating the meta data to match the v3.17 content:

  9ba007f8d0ab meta: bump kver to v3.17-final
  5c6c5fe9b0bf config: remove CONFIG_HOTPLUG
  0ceecad5f15a qemu: explicitly include usb configuration fragments
  f6c78ada8655 gfx: convert CONFIG_TABLET_USB_WACOM to CONFIG_HID_USB_WACOM
  cd1dbedfa3c9 x86: Support 32 bit binaries

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index eae08540e6e0..77855d956e9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17-rc7"
+LINUX_VERSION ?= "3.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
-SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
+SRCREV_machine ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
+SRCREV_meta ?= "9ba007f8d0abf3cc5499e8eee13065b7f0713e81"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 02f10a3aaf0f..3838dbfa57a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d156e4658a13349f7a30adafd436e32fb722d248"
-SRCREV_machine_qemumips ?= "5aa58a6ca9d4efe79ddf66c9d09695b42c84a3b6"
-SRCREV_machine_qemuppc ?= "cc4943bf3b93f9c424b63c357ab2c9f71384f3ac"
-SRCREV_machine_qemux86 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
-SRCREV_machine_qemux86-64 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
-SRCREV_machine_qemumips64 ?= "798c30525b1e0eacfa3ff97c4bb17c45b9b4b220"
-SRCREV_machine ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
-SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
+SRCREV_machine_qemuarm ?= "e86f70699655d1f5bf2518c8dcdb949a39161c86"
+SRCREV_machine_qemumips ?= "0acaa5991a61fbab0d897157049ac2e638e9c7bf"
+SRCREV_machine_qemuppc ?= "50e33fec112527de12c2833cd8a283dd4a75ae33"
+SRCREV_machine_qemux86 ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
+SRCREV_machine_qemux86-64 ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
+SRCREV_machine_qemumips64 ?= "c0558aaa8251a022447a4ac782d4e707401c52d3"
+SRCREV_machine ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
+SRCREV_meta ?= "9ba007f8d0abf3cc5499e8eee13065b7f0713e81"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17-rc7"
+LINUX_VERSION ?= "3.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


