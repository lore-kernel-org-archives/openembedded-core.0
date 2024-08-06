Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AABFC52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:03 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.15306.1722970561883244257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EaF35zAP;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4f6be9d13cdso354164e0c.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970561; x=1723575361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNhol46tsMwo9hgKkXMNO2lDjRuY8qvoiyKKz3lUhAc=;
        b=EaF35zAPVOkcoi8qLY/39Z9LzHuLxEJjS3SQ4J3BZZEYmQt0G507ohQkDloZVIwBGH
         QV0Oi6Uke9932fWtkFbJT3rpVU+83vOAk/Vz35nstGQ56UBj7nVHSjmnkhDepd1mnVb+
         1Y/qW8sblrG9dxpJ1YPb1orYesdMQf5qinR8zMrdFt28s6FXGKklBEZN25cXRAVj9Cte
         9C1bOW/FSeBDIPiSpB02FkO55h0C7prjbWAgUarFpx6NLF0t381CE+zmp6OJhGrGshJp
         2U+r5LMmz3CeuP6AuhF4nRre4Bgj28KL8YAWrT+zMbMGq9s4q1ADHHBXnQUdLBDcivyk
         qbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970561; x=1723575361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNhol46tsMwo9hgKkXMNO2lDjRuY8qvoiyKKz3lUhAc=;
        b=nCRNdk0fu1kx4awodt9tJfT7nvjqONhImydjGp/yHbRqwAtZ5fmxe4jxAjG2Zbubtw
         jo/dS4uGP76O/R1Lxf+7KLwts5c0oLaN2rgKQJUG+zftLAdiG9e0ejtb8hmiuJoiXQhf
         Hqf7CRPSGU1UeoLL81mmh+mMeI9XH8RBTVwsny3O+PmqW8Mgc2TKnugK47imScrevfHj
         JRaBi4DgjlzKvkle5e4W/4jzavCSzR48A+VeHz7arWY5ai2VUcNt7UDut0sAmVp6BFJr
         eOlFJ0x9I/BCCnpPRmXdFSqdavK4Sk1oOlH0IzYYJLbp3qWWy7Z59U6IM+l1097+7PaT
         lZgg==
X-Gm-Message-State: AOJu0YzdYm0KcQkNFrYbnRFNodT1ahJ1IJd0Qb5/6GBEDEHse944TFxx
	iStpQyGxQ0qkveAYIvXdv7qdq3dRCkfhDDOpJPqgz6XdDBVGk49dkw8bB9JU
X-Google-Smtp-Source: AGHT+IF8pNdQDz5JKTB7QrwTbh1y//hAVo3Kj9VgAQumY6+N5ATD6lkTBGuPPVpmb1WRn9uS8wbsSQ==
X-Received: by 2002:a05:6122:4692:b0:4ec:f6f2:f1cd with SMTP id 71dfb90a1353d-4f8a00189b6mr14141055e0c.9.1722970560484;
        Tue, 06 Aug 2024 11:56:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/6.10: update to v6.10.2
Date: Tue,  6 Aug 2024 14:55:49 -0400
Message-Id: <110dda3049d1ee49755e89146a1b104e5a51f387.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203042

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    c4386c5293aa8 drivers: gpu: drm: msm: registers: improve reproducibility
    2d002356c3bb6 Linux 6.10.2
    e1a786b9bbb76 tap: add missing verification for short frame
    8418f55302fa1 tun: add missing verification for short frame
    ed898f9ca3fa3 filelock: Fix fcntl/close race recovery compat path
    0990c63c53b88 ALSA: seq: ump: Skip useless ports for static blocks
    67b4307b200c0 ALSA: pcm_dmaengine: Don't synchronize DMA channel when DMA is paused
    cba936e34ba5c arm64: dts: qcom: sm6115: Disable SS instance in Parkmode for USB
    3f0ec0bcd7945 arm64: dts: qcom: sdm845: Disable SS instance in Parkmode for USB
    a87398c426e1a arm64: dts: qcom: ipq8074: Disable SS instance in Parkmode for USB
    86ef7fa0a3f81 arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
    53bcd3e3955f2 arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
    f6ca32f5d0ff3 arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
    aa38865e86565 arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
    a9426f558a45a arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
    4c815a74d6ffb arm64: dts: qcom: x1e80100-crd: Fix USB PHYs regulators
    12cfba78ac4e4 arm64: dts: qcom: x1e80100-qcp: Fix the PHY regulator for PCIe 6a
    e9e797f82040d arm64: dts: qcom: x1e80100-crd: Fix the PHY regulator for PCIe 6a
    4f6838e716396 arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
    6b9b370bab9c2 arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
    c5842959cdcb8 arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs regulators
    8446ce8ff62d2 arm64: dts: qcom: sc7280: Disable SuperSpeed instances in park mode
    0dfc866395f09 arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
    676f1898111c0 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    90fb34305b8b9 ALSA: hda/realtek: Enable headset mic on Positivo SU C1400
    f751555b73b8a ALSA: hda/tas2781: Add new quirk for Lenovo Hera2 Laptop
    87efe5b76ec9f usb: gadget: midi2: Fix incorrect default MIDI2 protocol setup
    617cf144c206f fs/ntfs3: Validate ff offset
    9b71f820f7168 fs/ntfs3: Add a check for attr_names and oatbl
    dbde7bc91093f jfs: don't walk off the end of ealist
    edb2e67dd4626 ocfs2: add bounds checking to ocfs2_check_dir_entry()
    a3aefb871222a s390/mm: Fix VM_FAULT_HWPOISON handling in do_exception()
    298e2ce222e71 drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
    0129910096573 Linux 6.10.1
    5e052818fafac thermal: core: Allow thermal zones to tell the core to ignore them
    68d19af95a353 io_uring: fix error pbuf checking
    d905723ee6578 ASoC: cs35l56: Limit Speaker Volume to +12dB maximum
    890e1e6b2fd51 ASoC: cs35l56: Use header defines for Speaker Volume control definition
    b9afbb9a0c734 tpm: Use auth only after NULL check in tpm_buf_check_hmac_response()
    fafd1dcc84c59 cifs: Fix setting of zero_point after DIO write
    b1d0a566769b6 cifs: Fix server re-repick on subrequest retry
    b5347b051d3b2 cifs: fix noisy message on copy_file_range
    5c0a6c40c2b94 cifs: Fix missing fscache invalidation
    447c00d76e908 cifs: Fix missing error code set
    4378be89ddb7d ext4: use memtostr_pad() for s_volume_name
    915a386c7cffd qemux86: add configuration symbol to select values
    62df91b21626f sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b8 clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbff clear_warn_once: bind a timer to written reset value
    89a5c70f20001 clear_warn_once: expand debugfs to include read support
    8014704c527d7 tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936c libbpf: Fix build warning on ref_ctr_off
    32fe8c972c362 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798dc perf: x86-32: explicitly include <errno.h>
    a5cb41682777e perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae2 perf: fix bench numa compilation
    6dbb2915e8a7c perf: add SLANG_INC for slang.h
    57f78dddfd930 perf: add sgidefs.h to for mips builds
    130f0306cfbac perf: change --root to --prefix for python install
    2520efe953414 perf: add 'libperl not found' warning
    45731b6ae676f perf: force include of <stdbool.h>
    ace10f8dec53e fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e2 fat: don't use obsolete random32 call in namei_vfat
    2442bae1a6451 FAT: Added FAT_NO_83NAME
    7561126bce00c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab9598763 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c99 aufs6: match exports to functions
    e125467cf228f aufs: adjust for v6.9+
    eebcdc6635bfa aufs6: correct do_splice_from prototype
    4c5829036c457 aufs: update remove_page to remove_folio
    e8d889d0f4341 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de174 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe24 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed3 aufs6: adapt to v6.6
    d3e4ede696034 aufs6: core
    49ec9271f41d3 aufs6: standalone
    dcc0978da2dd9 aufs6: mmap
    80e1609b37e77 aufs6: base
    0dbb3f0624208 aufs6: kbuild
    ad51078c5ebfc yaffs: fix mtime/itime field access
    e5f1d35d6188c yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7c yaffs2: v6.5 fixups
    f5908785d88d7 yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdff yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54fa yaffs2: replace bdevname call with sprintf
    92d30df4eb56c yaffs2: convert read_page -> readfolio
    6c895bffdf725 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255b yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046f yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16ee yaffs: include blkdev.h
    fe7d745aac947 yaffs: fix misplaced variable declaration
    bee147b2e5336 yaffs2: v5.6 build fixups
    22998f589ec26 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a9764 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda953 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4dc yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a81470 yaffs2: fix memory leak in mount/umount
    6c7827a16aaaa yaffs: Avoid setting any ACL releated xattr
    fa34828155425 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce7 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531c yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0c yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8b initramfs: allow an optional wrapper script around initramfs generation
    b619a8d543360 vt/conmakehash: improve reproducibility
    c786186aeef39 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e7 iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9f net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aad defconfigs: drop obselete options
    946e5b78ab94d linux-yocto: Handle /bin/awk issues
    9daee1dba5852 uvesafb: provide option to specify timeout for task completion
    f68b8683441a0 uvesafb: print error message when task timeout occurs
    a1595c6b60173 compiler.h: Undef before redefining __attribute_const__
    8086839613c68 vmware: include jiffies.h
    32e79eb3c169c Resolve jiffies wrapping about arp
    f6fabf91b6f24 nfs: Allow default io size to be configured.
    ad2b29f801e9e check console device file on fs when booting
    5194785d545b8 mount_root: clarify error messages for when no rootfs found
    78b3498cb59a7 mconf: fix output of cflags and libraries
    9cc6870708d54 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c938 modpost: mask trivial warnings
    4784584582f50 kbuild: exclude meta directory from distclean processing
    73072b5fe25a9 powerpc: serialize image targets
    a120eb2003200 arm: serialize build targets
    51d5719ac05b4 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0c cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586f x86_64_defconfig: Fix warnings
    1359db75df0c9 mips: make current_cpu_data preempt safe
    385edf6090c30 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319f mips: Kconfig: add QEMUMIPS64 option
    389ce854fde30 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa85 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f7 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e5 arm64: defconfig: cleanup config options
    c5fb425762ed8 vexpress: Pass LOADADDR to Makefile
    07a8b544d4e96 arm: ARM EABI socketcall
    574f3ae3d2ca7 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 18d94236d6..3bdf089cfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "db6fc5b1c6a520a67c58d41cb5cc59e6cd288338"
-SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
+SRCREV_machine ?= "5bdc0b099619bc8b5ba78c959341fbdec94bbcb0"
+SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10"
+LINUX_VERSION ?= "6.10.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 8e75c4ae93..8d95064732 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10"
+LINUX_VERSION ?= "6.10.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
+SRCREV_machine ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index afaf94c16e..7b27d84ba8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0086d23d727698bb22186f2553daa54883534eab"
-SRCREV_machine:qemuarm64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemuloongarch64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemumips ?= "8b680076e2cbc0b93ee1f55c64e3d6be267b1e8b"
-SRCREV_machine:qemuppc ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemuriscv64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemuriscv32 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemux86 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemux86-64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_machine:qemumips64 ?= "ebdf992764fc37d6c905dc5f8f0e927f06e95168"
-SRCREV_machine ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
-SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
+SRCREV_machine:qemuarm ?= "6705d5dee8c10b540b87b02bc0f154739c73c7e8"
+SRCREV_machine:qemuarm64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemuloongarch64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemumips ?= "80b11e534e03a10fb309eccb5128e83d42b0266c"
+SRCREV_machine:qemuppc ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemuriscv64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemuriscv32 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemux86 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemux86-64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_machine:qemumips64 ?= "09b08cd8880a997a591cae3d306c12a60193742b"
+SRCREV_machine ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
+SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0c3836482481200ead7b416ca80c68a29cfdaabd"
+SRCREV_machine:class-devupstream ?= "2d002356c3bb628937e0fb5d72a91dc493a984fe"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10"
+LINUX_VERSION ?= "6.10.2"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


