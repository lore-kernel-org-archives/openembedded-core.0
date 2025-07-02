Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1E4C83F0A
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 21:44:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.8316.1751492667206210060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 14:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 562LiP2v015441
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 16:44:26 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/6] linux-yocto/6.12: riscv: Enable dynamic ISA selection
Date: Wed,  2 Jul 2025 16:44:22 -0500
Message-Id: <1751492664-12569-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 21:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219854

From: Mark Hatle <mark.hatle@amd.com>

The updated yocto-kernel-cache introduces risc-v ISA selection, move commit
to allow these KERNEL_FEATURES to be selected.

Changelog:
    arch/riscv/tunes: Implement RISC-V ISA selection
    amd-zynqmp: crypto: Kconfig: Obsolete DEV_XILINX_RSA config option
    bsp: add new bsp amd-zynq
    nxp-imx9: Enable NEUTRON for i.MX95-19x19-verdin
    kver: bumping to v6.12.33
    preempt-rt.scc: enable firmware loading support for rt kernel
    intel-socfpga: enable intel-socfpga support for yocto-6.12
    nxp-imx9: Enable enetc for nxp-imx95
    nxp-imx9: Enable multimedia related configs for nxp-imx95
    nxp-imx9: Enable devfreq governors
    fs/yaffs2: fix build warnings in yaffs_vfs.c when running make allyesconfig
    ti-am335x: add kernel-cache configuration for v6.12 kernel
    nvidia-orin: enable config to support EFI GUID Partition
    nvidia-orin: enable configs I2C GPIO expander tca9534
    nvidia-orin: enable configs to support efivarfs feature
    bsp: add new bsp amd-zynqmp
    kver: bumping to v6.12.32
    nxp-imx9: Enable PHY_FSL_IMX9_DPHY_RX for nxp-imx9

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5a7bad9017..da0dea21fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "7cb6d42c40de351ecab0a083aef260f84407de0d"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 0fad73dddd..1e08082697 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 262ae35704..5ad858df2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
 SRCREV_machine:qemux86-64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
 SRCREV_machine:qemumips64 ?= "6470f58a8f04951f202cf85afb4421d2e7ec9995"
 SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
-SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


