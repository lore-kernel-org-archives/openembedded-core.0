Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 791927FF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:46 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id m14so786056qvl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=//iK8VhZie8bgP4WD/Y7dY3X/dRhwhOaBR19Vla+9l0=;
	b=UlKgiY916nFmaR7SQd0tnfujdUByuBhzhyvzGaggXjpyS+61wUFQK96Zc5GWL9uTiL
	mdKTjvz9pDkI6XnLSNIPAr2kR1VXECgigjXhLpmTKGqDt4btdPUhQHnaKTpEbMzVDYzj
	whRrQnUPBqlPboBPN8mTBjQicXGm3j0LglyxdXjQYEqgumMnt7SqfX3bLj7bwlBgAJ3b
	FiJivkoqk8x66e+h1CDCsMepKajNJw5viKGKcmEdWfJrS+23LZjlJDzb1wrnh7N89cA2
	rwxWcw3ny3rb9hl/bJR24j33LjN5aWtOT1sNbOUwM7fT2+VGccG8rWcfdHgDMZjW98Wj
	UpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=//iK8VhZie8bgP4WD/Y7dY3X/dRhwhOaBR19Vla+9l0=;
	b=EO7aHz8sMFPkYKU3L24uaYstQOJP1C5r3Cjhhh7lpEvTu8tN/cufZ+66nXrYCBRt93
	Qh06L/CHMzzrWM96lLX6/TBoNggvguoGL3txKSvuu+KB3gW/Fzbt93Avtq6dzkhb16UN
	9ZUEJzoVlYNQ6Bzl1xf2whcU+N1ZZLiPczOCm1gd3GjCtY4u5j9evLsM/RkXxYmytGoI
	2Pyu3TUMW5AxU3jIGX2dnVGBYHFngJoPlhRxGu0B8oNpj6Hlk3v16obXBrMKk4cI5t2r
	SMSZVuvoGtM9P8kYyIPPRvllN5OwhkmDjF2DR2pB9J8aCYrn5Aop0RPz1Np08Hg7KrEN
	DJvA==
X-Gm-Message-State: APjAAAUIjFl1oC/mwdOafj3CahDDHrlDT6h0KWMjgujDuE4vp2BRHbnG
	8R7Q6SiruhcreyGJgL6HxVc=
X-Google-Smtp-Source: APXvYqw1aPbJXhSgBFwP6NfyhH/DfV+JK8+UbZmxBuAM0lNN/GsAekvzuUvHBW50yDBUqRhHwI1Nbg==
X-Received: by 2002:a05:6214:1090:: with SMTP id
	o16mr2441099qvr.105.1576678067287; 
	Wed, 18 Dec 2019 06:07:47 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:33 -0500
Message-Id: <41c63cd8f55e48547a62f4a0b0ae78ba2a88223d.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1576677592.git.bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/5.2: update to v5.2.25
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:46 -0000
Content-Transfer-Encoding: 8bit

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
2.19.1


