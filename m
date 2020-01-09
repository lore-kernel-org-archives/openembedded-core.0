Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 142287FE77
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:04 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id p27so2023220pli.10
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tFfQBagJgGNgA6PFUP7t7zzzrS36sGJKFnimbmtfHtM=;
	b=QdRm/WtbnE4OJn1bov5uMiYiiJJc+adW5ug4GTUMt/Z1Z+WgXq85ciLuP9P3WigLhf
	v9DBL/3V94dXjRwpLEYj/+sEVVQBHBkE3OMu1ByjbplRETvZ2f9ufc/qgRChDttx1YWb
	s4bDx7IJ3C4t3jiHj63yA116TiKPPR96PsdLOn2Boh3mR7MXqtpqiixH4LebDZS/bxL4
	jPWQlt8se75NuLZtV3L2z7FiUFRiV/VWigfSgstKMYHwfghtcLN6Krr2JrNjrI1G6gn7
	4CforwOuzicEjVaZEV0mJjsjHSe7COUgG1e8cb0rQyn0G3q7FK4qgmUHNa7lWZvNks5a
	uT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tFfQBagJgGNgA6PFUP7t7zzzrS36sGJKFnimbmtfHtM=;
	b=EZwvndxaIyurwj/DS5rhRO5+IO/4A5rN18ZK/dPCvb3OdPI3QxiOJxiyrXCic/GRKE
	F0tS8C2zAwndEaFXb/FM1mfAnJ4o5F6EMU5Y+SAhr207QNV2BDu3X8KsdmX+i0NNdHQr
	tuDnx1m/vdQqsExw7KATYTDcJBcb0Y3h8hdMWWA06fYWSlEkDari4X4LCvtEPnYB1Nsc
	9RNceeaPD37Yhca2DSl32DOOvnVgwzVfccWRQ1zJEMbUqgtfZJ8FvxocOr1FfFVjh3ll
	PzDwQSymOjPQIOpPAo9GTcOLaHL4rqO+0wG7QM9hu9bxUeBLkqE9kaKGeRmw0/a435+K
	ovZg==
X-Gm-Message-State: APjAAAWuJv4gZOI8h+J55nDPdfEo8VsNj6n2wLw1Q9xShnNRrs+5gR9j
	3C4c91Nbmo7x52g5XX3FMBzQi45m
X-Google-Smtp-Source: APXvYqwGDSeyJjjTaZ5SPakoAEh7DKSMXwVifOmowRodEyrRiKCFLnaGjNk140z26shV8BhegGXJtQ==
X-Received: by 2002:a17:90a:d804:: with SMTP id
	a4mr2967041pjv.11.1578545405907; 
	Wed, 08 Jan 2020 20:50:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:32 -0800
Message-Id: <56e9c166c6c636f80e30cfa1ee4371acd392a79d.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 13/28] linux-yocto/5.2: update to v5.2.25
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:05 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    38cbae50e893 Linux 5.2.25
    efe66d67e43d wimax: i2400: Fix memory leak in i2400m_op_rfkill_sw_toggle
    aae5e918d3f4 wimax: i2400: fix memory leak
    596fd85a2430 iio: imu: adis16400: fix memory leak
    3fe8e6c9095c spi: lpspi: fix memory leak in fsl_lpspi_probe
    7d0bf52f1adb scsi: bfa: release allocated memory in case of error
    27fbb054e805 RDMA/hfi1: Prevent memory leak in sdma_init
    a135a89e6160 ath9k: release allocated buffer if timed out
    56e06c206399 ath10k: fix memory leak
    6e5539a37beb misc: fastrpc: prevent memory leak in fastrpc_dma_buf_attach
    69a90884629a spi: gpio: prevent memory leak in spi_gpio_probe
    92c5d7695ef6 rsi: release skb if rsi_prepare_beacon fails
    e874f72c40c2 RDMA: Fix goto target to release the allocated memory
    f34a1eae03b8 tracing: Have error path in predicate_parse() free its allocated memory
    2e5f50144b3e drm/amd/display: prevent memory leak
    d3021f313fd4 mwifiex: pcie: Fix memory leak in mwifiex_pcie_alloc_cmdrsp_buf
    d5293038e8f9 vcs: prevent write access to vcsu devices
    96f4eb9dc3b7 KVM: PPC: Book3S HV: Flush link stack on guest exit to host kernel
    6ad7da3d7562 powerpc/book3s64: Fix link stack flush on context switch
    edebf91d3684 powerpc/64s: support nospectre_v2 cmdline option
    69a943951169 crypto: user - fix memory leak in crypto_reportstat
    70c19a57f953 crypto: user - fix memory leak in crypto_report
    fd0f9ef50a33 can: gs_usb: gs_can_open(): prevent memory leak
    a216a264a85d rtlwifi: prevent memory leak in rtl_usb_probe
    8eaea2a3f510 of: unittest: fix memory leak in unittest_data_add
    f97bd033e3c8 virt: vbox: fix memory leak in hgcm_call_preprocess_linaddr
    cf5f620eb9ec iio: imu: adis16400: release allocated memory on failure
    4adc4baa97b6 mwifiex: pcie: Fix memory leak in mwifiex_pcie_init_evt_ring
    676ef8fc1346 nl80211: fix memory leak in nl80211_get_ftm_responder_stats
    a7f7800a32b7 net: qrtr: fix memort leak in qrtr_tun_write_iter
    ab4362f47880 iwlwifi: dbg_ini: fix memory leak in alloc_sgtable
    799775defe5a ath9k_htc: release allocated buffer if timed out
    b3287955d81c rtl8xxxu: prevent leaking urb
    af27e0abb87a ipmi: Fix memory leak in __ipmi_bmc_register
    d887d3cfa04a media: vivid: Fix wrong locking that causes race conditions on streaming stop
    0c1df555b18a media: rcar_drif: fix a memory disclosure
    aea6f13d6eff media: usb: fix memory leak in af9005_identify_state
    19746d855926 net/mlx5: prevent memory leak in mlx5_fpga_conn_create_cq
    8503f31fed01 crypto: ccp - Release all allocated memory if sha type is invalid

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit f9db269297dbd019129063135739b7f016bb2667)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 61eb8d6b67..65031c8d15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2761299685e59f4838784b9764f22f31c0ba78cc"
-SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
+SRCREV_machine ?= "e2077caf7f145e8f8ab98ff39d520e9215692542"
+SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.24"
+LINUX_VERSION ?= "5.2.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 61ec18eec1..1d9aa56703 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.24"
+LINUX_VERSION ?= "5.2.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fdfb41a859911607f9be6719615365e222c41c5c"
-SRCREV_machine ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
+SRCREV_machine_qemuarm ?= "95d588ef6f8c1cf5d3478bb60e96e449fa395a73"
+SRCREV_machine ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 28d89ff94f..6ae874e3e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "eae79a47742a27b57895dfc31033940078a58591"
-SRCREV_machine_qemuarm64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_machine_qemumips ?= "f5039ff845ae347063e6880d89d2e60f879ff856"
-SRCREV_machine_qemuppc ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_machine_qemuriscv64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_machine_qemux86 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_machine_qemux86-64 ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_machine_qemumips64 ?= "1c863c05958faf522455713270317a4647e27578"
-SRCREV_machine ?= "eb4da2e1ea7630f969e6dc25a1dc96eaeab1b6ec"
-SRCREV_meta ?= "5c56ad2c2261408c85713ed338d0449646d48e58"
+SRCREV_machine_qemuarm ?= "d0a10775d1cd3254de5fd7ab0616038e64e883f3"
+SRCREV_machine_qemuarm64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_machine_qemumips ?= "7b10c4f80e33bf4a5aa1f27e4d33220a5bf4634a"
+SRCREV_machine_qemuppc ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_machine_qemuriscv64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_machine_qemux86 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_machine_qemux86-64 ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_machine_qemumips64 ?= "c19324f7c3cc384a3bdc3e78b95d25528a734578"
+SRCREV_machine ?= "34462d734888f02c88f2fb686d74f42903c5992e"
+SRCREV_meta ?= "832aadfe04fb0fea50cf143b639ed18392b7316c"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.24"
+LINUX_VERSION ?= "5.2.25"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


