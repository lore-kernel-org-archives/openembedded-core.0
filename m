Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B46C4829C
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.4387.1707252821673800033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAN4wCB5;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-783dc658bd9so324489385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252821; x=1707857621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FfUfnlsitD7Jte/pGkbwG47VxH1YxGF3yT002aVg00=;
        b=fAN4wCB5VRNNe9pB56laWaOAnGnA7s908Z6rHeU2sduHDHhdjCEBmdPTX3uMdlzVEk
         QHLzR84cj+bVwsaDAzrCZ1xOOBOxL1HeyR0JwNuLLMt3QbhAlp2YeG2TAxw27KHte/iR
         2T8FrU6LOOj7H1/iKOCB3+d2bBx4czflQ2SiG13v+iP6MPgOpgzOOmX8UJtwhcS54e90
         5+pz4XtfpyB1Yjia9rKvlPwkEnPIWSin8p+K1xRbRJOjOJNuWqJsNSk92o41PQYACI/4
         t3bxHRBfvDbSo1AKylzPD5qiIxk+upE9xsup20ppjDmc0GOuGSWbBdDvH+eNLZZNMX7N
         R35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252821; x=1707857621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FfUfnlsitD7Jte/pGkbwG47VxH1YxGF3yT002aVg00=;
        b=RNFKnxoV0pk1TEl/TnmW/IU4PW8t5swH/QysQgVFtO9FfQsovky/y6jjTNSxitc3+U
         Qg5q7+Q6XP8EBfVXKS5fqn/ikUC1lP32/iTYmFDuB5Fy21pQI58p96z553Ml8TfPFOvJ
         +cMUQVAKMK1odX6nOFf46tKSMtQFYgMcJdu8JMdFl8QTpaqbGZhXm4ylUKrWHPoUZdqs
         p9Ynz8jfTNnikSuYTHRVGVJfCrmXqcgkHJ7po6WSHhXUm/oSrGencBibJCo180tHcTGc
         xhKDU6QnoCQC87AqoXHQkQo2p7UZeKyLZ/4s2nyjTNY+gUiUWnLYfpGOpjUZWmnkAllf
         cSug==
X-Gm-Message-State: AOJu0YyHewhkv2caz9oxFtCSgFMPOCEeFJ1/WjqjeTSAyNXwevPbUdVn
	IXKZRuq/rQHTJ2vvcaxZhQTyg2SOdviG/3K4eg3Yv0IPGFhfCr6PcWf55s2wK+FbBw==
X-Google-Smtp-Source: AGHT+IHT2zHDnfDqWFD5E2xHIESN4PCSsJZBUbgBOa/l2Y9r+B8B90AmFPCiiaC/RL206u04bGoIrQ==
X-Received: by 2002:a05:620a:4586:b0:785:8a7c:55f1 with SMTP id bp6-20020a05620a458600b007858a7c55f1mr4620204qkb.30.1707252820445;
        Tue, 06 Feb 2024 12:53:40 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/6.6: update to v6.6.13
Date: Tue,  6 Feb 2024 15:53:30 -0500
Message-Id: <c8895c5b310a1d1e564ede01f3a14689c1cf5a7d.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195029

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    62b19b564504 Linux 6.6.13
    9584c8d658c0 mm/memory_hotplug: fix memmap_on_memory sysfs value retrieval
    f54708e4a26d scripts/decode_stacktrace.sh: optionally use LLVM utilities
    09f222d40fae coresight: etm4x: Fix width of CCITMIN field
    d6d19c3d1792 PCI: Add ACS quirk for more Zhaoxin Root Ports
    7db7504a3e41 leds: ledtrig-tty: Free allocated ttyname buffer on deactivate
    12786872b26a parport: parport_serial: Add Brainboxes device IDs and geometry
    03427e7f2a56 parport: parport_serial: Add Brainboxes BAR details
    35f102607054 uio: Fix use-after-free in uio_open
    f4d6dbaa4376 binder: fix comment on binder_alloc_new_buf() return value
    8040d704adce binder: fix trivial typo of binder_free_buf_locked()
    a49087ab9350 binder: fix use-after-free in shinker's callback
    802c61319ec2 binder: use EPOLLERR from eventpoll.h
    e16a0bbdb7e5 Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"
    76a10fc65ab9 ksmbd: free ppace array on error in parse_dacl
    ab5c25b6988f ksmbd: don't allow O_TRUNC open on read-only share
    71be0f674070 drm/amd/display: Pass pwrseq inst for backlight and ABM
    6d4295d61579 ASoC: SOF: Intel: hda-codec: Delay the codec device registration
    08a2ae1d0402 bus: moxtet: Add spi device table
    b0ce6ddc1ca2 bus: moxtet: Mark the irq as shared
    2cd4362faa9e ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    3642b5a62496 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy X360 13-ay0xxx
    d86c51e95644 x86/microcode: do not cache microcode if it will not be used
    7e881af7fb3c drm/crtc: fix uninitialized variable use
    2f09679b8ac1 x86/csum: clean up `csum_partial' further
    1078f257eb3a x86/csum: Remove unnecessary odd handling
    f99b7b22c0af ARM: sun9i: smp: fix return code check of of_property_match_string
    1e6b9bc8cc36 connector: Fix proc_event_num_listeners count not cleared
    6a186b28c4fc net: qrtr: ns: Return 0 if server port is not present
    e79e7c3aa522 nfc: Do not send datagram if socket state isn't LLCP_BOUND
    79aa992c8038 virtio_blk: fix snprintf truncation compiler warning
    ffcaafdb8be6 ida: Fix crash in ida_free when the bitmap is empty
    766c6c1dd140 posix-timers: Get rid of [COMPAT_]SYS_NI() uses
    406cea6443b6 pinctrl: cy8c95x0: Fix get_pincfg
    5f0a16617f70 pinctrl: cy8c95x0: Fix regression
    3d5729d5cee2 pinctrl: cy8c95x0: Fix typo
    a5ba95c226b5 drm/amd/display: get dprefclk ss info from integration info table
    18562b1691e2 drm/amd/display: Add case for dcn35 to support usb4 dmub hpd event
    bd443910debf drm/amdkfd: svm range always mapped flag not working on APU
    5a358b978618 i2c: rk3x: fix potential spinlock recursion on poll
    c5e0ed716c52 smb: client: fix potential OOB in smb2_dump_detail()
    00e66f948abe HID: nintendo: Prevent divide-by-zero on code
    8d6bda0f95c1 dm audit: fix Kconfig so DM_AUDIT depends on BLK_DEV_DM
    5e0e2cb4a1ce ALSA: hda/realtek: Add quirks for ASUS Zenbook 2022 Models
    4818174fd58a ASoC: Intel: bytcr_rt5640: Add new swapped-speakers quirk
    ed1310b53b6f ASoC: Intel: bytcr_rt5640: Add quirk for the Medion Lifetab S10346
    1339559bb6dd platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
    5b235bbc2706 platform/x86/amd/pmc: Move keyboard wakeup disablement detection to pmc-quirks
    a7edb661bb85 platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
    f4fb4b9f1364 platform/x86/amd/pmc: Move platform defines to header
    64954dd2eef1 platform/x86: thinkpad_acpi: fix for incorrect fan reporting on some ThinkPad systems
    8e2609cbdee2 HID: nintendo: fix initializer element is not constant error
    3e0e4a900fcb kselftest: alsa: fixed a print formatting warning
    60e916d4b838 driver core: Add a guard() definition for the device_lock()
    1488b369267e Input: xpad - add Razer Wolverine V2 support
    015cfa30b39c wifi: iwlwifi: pcie: avoid a NULL pointer dereference
    544ce65cb52a ARC: fix smatch warning
    358bca0bb1b4 ARC: fix spare error
    c754028a068f s390/scm: fix virtual vs physical address confusion
    4361e15ac24b ASoC: cs35l45: Prevents spinning during runtime suspend
    ab65d383a57b ASoC: cs35l45: Prevent IRQ handling when suspending/resuming
    296e487dd215 ASoC: cs35l45: Use modern pm_ops
    a2af708bb197 pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend
    0a4a682b502f Input: i8042 - add nomux quirk for Acer P459-G2-M
    274333f82597 Input: atkbd - skip ATKBD_CMD_GETID in translated mode
    88c38fd2f3e6 reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning
    ad2347d78d7b Input: psmouse - enable Synaptics InterTouch for ThinkPad L14 G1
    33e42861eb95 ring-buffer: Do not record in NMI if the arch does not support cmpxchg in NMI
    d9a6029ddee5 tracing: Fix uaf issue when open the hist or hist_debug file
    0e73f1ba602d MIPS: dts: loongson: drop incorrect dwmac fallback compatible
    98707906c64e stmmac: dwmac-loongson: drop useless check for compatible fallback
    0df76142ca21 tracing: Add size check when printing trace_marker output
    f3dc260cd5f2 tracing: Have large events show up as '[LINE TOO BIG]' instead of nothing
    cd70be63167a jbd2: fix soft lockup in journal_finish_inode_data_buffers()
    6e567410d6d3 efi/loongarch: Use load address to calculate kernel entry address
    4dceffd823b7 platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
    cdd8512a5574 neighbour: Don't let neigh_forced_gc() disable preemption for long
    ff89e507b231 drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
    5c480a6966c5 jbd2: increase the journal IO's priority
    6459656095e4 jbd2: correct the printing of write_flags in jbd2_write_superblock()
    262853dc685b soundwire: intel_ace2x: fix AC timing setting for ACE2.x
    8c8343127735 clk: rockchip: rk3128: Fix HCLK_OTG gate register
    351bcf3a3772 clk: rockchip: rk3568: Add PLL rate for 292.5MHz
    4dd2d87c88fd LoongArch: Preserve syscall nr across execve()
    4d8121aa13fd LoongArch: Set unwind stack type to unknown rather than set error flag
    10d9f8ed6daf LoongArch: Apply dynamic relocations for LLD
    3584858bfd34 hwmon: (corsair-psu) Fix probe when built-in
    3f7109ec1fa5 ALSA: pcmtest: stop timer before buffer is released
    b92ad44a1b32 drm/exynos: fix a wrong error checking
    2debe511c1d2 drm/exynos: fix a potential error pointer dereference
    fb26de4a86e1 drm/amdgpu: Add NULL checks for function pointers
    7fc3d8ea1a67 drm/amd/display: Add monitor patch for specific eDP
    a0827b9172ee arm64: dts: rockchip: Fix PCI node addresses on rk3399-gru
    c52d545c1e31 nvme: fix deadlock between reset and scan
    946fd64ba361 nvme: prevent potential spectre v1 gadget
    8b2a6a3692e2 nvme-ioctl: move capable() admin check to the end
    8884a56d2154 nvme: ensure reset state check ordering
    cc5b051eeb48 nvme: introduce helper function to get ctrl state
    8392d3234721 ASoC: da7219: Support low DC impedance headset
    55aba82746bd net/tg3: fix race condition in tg3_reset_task()
    06cb2064b0bf pds_vdpa: set features order
    d3bb92beda4a pds_vdpa: clear config callback when status goes to 0
    53fff954e77c pds_vdpa: fix up format-truncation complaint
    3ad7bf5e57c9 ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module
    330c0f19b393 ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
    5713ab41ace4 ASoC: hdac_hda: Conditionally register dais for HDMI and Analog
    8fa621053995 ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
    fa60f8fac637 nouveau/tu102: flush all pdbs on vmm flush
    3c124f09b7ff ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores
    e8879e7a7b4e ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
    e1d391310724 ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
    f369cf7e94b4 ASoC: fsl_xcvr: refine the requested phy clock frequency
    8f82f2e4d9c4 ASoC: rt5650: add mutex to avoid the jack detection failure
    d568aed978da ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only case
    193d4bbe81fe ASoC: cs43130: Fix incorrect frame delay configuration
    655e69056d09 ASoC: cs43130: Fix the position of const qualifier
    ab10ac262156 ASoC: Intel: Skylake: mem leak in skl register function
    d7368ad5313e ASoC: SOF: topology: Fix mem leak in sof_dai_load()
    5a8bceaeaad0 ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
    07c7fd07b531 ASoC: Intel: Skylake: Fix mem leak in few functions
    8dada1d452ca arm64: dts: rockchip: fix rk356x pcie msg interrupt name
    73ed4a6ea7d3 ASoC: wm8974: Correct boost mixer inputs
    3290bb89e74d ASoC: amd: yc: Add HP 255 G10 into quirk table
    bade0c1e7569 hwtracing: hisi_ptt: Don't try to attach a task
    5e67b92b8b2b hwtracing: hisi_ptt: Handle the interrupt in hardirq context
    a4848c45a3f0 nvme-core: check for too small lba shift
    511f602527ac blk-mq: don't count completed flush data request as inflight in case of quiesce
    379af079c427 Revert "drm/prime: Unexport helpers for fd/handle conversion"
    5ca518149d46 smb: client, common: fix fortify warnings
    941887dc5ed4 drm/amdgpu: Use another offset for GC 9.4.3 remap
    ccba04281640 drm/amdkfd: Free gang_ctx_bo and wptr_bo in pqm_uninit
    61dfdb779048 drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null pointer
    6396b551f286 drm/amd/display: update dcn315 lpddr pstate latency
    867ecd8970d3 drm/amdkfd: Use common function for IP version check
    541cb7618a15 drm/amdgpu: Do not issue gpu reset from nbio v7_9 bif interrupt
    da29e4012f41 block: warn once for each partition in bio_check_ro()
    0c7df8c241ff io_uring: use fget/fput consistently
    75cc56afb28b nvme-core: fix a memory leak in nvme_ns_info_from_identify()
    a47f3a83411f ALSA: hda: intel-nhlt: Ignore vbps when looking for DMIC 32 bps format
    c455b17aff82 debugfs: fix automount d_fsdata usage
    0e25eac37f7a wifi: mac80211: handle 320 MHz in ieee80211_ht_cap_ie_to_sta_ht_cap
    3f7af987d55b wifi: avoid offset calculation on NULL pointer
    35a59d349ab0 wifi: cfg80211: lock wiphy mutex for rfkill poll
    5814deb5a5b0 mptcp: fix uninit-value in mptcp_incoming_options
    948cb8b2d5d0 ALSA: hda - Fix speaker and headset mic pin config for CHUWI CoreBook XPro
    d273f33bb1e3 pinctrl: lochnagar: Don't build on MIPS
    b12a331178d4 kunit: Reset suite counter right before running tests
    858c0840ef02 kunit: Warn if tests are slow
    f88c602fd0ab pinctrl: s32cc: Avoid possible string truncation
    2525d1ba225b f2fs: explicitly null-terminate the xattr list

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 22a93880fc..80bb901924 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "59ee8cb752a7e280cfe2d480964aa5b6c74e4203"
-SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
+SRCREV_machine ?= "55f4682a75d1673cd78504a7342918c1b5dc4d16"
+SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.12"
+LINUX_VERSION ?= "6.6.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 66199674a6..fed7220116 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.12"
+LINUX_VERSION ?= "6.6.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
+SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ce9169ac76..513a55dfa4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f50c6da5bec6481c9fd5618176c768d4ff7afcdd"
-SRCREV_machine:qemuarm64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemuloongarch64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemumips ?= "0175e713ae72f9b4ed10d1702ab9386d294fe96c"
-SRCREV_machine:qemuppc ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemuriscv64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemuriscv32 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemux86 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemux86-64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_machine:qemumips64 ?= "d41c8b84fcfcb4c2dd8eb856172cdc2b6a1bd342"
-SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
+SRCREV_machine:qemuarm ?= "d35039de8e71f9cd91e0056a3b107f5b02766bdb"
+SRCREV_machine:qemuarm64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemuloongarch64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemumips ?= "7b5332f480366b75d8c676482731a6b388ff5b0f"
+SRCREV_machine:qemuppc ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemuriscv64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemuriscv32 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemux86 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemux86-64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_machine:qemumips64 ?= "5915b5fa9b827e29cf1946dc0f92ab2b481de011"
+SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
+SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "47345b4264bc394a8d16bb16e8e7744965fa3934"
+SRCREV_machine:class-devupstream ?= "62b19b564504d027296502e0e30baf5fe0ef080a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.12"
+LINUX_VERSION ?= "6.6.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


