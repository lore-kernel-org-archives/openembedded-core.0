Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C0CFA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.19796.1666621484325099150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GiNSdOAP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id y1so9101217pfr.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31s9otgUaz+w60okb2UqcNLkxMmPQTFeF7ntxOfS9XA=;
        b=GiNSdOAPUIgEk6KD142P3C/Gb3qRH7xvbfJKpJJX/rrpDdklKdLTauzIFcMvRjfvby
         lSnsj0FUhwmFExNA9M8IBkduUwpPST0qLVG7go9XwLIo5tRS0zhk9JmXutlh8a8YFn74
         j1/xesLWJtLPM5yNgBYimZN+TzBBV4JnupF9al96kHIX+N1nZzjNESLC+zAJ0R0UruPz
         E4GVZnpY7eL/gjuMAADCfvFJXQ7yjR7HC155k+onwCLq97C0iPnCzMjOBHKEMdeBLp7J
         9yNdhIcoRySoSe7l+IQ8v1Px1zZdooQcL7G1q1ipY20l+1BCga/C/EFHfIhgfn0tMZjf
         d7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31s9otgUaz+w60okb2UqcNLkxMmPQTFeF7ntxOfS9XA=;
        b=x0JiErKHtoL9XKD1hoJuCvUYzxz7IlHP8yznR4PKsopMCaKK/XDX3nMtijLCja6b7h
         RyY4860fDDOHoqINI34YnVzpjPU4sJngQVrsMzcfkHUwAkeGWAvPwxJZ8d2Dm/XVSMLQ
         JD0ewnVjp/Qo1SR06IHayBbwzS3gYLQYFRwc8yWGucoi+fKFua4fMghJhjJHR8Om9tkj
         6Otn95jqSsF1NHsZ1QWp9DPWD4IcswHy00LsaxgZdzIrvpqt/TQcHm/1zvKzkfNJy8rh
         3FGXlYTuN0WkmlL/dAV/R/0tHFgM5sDmA25NMcT96xa6dsO/xqdsMP76sE+h3TjdbUqP
         7Kyg==
X-Gm-Message-State: ACrzQf0VSdsnKCNq/jsNa6UYV7W+RkbpQFYb/SHsfoZ3DqebabDunV+y
	2nXjILczNY6I+KpK50sBZDmsxQCoKWHkXBIq
X-Google-Smtp-Source: AMsMyM4qT5LV/xE9kM0N6qsy1fwSV5uWvyEIHxr/a0OeyrvdjMB4HUgHQPZN+rwBuri/hUD24O4GAw==
X-Received: by 2002:a65:408b:0:b0:42a:55fb:60b0 with SMTP id t11-20020a65408b000000b0042a55fb60b0mr28693990pgp.431.1666621483193;
        Mon, 24 Oct 2022 07:24:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] linux-yocto/5.4: update to v5.4.219
Date: Mon, 24 Oct 2022 04:24:16 -1000
Message-Id: <285fdd43a20ccb12231bd36e5e75fe13ad2a32fd.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172092

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    fd92cfed8bc6 Linux 5.4.219
    0cb5be43dc4b wifi: mac80211: fix MBSSID parsing use-after-free
    9478c5f9c007 wifi: mac80211: don't parse mbssid in assoc response
    7f441a6c90fe mac80211: mlme: find auth challenge directly
    c248c3330d5f Revert "fs: check FMODE_LSEEK to control internal pipe splicing"
    1d0da8674c23 Linux 5.4.218
    3ff54a91e4ea Input: xpad - fix wireless 360 controller breaking after suspend
    690467759573 Input: xpad - add supported devices as contributed on github
    9389750ac6b0 wifi: cfg80211: update hidden BSSes to avoid WARN_ON
    7fab3bf52059 wifi: mac80211_hwsim: avoid mac80211 warning on bad rate
    77bb20ccb9df wifi: cfg80211: avoid nontransmitted BSS list corruption
    785eaabfe310 wifi: cfg80211: fix BSS refcounting bugs
    359ce507f751 wifi: cfg80211: ensure length byte is present before access
    43689bf2cd8e wifi: cfg80211/mac80211: reject bad MBSSID elements
    020402c7dd58 wifi: cfg80211: fix u8 overflow in cfg80211_update_notlisted_nontrans()
    c634a9107f6a random: use expired timer rather than wq for mixing fast pool
    39800adc38f6 random: avoid reading two cache lines on irq randomness
    bc0375ca434b random: restore O_NONBLOCK support
    49d2fc9f998b USB: serial: qcserial: add new usb-id for Dell branded EM7455
    20a5bde60597 scsi: stex: Properly zero out the passthrough command structure
    46b822a7550d efi: Correct Macmini DMI match in uefi cert quirk
    b719d10f7ec3 ALSA: hda: Fix position reporting on Poulsbo
    e5d25a3bfde4 random: clamp credited irq bits to maximum mixed
    194f59391d6c ceph: don't truncate file in atomic_open
    259c0f68168a nilfs2: replace WARN_ONs by nilfs_error for checkpoint acquisition failure
    b7e409d11db9 nilfs2: fix leak of nilfs_root in case of writer thread creation failure
    792211333ad7 nilfs2: fix NULL pointer dereference at nilfs_bmap_lookup_at_level()
    963089ad76cb rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
    2da677c0c725 mmc: core: Terminate infinite loop in SD-UHS voltage switch
    373eca05b5b8 mmc: core: Replace with already defined values for readability
    7ec8f073c2bf USB: serial: ftdi_sio: fix 300 bps rate for SIO
    21446ad9cb98 usb: mon: make mmapped memory read only
    d2f3a51ca27e arch: um: Mark the stack non-executable to fix a binutils warning
    bb2d4c37b1fc um: Cleanup compiler warning in arch/x86/um/tls_32.c
    9e26e0eef622 um: Cleanup syscall_handler_t cast in syscalls_32.h
    3c9a75b3d2f7 net/ieee802154: fix uninit value bug in dgram_sendmsg
    61be8898d704 scsi: qedf: Fix a UAF bug in __qedf_probe()
    c790d3a00d42 ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
    aefe2f55a986 dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
    db702ecd713a dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
    59684c877783 firmware: arm_scmi: Add SCMI PM driver remove routine
    70e4f70d54e0 fs: fix UAF/GPF bug in nilfs_mdt_destroy
    398312c687bb perf tools: Fixup get_current_dir_name() compilation
    393a1aa4215b mm: pagewalk: Fix race between unmap and page walker
    6e150d605c9e Linux 5.4.217
    0c41153c367b docs: update mediator information in CoC docs
    096740d67560 Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
    e911caf9a158 Revert "drm/amdgpu: use dirty framebuffer helper"
    ae19c3c76dc4 xfs: remove unused variable 'done'
    538657def702 xfs: fix uninitialized variable in xfs_attr3_leaf_inactive
    9ff41b8d71ba xfs: streamline xfs_attr3_leaf_inactive
    c893fedaf10c xfs: move incore structures out of xfs_da_format.h
    5e13ad940a2a xfs: fix memory corruption during remote attr value buffer invalidation
    821e0951b4b3 xfs: refactor remote attr value buffer invalidation
    a1b66abe30da xfs: fix IOCB_NOWAIT handling in xfs_file_dio_aio_read
    1e4a0723eb38 xfs: fix s_maxbytes computation on 32-bit kernels
    16de74ee3ad6 xfs: truncate should remove all blocks, not just to the end of the page cache
    87e73331e4b7 xfs: introduce XFS_MAX_FILEOFF
    bd67d06b099d xfs: fix misuse of the XFS_ATTR_INCOMPLETE flag
    24f45c878299 x86/speculation: Add RSB VM Exit protections
    564275d4b93f x86/bugs: Warn when "ibrs" mitigation is selected on Enhanced IBRS parts
    4891e5fd1001 x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
    9862c0f4fd6c x86/speculation: Disable RRSBA behavior
    b9ae02c3c253 x86/bugs: Add Cannon lake to RETBleed affected CPU list
    d6a8a470dc22 x86/cpu/amd: Enumerate BTC_NO
    2edfa537f3b1 x86/common: Stamp out the stepping madness
    17a9fc4a7b91 x86/speculation: Fill RSB on vmexit for IBRS
    2242cf215013 KVM: VMX: Fix IBRS handling after vmexit
    51c71ed134e9 KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
    a31bdec99a95 KVM: VMX: Convert launched argument to flags
    5895a9297e60 KVM: VMX: Flatten __vmx_vcpu_run()
    64723cd346ea KVM/nVMX: Use __vmx_vcpu_run in nested_vmx_check_vmentry_hw
    57ba312f1037 KVM/VMX: Use TEST %REG,%REG instead of CMP $0,%REG in vmenter.S
    87dfe68a3513 x86/speculation: Remove x86_spec_ctrl_mask
    4109a8ce107d x86/speculation: Use cached host SPEC_CTRL value for guest entry/exit
    0fd086edf887 x86/speculation: Fix SPEC_CTRL write on SMT state change
    18d5a93fd202 x86/speculation: Fix firmware entry SPEC_CTRL handling
    03a575a0f954 x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
    8afd1c7da2b0 x86/speculation: Change FILL_RETURN_BUFFER to work with objtool
    3ee9e9a5af07 intel_idle: Disable IBRS during long idle
    97bc52c14a93 x86/bugs: Report Intel retbleed vulnerability
    fd67fe3db93f x86/bugs: Split spectre_v2_select_mitigation() and spectre_v2_user_select_mitigation()
    2d4ce2d72c3b x86/speculation: Add spectre_v2=ibrs option to support Kernel IBRS
    e2d793a3742a x86/bugs: Optimize SPEC_CTRL MSR writes
    a3111faed5c1 x86/entry: Add kernel IBRS implementation
    fd32a31553a1 x86/entry: Remove skip_r11rcx
    3c93ff4e23ea x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value
    9a596426d7bd x86/bugs: Add AMD retbleed= boot parameter
    063b7f980607 x86/bugs: Report AMD retbleed vulnerability
    954d591a84d0 x86/cpufeatures: Move RETPOLINE flags to word 11
    893cd858b09c x86/kvm/vmx: Make noinstr clean
    f62d272c2fec x86/cpu: Add a steppings field to struct x86_cpu_id
    69460b1ed63d x86/cpu: Add consistent CPU match macros
    87449d94e75c x86/devicetable: Move x86 specific macro out of generic code
    fbd29b7549b2 Revert "x86/cpu: Add a steppings field to struct x86_cpu_id"
    3a8ff61e6f13 Revert "x86/speculation: Add RSB VM Exit protections"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 09ff50469a..5da86988ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f06a67473d2422ed3bdfb951e0897929b0959678"
-SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
+SRCREV_machine ?= "983b2c21d3fa76840461947f3f644dd9442d8e40"
+SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.216"
+LINUX_VERSION ?= "5.4.219"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3523945155..269ad6e459 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.216"
+LINUX_VERSION ?= "5.4.219"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3513255b2d77e6a6bf2ebad2697e05cfd42215ab"
-SRCREV_machine ?= "6f25ed1235d5c2556a2c1b491ffa3d3815fb26eb"
-SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
+SRCREV_machine_qemuarm ?= "a4c846b5cacb954ae98a8eba9e0450812f1db42c"
+SRCREV_machine ?= "ae25c500cf7dae5520897489b3fe49bdf068528b"
+SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index acda5ebe78..d740333ff4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "26b50c67881dd59a4d31bfcd667df69dc9e9ea52"
-SRCREV_machine_qemuarm64 ?= "08307edd8480dc6a3ce10d84e27c816423f396e4"
-SRCREV_machine_qemumips ?= "f49695f1e70bc9eeef061edcb2f22753520f7a43"
-SRCREV_machine_qemuppc ?= "f87963b9e6cc4e036a49def1714f850488bae5b1"
-SRCREV_machine_qemuriscv64 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
-SRCREV_machine_qemux86 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
-SRCREV_machine_qemux86-64 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
-SRCREV_machine_qemumips64 ?= "ae1f3a35c011a787423fedf843f0330f936e5bab"
-SRCREV_machine ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
-SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
+SRCREV_machine_qemuarm ?= "88065fdc7d5d404312da98b78229996b61f56c21"
+SRCREV_machine_qemuarm64 ?= "ac9667e4dba109088d7ed5922f28d6ef1ba66e9b"
+SRCREV_machine_qemumips ?= "e0dd90f622f78e0ad05797996756528623070da4"
+SRCREV_machine_qemuppc ?= "0d45c84c8240fadec9a36a13d9cf077b6793bcfb"
+SRCREV_machine_qemuriscv64 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
+SRCREV_machine_qemux86 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
+SRCREV_machine_qemux86-64 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
+SRCREV_machine_qemumips64 ?= "a5cc27ae60c504fc309926d8e72129128befdbd5"
+SRCREV_machine ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
+SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.216"
+LINUX_VERSION ?= "5.4.219"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


