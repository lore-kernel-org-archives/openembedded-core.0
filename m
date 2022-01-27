Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B54C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CwmeBq30;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260238; x=1674796238;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Cpb7P+5dO9Bku348ahX1/Dl8qLeo/r8tq24qCQioH78=;
  b=CwmeBq30crg0nJBHZwzYSQuOVjFQ11MyEhEytBv7VYpOujikXUmvS5SZ
   kt5ELo2HT3MB86wSVUWTtSWuS+ZGEPORk7IdGAejcQT0tTZxFVz6v8MIp
   SADRPszK5qe5vnVqZtSOMPREeVFEeDp9QhXdcu6rF+no5sl4yk+qlo0Ac
   kiohPnJ2fozGZT+OCtAMcok/awfV1k2t1IYXevEr7ZQ7qRjoSGXnnJ/U+
   G4udqXq2RVKpuFzB5Me36xzkPX0sIySJ5e5QqnVOF7l7RFfZuukePa9PV
   AFjGkaCxB7KvuxgTrbkxNue/uXCI93s2K0NSb4eQ4Wx/zc7axF2F61NDL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590367"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590367"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209057"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/17] linux-yocto/5.4: update to v5.4.172
Date: Thu, 27 Jan 2022 13:10:05 +0800
Message-Id: 
 <3d3db22ec53d86985040294378ffb81306ef9a5b.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161015

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b7f70762d158 Linux 5.4.172
    f415409551b0 staging: greybus: fix stack size warning with UBSAN
    65c2e7176f77 drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
    86ded7a6cf40 staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()
    a459686f986c media: Revert "media: uvcvideo: Set unique vdev name based in type"
    7e07bedae159 random: fix crash on multiple early calls to add_bootloader_randomness()
    517ab153f503 random: fix data race on crng init time
    90ceecdaa062 random: fix data race on crng_node_pool
    a4fa4377c91b can: gs_usb: gs_can_start_xmit(): zero-initialize hf->{flags,reserved}
    e90a7524b5c8 can: gs_usb: fix use of uninitialized variable, detach device on reception of invalid USB data
    9e9241d3345a drivers core: Use sysfs_emit and sysfs_emit_at for show(device *...) functions
    ada3805f1423 mfd: intel-lpss: Fix too early PM enablement in the ACPI ->probe()
    d08a0a88db88 veth: Do not record rx queue hint in veth_xmit
    a6722b497401 mmc: sdhci-pci: Add PCI ID for Intel ADL
    1199f0928488 USB: Fix "slab-out-of-bounds Write" bug in usb_hcd_poll_rh_status
    43aac50196f3 USB: core: Fix bug in resuming hub's handling of wakeup requests
    ed5c2683b67b Bluetooth: bfusb: fix division by zero in send path
    784e873af3dc Bluetooth: btusb: fix memory leak in btusb_mtk_submit_wmt_recv_urb()
    ad07b60837b2 workqueue: Fix unbind_workers() VS wq_worker_running() race

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 48a96b265b..b7a07bb17b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2e96217d85f653d79f1e691c84aaf178931550a7"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine ?= "e92d76afe6d8592917c0e7b948912c085e661df2"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 80d260cf88..a75570df93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "59c50d08a8c111c9941b53cc3903cafc7b9339f0"
-SRCREV_machine ?= "da1b138e527f276887038d0091980ec5bfbd0824"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine_qemuarm ?= "10b4756eee78aa43ff9ed64da700ec6e8d97ff22"
+SRCREV_machine ?= "6ab93fdc53b64e146e4f16363375c1beb37b82e4"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c467a690d0..db80789ba9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c961afa9250955e8bc4e286fba5942181cdfce45"
-SRCREV_machine_qemuarm64 ?= "0408baf57ccb7975ea0291418f44c1bf241b9792"
-SRCREV_machine_qemumips ?= "1e20719de0a733cf6c9f1f5467a16e8449dd1eb3"
-SRCREV_machine_qemuppc ?= "40c08791a68abb946948e1aea7532dc156e9eaa5"
-SRCREV_machine_qemuriscv64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemux86 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemux86-64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemumips64 ?= "31c53aae874ab1a677be38ffe29dc0e7084a08f4"
-SRCREV_machine ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine_qemuarm ?= "8de1da3dc354dedef2e435e694eec6d6e72c9822"
+SRCREV_machine_qemuarm64 ?= "eed7c0a64f3a7a91a130bc2e507304dc8b446a31"
+SRCREV_machine_qemumips ?= "996a9660e4fab70db5cecec9c831141cd03c3d36"
+SRCREV_machine_qemuppc ?= "0197cf5754b1bd4eb035c342af9cc27e8c3339ca"
+SRCREV_machine_qemuriscv64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemux86 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemux86-64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemumips64 ?= "fe2769a7c268ed224ec70fd2aaab850e4eef70dc"
+SRCREV_machine ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


