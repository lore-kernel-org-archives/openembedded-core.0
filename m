Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1E1CCA47C
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:51 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.12693.1654610390867869105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FwhwHgY3;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id a184so9683579qkg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sniNDL43j4X9idDk35oXb0jf3K+R0o97JuH1EraxF2w=;
        b=FwhwHgY3MCimn3E1tz2FvTjL2xG1pZNyavU5aZsDKwdEYN46PSdcXL4QO/0PTYljzU
         wrTQEAT+u47iWVTLXEwnBi5cKIWN5/9ZWxT7sXRjZZ3uIPhFRmHfMezkQ+WmYbQaz3No
         m1bqQeZpodDHU8kdeNZBwN5a8rJleEyxXc0VDk9JguDf5KMrN2Pe0hgEAmfOE6yfkHnD
         tG5DsVxxRkCIWbwhKrV1NQSzKEOSAVV+5feK5BMQIwzvHruQ6y3fI+1aLYSfQ4zzS/Vx
         TFtopFiqV6AyCAx+uwmhFmf3fjsbjB/ut7saKxjWsCG3I36DP987MiIq0gPWT1kN6FoF
         5HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sniNDL43j4X9idDk35oXb0jf3K+R0o97JuH1EraxF2w=;
        b=m+z2OTrJTxJRyPV3C6SbVAW/EBm+ZV4ad3dMGI6AFYOXomodtJd08rXCv+k0pE6f0K
         jKcSq/upq6YSgRgohyQ9207PioZVoDU7eWibCgCq9askGK296Z37RBo7nRsgnzCZpxjf
         csdD3ldmk2I0Nn1Xofzn7AeTbZyYZ8oY9V0wgLjvDzcl9sMhq224qLo5qQfCOKpJKA5u
         1FS5UTzvDDIZ3GHtyiyB1RnM/XcI6EhcZvapsCuOUYBffa/dq3ym7/FoumBCrA3AiCjq
         yxas/JgOei/i5/jAEVWSOeLGC+UrGIwMMsryMJe4mX3CNhld2fvG5D542KdBMk5gqN1n
         OFzw==
X-Gm-Message-State: AOAM53092rvjYy3ZboOH0WHTsiLTuwTFOK7o1z4fQcA1SxfyRYmT4K+v
	rsmcBw17Uns8mw60Zvj7pjKOVZ7Ch0yI2w==
X-Google-Smtp-Source: 
 ABdhPJyNRNcZVMEB4us56koZTXXP7EaDXfL601yASWItX+hCDMY/KgiFyuF4yrNn91olILQttuLw6w==
X-Received: by 2002:a37:bd06:0:b0:6a3:4346:fc23 with SMTP id
 n6-20020a37bd06000000b006a34346fc23mr19797717qkf.348.1654610389769;
        Tue, 07 Jun 2022 06:59:49 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.15: update to v5.15.44
Date: Tue,  7 Jun 2022 09:59:36 -0400
Message-Id: 
 <a960134c61671e0ec5fa2d6cba643d6ff85eef92.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166667

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4e67be407725 Linux 5.15.44
    50196b5d73dc ALSA: ctxfi: Add SB046x PCI ID
    ea5b87349d5a random: check for signals after page of pool writes
    3e167570a951 random: wire up fops->splice_{read,write}_iter()
    0789c69644c8 random: convert to using fops->write_iter()
    7f8cea12a494 random: convert to using fops->read_iter()
    6244da28c6b3 random: unify batched entropy implementations
    64cb7f01ddd2 random: move randomize_page() into mm where it belongs
    55a368c3e850 random: move initialization functions out of hot pages
    542a60612d2a random: make consistent use of buf and len
    29ed26a33436 random: use proper return types on get_random_{int,long}_wait()
    55729575eaa9 random: remove extern from functions in header
    c6ae9d65bcdb random: use static branch for crng_ready()
    4e5e6754a4b6 random: credit architectural init the exact amount
    11cce5040c29 random: handle latent entropy and command line from random_init()
    ac0172992c94 random: use proper jiffies comparison macro
    8df752b82ec5 random: remove ratelimiting for in-kernel unseeded randomness
    272b79432f66 random: move initialization out of reseeding hot path
    c4e600154ac0 random: avoid initializing twice in credit race
    23a1b984f4b8 random: use symbolic constants for crng_init states
    f4cb809a90df siphash: use one source of truth for siphash permutations
    82caef84092e random: help compiler out with fast_mix() by using simpler arguments
    4649394c4749 random: do not use input pool from hard IRQs
    df4e319ea60f random: order timer entropy functions below interrupt functions
    baf06217704b random: do not pretend to handle premature next security model
    0d24003b5fde random: use first 128 bits of input as fast init
    0d79a47b4ae0 random: do not use batches when !crng_ready()
    1ab530cf40dc random: insist on random_get_entropy() existing in order to simplify
    e6bd242523e8 xtensa: use fallback for random_get_entropy() instead of zero
    b4582cb35167 sparc: use fallback for random_get_entropy() instead of zero
    d876dca6edf3 um: use fallback for random_get_entropy() instead of zero
    e017497815f3 x86/tsc: Use fallback for random_get_entropy() instead of zero
    38fbfa404da6 nios2: use fallback for random_get_entropy() instead of zero
    197d25e068c0 arm: use fallback for random_get_entropy() instead of zero
    9e6db825e87a mips: use fallback for random_get_entropy() instead of just c0 random
    2ab416043a94 riscv: use fallback for random_get_entropy() instead of zero
    a1428cd7e194 m68k: use fallback for random_get_entropy() instead of zero
    82f182812f17 timekeeping: Add raw clock fallback for random_get_entropy()
    bc94ccb2904e powerpc: define get_cycles macro for arch-override
    8ca78fbdeba0 alpha: define get_cycles macro for arch-override
    9bf990cff673 parisc: define get_cycles macro for arch-override
    e05efd31b9db s390: define get_cycles macro for arch-override
    9f174326e35c ia64: define get_cycles macro for arch-override
    807ed9c29586 init: call time_init() before rand_initialize()
    2814a9e632db random: fix sysctl documentation nits
    4179671f496b random: document crng_fast_key_erasure() destination possibility
    8b373c113a4c random: make random_get_entropy() return an unsigned long
    b8078810e44d random: allow partial reads if later user copies fail
    ccaaff57ed50 random: check for signals every PAGE_SIZE chunk of /dev/[u]random
    02c2e2ca3610 random: check for signal_pending() outside of need_resched() check
    e7e196e1ae26 random: do not allow user to keep crng key around on stack
    be7561767ce8 random: do not split fast init input in add_hwgenerator_randomness()
    636b057e2a1a random: mix build-time latent entropy into pool at init
    3967a200367c random: re-add removed comment about get_random_{u32,u64} reseeding
    25727cbbe9b4 random: treat bootloader trust toggle the same way as cpu trust toggle
    a704248b4590 random: skip fast_init if hwrng provides large chunk of entropy
    3689ac035180 random: check for signal and try earlier when generating entropy
    94c8249efa76 random: reseed more often immediately after booting
    99290c6898b2 random: make consistent usage of crng_ready()
    0c66c876393b random: use SipHash as interrupt entropy accumulator
    6da877d2d46b random: replace custom notifier chain with standard one
    39c9e5566ac5 random: don't let 644 read-only sysctls be written to
    e4e1600a674f random: give sysctl_random_min_urandom_seed a more sensible value
    2c60d7f38d64 random: do crng pre-init loading in worker rather than irq
    1523ec5324e9 random: unify cycles_t and jiffies usage and types
    fdb1e54472c3 random: cleanup UUID handling
    c169e7a09cd4 random: only wake up writers after zap if threshold was passed
    e400ba11a241 random: round-robin registers as ulong, not u32
    144c1e7ecf00 random: clear fast pool, crng, and batches in cpuhp bring up
    80c1f7f8f3cd random: pull add_hwgenerator_randomness() declaration into random.h
    98d6def672fd random: check for crng_init == 0 in add_device_randomness()
    9df4a56fad32 random: unify early init crng load accounting
    d386b087056a random: do not take pool spinlock at boot
    3c48a2da32ef random: defer fast pool mixing to worker
    9489e36e2150 random: rewrite header introductory comment
    9385681af846 random: group sysctl functions
    96340f035df6 random: group userspace read/write functions
    74b704245f31 random: group entropy collection functions
    43e87e6f3317 random: group entropy extraction functions
    019e057db9b1 random: group crng functions
    81e62ff1f650 random: group initialization wait functions
    d3a2510216b4 random: remove whitespace and reorder includes
    30c52e99db0d random: remove useless header comment
    95f85a01584e random: introduce drain_entropy() helper to declutter crng_reseed()
    c807eca035c3 random: deobfuscate irq u32/u64 contributions
    f641f9495d6f random: add proper SPDX header
    ce951e9672df random: remove unused tracepoints
    4509941f75ac random: remove ifdef'd out interrupt bench
    ad5d17d0faf9 random: tie batched entropy generation to base_crng generation
    86ab60616ec6 random: fix locking for crng_init in crng_reseed()
    d2d1ad9430b1 random: zero buffer after reading entropy from userspace
    eda555356b39 random: remove outdated INT_MAX >> 6 check in urandom_read()
    5dd066ade820 random: make more consistent use of integer types
    ba789caa17a0 random: use hash function for crng_slow_load()
    b27bd09d0544 random: use simpler fast key erasure flow on per-cpu keys
    1aab83f96663 random: absorb fast pool into input pool after fast load
    4a18db164cbb random: do not xor RDRAND when writing into /dev/random
    b51caadb18a7 random: ensure early RDSEED goes through mixer on init
    fd6eb2800589 random: inline leaves of rand_initialize()
    5e4fab6fefb1 random: get rid of secondary crngs
    ded4cc806d0d random: use RDSEED instead of RDRAND in entropy extraction
    704c76e08804 random: fix locking in crng_fast_load()
    67fdda9af773 random: remove batched entropy locking
    ad86aa8ec90f random: remove use_input_pool parameter from crng_reseed()
    1bc9db59b24c random: make credit_entropy_bits() always safe
    3730490111ca random: always wake up entropy writers after extraction
    cb65ac300816 random: use linear min-entropy accumulation crediting
    a6beb8155b9c random: simplify entropy debiting
    a5e2c8a4574a random: use computational hash for entropy extraction
    add92df1cb37 random: only call crng_finalize_init() for primary_crng
    07e015230415 random: access primary_pool directly rather than through pointer
    b53c9666e714 random: continually use hwgenerator randomness
    c1dc53d781fd random: simplify arithmetic function flow in account()
    2f0e83e8326b random: selectively clang-format where it makes sense
    db7a0a9171ed random: access input_pool_data directly rather than through pointer
    c25c7e29be27 random: cleanup fractional entropy shift constants
    68512942c0d7 random: prepend remaining pool constants with POOL_
    2772ba4d5223 random: de-duplicate INPUT_POOL constants
    da80b44cf9cf random: remove unused OUTPUT_POOL constants
    f9efa1a98831 random: rather than entropy_store abstraction, use global
    b6d849d0e2f8 random: remove unused extract_entropy() reserved argument
    578fbb760064 random: remove incomplete last_data logic
    8aa9ddc4db29 random: cleanup integer types
    4330c485f92c random: cleanup poolinfo abstraction
    250bda5d0505 random: fix typo in comments
    15a1a3baf14f random: don't reset crng_init_cnt on urandom_read()
    d47579fb283a random: avoid superfluous call to RDRAND in CRNG extraction
    0c3910447110 random: early initialization of ChaCha constants
    5822fad8d3dc random: use IS_ENABLED(CONFIG_NUMA) instead of ifdefs
    69bb5f0917f9 random: harmonize "crng init done" messages
    c4c9081184e9 random: mix bootloader randomness into pool
    1b1258b91757 random: do not re-init if crng_reseed completes before primary init
    08040365d0b7 random: do not sign extend bytes for rotation when mixing
    2e827d53343a random: use BLAKE2s instead of SHA1 in extraction
    c5a7694fa802 random: remove unused irq_flags argument from add_interrupt_randomness()
    40af1df8034a random: document add_hwgenerator_randomness() with other input functions
    45626449eb25 lib/crypto: blake2s: avoid indirect calls to compression function for Clang CFI
    b0cdd9ec8445 lib/crypto: sha1: re-roll loops to reduce code size
    cba2195416d4 lib/crypto: blake2s: move hmac construction into wireguard
    caba66ec322e lib/crypto: blake2s: include as built-in
    830ecbae41a7 MAINTAINERS: add git tree for random.c
    12d7163380a2 MAINTAINERS: co-maintain random.c
    0da5349e2254 ACPI: sysfs: Fix BERT error region memory mapping
    bf5a3c51e9f7 ice: fix crash at allocation failure
    acd12d165281 KVM: x86/mmu: fix NULL pointer dereference on guest INVPCID
    f82ccfa4835b HID: amd_sfh: Add support for sensor discovery

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 034656017c..b052db8a15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0349dadc971ea2a9ad780b9be95df3c7b9f08eac"
-SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
+SRCREV_machine ?= "83bec9a458bfdfb46c5dc62342bafae2806043d4"
+SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.43"
+LINUX_VERSION ?= "5.15.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index e9991a66fa..f6110354a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.43"
+LINUX_VERSION ?= "5.15.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bec753cf26f9924ed9e4e583032687e4a2a947f4"
-SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
+SRCREV_machine ?= "768cd295dfc0a311d2e53c1b05e19a246e184d0e"
+SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b7fdaebd3e..3cb5f93a21 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "53027a25781dce4876ed47dde4e7bb1f49216bf2"
-SRCREV_machine:qemuarm64 ?= "0a49d733a9ec378aa945dbd20f4d1e3b2d4a9052"
-SRCREV_machine:qemumips ?= "f8f756c4bfc3489427d714492b29ca316436276d"
-SRCREV_machine:qemuppc ?= "1ae9b6880799961c8bc3c33d8b596dbea4002401"
-SRCREV_machine:qemuriscv64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_machine:qemuriscv32 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_machine:qemux86 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_machine:qemux86-64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_machine:qemumips64 ?= "cc95aac05d6fb9f0fbe1c336127568df916e2fed"
-SRCREV_machine ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
+SRCREV_machine:qemuarm ?= "1585df4dbb1e353cc1472748186504a377de5dce"
+SRCREV_machine:qemuarm64 ?= "363482e730cbf7f772430c99c83f60ddc01d7518"
+SRCREV_machine:qemumips ?= "f534cfa2119dc7cf07d546d9fed2b822af1bc838"
+SRCREV_machine:qemuppc ?= "c019857d9af595336bb272c981150952b87d2639"
+SRCREV_machine:qemuriscv64 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
+SRCREV_machine:qemuriscv32 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
+SRCREV_machine:qemux86 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
+SRCREV_machine:qemux86-64 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
+SRCREV_machine:qemumips64 ?= "a26ad766d7372a98d4d1f11d50953c45782f3a37"
+SRCREV_machine ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
+SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0e5bb338bf471ec46924f744c4301751bab8793a"
+SRCREV_machine:class-devupstream ?= "4e67be407725b1d8b829ed2075987037abec98ec"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.43"
+LINUX_VERSION ?= "5.15.44"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


