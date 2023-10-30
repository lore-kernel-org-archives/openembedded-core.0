Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4F1C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 11:55:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.146922.1698666896933042813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 04:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acCTozJO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4084de32db5so36445735e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698666895; x=1699271695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFsDm+ji2D/4PVoQAZor/flM2nV/mrAEN3ZxbPbDuDk=;
        b=acCTozJOpxxRkBL0YKOmUUTX4NM/M40zfFNiPVI6DQpSjqt1ppYUh4OWPnyzfYGrg1
         ggNDjFrrHYxJAgRHvAl/kjoom2GwbW6Ln7tC6r3CFvfXnStE+6U3pi/mZ0uF/mRAi6M4
         CZO9UnEBU+xPz6/DbQ86PIpuftlC9LjMpbYQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698666895; x=1699271695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFsDm+ji2D/4PVoQAZor/flM2nV/mrAEN3ZxbPbDuDk=;
        b=Rm5OCMYI/1+HZaiJfRpYEM+qZ7qJA7QibnXjsKLZyysrOgHOKP1UtXgqfPkEsj5Z/3
         fK5rFPi+htxElioca6VluMEPh6GyeyXe7LoPjIIapH/rijjqX55VRbyGMLRvNnfMbXKg
         5xo7QSZa3VXNALB/4PfBHB5N566qetPSDdzdaFdI0B8DY8jZveTKZMti2WS/WrOQKpt0
         7Gd7q93H4E+qjDU1qbptHi6IapXDvYSOvh+qWR3AHMgwQ8e1s7aFTvYA3mHsU9vyk6mn
         SOwIgyCdIaBFPReebxYq1ROB02ljz58BF0Qwzl/9eK8uaUnGMiODruJo4/yBpfK9t8EL
         34Jg==
X-Gm-Message-State: AOJu0YwBgVbpgsnmWvCZIkZ65g2pT83wi7j/ENyHka6LbiyIoy0Mv18c
	tZbfRcBUhnCrAasVqst6MblMgfbK0JeE9UUmceU=
X-Google-Smtp-Source: AGHT+IFNO4zVbwpM8BHTYdeRfYm0symmaDmnIvcK7DTUOkUnt10/OMhxxOh4PBIxxzlqTT2EfeoVIw==
X-Received: by 2002:adf:d1e8:0:b0:32f:7d50:267e with SMTP id g8-20020adfd1e8000000b0032f7d50267emr4753040wrd.9.1698666894597;
        Mon, 30 Oct 2023 04:54:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:482a:b779:b769:fa72])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d4081000000b00323293bd023sm8072436wrp.6.2023.10.30.04.54.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 04:54:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 8.1.0 -> 8.1.2
Date: Mon, 30 Oct 2023 11:54:53 +0000
Message-Id: <20231030115453.1995317-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189793

Drop three backport patches as they're applied upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...u-native_8.1.0.bb => qemu-native_8.1.2.bb} |   0
 ...e_8.1.0.bb => qemu-system-native_8.1.2.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   5 +-
 ...t-data-in-bounds-in-iotlb_to_section.patch |  42 -----
 ...u-Use-async_run_on_cpu-in-tcg_commit.patch | 157 ------------------
 .../qemu/qemu/CVE-2023-42467.patch            |  49 ------
 .../qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb}     |   0
 7 files changed, 1 insertion(+), 252 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.0.bb => qemu-native_8.1.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.0.bb => qemu-system-native_8.1.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 rename meta/recipes-devtools/qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 78c495516f2..5ab2cb83b4d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,18 +29,15 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
-           file://0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch \
-           file://0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch \
            file://fixedmeson.patch \
            file://fixmips.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-	   file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55"
+SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch b/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
deleted file mode 100644
index 7380e16ab32..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 86e4f93d827d3c1efd00cd8a906e38a2c0f2b5bc Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Fri, 25 Aug 2023 14:06:58 -0700
-Subject: [PATCH] softmmu: Assert data in bounds in iotlb_to_section
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Acked-by: Alex Bennée <alex.bennee@linaro.org>
-Suggested-by: Alex Bennée <alex.bennee@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/86e4f93d827d3c1efd00cd8a906e38a2c0f2b5bc]
----
- softmmu/physmem.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/softmmu/physmem.c b/softmmu/physmem.c
-index 3df73542e1..7597dc1c39 100644
---- a/softmmu/physmem.c
-+++ b/softmmu/physmem.c
-@@ -2413,9 +2413,15 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
-     int asidx = cpu_asidx_from_attrs(cpu, attrs);
-     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
-     AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
--    MemoryRegionSection *sections = d->map.sections;
-+    int section_index = index & ~TARGET_PAGE_MASK;
-+    MemoryRegionSection *ret;
-+
-+    assert(section_index < d->map.sections_nb);
-+    ret = d->map.sections + section_index;
-+    assert(ret->mr);
-+    assert(ret->mr->ops);
- 
--    return &sections[index & ~TARGET_PAGE_MASK];
-+    return ret;
- }
- 
- static void io_mem_init(void)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch b/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
deleted file mode 100644
index 8289b459916..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 0d58c660689f6da1e3feff8a997014003d928b3b Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Fri, 25 Aug 2023 16:13:17 -0700
-Subject: [PATCH] softmmu: Use async_run_on_cpu in tcg_commit
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-After system startup, run the update to memory_dispatch
-and the tlb_flush on the cpu.  This eliminates a race,
-wherein a running cpu sees the memory_dispatch change
-but has not yet seen the tlb_flush.
-
-Since the update now happens on the cpu, we need not use
-qatomic_rcu_read to protect the read of memory_dispatch.
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1826
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1834
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1846
-Tested-by: Alex Bennée <alex.bennee@linaro.org>
-Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-
-Upstream-Status: Backport [0d58c660689f6da1e3feff8a997014003d928b3b]
----
- accel/tcg/cpu-exec-common.c | 30 ----------------------------
- include/exec/cpu-common.h   |  1 -
- softmmu/physmem.c           | 40 +++++++++++++++++++++++++++----------
- 3 files changed, 29 insertions(+), 42 deletions(-)
-
-Index: qemu-8.1.0/accel/tcg/cpu-exec-common.c
-===================================================================
---- qemu-8.1.0.orig/accel/tcg/cpu-exec-common.c
-+++ qemu-8.1.0/accel/tcg/cpu-exec-common.c
-@@ -33,36 +33,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
-     cpu_loop_exit(cpu);
- }
- 
--#if defined(CONFIG_SOFTMMU)
--void cpu_reloading_memory_map(void)
--{
--    if (qemu_in_vcpu_thread() && current_cpu->running) {
--        /* The guest can in theory prolong the RCU critical section as long
--         * as it feels like. The major problem with this is that because it
--         * can do multiple reconfigurations of the memory map within the
--         * critical section, we could potentially accumulate an unbounded
--         * collection of memory data structures awaiting reclamation.
--         *
--         * Because the only thing we're currently protecting with RCU is the
--         * memory data structures, it's sufficient to break the critical section
--         * in this callback, which we know will get called every time the
--         * memory map is rearranged.
--         *
--         * (If we add anything else in the system that uses RCU to protect
--         * its data structures, we will need to implement some other mechanism
--         * to force TCG CPUs to exit the critical section, at which point this
--         * part of this callback might become unnecessary.)
--         *
--         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
--         * only protects cpu->as->dispatch. Since we know our caller is about
--         * to reload it, it's safe to split the critical section.
--         */
--        rcu_read_unlock();
--        rcu_read_lock();
--    }
--}
--#endif
--
- void cpu_loop_exit(CPUState *cpu)
- {
-     /* Undo the setting in cpu_tb_exec.  */
-Index: qemu-8.1.0/include/exec/cpu-common.h
-===================================================================
---- qemu-8.1.0.orig/include/exec/cpu-common.h
-+++ qemu-8.1.0/include/exec/cpu-common.h
-@@ -133,7 +133,6 @@ static inline void cpu_physical_memory_w
- {
-     cpu_physical_memory_rw(addr, (void *)buf, len, true);
- }
--void cpu_reloading_memory_map(void);
- void *cpu_physical_memory_map(hwaddr addr,
-                               hwaddr *plen,
-                               bool is_write);
-Index: qemu-8.1.0/softmmu/physmem.c
-===================================================================
---- qemu-8.1.0.orig/softmmu/physmem.c
-+++ qemu-8.1.0/softmmu/physmem.c
-@@ -680,8 +680,7 @@ address_space_translate_for_iotlb(CPUSta
-     IOMMUTLBEntry iotlb;
-     int iommu_idx;
-     hwaddr addr = orig_addr;
--    AddressSpaceDispatch *d =
--        qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
-+    AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
- 
-     for (;;) {
-         section = address_space_translate_internal(d, addr, &addr, plen, false);
-@@ -2412,7 +2411,7 @@ MemoryRegionSection *iotlb_to_section(CP
- {
-     int asidx = cpu_asidx_from_attrs(cpu, attrs);
-     CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
--    AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
-+    AddressSpaceDispatch *d = cpuas->memory_dispatch;
-     int section_index = index & ~TARGET_PAGE_MASK;
-     MemoryRegionSection *ret;
- 
-@@ -2487,23 +2486,42 @@ static void tcg_log_global_after_sync(Me
-     }
- }
- 
-+static void tcg_commit_cpu(CPUState *cpu, run_on_cpu_data data)
-+{
-+    CPUAddressSpace *cpuas = data.host_ptr;
-+
-+    cpuas->memory_dispatch = address_space_to_dispatch(cpuas->as);
-+    tlb_flush(cpu);
-+}
-+
- static void tcg_commit(MemoryListener *listener)
- {
-     CPUAddressSpace *cpuas;
--    AddressSpaceDispatch *d;
-+    CPUState *cpu;
- 
-     assert(tcg_enabled());
-     /* since each CPU stores ram addresses in its TLB cache, we must
-        reset the modified entries */
-     cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
--    cpu_reloading_memory_map();
--    /* The CPU and TLB are protected by the iothread lock.
--     * We reload the dispatch pointer now because cpu_reloading_memory_map()
--     * may have split the RCU critical section.
-+    cpu = cpuas->cpu;
-+
-+    /*
-+     * Defer changes to as->memory_dispatch until the cpu is quiescent.
-+     * Otherwise we race between (1) other cpu threads and (2) ongoing
-+     * i/o for the current cpu thread, with data cached by mmu_lookup().
-+     *
-+     * In addition, queueing the work function will kick the cpu back to
-+     * the main loop, which will end the RCU critical section and reclaim
-+     * the memory data structures.
-+     *
-+     * That said, the listener is also called during realize, before
-+     * all of the tcg machinery for run-on is initialized: thus halt_cond.
-      */
--    d = address_space_to_dispatch(cpuas->as);
--    qatomic_rcu_set(&cpuas->memory_dispatch, d);
--    tlb_flush(cpuas->cpu);
-+    if (cpu->halt_cond) {
-+        async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
-+    } else {
-+        tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
-+    }
- }
- 
- static void memory_map_init(void)
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
deleted file mode 100644
index 86ab7cf81a6..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
-From: Thomas Huth <thuth@redhat.com>
-Date: Thu, 5 Oct 2023 06:01:10 +0000
-Subject: [PATCH] hw/scsi/scsi-disk: Disallow block sizes smaller than 512
- [CVE-2023-42467]
-
-We are doing things like
-
-    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);
-
-in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
-the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
-with a division by 0 exception. Thus disallow block sizes of 256
-bytes to avoid this situation.
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1813
-CVE: 2023-42467
-Signed-off-by: Thomas Huth <thuth@redhat.com>
-Message-ID: <20230925091854.49198-1-thuth@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-CVE: CVE-2023-42467
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- hw/scsi/scsi-disk.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
-index e0d79c796..477ee2bcd 100644
---- a/hw/scsi/scsi-disk.c
-+++ b/hw/scsi/scsi-disk.c
-@@ -1628,9 +1628,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
-          * Since the existing code only checks/updates bits 8-15 of the block
-          * size, restrict ourselves to the same requirement for now to ensure
-          * that a block size set by a block descriptor and then read back by
--         * a subsequent SCSI command will be the same
-+         * a subsequent SCSI command will be the same. Also disallow a block
-+         * size of 256 since we cannot handle anything below BDRV_SECTOR_SIZE.
-          */
--        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
-+        if (bs && !(bs & ~0xfe00) && bs != s->qdev.blocksize) {
-             s->qdev.blocksize = bs;
-             trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
-         }
---
-2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.0.bb b/meta/recipes-devtools/qemu/qemu_8.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.2.bb
-- 
2.39.2


