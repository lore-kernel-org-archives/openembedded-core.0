Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40056C54790
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:45:14 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.4630.1708483513460583869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jEGKzggr;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7877468beacso8208685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483512; x=1709088312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN5ZN9GAxk3KMNWJEfxMyHRvcfNhspIdSuzs5slgxIE=;
        b=jEGKzggr2y0Y+LaQWn76fjOpeuFVCb44lRilOv8imbifInmMgTFpf7Dbvmups72WfP
         7GyBZWHhzSmQWdrUfrZOKo4xKND9b+UNby6Nr8Qnlk+Lttvzv+tAUIZxGHpfVmAgBews
         He0oODFRY7/wGfjDimiXH36maXWRrG8YirwtxnpnEEG4EgmcKUp20fPmOMq6SakaupyC
         GJx3AnSDOTuUpfhzas5EmKoaT75hcHTai7DAgdTxalw7Olc9itDKPqMw5lPvC4wbh1zF
         Eg8HtUOsLMZqmTennQc0wVLZUby9hpuovA5dLWeOO2H5NJob7oizAVGeMPJEdY+2KkDB
         XQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483512; x=1709088312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN5ZN9GAxk3KMNWJEfxMyHRvcfNhspIdSuzs5slgxIE=;
        b=Yr5btdHdteXL7MOHTtdqYRCES5z+cvbxUsPL3dwWSYMV13O9hLOGCIsDihqN60gYET
         CBSzOPg2HZmyi2xal7XYCBIbf05ardHgLM8UArTDBIEDbtY2A5uvETE+mb3bm5/aKx59
         ijakNzZz1y4k0883Q7b+IMVTFwqfbo3SbeafJ7hBV6EcGTS0rnGexthOWhX+Qa0kMUCj
         I3cBoKr0Oakcj1Q6/WNLIIBtuAbDXpZs7I4W5l2fqC0zfbhQ1T+p+MShKS20sp6lvtqd
         Xe5EgYXjtnAl7WyIs7Rd0TRx2PczpedQLk8hSDfQf+u2kq/fyiJsEVVXgEWY/6bbRjOE
         0LbQ==
X-Gm-Message-State: AOJu0YxnmEFMWnomsAZRD2/esprzrqSPfVmZimqazx8ixVpaJWC5KPNf
	RvIKmCvnil/6IiRL6MZ4eBHKMi6azXwpXZZw+TmDArd9iQIFVWPMU+4Pf5u+
X-Google-Smtp-Source: AGHT+IHl4esRX4MDd+xcTuWEABmbwNw/fyab2ahUopCbIPFLac92sv4Lbt1LzxYzy7h/kYtY9BT2JA==
X-Received: by 2002:a05:620a:e10:b0:787:6b47:6a75 with SMTP id y16-20020a05620a0e1000b007876b476a75mr6487695qkm.24.1708483512232;
        Tue, 20 Feb 2024 18:45:12 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm3945398qkn.61.2024.02.20.18.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:45:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] linux-yocto/5.15: update to v5.15.147
Date: Tue, 20 Feb 2024 21:44:56 -0500
Message-Id: <20240221024500.3239062-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
References: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195946

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    ddcaf4999061 Linux 5.15.147
    231752a0a05d net: usb: ax88179_178a: move priv to driver_priv
    d800d18ba132 net: usb: ax88179_178a: remove redundant init code
    329197033bb0 tracing/kprobes: Fix symbol counting logic by looking at modules as well
    ccb7eef5f2f3 kallsyms: Make module_kallsyms_on_each_symbol generally available
    ab3a3aadb373 netfilter: nf_tables: Reject tables of unsupported family
    0eb556b2386d perf inject: Fix GEN_ELF_TEXT_OFFSET for jit
    b8a5308feedd ipv6: remove max_size check inline with ipv4
    ba5efd8544fa net: tls, update curr on splice as well
    06bb52d2efb3 mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    6722186854a7 mmc: core: Cancel delayed work before releasing host
    edaefc210e10 mmc: rpmb: fixes pause retune on all RPMB partitions.
    41f20ac9bdc4 mmc: meson-mx-sdhc: Fix initialization frozen issue
    91432aebce51 mm: fix unmap_mapping_range high bits shift bug
    5e44f5da1266 i2c: core: Fix atomic xfer check for non-preempt config
    1d5c1617e1e1 x86/kprobes: fix incorrect return address calculation in kprobe_emulate_call_indirect
    10086ff58ce4 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    660b3c3bc8a7 mm/memory-failure: check the mapcount of the precise page
    80eb449f809c selftests: secretmem: floor the memory size to the multiple of page_size
    a58ae5ab714d net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    500c7f32ad43 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    fda00eb3cd41 asix: Add check for usbnet_get_endpoints
    0817c1b21561 octeontx2-af: Re-enable MAC TX in otx2_stop processing
    20fce91b4fa0 octeontx2-af: Always configure NIX TX link credits based on max frame size
    6bbbcff3c798 octeontx2-af: Set NIX link credits based on max LMAC
    6ef9a28e1bb2 octeontx2-af: Don't enable Pause frames by default
    bc56ed720e06 net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    cfcf5490145a igc: Fix hicredit calculation
    6c853b57684e i40e: Restore VF MSI-X state during PCI reset
    9400f854facd ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    e08b666e4415 ASoC: meson: g12a-toacodec: Fix event generation
    3a78a57764f0 ASoC: meson: g12a-tohdmitx: Validate written enum values
    f74281f241ff ASoC: meson: g12a-toacodec: Validate written enum values
    947db598acb8 i40e: fix use-after-free in i40e_aqc_add_filters()
    975d6f66f2b6 net: Save and restore msg_namelen in sock_sendmsg
    b2869e7600f4 netfilter: nft_immediate: drop chain reference counter on error
    51976846f202 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    c748c358debe sfc: fix a double-free bug in efx_probe_filters
    5c161f2220f5 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    fd2e7829239e net-timestamp: extend SOF_TIMESTAMPING_OPT_ID to HW timestamps
    dc5643abc1ac can: raw: add support for SO_MARK
    464fb49ca9bb can: raw: add support for SO_TXTIME/SCM_TXTIME
    ba80ff7a85b6 net: Implement missing getsockopt(SO_TIMESTAMPING_NEW)
    5636941e42d5 r8169: Fix PCI error on system resume
    0ce9a244d33b net: sched: em_text: fix possible memory leak in em_text_destroy()
    c0b56aa9d1a6 mlxbf_gige: fix receive packet race condition
    271567afd4c2 ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
    1867a9094743 igc: Check VLAN EtherType mask
    f24370ddf75d igc: Check VLAN TCI mask
    4ec5efdb9034 igc: Report VLAN EtherType matching back to user
    b17f8024a5f0 i40e: Fix filter input checks to prevent config with invalid values
    def90597ef5b drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
    a7b67635de1a octeontx2-af: Fix marking couple of structure as __packed
    802af3c88ad1 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local
    5d3e98ef12f6 drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes in AUX xfer
    2f8cefc8b638 wifi: iwlwifi: pcie: don't synchronize IRQs from IRQ
    1f2f662c8bec Revert "PCI/ASPM: Remove pcie_aspm_pm_state_change()"
    200cecd6ff1e ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook 440 G6
    90ab9a70f0d8 block: Don't invalidate pagecache for invalid falloc modes
    c496c35310e6 keys, dns: Fix missing size check of V1 server-list header

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 1e61698222..e64f21b2f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "daa620f017a02ae381f1e54be7ceb8a2f3e3caee"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "7168cfa2ce6492db31163393808806b6f48af5e8"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c7c4e09bd9..38bea23264 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aade2fc343af128889d6c6f1071ec1a8e9a548a8"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "641e2136a155ce3179c84b9365a5998c1354fdd0"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ef8c18b1b2..1acd7b62cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f59d00a628c3ddb39052284a4a7bd54f9ee12999"
-SRCREV_machine:qemuarm64 ?= "8b10556d4fd67dec1a16252ef0d3058dfe31dff5"
-SRCREV_machine:qemumips ?= "b0c8aefa7811fd3b7cebb25c1565f73523c7b2ac"
-SRCREV_machine:qemuppc ?= "0ebd785a8436934e3f3e6dea6506de7f7ed9947e"
-SRCREV_machine:qemuriscv64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemuriscv32 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86-64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemumips64 ?= "187d249255a797c470b0680f28e18a17a05c3bb4"
-SRCREV_machine ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine:qemuarm ?= "82f8a25a3894c10d1cf26914b8e51726351ba11e"
+SRCREV_machine:qemuarm64 ?= "cf955e443d881e296b83940143fd30ea83fcf222"
+SRCREV_machine:qemumips ?= "1c3babd3b42768e24c797edfc3f67906aca6d072"
+SRCREV_machine:qemuppc ?= "b08998787bece69376578b049cab073d8b80e872"
+SRCREV_machine:qemuriscv64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemuriscv32 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemux86-64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_machine:qemumips64 ?= "4ff2c0496c0160a96185a080ec9678c63b68bd47"
+SRCREV_machine ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
+SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.147"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


