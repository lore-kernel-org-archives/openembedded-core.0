Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E889C76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:08:57 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.104393.1679670533210239767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RRBI1VqZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id qh28so1777763qvb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvOBuQZsR2faGqmMJYQShL61zPj8jOFPTuoPpsdN1Eo=;
        b=RRBI1VqZs339C2bELefBs8bd7rgq945KJtRdOkd/3rpIjpLIQwWkCdowGGe9crKbGR
         mhz30p5XmgncR93bzeTvLLY3ItYq1SywPeVJmqsDePVrvRvNVB6voW2EetvLTVKrvNK4
         O63bE88zPTIgC7bO4wqFo7XpviFbxCxdbWtO11g5/cNxogSrQQq2giXGNMtorw5YVTqj
         mAm7BhYXps1Q3jrUA3oQSooQ1MRHAiEUascSA1e/uc3NRJeWOUZY3tR8/TDL5EzV7rEX
         Te/Bb/SGORqG65F2HF7L7p7tFYNRmC/7fly2HNhlG0vzY2u6W56wCOvVLEzyEcmpaQDQ
         TNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvOBuQZsR2faGqmMJYQShL61zPj8jOFPTuoPpsdN1Eo=;
        b=UHCvr0TT/GsZ/3wMz700fpqK12/lTmAWK/5UI/2M+/n4X/g0AT+xJxrBODGni5EluA
         KyvtKcrFgF3eOvKszkDfjAalnBfZScsUKeEn9E/JdS6WhJILZ2fKeGL0nnPqlRvoqoxJ
         ctC1L0Fhw//WMWFj8IpjXI2b9jFn3pPfwuDdqEqfxz3aOSW3+plWHUflY8xF0humEqAx
         3cx2isn83Ihb225+DI4KNXrFedRpFLZNfyOHqgKYaRXctovDhyNrkdONcbosCVjGqhHi
         rKX/hal0ScMk1XVt0RuuqEkg4EPZ2kft8c0XHG8fxOuAu3I1rGg8/XnJDqAfv8ZMfrfx
         fJ5w==
X-Gm-Message-State: AAQBX9cNTDntma2x1pSYzZDRDOLSeiQmVTfNBzDAdagtvvDD6v2iuG4x
	c12ruXnB5JO9vorJVrELgvOgG5OLb7xvzg==
X-Google-Smtp-Source: AKy350aUB9WTwp7kNbml5voA1KTmXeF8zykiB/EtgJr+NqN1PO9VYU27ns46LqMUerFfpmQW/8AQvQ==
X-Received: by 2002:a05:6214:3016:b0:56e:a7d1:4d65 with SMTP id ke22-20020a056214301600b0056ea7d14d65mr3978651qvb.52.1679670532172;
        Fri, 24 Mar 2023 08:08:52 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.1: update to v6.1.15
Date: Fri, 24 Mar 2023 11:08:42 -0400
Message-Id: <f93fb930a76311757c3339b6e7772b81259e6055.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179042

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    42616e0f09fb Linux 6.1.15
    c87fb861ec18 USB: core: Don't hold device lock while reading the "descriptors" sysfs file
    c49bd6c2dd1b scripts/tags.sh: fix incompatibility with PCRE2
    a591d9fd7001 fs: use consistent setgid checks in is_sxid()
    89f5f21b960e attr: use consistent sgid stripping checks
    c1df288f4495 attr: add setattr_should_drop_sgid()
    e44f23ef9160 fs: move should_remove_suid()
    18c2750856dc attr: add in_group_or_capable()
    118ad80d27d9 drm/amd/display: Properly reuse completion structure
    c9d3eb6151b3 usb: typec: pd: Remove usb_suspend_supported sysfs from sink PDO
    fb9a79557942 arm64: dts: uniphier: Fix property name in PXs3 USB node
    ec357cd3e8af usb: gadget: u_serial: Add null pointer check in gserial_resume
    ad5914431b70 USB: serial: option: add support for VW/Skoda "Carstick LTE"
    d9651c258d66 usb: dwc3: pci: add support for the Intel Meteor Lake-M
    075e2099c32c drm/amd/display: Fix race condition in DPIA AUX transfer
    4da108082a32 drm/amd/display: Move DCN314 DOMAIN power control to DMCUB
    a595a81df673 vc_screen: don't clobber return value in vcs_read
    ea4c208efea4 net: Remove WARN_ON_ONCE(sk->sk_forward_alloc) from sk_stream_kill_queues().
    d879a777d148 bpf: bpf_fib_lookup should not return neigh in NUD_FAILED state
    f2173508b195 PM: sleep: Avoid using pr_cont() in the tasks freezing code
    0c2f28f01fce x86/cpu: Add Lunar Lake M
    bcc844436312 selftests: ocelot: tc_flower_chains: make test_vlan_ingress_modify() more comprehensive
    56b6ea55f1dc HID: Ignore battery for ELAN touchscreen 29DF on HP
    a03cc84f70a0 ASoC: codecs: es8326: Fix DTS properties reading
    0412fe1deab1 HID: core: Fix deadloop in hid_apply_multiplier.
    b7641733a4a1 neigh: make sure used and confirmed times are valid
    6595071a3604 ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port
    39cdf021fa05 ASoC: SOF: amd: Fix for handling spurious interrupts from DSP
    8988889aaeb5 powerpc: Don't select ARCH_WANTS_NO_INSTR
    ce77f44cb9ad IB/hfi1: Assign npages earlier
    d06e776698ad ASoC: rt715-sdca: fix clock stop prepare timeout issue
    46abcdf96db2 arm64: dts: rockchip: align rk3399 DMC OPP table with bindings
    07c5877e1444 btrfs: send: limit number of clones and allocated memory size
    91210aca68f3 pinctrl: amd: Fix debug output for debounce time
    fdbcacfe495d ACPI: NFIT: fix a potential deadlock during NFIT teardown
    1b7730f20355 HID: Ignore battery for Elan touchscreen on Asus TP420IA
    0773ecf7bcda HID: elecom: add support for TrackBall 056E:011C
    860a9c0509db arm64: dts: rockchip: fix probe of analog sound card on rock-3a
    6a63f9795f6e arm64: dts: rockchip: add missing #interrupt-cells to rk356x pcie2x1
    59770f4b5237 ARM: dts: rockchip: add power-domains property to dp node on rk3288
    69eca8dd3c61 arm64: dts: rockchip: drop unused LED mode property from rk3328-roc-cc
    fd606d611560 arm64: dts: rockchip: reduce thermal limits on rk3399-pinephone-pro
    0b892d8fe90b Fix XFRM-I support for nested ESP tunnels

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index f0e3614c8a..6598b423ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fb6c0ef43abf097dcb4c5c94f0609c2f3e3f339b"
-SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
+SRCREV_machine ?= "8e1d6bb01a46293b6b60b203b2efc941b5fa8f6e"
+SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.14"
+LINUX_VERSION ?= "6.1.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 7e372bce49..14be758f6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.14"
+LINUX_VERSION ?= "6.1.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
+SRCREV_machine ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index be31a22524..876c141506 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -14,25 +14,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "129155997616e25e7221ed259fa75282e46a00b6"
-SRCREV_machine:qemuarm64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemuarm ?= "9aa65d42312580ec8b118252765ce1e121838206"
+SRCREV_machine:qemuarm64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
 SRCREV_machine:qemuloongarch64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemumips ?= "aa98067af82a03ef5223e9c116506030a732eb24"
-SRCREV_machine:qemuppc ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_machine:qemuriscv64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_machine:qemuriscv32 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_machine:qemux86 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_machine:qemux86-64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_machine:qemumips64 ?= "dfe8ca1dc8dcd94f4959923650ccc6d84e94dc50"
-SRCREV_machine ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
-SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
+SRCREV_machine:qemumips ?= "9842d12e2a958990b434e65cd0e60cd4a403103a"
+SRCREV_machine:qemuppc ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_machine:qemuriscv64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_machine:qemuriscv32 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_machine:qemux86 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_machine:qemux86-64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_machine:qemumips64 ?= "9c8388933caf687ce8562000b8b964eb6d136b83"
+SRCREV_machine ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
+SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7d54cb2c26dad1264ecca85992bfe8984df4b7b5"
+SRCREV_machine:class-devupstream ?= "42616e0f09fb4e9a6c59892a227f7bdefbd2d6d3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -40,7 +40,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.14"
+LINUX_VERSION ?= "6.1.15"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


