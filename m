Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ED6C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.11309.1641924012279849595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MwMiUfKo;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 82so1734134qki.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6WFI+8vQKZA/HAIPZfw8CkuyxzpXgOvyq5Xy9nuDjJ0=;
        b=MwMiUfKovaL9o0kaMqT+9miiPL33Aby6aeHwMAITMaNj4jNPBSC3oQtFyhNUawgE1S
         k3Z45YHwXTTx57TSzA4fGV7NHTGDURlLT5ksWepTMGbRRHUaBdVUf51aXTav90f/xBqO
         Pz4KKWECHneef9RBnKW0UR594b+h8mhrUqnZgji9wIsuTCl3BfNqi+BCWdsc+/MBFlxE
         yvBBUjnoOlSjtgoF19B61Vy+qw6rOribDyYPHBncU93DXNcLUob7u3HNJLxyipz2mPD5
         wUfav0eqW4AtPbnA7n8rbQFNFydrXS3qF3yDlSfXc4niLFV2eIeZDKZ70fIPXa/9aASb
         /N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WFI+8vQKZA/HAIPZfw8CkuyxzpXgOvyq5Xy9nuDjJ0=;
        b=qaIWmOGAXMsGxco656TjFIxssz5540yubNbZXwnOcnL/ABdlN/bvMd5vqyqQbLtYq5
         n6ySfGYEWdVSq7NTbynsI0vGEiIX6rvCgzqi3nYH6eZWDo9dPnWnHv54IUAllcm4d6pt
         fXtO3D//6RgXabD2a8H03pzIlDnQw/MqUipi8O9Zga7M5wHEsOMvdbR1dpeUd2zTUAuG
         hegiNxUD0jz4IZ8F4b5+dYRljZvKciy6COxhI2LcL15bBfPy5HlYs48JOPw1L9gEjcv7
         lbeJz4/YHGvevBdYHmqsjf/kj011QZVBO7uoS8cS8cf61DWsaXkHbHxnwtdrT8GAG9Z3
         zepA==
X-Gm-Message-State: AOAM533KP9nj8h4mG4M4tr6NPDDxUnAra3EeFRODqHV2us2kGFXKPFGS
	Sjs8oPDEX8clOpEwJo1oy7E=
X-Google-Smtp-Source: 
 ABdhPJxo0c0jtKubtplNbpGGC+9LHVWd6wT/qt+oO8huOJobUB9ZUyXqVAoxZPw37CFonyC4pCdtWA==
X-Received: by 2002:a05:620a:f10:: with SMTP id
 v16mr3979837qkl.36.1641924006659;
        Tue, 11 Jan 2022 10:00:06 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-yocto/5.15: update to v5.15.13
Date: Tue, 11 Jan 2022 12:59:55 -0500
Message-Id: 
 <c5bc061a4838c181f28b5ce5ee917fc881852cb2.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160433

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

734eb1fd2073 Linux 5.15.13
bc5fce3dff9a perf scripts python: intel-pt-events.py: Fix printing of switch events
632ee8a1786a perf script: Fix CPU filtering of a script's switch events
90d273381bfb perf intel-pt: Fix parsing of VM time correlation arguments
47b5d0a7532d fs/mount_setattr: always cleanup mount_kattr
08eacbd141e2 net: fix use-after-free in tw_timer_handler
ffe4a1ba1a82 mm/damon/dbgfs: fix 'struct pid' leaks in 'dbgfs_target_ids_write()'
466267ced87d Input: spaceball - fix parsing of movement data packets
e79ff8c68acb Input: appletouch - initialize work before device registration
90ffed2d5e0d scsi: vmw_pvscsi: Set residual data length conditionally
17691bada6b2 binder: fix async_free_space accounting for empty parcels
90d2beed5e75 nitro_enclaves: Use get_user_pages_unlocked() call to handle mmap assert
0c823e0b4697 usb: mtu3: set interval of FS intr and isoc endpoint
249ddfbe0057 usb: mtu3: fix list_head check warning
dace4123e304 usb: mtu3: add memory barrier before set GPD's HWO
ebef2aa29f37 usb: gadget: f_fs: Clear ffs_eventfd in ffs_data_clear.
81f8de4b6af6 xhci: Fresco FL1100 controller should not have BROKEN_MSI quirk set.
0f591d17e36e drm/amd/display: Changed pipe split policy to allow for multi-display pipe split
94ba5b0fb52d drm/amdgpu: add support for IP discovery gc_info table v2
97fd2b6c0340 drm/amdgpu: When the VCN(1.0) block is suspended, powergating is explicitly enabled
2ee1296e0655 drm/nouveau: wait for the exclusive fence after the shared ones v2
e63109384796 uapi: fix linux/nfc.h userspace compilation errors
7b006d5a5aad nfc: uapi: use kernel size_t to fix user-space builds
f68599581067 i2c: validate user data in compat ioctl
17f5a2bc2ffe fsl/fman: Fix missing put_device() call in fman_port_probe
20426341c071 selftests: net: using ping6 for IPv6 in udpgro_fwd.sh
6eb92fb14689 net/ncsi: check for error return from call to nla_put_u32
62320f472fc2 net: bridge: mcast: fix br_multicast_ctx_vlan_global_disabled helper
5943eb7bbac3 selftests: net: Fix a typo in udpgro_fwd.sh
676345fa9c55 selftests/net: udpgso_bench_tx: fix dst ip argument
f1157fe47992 net: bridge: mcast: add and enforce startup query interval minimum
a22ac8009f7e net: bridge: mcast: add and enforce query interval minimum
a780f0dd2507 net/mlx5e: Fix wrong features assignment in case of error
30a26a8c506f ionic: Initialize the 'lif->dbid_inuse' bitmap
a3dffd1d0677 drm/amd/display: Set optimize_pwr_state for DCN31
6af58ce9307f drm/amd/display: Send s0i2_rdy in stream_count == 0 optimization
a87eb54df52f igc: Fix TX timestamp support for non-MSI-X platforms
10597585d793 igc: Do not enable crosstimestamping for i225-V models
b85f751d71ae net/smc: fix kernel panic caused by race of smc_sock
85ce25935e06 net/smc: don't send CDC/LLC message if link not ready
238920381b89 NFC: st21nfca: Fix memory leak in device probe and remove
c1babfe1b810 net: lantiq_xrx200: fix statistics of received bytes
c903a963b7e6 net: ag71xx: Fix a potential double free in error handling paths
0d82faa347a1 net: usb: pegasus: Do not drop long Ethernet frames
cc70cbd3b155 net/smc: fix using of uninitialized completions
75799e71df1d sctp: use call_rcu to free endpoint
df06c8dd7aca selftests: Calculate udpgso segment count without header adjustment
027282344397 udp: using datalen to cap ipv6 udp max gso segments
07f16b17416a net/mlx5e: Delete forward rule for ct or sample action
aa584ad8fa29 net/mlx5e: Use tc sample stubs instead of ifdefs in source file
12813ba11bf0 net/mlx5e: Fix ICOSQ recovery flow for XSK
144dbcc14546 net/mlx5e: Fix interoperability between XSK and ICOSQ recovery flow
07f13d58a8ec net/mlx5e: Wrap the tx reporter dump callback to extract the sq
219419510c4e net/mlx5: Fix tc max supported prio for nic mode
5da639db8b71 net/mlx5: Fix SF health recovery flow
c0cc069899fb net/mlx5: Fix error print in case of IRQ request failed
4595dffccfa5 net/mlx5: DR, Fix NULL vs IS_ERR checking in dr_domain_init_resources
a68d72d899a2 scsi: lpfc: Terminate string in lpfc_debugfs_nvmeio_trc_write()
172fc0a7d7ab selinux: initialize proto variable in selinux_ip_postroute_compat()
f5cb610fa3d2 efi: Move efifb_setup_from_dmi() prototype from arch headers
5677e0772364 powerpc/ptdump: Fix DEBUG_WX since generic ptdump conversion
fc738764c9fa recordmcount.pl: fix typo in s390 mcount regex
919f5678bae1 ALSA: hda: intel-sdw-acpi: go through HDAS ACPI at max depth of 2
cce476954401 ALSA: hda: intel-sdw-acpi: harden detection of controller
62f0a61fcb8a memblock: fix memblock_phys_alloc() section mismatch error
ea48bffecc3e platform/x86: apple-gmux: use resource_size() with res
6964e81f11ce platform/mellanox: mlxbf-pmc: Fix an IS_ERR() vs NULL bug in mlxbf_pmc_map_counters
e96373f0a5f4 parisc: Clear stale IIR value on instruction access rights trap
0d76daf2013c net/sched: Extend qdisc control block with tc control block
80176f65fa28 tomoyo: use hwight16() in tomoyo_domain_quota_is_ok()
3fe6a63b5dbd tomoyo: Check exceeded quota early in tomoyo_domain_quota_is_ok().
e97d5549f842 Input: i8042 - enable deferred probe quirk for ASUS UM325UA
dd33054e4c18 Input: i8042 - add deferred probe support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index dd897d121f..f114e0ad4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "11651ef1c948677add527afd54c9f960a33884c8"
-SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
+SRCREV_machine ?= "4cf3777087098d1900d7b10f9fa902374e147243"
+SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.12"
+LINUX_VERSION ?= "5.15.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 85cdfd820a..1c41406f52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.12"
+LINUX_VERSION ?= "5.15.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0f7af34df7639ad8c513e6698d5f1a6081b55f77"
-SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
+SRCREV_machine:qemuarm ?= "d6eeaf39f3beb483733ff2970c901a94093d0b7d"
+SRCREV_machine ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d6c57ab0bc..b6f2fc3b4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1ed914708fb430667f06724b65aaa872d939bcc4"
-SRCREV_machine:qemuarm64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemumips ?= "e2e8b2e5f6f7fda78b8d7641810c0d04be150c0a"
-SRCREV_machine:qemuppc ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemuriscv64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemuriscv32 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemux86 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemux86-64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_machine:qemumips64 ?= "723cf54aff5756af97663c4a8a7bf0754d0d940e"
-SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
+SRCREV_machine:qemuarm ?= "aa48e73490dacca52a99928456050476765b56a7"
+SRCREV_machine:qemuarm64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemumips ?= "b15f476dfd5edc44300279429b7de25ec899c2a6"
+SRCREV_machine:qemuppc ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemuriscv64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemuriscv32 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemux86 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemux86-64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemumips64 ?= "e146f932b0ae0c3f764745df1c80aafa0136f276"
+SRCREV_machine ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "b1e4fff58196879307a8333086b63a68d7551e0a"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "25960cafa06e6fcd830e6c792e6a7de68c1e25ed"
+SRCREV_machine:class-devupstream ?= "734eb1fd2073f503f5c6b44f1c0d453ca6986b84"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.12"
+LINUX_VERSION ?= "5.15.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


