Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.33050.1620046483526041815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oYJhkmbI;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id a18so3502933qtj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vzGT+ijiVaPY2a2EJKxvaIJqXdzBkOkuZsEM0HMreo=;
        b=oYJhkmbIdrWX1jlkJFVredJm0WGwEoNSOJytBZRfOS4w8n8BvOXQWKArhCHHEuA0St
         ezanMjviXoejoHRjhe+h9zhS/cwT1wH1mvGS/Mfp5RiEBj7vFtjwv/x5NeZcB+6BkClK
         ewnPjus/qvnvOUFTP+Yxmlb0PWSh/xMxiptD0UH/NZFHgYvqpLjIFKGeKFv876KIgIRN
         fbFf+qWvoaltv3rRnbTT/eFUdPeAzGbtzGHYE4yDfdL/BGlX+/nW8+GpAXgclz5zvpoR
         OoHjqvr3B69Hl28WOYhPM+oV0P8BWztLScs9vQub7gzegsI+CyQ7tx3CbtB9Q2jPc9n9
         nTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vzGT+ijiVaPY2a2EJKxvaIJqXdzBkOkuZsEM0HMreo=;
        b=OyIOHxri8eCtu6zDKTBhTgw37N5p6xIDjJ5ydtAviu7aG+14D/cx84zAZyyqkW/8s0
         kyisJZITgaztPktumqIWMZlnMgKCWhOeXG+KR4wiejtzDGeM9DOSEs6kRkWxuJKSL8cd
         HTJBPgd1NT4yGg/Wj4nyAHubZoBvHwdVzGIrMbdpCFvc4ETiPCcAtbgkeI+WLbIMvTvS
         94icLIp8uDVbazlP8csj1VVCxcCwaXmAiKcF+E2YTpDDE3TqvxdL1yMjNtJw/oaubU1F
         Dj76lOjZdW0Q+CXUAtcDjDIqN9Wn2GUyLq+E3B2JO9ltYGVx9pk5NutAkWZ4wMpvz/hN
         AdzQ==
X-Gm-Message-State: AOAM533u1EQoWbBS7Umj3lSa4A1bifCgrVCIivB7igYBFlE3OtmWF/xQ
	NJ/XmBnlcnbQY3nKQmQpdlfnQKUfmAUtkw==
X-Google-Smtp-Source: ABdhPJzY1XhgyL3jiQOm9lxhJDInSzfFiFxDPEKjvOKfn+En5geLc3WMUImJjx90xegC2yCwgCe3wA==
X-Received: by 2002:a05:622a:1186:: with SMTP id m6mr16568770qtk.319.1620046482652;
        Mon, 03 May 2021 05:54:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/5.4: update to v5.4.116
Date: Mon,  3 May 2021 08:54:33 -0400
Message-Id: <39e6e12788b1d82c71de53512c5348e5bbd0e01b.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1620046297.git.bruce.ashfield@gmail.com>
References: <cover.1620046297.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    370636ffbb86 Linux 5.4.116
    e23967af130b bpf: Update selftests to reflect new error states
    ef4e68f0af04 bpf: Tighten speculative pointer arithmetic mask
    4dc6e55e282f bpf: Move sanitize_val_alu out of op switch
    876d1cec9369 bpf: Refactor and streamline bounds check into helper
    4158e5fea3b1 bpf: Improve verifier error messages for users
    15de0c537bf7 bpf: Rework ptr_limit into alu_limit and add common error path
    f7fbedc90909 bpf: Ensure off_reg has no mixed signed bounds for all types
    4a163b1c7053 bpf: Move off_reg into sanitize_ptr_alu
    19bfeb47e96b Linux 5.4.115
    af7099bad495 USB: CDC-ACM: fix poison/unpoison imbalance
    d7fad2ce15bd net: hso: fix NULL-deref on disconnect regression
    699017fe0de4 x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access
    b3962b4e8334 ia64: tools: remove duplicate definition of ia64_mf() on ia64
    763cbe5e1ebb ia64: fix discontig.c section mismatches
    3dce9c4bb546 csky: change a Kconfig symbol name to fix e1000 build error
    892f6bc55746 cavium/liquidio: Fix duplicate argument
    2ccca124620e xen-netback: Check for hotplug-status existence before watching
    78687d6a3213 s390/entry: save the caller of psw_idle
    026490fac496 net: geneve: check skb is large enough for IPv4/IPv6 header
    caaf9371ecad ARM: dts: Fix swapped mmc order for omap3
    be60afbb9136 HID: wacom: Assign boolean values to a bool variable
    116ee59ef886 HID: alps: fix error return code in alps_input_configured()
    a4e2b91cea52 HID: google: add don USB id
    aefb6ac6ac11 perf auxtrace: Fix potential NULL pointer dereference
    39638289595b perf/x86/kvm: Fix Broadwell Xeon stepping in isolation_ucodes[]
    319a06e58ed7 perf/x86/intel/uncore: Remove uncore extra PCI dev HSWEP_PCI_PCU_3
    82808cc02681 locking/qrwlock: Fix ordering in queued_write_lock_slowpath()
    c6eb92b37af1 arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS
    37ee803d7ed7 pinctrl: lewisburg: Update number of pins in community
    dbb355960ef9 gpio: omap: Save and restore sysconfig
    835c8d688e1e s390/ptrace: return -ENOSYS when invalid syscall is supplied

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 972b6306a6..939bef0ca9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da52117f6cbb53b6242803d432e8649a964f0435"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine ?= "b62ae8bedb024e67e7c5cda51840454a4170c858"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3886388ea9..e3750dd7f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "06631306658b18d4e29f721a43479d90effc3fc2"
-SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine_qemuarm ?= "80bd6016a9bdaed4b66ddffffa8c8e62d7c1f8a6"
+SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d2743638ad..38404a1935 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d62f2d60acebc640c2749532e1527d1f117003d6"
-SRCREV_machine_qemuarm64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemumips ?= "ec6cca9ea72879a0d06ce1243e952a42a3435607"
-SRCREV_machine_qemuppc ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemuriscv64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemux86 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemux86-64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemumips64 ?= "fd8bb72df12890ec21b27b83e26492ba527ebea3"
-SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine_qemuarm ?= "e71df0530eefcac1b3248329e385bcefbad6336e"
+SRCREV_machine_qemuarm64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemumips ?= "07445052fdd15e60b30dc5ae9d162c2e6bba47d1"
+SRCREV_machine_qemuppc ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemuriscv64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemux86 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemux86-64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemumips64 ?= "b36d79d6f2aaf9dadec352f611e7b9becf2b9a55"
+SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

