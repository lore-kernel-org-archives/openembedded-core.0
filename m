Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A05C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:20:07 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.104108.1679671199608768452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/scjq/t;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 31so1876586qvc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679671198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot9JKgckhvKrddNPnTkC2jcjRckIslHnxZ168ag51wQ=;
        b=Q/scjq/t2pP0WiHbvhv809FFdNZNKdiSoUWpwigzYbVrxFh44ckYQsx8eCjLuTSiET
         wtLFiSy/wSj13fwkPpG42tevBTmDVfCktSzCzLHokMxDKDkNFRw4FgEE6qzHw7FcaLcc
         4wMX7ADz+lij4UKkUMkLjAPyGXpEOCDeJLJ9VHywk/Rpdyd2yixN/EB/9KvySPASYH+3
         qfu0Oo+Q+qzj24GJM4rHbpRwQji0M0ZaqlkAAIU6fJeOg9b/iyHPxOJDmgMJX8t9GVnS
         n2+yjFKr7DmIf4LXAN6W3AvEpQxhtkNCn3rCgQKTkj0fB94Ju8mOW0x/q+T2yjtAu/lM
         azUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679671198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot9JKgckhvKrddNPnTkC2jcjRckIslHnxZ168ag51wQ=;
        b=7cwZ+Bk2quDZ0SN3qa4ODlApyrpbGIb5LqSkntwUtvATbfGtxiOLneSWa3wycWVT8c
         EijfsVYJbsFBOKKZc3/nEpRg0M/P95lCtEZ2aYSpSMzYMcdjrN3w85llteqvRa7EUNZl
         9a6LleoqhrZIwb9BqK3nWz18BMhhYg88nfbEVe2u1ymjBauZBgkj54O21zryTk42c4rC
         KdiBtG13gtWLC0+iiFNBPv5USPpbAAvdzdYlj/S+8OMEJONLJk/YQWIo+QHtrvvs3nEC
         Z49rvZJ7jI4Bm1J+ogEFL3RbFEQemEFF6qtomrKPa5ApNEUtWPYsnFM5p2u7Xa/8WSok
         kWzA==
X-Gm-Message-State: AAQBX9dLVR07o1Ki9UJMyt1qqQreNxxHyZ2qZaRLf0mJ/yjAYUOXFLMs
	TlsAI3AcsAXqf2Qj0B85L4SHRFinZcxi0Q==
X-Google-Smtp-Source: AKy350ZKYYXe2ptYSDvwBz0U88LyUZdOQa14mFiFjjY51tO6FPelxFntqFvnVAgvltAwjtkt5mtOig==
X-Received: by 2002:a05:6214:e6e:b0:5c8:f391:9442 with SMTP id jz14-20020a0562140e6e00b005c8f3919442mr4901537qvb.18.1679671198450;
        Fri, 24 Mar 2023 08:19:58 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a148800b0073bb0ef3a8esm14316752qkj.21.2023.03.24.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:19:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [[PATCH][kirkstone] 1/7] linux-yocto/5.10: update to v5.10.162
Date: Fri, 24 Mar 2023 11:19:50 -0400
Message-Id: <20230324151956.1349749-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179053

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0fe4548663f7 Linux 5.10.162
    189556b05e17 io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups
    4ef66581d7fd eventfd: provide a eventfd_signal_mask() helper
    2f093775022b eventpoll: add EPOLL_URING_WAKE poll wakeup flag
    b76c5373f084 Revert "proc: don't allow async path resolution of /proc/self components"
    87cb08dc6b4f Revert "proc: don't allow async path resolution of /proc/thread-self components"
    a3025359ffa7 net: remove cmsg restriction from io_uring based send/recvmsg calls
    6ef2b4728a00 task_work: unconditionally run task_work from get_signal()
    c91ab04781f9 signal: kill JOBCTL_TASK_WORK
    788d0824269b io_uring: import 5.15-stable io_uring
    ed3005032993 task_work: add helper for more targeted task_work canceling
    831cb78a2a5e kernel: don't call do_exit() for PF_IO_WORKER threads
    9ded44b69c71 kernel: stop masking signals in create_io_thread()
    f0a5f0dc0131 x86/process: setup io_threads more like normal user space threads
    dd26e2cec74f arch: ensure parisc/powerpc handle PF_IO_WORKER in copy_thread()
    320c8057eceb arch: setup PF_IO_WORKER threads like PF_KTHREAD
    000de389ad7b entry/kvm: Exit to user mode when TIF_NOTIFY_SIGNAL is set
    0f735cf52bd0 kernel: allow fork with TIF_NOTIFY_SIGNAL pending
    4b4d2c79921a coredump: Limit what can interrupt coredumps
    90a2c3821bbf kernel: remove checking for TIF_NOTIFY_SIGNAL
    61bdeb142e8f task_work: remove legacy TWA_SIGNAL path
    6e2bce21acb4 alpha: fix TIF_NOTIFY_SIGNAL handling
    db911277a2b3 ARC: unbork 5.11 bootup: fix snafu in _TIF_NOTIFY_SIGNAL handling
    a1240cc413eb ia64: don't call handle_signal() unless there's actually a signal queued
    e1402ba4df20 sparc: add support for TIF_NOTIFY_SIGNAL
    78a53ff02656 riscv: add support for TIF_NOTIFY_SIGNAL
    57e833a0a03d nds32: add support for TIF_NOTIFY_SIGNAL
    751fedb9ba5d ia64: add support for TIF_NOTIFY_SIGNAL
    48e9e35d33d6 h8300: add support for TIF_NOTIFY_SIGNAL
    c82617d9decc c6x: add support for TIF_NOTIFY_SIGNAL
    30b78a17ac8f alpha: add support for TIF_NOTIFY_SIGNAL
    bf0b619593cd xtensa: add support for TIF_NOTIFY_SIGNAL
    1bee9dbbcabb arm: add support for TIF_NOTIFY_SIGNAL
    02d383a59cbf microblaze: add support for TIF_NOTIFY_SIGNAL
    19f3e328b4c6 hexagon: add support for TIF_NOTIFY_SIGNAL
    c2037d61dec2 csky: add support for TIF_NOTIFY_SIGNAL
    12284aec880f openrisc: add support for TIF_NOTIFY_SIGNAL
    3fde31e96262 sh: add support for TIF_NOTIFY_SIGNAL
    dc808ffd9778 um: add support for TIF_NOTIFY_SIGNAL
    0aef2ec06394 s390: add support for TIF_NOTIFY_SIGNAL
    8ca2e5709922 mips: add support for TIF_NOTIFY_SIGNAL
    abab3d4444b5 powerpc: add support for TIF_NOTIFY_SIGNAL
    45b365bc6c1b parisc: add support for TIF_NOTIFY_SIGNAL
    cf3c64867319 nios32: add support for TIF_NOTIFY_SIGNAL
    fe137f46d41f m68k: add support for TIF_NOTIFY_SIGNAL
    79a9991e87fe arm64: add support for TIF_NOTIFY_SIGNAL
    2dbb0354517b arc: add support for TIF_NOTIFY_SIGNAL
    4b1dcf8ec9b2 x86: Wire up TIF_NOTIFY_SIGNAL
    eb42e7b30431 task_work: Use TIF_NOTIFY_SIGNAL if available
    3c295bd2ddae entry: Add support for TIF_NOTIFY_SIGNAL
    d2136fc145be fs: provide locked helper variant of close_fd_get_file()
    57b20530363d file: Rename __close_fd_get_file close_fd_get_file
    214f80e25176 fs: make do_renameat2() take struct filename
    52cfde6bbf64 signal: Add task_sigpending() helper
    ad0b0137953a net: add accept helper not installing fd
    069ac28d9243 net: provide __sys_shutdown_sock() that takes a socket
    0b8cd5d814cb tools headers UAPI: Sync openat2.h with the kernel sources
    5683caa7350f fs: expose LOOKUP_CACHED through openat2() RESOLVE_CACHED
    0cf0ce8fb5b1 Make sure nd->path.mnt and nd->path.dentry are always valid pointers
    146fe79fff13 fix handling of nd->depth on LOOKUP_CACHED failures in try_to_unlazy*
    c1fe7bd3e1aa fs: add support for LOOKUP_CACHED
    36ec31201a3d saner calling conventions for unlazy_child()
    e86db87191d8 iov_iter: add helper to save iov_iter state
    1500fed00878 kernel: provide create_io_thread() helper
    1a9148dfd8e0 Linux 5.10.161
    eec1c3ade48b net: loopback: use NET_NAME_PREDICTABLE for name_assign_type
    f3fe6817156a Bluetooth: L2CAP: Fix u8 overflow
    7c3a523c9b19 HID: uclogic: Add HID_QUIRK_HIDINPUT_FORCE quirk
    1d5db0c322ae HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch V 10
    263a1782a618 HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch 10E
    a20b5eec0742 HID: ite: Add support for Acer S1002 keyboard-dock
    f2479c3daaab igb: Initialize mailbox message for VF reset
    9ff7aff40ef5 xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
    c8bf31a00f4f USB: serial: f81534: fix division by zero on line-speed change
    5b75a0041674 USB: serial: f81232: fix division by zero on line-speed change
    9895ce5ea283 USB: serial: cp210x: add Kamstrup RF sniffer PIDs
    398215f78338 USB: serial: option: add Quectel EM05-G modem
    c79538f32df1 usb: gadget: uvc: Prevent buffer overflow in setup handler
    8b2f86f82c0e udf: Fix extending file within last block
    db873b770d8a udf: Do not bother looking for prealloc extents if i_lenExtents matches i_size
    1a075f4a5494 udf: Fix preallocation discarding at indirect extent boundary
    1f7f7365aee8 udf: Discard preallocation before extending file with a hole

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4391c45fa9..c60ac9c1df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "609783e001b7bddeb8d66711b1a0617d6d40557e"
-SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
+SRCREV_machine ?= "58d7abb88dadc31a3bdcaabc324ae015d77642b7"
+SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.160"
+LINUX_VERSION ?= "5.10.162"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e7565e1cb8..319afe7d90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.160"
+LINUX_VERSION ?= "5.10.162"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "16e60c5bf21350952be933d49fde64889174b5cf"
-SRCREV_machine ?= "fb5efade4aa75991204b037c02c0b50f30fa1c18"
-SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
+SRCREV_machine:qemuarm ?= "000c7b1d423312bee3df57ad9fb21c14aebb72a4"
+SRCREV_machine ?= "51ac36b99b75676c2091010f956157988a8d5de7"
+SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c37b7f63c8..447e24845c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2bb2a540cf1d7af197613bd84e4ebe676dbcebb3"
-SRCREV_machine:qemuarm64 ?= "a985b377a910a67793055f0037899488f012bdbb"
-SRCREV_machine:qemumips ?= "19ba1e5a948b1ad4e12da79c243257308e40927f"
-SRCREV_machine:qemuppc ?= "7eb969488b7e00cdd5971ff0f89c85bdef9a6922"
-SRCREV_machine:qemuriscv64 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
-SRCREV_machine:qemuriscv32 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
-SRCREV_machine:qemux86 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
-SRCREV_machine:qemux86-64 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
-SRCREV_machine:qemumips64 ?= "be75e1ae0d7d66ed258fc648a82d09ac996d1aee"
-SRCREV_machine ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
-SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
+SRCREV_machine:qemuarm ?= "380b1e992eafa722835adb09cbb5af5ff875f99f"
+SRCREV_machine:qemuarm64 ?= "5c57336460ee51401b72702b59900e488db6c43a"
+SRCREV_machine:qemumips ?= "8ab71234839a238d16fa117135de6e9b2b0c078e"
+SRCREV_machine:qemuppc ?= "1b1dea5d2e11efd49f323fd5ebcf368ad0bbb370"
+SRCREV_machine:qemuriscv64 ?= "353f388471e281c0f387436b035bfdcd2f468505"
+SRCREV_machine:qemuriscv32 ?= "353f388471e281c0f387436b035bfdcd2f468505"
+SRCREV_machine:qemux86 ?= "353f388471e281c0f387436b035bfdcd2f468505"
+SRCREV_machine:qemux86-64 ?= "353f388471e281c0f387436b035bfdcd2f468505"
+SRCREV_machine:qemumips64 ?= "d0d18a95acb1380e3f1173ff10346d98a50a596d"
+SRCREV_machine ?= "353f388471e281c0f387436b035bfdcd2f468505"
+SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.160"
+LINUX_VERSION ?= "5.10.162"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


