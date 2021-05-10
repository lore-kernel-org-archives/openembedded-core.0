Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.32417.1620657018549573468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rMbSo4Fu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so8265073oth.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H7y+xmHny14VcPp4jo2bIfZ0dDV2RCoMVsPcJ4L7viA=;
        b=rMbSo4Fu/WN8zc/YUA+uXT/C6J1YkVulpY+UKM9wQ7lSd0hCNzso+dFC6RafTHVRCE
         fICXSeRwycAmDQoTDwogwPX8z2p0ghsK2bURyLodmqeHOn1qhe4fz2NQxAP62UfsNGcx
         065nhmGpDLPj0tHmqxaJG0tgFkzq9ufR6IKW+fSfhZJBeX/RLp17H1sNaFgHWpfjuAex
         1Ed7beiFdpAjEcEKV3zbTUQHpd8SMCooIFqheKCRq9q8pzo1NuKStCQ17fXctujeL/i5
         Y824jpbUqH8z99t7nsYQf7mBCMRdaX1BT4e7y7308VIcQE1UWCcVMsHPv1mlUFi4tPU7
         4Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7y+xmHny14VcPp4jo2bIfZ0dDV2RCoMVsPcJ4L7viA=;
        b=cCKJu4Ztq5QEsrkYyJmwOd0ufz5vqgSZh/KjV/oE4DWYDhabs8w+ejsvzo3ZX/guSW
         KutB0xGRA5/pl30BM62Xk9iByVocc2+6492ddUKcdoLAGO0HTXWKUNGq4ieDCVYkuPCi
         ayoAFzaHUlHA1T9I4AVGejS1lPylI1Y+nMzYGAM9uLIRDwRYv/0XqyKx0HF/eCS4JmLu
         Dfw7ZzhogKgAHrMBDFm/uBVJxqoPmQjbBOKiQyC70oVbOEtZhiYJwyRCQcobsMiqza73
         qwWa7Wy6LRddShZH8iKvrDD/js95Ra0nR6kDJJBOOt5mO2GUuLwCjPTHBq/tpqfajfP2
         2MUw==
X-Gm-Message-State: AOAM531kCwmDyJYfH1wm7DELY1t+gkUFOXnlrJcDDGg2oxLxQKZATovE
	x/QXAF/jYa3yAtMXyyCe/vcOZdYgnTpebn82aG4=
X-Google-Smtp-Source: ABdhPJw/4oJoHRCVcmuEnDy4qBjedkwN72SHxKPF28e5g9WGMnAtEFrYJNmeB70Iu2Ug7nwuZibwGQ==
X-Received: by 2002:a9d:220a:: with SMTP id o10mr22450670ota.199.1620657017143;
        Mon, 10 May 2021 07:30:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/25] linux-yocto/5.4: update to v5.4.116
Date: Mon, 10 May 2021 04:28:48 -1000
Message-Id: <8dd9cfc0f95366b1ca7fca981d4ae238b6dcb92c.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 667352cc46429f3d8eca12cf93c26be2d26e5d74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fd44e171eb..79aff31770 100644
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
index cb71881144..f2f0ac0b56 100644
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
2.25.1

