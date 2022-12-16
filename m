Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F15EC3DA71
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 15:45:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.16182.1671205516375507133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 07:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBhuf8Oq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso2115285wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8lf3D4/byvUWXG66pG0dRGbyZC3K3RfPfKMbXjDtxA=;
        b=RBhuf8OqxoJFT8ihLkwVhPqGrXIG3OoEJNIq240ZE5n7wMHHy5UN6+l3e0TSLAQRJy
         FgVaQBHC7RfKmDzsXHuzDLEWZ9H5g9h82J0YeAVo8plEEmktZvrea5P8uztC4jKjT5dd
         LKyLTCgSW1Putiu+j52ZUWL+b/6uMY7uyKZXyRcXOolSvkitMI5VWWIv8FP5sZxsj7Vw
         8ZaFcb2ASvBdV1Ei9Ilms5rbHcfn0SQiEXhPp3nCTpQe5XOyaN8RdMGhZDlUMAtFNVHN
         ovjyrI/tf26tW+Rg079J4xG6iQ+JiMM7R6Xw2ndF3mTNcOaraRPVU/MbjNtWNjlec4rK
         xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8lf3D4/byvUWXG66pG0dRGbyZC3K3RfPfKMbXjDtxA=;
        b=OCZ92XxMHqzxrX79EVgC+kxsVwB4tkFDiuE+g3E3YCi0vgkVTEWrCNsg5EQqvvR75V
         SKtUP0R0ReDZWJNqQwKRdxEOg0p79PxI/yYD+anxyRCGn0Ed030RUYZGx2Nbt5khBm1z
         TlfIVcwF+esT/FLDDmzK6ahW1ZlTIytO925+jqqsj1jo15Mc2pw7IIys2g1m2EqIbXi8
         z6kv9sr4ONFVTXPUfqtnfhAmEJAIgRih9fII7FPdMqwNxZcdbpRcNfLj7nD8aKeEsUug
         wsU/ZJP8ug5nmsGbltIju5HuwJDIuWNhsweYBVhHJ8eLJlkE9M+VmW8aQ/jsrtMQVrKo
         V/Ug==
X-Gm-Message-State: ANoB5pld7zpSPhcZatwo4IKbRmydF6OqVhb7hEMJMutGSYLK8lbcctIn
	xofpzoyg/OLqn1oIqwPAvMp893dWXSQ=
X-Google-Smtp-Source: AA0mqf4yGfYwjVejuzzEo8SvFSY4bxO921pEws5Z6l+JyoG9SZZ5Fj4RbQ5+fL9gsMvnwTtEIEJJ0w==
X-Received: by 2002:a05:600c:354e:b0:3cf:5d41:b748 with SMTP id i14-20020a05600c354e00b003cf5d41b748mr25476721wmq.36.1671205514618;
        Fri, 16 Dec 2022 07:45:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v2-20020a05600c214200b003cfa81e2eb4sm2887836wml.38.2022.12.16.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 07:45:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH v2] qemu: update 7.1.0 -> 7.2.0
Date: Fri, 16 Dec 2022 16:45:11 +0100
Message-Id: <20221216154511.341054-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 15:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174759

Disable slirp by default: qemu no longer carries libslirp in-tree,
and enabling slirp requires providing external libslirp first
(available from e.g. meta-virtualization).

Another noteworthy change is:

x86: TCG support for AVX, AVX2, F16C, FMA3 and VAES instructions

... which means both meta-intel and qemu x86 targets can
now fully utilize Haswell-and-later instruction set with benefits
for performance in emulation and on silicon.

Changelog:
https://wiki.qemu.org/ChangeLog/7.2

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...u-native_7.1.0.bb => qemu-native_7.2.0.bb} |  0
 ...e_7.1.0.bb => qemu-system-native_7.2.0.bb} |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           | 11 ++--
 ...ulip-Restrict-DMA-engine-to-memories.patch | 64 -------------------
 .../qemu/qemu/CVE-2022-3165.patch             | 59 -----------------
 .../qemu/qemu/arm-cpreg-fix.patch             | 27 --------
 .../qemu/{qemu_7.1.0.bb => qemu_7.2.0.bb}     |  4 +-
 8 files changed, 8 insertions(+), 161 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_7.1.0.bb => qemu-native_7.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_7.1.0.bb => qemu-system-native_7.2.0.bb} (96%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch
 rename meta/recipes-devtools/qemu/{qemu_7.1.0.bb => qemu_7.2.0.bb} (91%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index bb34d0deff..be2a381a39 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.39%"
 GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.36"
 LINUXLIBCVERSION ?= "5.19%"
-QEMUVERSION ?= "7.1%"
+QEMUVERSION ?= "7.2%"
 GOVERSION ?= "1.19%"
 LLVMVERSION ?= "15.%"
 RUSTVERSION ?= "1.65%"
diff --git a/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_7.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_7.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_7.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_7.2.0.bb
index 04c7c2a6ac..81818ce591 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_7.2.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native me
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie slirp \
+PACKAGECONFIG ??= "fdt alsa kvm pie \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0b24540bf9..a89894da5f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,13 +27,10 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
-           file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
-           file://arm-cpreg-fix.patch \
-           file://CVE-2022-3165.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6"
+SRC_URI[sha256sum] = "5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
@@ -70,12 +67,12 @@ do_install_ptest() {
 	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemle-aml.sh
 
 	# Strip the paths from the QEMU variable, we can use PATH
-	sed -i -e "s#^QEMU=.*/qemu-#QEMU=qemu-#g" ${D}${PTEST_PATH}/tests/tcg/*.mak
+	sed -i -e "s#^QEMU=.*/qemu-#QEMU=qemu-#g" ${D}${PTEST_PATH}/tests/tcg/*.mak ${D}${PTEST_PATH}/tests/tcg/*/*.mak
 
 	# Strip compiler flags as they break reproducibility
 	sed -i -e "s,^CC=.*,CC=gcc," \
 	       -e "s,^CCAS=.*,CCAS=gcc," \
-	       -e "s,^LD=.*,LD=ld," ${D}${PTEST_PATH}/tests/tcg/*.mak
+	       -e "s,^LD=.*,LD=ld," ${D}${PTEST_PATH}/tests/tcg/*.mak ${D}${PTEST_PATH}/tests/tcg/*/*.mak
 
 	# Update SRC_PATH variable to the right place on target
 	sed -i -e "s#^SRC_PATH=.*#SRC_PATH=${PTEST_PATH}#g" ${D}${PTEST_PATH}/tests/tcg/*.mak
@@ -198,7 +195,7 @@ PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
-PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
+PACKAGECONFIG[slirp] = "--enable-slirp,--disable-slirp,libslirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch b/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
deleted file mode 100644
index 6c85a77ba7..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-CVE: CVE-2022-2962
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5c5c50b0a73d78ffe18336c9996fef5eae9bbbb0 Mon Sep 17 00:00:00 2001
-From: Zheyu Ma <zheyuma97@gmail.com>
-Date: Sun, 21 Aug 2022 20:43:43 +0800
-Subject: [PATCH] net: tulip: Restrict DMA engine to memories
-
-The DMA engine is started by I/O access and then itself accesses the
-I/O registers, triggering a reentrancy bug.
-
-The following log can reveal it:
-==5637==ERROR: AddressSanitizer: stack-overflow
-    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
-    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
-    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
-    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
-    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
-    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
-    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
-    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
-    #8 0x5595435fb082 in dma_memory_rw_relaxed qemu/include/sysemu/dma.h:87:12
-    #9 0x5595435fb082 in dma_memory_rw qemu/include/sysemu/dma.h:130:12
-    #10 0x5595435fb082 in dma_memory_write qemu/include/sysemu/dma.h:171:12
-    #11 0x5595435fb082 in stl_le_dma qemu/include/sysemu/dma.h:272:1
-    #12 0x5595435fb082 in stl_le_pci_dma qemu/include/hw/pci/pci.h:910:1
-    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
-    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
-    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
-
-Fix this bug by restricting the DMA engine to memories regions.
-
-Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/tulip.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/tulip.c b/hw/net/tulip.c
-index 097e905bec..b9e42c322a 100644
---- a/hw/net/tulip.c
-+++ b/hw/net/tulip.c
-@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
- static void tulip_desc_read(TULIPState *s, hwaddr p,
-         struct tulip_descriptor *desc)
- {
--    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-+    const MemTxAttrs attrs = { .memory = true };
- 
-     if (s->csr[0] & CSR0_DBO) {
-         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
-@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
- static void tulip_desc_write(TULIPState *s, hwaddr p,
-         struct tulip_descriptor *desc)
- {
--    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-+    const MemTxAttrs attrs = { .memory = true };
- 
-     if (s->csr[0] & CSR0_DBO) {
-         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
deleted file mode 100644
index 3b4a6694c2..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-CVE: CVE-2022-3165
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From d307040b18bfcb1393b910f1bae753d5c12a4dc7 Mon Sep 17 00:00:00 2001
-From: Mauro Matteo Cascella <mcascell@redhat.com>
-Date: Sun, 25 Sep 2022 22:45:11 +0200
-Subject: [PATCH] ui/vnc-clipboard: fix integer underflow in
- vnc_client_cut_text_ext
-
-Extended ClientCutText messages start with a 4-byte header. If len < 4,
-an integer underflow occurs in vnc_client_cut_text_ext. The result is
-used to decompress data in a while loop in inflate_buffer, leading to
-CPU consumption and denial of service. Prevent this by checking dlen in
-protocol_client_msg.
-
-Fixes: CVE-2022-3165
-Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
-Reported-by: TangPeng <tangpeng@qianxin.com>
-Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
-Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 6a05d06147..acb3629cd8 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
-         if (len == 1) {
-             return 8;
-         }
-+        uint32_t dlen = abs(read_s32(data, 4));
-         if (len == 8) {
--            uint32_t dlen = abs(read_s32(data, 4));
-             if (dlen > (1 << 20)) {
-                 error_report("vnc: client_cut_text msg payload has %u bytes"
-                              " which exceeds our limit of 1MB.", dlen);
-@@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
-         }
- 
-         if (read_s32(data, 4) < 0) {
--            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
--                                    read_u32(data, 8), data + 12);
-+            if (dlen < 4) {
-+                error_report("vnc: malformed payload (header less than 4 bytes)"
-+                             " in extended clipboard pseudo-encoding.");
-+                vnc_client_error(vs);
-+                break;
-+            }
-+            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data + 12);
-             break;
-         }
-         vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch b/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch
deleted file mode 100644
index 071691f8ca..0000000000
--- a/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
-
-SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
-it with ARM_CP_EL3_NO_EL2_KEEP.
-
-Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04515.html]
-
----
- target/arm/helper.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: qemu-7.1.0/target/arm/helper.c
-===================================================================
---- qemu-7.1.0.orig/target/arm/helper.c
-+++ qemu-7.1.0/target/arm/helper.c
-@@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[
-       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
-     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
-       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
--      .access = PL2_RW, .type = ARM_CP_ALIAS,
-+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
-       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
-     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
-       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
diff --git a/meta/recipes-devtools/qemu/qemu_7.1.0.bb b/meta/recipes-devtools/qemu/qemu_7.2.0.bb
similarity index 91%
rename from meta/recipes-devtools/qemu/qemu_7.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_7.2.0.bb
index 42e133967e..9f7fad9886 100644
--- a/meta/recipes-devtools/qemu/qemu_7.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_7.2.0.bb
@@ -15,12 +15,12 @@ EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCU
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm pie slirp \
+    fdt sdl kvm pie \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
+PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 # ppc32 hosts are no longer supported in qemu
-- 
2.30.2


