Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6D31179EC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 19:50:43 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id w18so8998259ite.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 11:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BzDX64VvsN+Sx0R/WREq3fMRf4rKoXdsy1Dle5uUzlY=;
	b=jLceXGh1FHmj2Vi2sM0dSYfydnOgRIiFJi0Mq2rT3NGshTUhYLFXYtH1289zbjy+tk
	R4Ye1gMTabNWPgs9Mdsl2VIQNKjKQK+Xg3gXUgBXWmX7CJkwU9A093sMCenYblbj+FwV
	1FORGkG/D2TMdoSeCO/e1ElIYN1gej/oZaZ+ml+Z6a3pZq7AQhyTps0SpPJbtvJDDbeA
	B196Q7dHdm5DcBt0X3eAex3CsA4kGB8RnZF8axEQalkLgFVdAACA8on7K2rMnTI7Jvau
	zzD54oOhX1ruGxw5JsIEdTTZGX6/3kOe79cjk0VyvzC2Pc1ONNezB++7v9AYY+9j3dBs
	WMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BzDX64VvsN+Sx0R/WREq3fMRf4rKoXdsy1Dle5uUzlY=;
	b=Rn2mt0PYUGLvujR+00Mry791PUg57G46UEdE1DEsfLnvhbYelm8R9u4e2/9jZbio4V
	t3jrICA90JKpMxMdJQvvKAyceiV3WckhJ6vo//agSl/Dc859Z3B+v1bJk4Vh50rN73VJ
	8RbbdKdYVp+PMVAzucGZoSaWpDvkvnkAIlFtZVnNhXelbZW9jvdHC9FsuS1t9NqjHVfx
	WiGFKi8oViwjLa5f3o1/2x54y5mUhUh2y8T9kHvN5ABRa895NBfawJa7sRlKdxFqah1O
	sgfK0vy8cuLAbphYXKoSVWFryCVCC5pfSZjH+JLSEnhiFNLaBJdbLYXm6m76489OcLm+
	fKWg==
X-Gm-Message-State: AHQUAubLvfBOPXhT8wV7fWFvp3FeaRZqZXdDfKABL2Mg8WC2NUVZ6l4v
	jl7uVmOCzFQ/p0K/Wzas1r32iE+Hfd5OWA==
X-Google-Smtp-Source: AHgI3IZGxqMoLL7gkjnjayIYs5uZJt8oPbnSG23kaJwXPeRDvOC4i5Yi7Wn5A4qxFKkESiT0JVcvOA==
X-Received: by 2002:a24:55ca:: with SMTP id e193mr3234039itb.119.1549482644197;
	Wed, 06 Feb 2019 11:50:44 -0800 (PST)
Received: from localhost.localdomain ([174.116.254.195])
	by smtp.gmail.com with ESMTPSA id
	w26sm3302983iol.60.2019.02.06.11.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 11:50:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Feb 2019 19:50:38 +0000
Message-Id: <804e5c2dacea354d986b9eabffa11642f89fb87c.1549481175.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549481175.git.bruce.ashfield@gmail.com>
References: <cover.1549481175.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.18: update to v4.18.26
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
X-List-Received-Date: Wed, 06 Feb 2019 19:50:43 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating Paul Gortmaker's stable updates that comprise the following
commits:

   89754c7da63f Linux 4.18.26
   c564abe1908c NFSv4: Fix a tracepoint Oops in initiate_file_draining()
   890d46c677fd net: hns3: fix return value error while hclge_cmd_csq_clean failed
   9cee553eeef0 PCI/AER: Remove duplicate PCI_EXP_AER_FLAGS definition
   5ffe615c7959 fbdev: omap2: omapfb: fix ifnullfree.cocci warnings
   9a2eb194c961 fbdev: omap2: omapfb: fix bugon.cocci warnings
   795731d5307f fbdev: omap2: omapfb: fix boolreturn.cocci warnings
   8c656840a4cc PCI: mobiveil: Add Kconfig/Makefile entries
   0f7c216a5905 pinctrl: mediatek: include chained_irq.h header
   3f240c958d39 m68k/io: Add missing ioremap define guards, fix typo
   3aca0a7960d4 dm writecache: report start_sector in status line
   50de44fbe274 arm64: mm: Export __sync_icache_dcache() for xen-privcmd
   4c521f993bb9 tipc: add missing dev_put() on error in tipc_enable_l2_media
   0a7f5ef06a67 clk: actions: Add missing REGMAP_MMIO dependency
   90cbc3a9021a net: remove redundant input checks in SIOCSIFTXQLEN case of dev_ifsioc
   92b0d2a490ba nvmet: check fileio lba range access boundaries
   95550ccfee82 EVM: fix return value check in evm_write_xattrs()
   9c63338b2ecc multicast: remove useless parameter for group add
   818380e81f55 regulator: qcom_spmi: Do not initialise static to NULL
   80faeb6437d9 netfilter: nft_socket: Break evaluation if no socket found
   7896db3d286a netfilter: nft_tproxy: Move nf_tproxy_assign_sock() to nf_tproxy.h
   6ee2615cbc6c x86/hyper-v: Check cpumask_to_vpset() return value in hyperv_flush_tlb_others_ex()
   b98d573d572f drm/nouveau/kms/nv50-: fix drm-get-put.cocci warnings
   5b4fbedbb14a ASoC: qdsp6: q6routing: off by one in routing_hw_params()
   0ce601464e44 drm/amdgpu: get VCN start to process in the dpm disabled case
   cdb988723c92 net: stmmac: Fix PCI module removal leak
   f014d3b35b9f ip: on queued skb use skb_header_pointer instead of pskb_may_pull
   ee45cb43d804 linux/device.h: fix kernel-doc notation warning
   eb11d9a94de0 regulator: Revert "regulator: pfuze100: add enable/disable for switch"
   26d53be66490 KVM: VMX: hide flexpriority from guest when disabled at the module level
   1c9ebfaf8229 media: omap3isp: fix warning for !CONFIG_PM
   60f30bf144b8 cfg80211: fix wext-compat memory leak
   9685f469611b spi: spi-mem: Add missing description for data.nbytes field
   07b7e110c17b arm64: dts: renesas: r8a77990: Remove non-existing STBE region
   d6e90a26c5bd media: cx231xx: fix RC_CORE dependency
   7a281dbd6967 media: v4l: cadence: add VIDEO_V4L2 dependency
   3b95f46801af perf Documentation: Fix out-of-tree asciidoctor man page generation
   8d927494900d selftests: forwarding: mirror_gre_vlan_bridge_1q: Unset rp_filter
   8359363df5a6 net/mlx5: Use u16 for Work Queue buffer strides offset
   0f85219db2ee kconfig: remove a spurious self-assignment
   40535cf8ca98 netfilter: nf_tables: don't prevent event handler from device cleanup on netns exit
   10d27d084c16 drm/i915: Stop holding a ref to the ppgtt from each vma
   e9c0ce028417 f2fs: wake up gc thread immediately when gc_urgent is set
   b9f47e1e8a61 tcp: avoid resetting ACK timer upon receiving packet with ECN CWR flag
   f1a29b5218b0 tcp: mandate a one-time immediate ACK
   4474fad367bf selftests: rtnetlink: use a local IP address for IPsec tests
   f9229f11713c selftests: rtnetlink: hide complaint from terminated monitor
   2b4cb6ad782d i40iw: Reorganize acquire/release of locks in i40iw_manage_apbvt
   f2aa45e70b9a drm/sun4i: mark PM functions as __maybe_unused
   6c4f9bb9e2c7 drm/v3d: Checking for NULL vs IS_ERR()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.18.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.18.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index d4a21a03d4..6ecb57efa4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5cc3fddf0e2a9f390b00d50f27c726a5aea86d85"
-SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
+SRCREV_machine ?= "ad21eff3cd97f23ceecad649f7f669223d218959"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.25"
+LINUX_VERSION ?= "4.18.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 2efa40f16c..9ff5913c07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.25"
+LINUX_VERSION ?= "4.18.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "214d5273e58b56f89795bf384068e7b8c21c0f8d"
-SRCREV_machine ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
+SRCREV_machine_qemuarm ?= "0a2fc6e7fa406b0667c4b45f88f71c37edebdde9"
+SRCREV_machine ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 1ecbec9922..10c7ee8dce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0002e7595bd75ecb2c1561d4b5c025130ccd31f3"
-SRCREV_machine_qemuarm64 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_machine_qemumips ?= "28983ad3c7a64c15c154c1edf1d11472abb778f7"
-SRCREV_machine_qemuppc ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_machine_qemux86 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_machine_qemux86-64 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_machine_qemumips64 ?= "3be07269ed012fb6d148bd641ee40a40cb6cb13f"
-SRCREV_machine ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
-SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
+SRCREV_machine_qemuarm ?= "49fc5ca3eeb33c93ee551b778db488b630018e1b"
+SRCREV_machine_qemuarm64 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemumips ?= "8347c02073d6e0a388bb2f055cd026b4fc2560a6"
+SRCREV_machine_qemuppc ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemux86 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemux86-64 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemumips64 ?= "e8d0920e7ed5fb0da4eed2ea3872f904583ad824"
+SRCREV_machine ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.25"
+LINUX_VERSION ?= "4.18.26"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


