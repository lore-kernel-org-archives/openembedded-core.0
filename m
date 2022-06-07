Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE0BC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 14:00:01 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.13005.1654610392425170644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W2vZ8bT0;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id d128so5397049qkg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PYVZsL0XP+rpZj/wgJesNmwPfu8ip0ghCygoOqnD18=;
        b=W2vZ8bT0e/mD9uxk+Hws+8PwCOwb4EGlpydjnX1wvggYLNrE1pO++CQ0HaKPFXOKcU
         4f+M00nPcrxxrrvRXCrCSkDo7E2a2A4SE5JFX40+JdAq6mFGBEGejjFKtoQmLSud80bQ
         JOH2M1kG9j0nIuKXTE0DaWMZA9u7SUNbqudI3+WBiIhk/7RqmTGFrPXU2y+Owbj9eU2K
         ZGkUi6T0ywI8XqTIjWIGX426Ybc6yzlHUI1sn2BHFWJLwf5Y+VKIH/PjZ1BpOQgbdu0J
         zd2FMp1c0/qWUMF/8vFiPfW9E6VXqDMQDAWjtKNwT3JprhFPuyld2YJgR81ueHzqhInz
         i/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PYVZsL0XP+rpZj/wgJesNmwPfu8ip0ghCygoOqnD18=;
        b=dgtO0YEcSREUujpty2unwf4LMZ4VRKpptNgR1nu+ZbYGLZ53nqpv3mduedxIjyDFaw
         LGrK1qvkjSaufRssbWsmj9ai4MBKI4WwdPW0Udxmuup+JlN6Pgvbf1fyaEFSY6VSMseD
         Pdf7VJgIbeofpZIHrmuv/55JTFxz5bofM2nIabmbL3rCyDeb07ItMSe3zQq378a9OEXF
         sA4WSFTFedvTLWz7ZE+jAcPbHNqHSO/rHdem4IXUNvOw/d7zCWyusmmvQfSjWMoQDMaa
         dgcaZz0UCJBQK2TnmiWHKRpCz+t85vBsvQtEtJC4gMcb4wCOoU0CaHG+6Fuy3vbgKj6H
         fVig==
X-Gm-Message-State: AOAM532UJkYwsb4M6hUb3VzxrUHAzvmFEe0mER+Ps2Wxr47TR0ciHuFt
	hQK3jqU1Ptj76Zeswh2RvdGFSHyuRVzLpQ==
X-Google-Smtp-Source: 
 ABdhPJxTjM+K9dvWgkd78nUzrWwnJL1SgkqNGvRO4Ah85N+N/qrHQ0p7FRfGGQ+pCXqDZ0zxEj7e6w==
X-Received: by 2002:a37:5404:0:b0:6a6:48c7:b137 with SMTP id
 i4-20020a375404000000b006a648c7b137mr19440514qkb.284.1654610391344;
        Tue, 07 Jun 2022 06:59:51 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/5.10: update to v5.10.119
Date: Tue,  7 Jun 2022 09:59:37 -0400
Message-Id: 
 <2278c2e505f3f5723e756e052e9f18698a419603.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 14:00:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166668

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    56c31ac1d8aa Linux 5.10.119
    7c57f2134988 ALSA: ctxfi: Add SB046x PCI ID
    514f58734001 random: check for signals after page of pool writes
    18c261e9485a random: wire up fops->splice_{read,write}_iter()
    cf8f8d37586f random: convert to using fops->write_iter()
    affa1ae52219 random: convert to using fops->read_iter()
    4bb374a1183b random: unify batched entropy implementations
    552ae8e4841b random: move randomize_page() into mm where it belongs
    5f2a040b2fb4 random: move initialization functions out of hot pages
    02102b63bd96 random: make consistent use of buf and len
    33783ca3556e random: use proper return types on get_random_{int,long}_wait()
    1fdd7eef2100 random: remove extern from functions in header
    811afd06e0f3 random: use static branch for crng_ready()
    04d61b96bd8a random: credit architectural init the exact amount
    5123cc61e27d random: handle latent entropy and command line from random_init()
    9320e087f2b6 random: use proper jiffies comparison macro
    31ac294037be random: remove ratelimiting for in-kernel unseeded randomness
    b50f2830b3df random: move initialization out of reseeding hot path
    4c4110c052e8 random: avoid initializing twice in credit race
    cef9010b78c4 random: use symbolic constants for crng_init states
    30e9f362661c siphash: use one source of truth for siphash permutations
    772edeb8c76a random: help compiler out with fast_mix() by using simpler arguments
    18413472339b random: do not use input pool from hard IRQs
    999b0c9e8a97 random: order timer entropy functions below interrupt functions
    ce3c4ff38186 random: do not pretend to handle premature next security model
    24d327568578 random: use first 128 bits of input as fast init
    273aebb50be6 random: do not use batches when !crng_ready()
    f4c98fe1d100 random: insist on random_get_entropy() existing in order to simplify
    ffcfdd5de9d0 xtensa: use fallback for random_get_entropy() instead of zero
    e1ea0e26d3e4 sparc: use fallback for random_get_entropy() instead of zero
    a5092be129cf um: use fallback for random_get_entropy() instead of zero
    25d4fdf1f0f8 x86/tsc: Use fallback for random_get_entropy() instead of zero
    0b93f40cbe97 nios2: use fallback for random_get_entropy() instead of zero
    fdca77508152 arm: use fallback for random_get_entropy() instead of zero
    d5531246afcf mips: use fallback for random_get_entropy() instead of just c0 random
    714def449776 riscv: use fallback for random_get_entropy() instead of zero
    84397906a603 m68k: use fallback for random_get_entropy() instead of zero
    7690be1adf8a timekeeping: Add raw clock fallback for random_get_entropy()
    07b5d0b3e2cc powerpc: define get_cycles macro for arch-override
    30ee01bcdc2c alpha: define get_cycles macro for arch-override
    c55a863c304e parisc: define get_cycles macro for arch-override
    641d1fbd9667 s390: define get_cycles macro for arch-override
    c895438b172c ia64: define get_cycles macro for arch-override
    7d9eab78bed9 init: call time_init() before rand_initialize()
    ec25e386d381 random: fix sysctl documentation nits
    9dff512945f1 random: document crng_fast_key_erasure() destination possibility
    a1b5c849d855 random: make random_get_entropy() return an unsigned long
    72a9ec8d7514 random: allow partial reads if later user copies fail
    1805d20dfb67 random: check for signals every PAGE_SIZE chunk of /dev/[u]random
    9641d9b4303f random: check for signal_pending() outside of need_resched() check
    26ee8fa4dfda random: do not allow user to keep crng key around on stack
    bb515a5beff2 random: do not split fast init input in add_hwgenerator_randomness()
    be0d4e3e96ad random: mix build-time latent entropy into pool at init
    bb563d06c5bc random: re-add removed comment about get_random_{u32,u64} reseeding
    f3bc5eca83d3 random: treat bootloader trust toggle the same way as cpu trust toggle
    7cb6782146b8 random: skip fast_init if hwrng provides large chunk of entropy
    083ab33951e4 random: check for signal and try earlier when generating entropy
    20da9c6079df random: reseed more often immediately after booting
    9891211dfe03 random: make consistent usage of crng_ready()
    95a1c94a1bd7 random: use SipHash as interrupt entropy accumulator
    849e7b744cf2 random: replace custom notifier chain with standard one
    66307429b5df random: don't let 644 read-only sysctls be written to
    4c74ca006afe random: give sysctl_random_min_urandom_seed a more sensible value
    0964a76fd58b random: do crng pre-init loading in worker rather than irq
    192d4c6cb3e2 random: unify cycles_t and jiffies usage and types
    47f0e89b71e2 random: cleanup UUID handling
    9b0e0e27140d random: only wake up writers after zap if threshold was passed
    c47f215ab36d random: round-robin registers as ulong, not u32
    5064550d422d random: clear fast pool, crng, and batches in cpuhp bring up
    6e1cb84cc6a0 random: pull add_hwgenerator_randomness() declaration into random.h
    32252548b50f random: check for crng_init == 0 in add_device_randomness()
    684e9fe92d44 random: unify early init crng load accounting
    f656bd0011fd random: do not take pool spinlock at boot
    5d73e69a5dd4 random: defer fast pool mixing to worker
    7873321cd88f random: rewrite header introductory comment
    6d1671b6d253 random: group sysctl functions
    21ae543e3afb random: group userspace read/write functions
    f04580811d26 random: group entropy collection functions
    e9ff357860ab random: group entropy extraction functions
    d7e5b1925a67 random: group crng functions
    6b1ffb3b5a08 random: group initialization wait functions
    6c9cee15555d random: remove whitespace and reorder includes
    7b0f36f7c252 random: remove useless header comment
    b3901816545e random: introduce drain_entropy() helper to declutter crng_reseed()
    0971c1c2fdc6 random: deobfuscate irq u32/u64 contributions
    ae1b8f19542f random: add proper SPDX header
    9342656c013d random: remove unused tracepoints
    17ad693cd214 random: remove ifdef'd out interrupt bench
    28683a188537 random: tie batched entropy generation to base_crng generation
    adc32acf23db random: fix locking for crng_init in crng_reseed()
    bb63851c2557 random: zero buffer after reading entropy from userspace
    63c1aae40ac1 random: remove outdated INT_MAX >> 6 check in urandom_read()
    07280d2c3f33 random: make more consistent use of integer types
    655a69cb41e0 random: use hash function for crng_slow_load()
    95026060d809 random: use simpler fast key erasure flow on per-cpu keys
    732872aa2c41 random: absorb fast pool into input pool after fast load
    7a5b9ca583f9 random: do not xor RDRAND when writing into /dev/random
    16a6e4ae71e2 random: ensure early RDSEED goes through mixer on init
    c521bf08ee69 random: inline leaves of rand_initialize()
    70377ee0740c random: get rid of secondary crngs
    c36e71b5a52e random: use RDSEED instead of RDRAND in entropy extraction
    1d1582e5fe52 random: fix locking in crng_fast_load()
    0762b7d1f1ad random: remove batched entropy locking
    8d07e2a22687 random: remove use_input_pool parameter from crng_reseed()
    b07fcd9e53fa random: make credit_entropy_bits() always safe
    32d1d7ce3aad random: always wake up entropy writers after extraction
    985292206167 random: use linear min-entropy accumulation crediting
    bb9c45cfb97e random: simplify entropy debiting
    de0727c0c448 random: use computational hash for entropy extraction
    e0cc561e4758 random: only call crng_finalize_init() for primary_crng
    480fd91dcdc7 random: access primary_pool directly rather than through pointer
    0b9e36e895bb random: continually use hwgenerator randomness
    6d2d29f051be random: simplify arithmetic function flow in account()
    a0653a9ec15e random: selectively clang-format where it makes sense
    bccc8d92310d random: access input_pool_data directly rather than through pointer
    a9db850c219f random: cleanup fractional entropy shift constants
    edd294052e77 random: prepend remaining pool constants with POOL_
    f87f50b843e4 random: de-duplicate INPUT_POOL constants
    09ae6b851979 random: remove unused OUTPUT_POOL constants
    8cc5260c19da random: rather than entropy_store abstraction, use global
    5897e06ac15a random: remove unused extract_entropy() reserved argument
    ae093ca1256e random: remove incomplete last_data logic
    7abbc9809fa0 random: cleanup integer types
    c9e108e36dc8 random: cleanup poolinfo abstraction
    8a3b78f9177c random: fix typo in comments
    0ad5d6384d25 random: don't reset crng_init_cnt on urandom_read()
    17420c77f04c random: avoid superfluous call to RDRAND in CRNG extraction
    c245231aecd3 random: early initialization of ChaCha constants
    efaddd56bc54 random: use IS_ENABLED(CONFIG_NUMA) instead of ifdefs
    644320410266 random: harmonize "crng init done" messages
    ca57d51126e4 random: mix bootloader randomness into pool
    542d8ebedb4d random: do not re-init if crng_reseed completes before primary init
    2bfdf588a811 random: do not sign extend bytes for rotation when mixing
    685200b076ff random: use BLAKE2s instead of SHA1 in extraction
    33c30bfe4fb4 random: remove unused irq_flags argument from add_interrupt_randomness()
    b57a88874088 random: document add_hwgenerator_randomness() with other input functions
    ae33c501e059 lib/crypto: blake2s: avoid indirect calls to compression function for Clang CFI
    07918ddba3ab lib/crypto: sha1: re-roll loops to reduce code size
    5fb6a3ba3af6 lib/crypto: blake2s: move hmac construction into wireguard
    62531d446a98 lib/crypto: blake2s: include as built-in
    aec0878b1d13 crypto: blake2s - include <linux/bug.h> instead of <asm/bug.h>
    030d3443aa61 crypto: blake2s - adjust include guard naming
    fea91e907076 crypto: blake2s - add comment for blake2s_state fields
    d45ae768b71b crypto: blake2s - optimize blake2s initialization
    6c362b7c7764 crypto: blake2s - share the "shash" API boilerplate code
    72e5b68f33a1 crypto: blake2s - move update and final logic to internal/blake2s.h
    e467a55bd006 crypto: blake2s - remove unneeded includes
    198a19d7ee95 crypto: x86/blake2s - define shash_alg structs using macros
    89f9ee998e36 crypto: blake2s - define shash_alg structs using macros
    0f8fcf5b6ed7 crypto: lib/blake2s - Move selftest prototype into header file
    c3a4645d803e MAINTAINERS: add git tree for random.c
    c4882c6e1ec9 MAINTAINERS: co-maintain random.c
    acb198c4d11f random: remove dead code left over from blocking pool
    6227458fef95 random: avoid arch_get_random_seed_long() when collecting IRQ randomness
    257fbea15ab1 ACPI: sysfs: Fix BERT error region memory mapping
    14fa2769ea6c ACPI: sysfs: Make sparse happy about address space in use
    0debc69f003b media: vim2m: initialize the media device earlier
    ed0e71cc3f1e media: vim2m: Register video device after setting up internals
    a5c68f457fbf secure_seq: use the 64 bits of the siphash for port offset calculation
    33f1b4a27abc tcp: change source port randomizarion at connect() time
    9b4aa0d80b18 KVM: x86/mmu: fix NULL pointer dereference on guest INVPCID
    74c6e5d58435 KVM: x86: Properly handle APF vs disabled LAPIC situation
    c06e5f751a08 staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
    a8f4d63142f9 lockdown: also lock down previous kgdb use

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7bf7a8016b..ce903a7372 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b324ad7fb718b77e1bcb14017020a7a123ebc30c"
-SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
+SRCREV_machine ?= "5629d552de7759e4bb9821e210f3673c14900dd0"
+SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.118"
+LINUX_VERSION ?= "5.10.119"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2cce9695ff..625cdfd085 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.118"
+LINUX_VERSION ?= "5.10.119"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d4df93eb136b36c65d2fe5cfdb5404b222ff2a4d"
-SRCREV_machine ?= "f854641b454815ec8fea760820c7f8a6426330b8"
-SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
+SRCREV_machine:qemuarm ?= "50342ca6fc7dd66bfde9dfd1d6c336f99c55e0ab"
+SRCREV_machine ?= "d2cfd8b4499710877d54129a9137351a9de166fb"
+SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e08d38d4cb..fcb7b83cec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "71b08c67d5af08e96976aebea86e7d6cc18ac648"
-SRCREV_machine:qemuarm64 ?= "6f85e9236905531846a8473787ab45727b7febe7"
-SRCREV_machine:qemumips ?= "f8bb9500384317b474b0dbf27548d0ec81d9271d"
-SRCREV_machine:qemuppc ?= "66aa1440e2f7df15fb5af87cdafaf0f7be95940f"
-SRCREV_machine:qemuriscv64 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
-SRCREV_machine:qemuriscv32 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
-SRCREV_machine:qemux86 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
-SRCREV_machine:qemux86-64 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
-SRCREV_machine:qemumips64 ?= "6a33fdea4104a586b0a5abca593ef0dba1dbb87a"
-SRCREV_machine ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
-SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
+SRCREV_machine:qemuarm ?= "68264cfbddebea663543a7c4ad5131c6cf63d3d2"
+SRCREV_machine:qemuarm64 ?= "b95be3e8c15d939ce402775de98ab80eda493b11"
+SRCREV_machine:qemumips ?= "c6a8eaf00384dcce14bb9e28f2d68b5004e8c6f3"
+SRCREV_machine:qemuppc ?= "6c1e46f34c6b9ababf8c6fcb4c01274099bb034f"
+SRCREV_machine:qemuriscv64 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
+SRCREV_machine:qemuriscv32 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
+SRCREV_machine:qemux86 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
+SRCREV_machine:qemux86-64 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
+SRCREV_machine:qemumips64 ?= "8d66b3ad7fbc8554ba2248cfbe755f8d24cb5a1a"
+SRCREV_machine ?= "f844c3765c3270321f0b3347992565cfdb938c99"
+SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.118"
+LINUX_VERSION ?= "5.10.119"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


