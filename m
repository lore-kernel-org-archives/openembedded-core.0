Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B43106B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 05:57:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0F5vhgb001578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 21:57:43 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 21:57:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 15 Jan 2014 00:57:42 -0500
Message-ID: <fedc659a7572755e4ac2d60d064137aa0cd102f0.1389765320.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389765320.git.bruce.ashfield@windriver.com>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.10: update meta data for media fragments
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
X-List-Received-Date: Wed, 15 Jan 2014 05:57:44 -0000
Content-Type: text/plain

Updating the meta SRCREV to import the following changes:

   d9cd83c0292b remove old MEDIA config fragments
   06b76256d7e2 common-pc-standard.scc: Enable USB webcam support
   acb8b43837d8 common-pc-64.scc: update as per changes in the media config fragments
   5513fd2ad72a minnow-standard.scc: Enable media features
   172ba799bedc media-all.scc: A feature including all the media features
   1a7e1d3a292e media-platform: A feature for platform media devices
   03c48dacbb9a media-dvb-frontends : A feature for Digital Video Broadcast Devices
   59b92b9d6c72 media-usb-tv: A feature for USB TV media adapters
   5ec0709b1fed media-tuners: A feature for media tuner devices
   356dc83e39f3 media-rc: A feature for remote control media devices
   89d96cf9d574 media-radio: A feature for AM/FM radio devices
   3dd2ebeaf49b media-pci-capture: A feature for PCI media capture devices
   9ee0e95bfc52 media-i2c: A feature for I2C media devices
   28976f4a3e27 media-usb-webcams: A feature for USB media devices
   f8206f4e00b1 media: A feature for media infrastructure
   08bfb248a17f standard.scc: Add firmware loading feature
   e567a3d53593 firmware: A feature for firmware loading support

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index d9c5afa3afb6..e81a77ba4ea5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "ee9480cd91b2b46325a2da9aa6ae779d8e4163c0"
 SRCREV_machine_qemuppc ?= "5c126504c0a2f72d80bae9d96cea7eb9d7854290"
-SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
+SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index a866421b5ace..b25edc0baa5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.19"
 KMETA = "meta"
 
 SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
+SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 10f290111236..cce8249e98df 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -12,13 +12,13 @@ KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "7744145fcc3e4b6b6e308a1b86dc1c8b237b7575"
-SRCREV_machine_qemumips  ?= "2b8e8c694c38729ce724facdb0ab20751d061a2e"
+SRCREV_machine_qemumips ?= "2b8e8c694c38729ce724facdb0ab20751d061a2e"
 SRCREV_machine_qemuppc ?= "9a7537cb9bcc5c835dae6ac84fbbe7298473f69c"
 SRCREV_machine_qemux86 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
 SRCREV_machine_qemux86-64 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
 SRCREV_machine_qemumips64 ?= "0cd8e958d0ec7e01fd21fc7891da7eed688b0d37"
 SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_meta ?= "f47ea2844543c8ebf4572cfe23e4cfd6cb94d887"
+SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


