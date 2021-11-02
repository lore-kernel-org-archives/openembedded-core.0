Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0711C4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.505.1635871635257964071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509713"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509713"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575145"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/24] linux-yocto/5.14: update to v5.14.13
Date: Wed,  3 Nov 2021 00:43:56 +0800
Message-Id: 
 <d7eebc956d4fa4353475fda198a656619ae387e4.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157794

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    b9ed05407395 Linux 5.14.13
    d7c187ab28f6 hwmon: (pmbus/ibm-cffps) max_power_out swap changes
    e798dcd960a3 io_uring: kill fasync
    15571bb5bb64 sched: Always inline is_percpu_thread()
    643c519c36dc perf/core: fix userpage->time_enabled of inactive events
    15f69a666166 scsi: qla2xxx: Fix excessive messages during device logout
    cc07ecaf9a9c scsi: virtio_scsi: Fix spelling mistake "Unsupport" -> "Unsupported"
    21c2e89e7caa scsi: ses: Fix unsigned comparison with less than zero
    18d1c5ea3798 drm/amdgpu: fix gart.bo pin_count leak
    048389b85643 net: sun: SUNVNET_COMMON should depend on INET
    e36444b36ff0 vboxfs: fix broken legacy mount signature checking
    5c85a825615a net: bgmac-platform: handle mac-address deferral
    af13e6176b25 mac80211: check return value of rhashtable_init
    ebb25ff84341 net: prevent user from passing illegal stab size
    998e080844c9 hwmon: (ltc2947) Properly handle errors when looking for the external clock
    1d0996b0d2b3 m68k: Handle arrivals of multiple signals correctly
    4d38fb418f71 pinctrl: qcom: sc7280: Add PM suspend callbacks
    9a8a181ed97e mac80211: Drop frames from invalid MAC address in ad-hoc mode
    a3ea231aa3f0 netfilter: nf_nat_masquerade: defer conntrack walk to work queue
    36f822c301c7 netfilter: nf_nat_masquerade: make async masq_inet6_event handling generic
    6c3e84af3944 KVM: arm64: nvhe: Fix missing FORCE for hyp-reloc.S build rule
    1fd0252cad6b ASoC: SOF: loader: release_firmware() on load failure to avoid batching
    2dd40af15d19 HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs
    95cb145dcfc8 netfilter: ip6_tables: zero-initialize fragment offset
    f117530a10e0 HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
    13e6abfa0b1e ALSA: usb-audio: Unify mixer resume and reset_resume procedure
    cb315326664d ALSA: oxfw: fix transmission method for Loud models based on OXFW971
    3c13d6e6fc56 ASoC: Intel: sof_sdw: tag SoundWire BEs as non-atomic
    7c2893a12fc0 ext4: correct the error path of ext4_write_inline_data_end()
    501f3491d99e ext4: check and update i_disksize properly

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1028453439db361d5f77fa220d77c49bc7a1f82)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index aa101955d6..245ea46ceb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0dca0e4b8b5b7238f27dbbb5cec14750ce29a5c"
-SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
+SRCREV_machine ?= "cddeec4e197612a11f5a3d746a15825c66040830"
+SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.12"
+LINUX_VERSION ?= "5.14.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 1a3594e727..c98a5fa428 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.12"
+LINUX_VERSION ?= "5.14.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0eeb536a4a61174cfec3b95aec7e27740dc0662a"
-SRCREV_machine ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
+SRCREV_machine:qemuarm ?= "ace292aaba53e26d1888bebda95bbadfd417c2a5"
+SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 96444fce6c..fe7244399a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f70b10ff20aba38b88b584e2afe1b770f7ff9a4f"
-SRCREV_machine:qemuarm64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemumips ?= "08267813b07acec518ec4e08b6cee2faa181f165"
-SRCREV_machine:qemuppc ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemuriscv64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemuriscv32 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemux86 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemux86-64 ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_machine:qemumips64 ?= "525aeb16741a2f076c476edc054edcb115ad20ca"
-SRCREV_machine ?= "31388cdaa9a0eff3393518a59084effc44ebb965"
-SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
+SRCREV_machine:qemuarm ?= "0ecde89d921e617656eaf267c6229732761ceb60"
+SRCREV_machine:qemuarm64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemumips ?= "ccb44d7db58f17783101bbc1550d67c4d0edf46f"
+SRCREV_machine:qemuppc ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemuriscv64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemuriscv32 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemux86 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemux86-64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_machine:qemumips64 ?= "b8f18794a5a6bb9c6d0190a2006dfbd82f0f5916"
+SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
+SRCREV_meta ?= "6f8d397886b014e8c7ef4ffb08a489fd7b6a0a3f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "b47f4f4778277597f981d764f019ba211882edb7"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "325225e2f9fa0a4edf0b7da30c256df2433db6bb"
+SRCREV_machine:class-devupstream ?= "b9ed054073957b91d758135fdf277b3f77b5f2f1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.12"
+LINUX_VERSION ?= "5.14.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


