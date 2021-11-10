Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A028AC433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:21 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.11542.1636549640985012623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQIXy7pP;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bq14so2395973qkb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vIpdZgJwe/ywVcl6KIWxCrPylWmzUPHE0pqI0o6LLY=;
        b=pQIXy7pPJLb/XN2s4wtzfUac2/HBLZtCDpMJyvrQvoblKABnY9Hy12g9sEdkKhmb1e
         pT0P7hhfKjMu1AVGY0JcpZVvSeb/+/1j5kEJvM+VhKbTZIKPGxNdtlcar36gxuGQvZCE
         e1p46ooLP95JtlNetJmv+owh/w7RxQaA+EdEZgrWUgdGMEVtKM9pXiwmu+zQEHXvzdgk
         z6tiQQUraESA9mkMKQ0/zEgAd03yEG2JGP8UPZwe5EKUdvzhfAFm/nJrvu3KkTN8BtWQ
         pWb9a6+TopqItX8KVrjA/ha77BX4S7kVHgSj4QZZx/D6KARZfYEOOUc+c5nv5C8nGok8
         4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vIpdZgJwe/ywVcl6KIWxCrPylWmzUPHE0pqI0o6LLY=;
        b=DYXbG3hcdRYg0tq/juDbXeuQDwae6sR4TFrhZg41VwXtJJVTQ8yU18LZ7Tje0uaxAz
         cWVo83QQbUpgebEZjM/UVpR2udWkhSjNV1GjDm6gGQwmH9ALa9Olk0j6Gvk3Dft9b4JR
         dlk0e8pQYWikzL0BoAC7hR+FXdsFcNeHfCnSnWz6gesr9e8z+3j9I7rdDBI763FAnr0V
         ZzvcnuIE0OUXVrPTIGyBdWsUDIxklsrqY4SYvI5vHt327Nx46lhYZO6n8MCM3wblM+i6
         azfL6f0hmzzpNv/MIB/uT7jm2lYuwlP0SFaeqUa6cg7xZfcAc+D9VGj4kUWFomXfrON+
         vOsA==
X-Gm-Message-State: AOAM532GL4dvlHCbpOWvYTGTDAnoVe/bDPpiJrWelGQnzmlgw3U3GHwl
	CAG7TKjyoktvL/V4vfmfAWgJ6xiKzN3Iow==
X-Google-Smtp-Source: 
 ABdhPJwqDJowTzFs9mB3SV94aHkp8V8IblO9l3clOeA8rJuezB0JBu+SDCIA8BMz3TSD/bEIu+tTLQ==
X-Received: by 2002:a37:ae83:: with SMTP id
 x125mr12402014qke.37.1636549639837;
        Wed, 10 Nov 2021 05:07:19 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto-rt/5.15: update to -rt17
Date: Wed, 10 Nov 2021 08:07:10 -0500
Message-Id: 
 <18ab54edd9547029a70e5a2b110b90b9d0eac3f6.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158066

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.15:

    6f51b8d2b7dc Add localversion for -RT release
    3c8ff0c09156 sysfs: Add /sys/kernel/realtime entry
    828d8f9b903f POWERPC: Allow to enable RT
    6db76b613e53 powerpc/stackprotector: work around stack-guard init from atomic
    44be16e0180a powerpc/kvm: Disable in-kernel MPIC emulation for PREEMPT_RT
    a5c27dfc178a powerpc/pseries/iommu: Use a locallock instead local_irq_save()
    dce767609e50 powerpc: traps: Use PREEMPT_RT
    9cad1f8c7dd7 ARM64: Allow to enable RT
    5bd881944e4f ARM: Allow to enable RT
    715792fbbaf7 tty/serial/pl011: Make the locking work on RT
    69221f2f5b91 tty/serial/omap: Make the locking RT aware
    5fa50218f3e3 arm64: signal: Use ARCH_RT_DELAYS_SIGNAL_SEND.
    c004c410d380 arm64/sve: Make kernel FPU protection RT friendly
    7ffcb4485981 arm64/sve: Delay freeing memory in fpsimd_flush_thread()
    322561563b01 KVM: arm/arm64: downgrade preempt_disable()d region to migrate_disable()
    fe5ed302a1ec ARM: enable irq in translation/section permission fault handlers
    f17af435c3a3 arch/arm64: Add lazy preempt support
    10e096c7a491 powerpc: Add support for lazy preemption
    5e15c21804be arm: Add support for lazy preemption
    abc04080e1b3 entry: Fix the preempt lazy fallout
    2fb1741e933b x86: Support for lazy preemption
    24b379de7afc x86/entry: Use should_resched() in idtentry_exit_cond_resched()
    860dbaa27ad1 sched: Add support for lazy preemption
    4d5c9c824eee */softirq: Disable softirq stacks on PREEMPT_RT
    2676f33e2cf4 generic/softirq: Disable softirq stacks on PREEMPT_RT
    1886700e5658 leds: trigger: Disable CPU trigger on PREEMPT_RT
    694e3f263964 drivers/block/zram: Replace bit spinlocks with rtmutex for -rt
    97f765c75d6d mm/zsmalloc: Replace bit spinlock and get_cpu_var() usage.
    49c7010ff12e tpm_tis: fix stall after iowrite*()s
    df583a002c38 virt: acrn: Remove unsued acrn_irqfds_mutex.
    a68737287907 smack: Guard smack_ipv6_lock definition within a SMACK_IPV6_PORT_LABELING block
    ac9df8459eda ASoC: mediatek: mt8195: Remove unsued irqs_lock.
    02bc2e3cbe09 genirq: update irq_set_irqchip_state documentation
    ac932078b2e6 x86: Enable RT also on 32bit
    e262f9f76c5b x86: Allow to enable RT
    fef570ba4596 x86: kvm Require const tsc for RT
    e5a9202c3535 signal/x86: Delay calling signals in atomic
    2c0f317da8b9 drm/i915: Drop the irqs_disabled() check
    06b3f43f370b drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
    ac58ec9af512 drm/i915/gt: Queue and wait for the irq_work item.
    aaa6ddcfd053 drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
    6db29073f209 drm/i915: Disable tracing points on PREEMPT_RT
    5d34e949e11c drm/i915: Don't check for atomic context on PREEMPT_RT
    0ca85efbe2e9 drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
    688ce2658570 drm/i915: Use preempt_disable/enable_rt() where recommended
    9a76a256848c drm/i915: Don't disable interrupts and pretend a lock as been acquired in __timeline_mark_lock().
    766248132ccf random: Make it work on rt
    ba411ba63b8e x86: stackprotector: Avoid random pool on rt
    3c158aab9acc panic: skip get_random_bytes for RT_FULL in init_oops_id
    bf099c9ff70f net: dev: always take qdisc's busylock in __dev_xmit_skb()
    783862056952 net: Dequeue in dev_cpu_dead() without the lock
    61793a50d51d net: Use skbufhead with raw lock
    4e369dc108af net/core: use local_bh_disable() in netif_rx_ni()
    8056c6bd6380 rcu: Delay RCU-selftests
    1372b981252b fs/dcache: disable preemption on i_dir_seq's write side
    8f35827f634d fs/dcache: use swait_queue instead of waitqueue
    dc26bf05c680 ptrace: fix ptrace vs tasklist_lock race
    54332013d985 signal: Revert ptrace preempt magic
    65309bca8d9c mm/memcontrol: Disable on PREEMPT_RT
    5d193966a444 u64_stats: Disable preemption on 32bit-UP/SMP with RT during updates
    9e7c9b1a7d21 softirq: Check preemption after reenabling interrupts
    0d4e38f0610e crypto: cryptd - add a lock instead preempt_disable/local_bh_disable
    4a01578f1878 sunrpc: Make svc_xprt_do_enqueue() use get_cpu_light()
    03f8b0f0eedb net: Remove preemption disabling in netif_rx()
    ddd725b42e48 mm/vmalloc: Another preempt disable region which sucks
    28545272667f scsi/fcoe: Make RT aware.
    dcb042c59ca4 md: raid5: Make raid5_percpu handling RT aware
    393999301a85 block/mq: do not invoke preempt_disable()
    8485ff82f922 kernel/sched: add {put|get}_cpu_light()
    274408c7b291 sched: Make preempt_enable_no_resched() behave like preempt_enable() on PREEMPT_RT
    9708837923a7 locking: Allow to include asm/spinlock_types.h from linux/spinlock_types_raw.h
    b5f1fc042d2f lockdep/selftests: Adapt ww-tests for PREEMPT_RT
    3e6dd28f0231 lockdep/selftests: Skip the softirq related tests on PREEMPT_RT
    0da6a4f59354 lockdep/selftests: Unbalanced migrate_disable() & rcu_read_lock()
    b29dc4a9ef20 lockdep/selftests: Add rtmutex to the last column
    db92f5fc3fb7 lockdep: Make it RT aware
    fae24609aafa rtmutex: Add rt_mutex_lock_nest_lock() and rt_mutex_lock_killable().
    9d8c380fa819 rtmutex: Add a special case for ww-mutex handling.
    d6b24f0f2a8a sched: Trigger warning if ->migration_disabled counter underflows.
    6e09a284f2a6 lockdep/selftests: Avoid using local_lock_{acquire|release}().
    bd833044483a locking: Remove rt_rwlock_is_contended()
    36839db14247 jump-label: disable if stop_machine() is used
    5a657ef837de tcp: Remove superfluous BH-disable around listening_hash
    c11095ec78ef mm: workingset: replace IRQ-off check with a lockdep assert.
    168e3d8875c7 cgroup: use irqsave in cgroup_rstat_flush_locked()
    639d2eb6493f sched: Move mmdrop to RCU on RT
    590419b10863 sched: Delay task stack freeing on RT
    37860896be2e sched: Move kprobes cleanup out of finish_task_switch()
    dc3565cd6bbd sched: Disable TTWU_QUEUE on RT
    77db91d4d2b5 sched: Limit the number of task migrations per batch on RT
    8ea3ab8bb409 locking/rt: Take RCU nesting into account for __might_resched()
    b2f56dfeab18 sched: Make cond_resched_lock() variants RT aware
    9bac73a04b71 sched: Make RCU nest depth distinct in __might_resched()
    4f3dd3cb71e5 sched: Make might_sleep() output less confusing
    b8c4ad5ceaec sched: Cleanup might_sleep() printks
    588c973bd55b sched: Remove preempt_offset argument from __might_sleep()
    5b8fbf83bb40 sched: Make cond_resched_*lock() variants consistent vs. might_sleep()
    8e4b532478f2 sched: Clean up the might_sleep() underscore zoo
    3a5e868f92f0 fscache: Use only one fscache_object_cong_wait.
    67ba86618a1e fs/namespace: Boost the mount_lock.lock owner instead of spinning on PREEMPT_RT.
    cad3bedc2a83 smp: Wake ksoftirqd on PREEMPT_RT instead do_softirq().
    394e3bdd3242 irq_poll: Use raise_softirq_irqoff() in cpu_dead notifier
    4de8f9d6a1ad irq_work: Also rcuwait for !IRQ_WORK_HARD_IRQ on PREEMPT_RT
    87e75faa338d irq_work: Handle some irq_work in a per-CPU thread on PREEMPT_RT
    d2100f67254d irq_work: Allow irq_work_sync() to sleep if irq_work() no IRQ support.
    ada60e0098ea sched/rt: Annotate the RT balancing logic irqwork as IRQ_WORK_HARD_IRQ
    f657de711e15 net: stats: Read the statistics in ___gnet_stats_copy_basic() instead of adding.
    0d3a9c303dd9 net: sched: remove one pair of atomic operations
    853f1349041a net: sched: fix logic error in qdisc_run_begin()
    68f3b93760b7 net: sched: Allow statistics reads from softirq.
    86e29a3d2d68 net: sched: Remove Qdisc::running sequence counter
    304640d0b862 net: sched: Merge Qdisc::bstats and Qdisc::cpu_bstats data types
    1c7a827367ee net: sched: Use _bstats_update/set() instead of raw writes
    22701ce1b59f net: sched: Protect Qdisc::bstats with u64_stats
    54538aff544a u64_stats: Introduce u64_stats_set()
    69534c384086 gen_stats: Move remaining users to gnet_stats_add_queue().
    e1f89d46623c mq, mqprio: Use gnet_stats_add_queue().
    d3968711bb65 gen_stats: Add gnet_stats_add_queue().
    c2b1af791919 gen_stats: Add instead Set the value in __gnet_stats_copy_basic().
    3d38b89d239a net/sched: sch_ets: properly init all active DRR list handles
    b59a9b759b1a kcov: Replace local_irq_save() with a local_lock_t.
    8e2db8a2201a kcov: Avoid enable+disable interrupts if !in_task().
    d244291fb820 kcov: Allocate per-CPU memory on the relevant node.
    6eec9f99da0e Documentation/kcov: Define `ip' in the example.
    e619eb9cb198 Documentation/kcov: Include types.h in the example.
    f002c820156b x86/softirq: Disable softirq stacks on PREEMPT_RT
    12b80085754b mm: Disable NUMA_BALANCING_DEFAULT_ENABLED and TRANSPARENT_HUGEPAGE on PREEMPT_RT
    a1411120989b mm/scatterlist: Replace the !preemptible warning in sg_miter_stop()
    56fb69cc8a0b mm: page_alloc: Use migrate_disable() in drain_local_pages_wq()
    39d1d6a46eaa mm: Allow only SLUB on PREEMPT_RT
    bf1b661248f6 crypto: testmgr - Only disable migration in crypto_disable_simd_for_test()
    ddd1767afd69 samples/kfifo: Rename read_lock/write_lock
    a6c921dd2368 net/core: disable NET_RX_BUSY_POLL on PREEMPT_RT
    96cc6b82ae54 mm: Disable zsmalloc on PREEMPT_RT
    f77af3465961 efi: Allow efi=runtime
    8b3cde535f8f efi: Disable runtime services on RT
    7082e94c5405 lockdep: Let lock_is_held_type() detect recursive read as read
    ffc314d30f16 genirq: Disable irqfixup/poll on PREEMPT_RT.
    1ec49f38b6ae genirq: Move prio assignment into the newly created thread
    e272fc66d6bc kthread: Move prio/affinite change into the newly created thread
    468813504d5a rcutorture: Avoid problematic critical section nesting on PREEMPT_RT
    e6a408241cee sched: Switch wait_task_inactive to HRTIMER_MODE_REL_HARD
    cd6bda4839a6 printk: Enhance the condition check of msleep in pr_flush()
    2ad1282d77e8 printk: add pr_flush()
    cd582486f3e8 printk: add console handover
    25f13bd1d07b printk: remove deferred printing
    2d440f3f2ee5 printk: move console printing to kthreads
    df0a27dbd128 printk: introduce kernel sync mode
    4efb519165f1 printk: use seqcount_latch for console_seq
    8653ea7d3c45 printk: call boot_delay_msec() in printk_delay()
    892cddfada1f printk: relocate printk_delay()
    e1ac77117990 serial: 8250: implement write_atomic
    967b98b7c528 kdb: only use atomic consoles for output mirroring
    36422a33e3b3 console: add write_atomic interface
    7b9055c4c17d printk: rename printk cpulock API and always disable interrupts
    3791dee37847 arm64: mm: Make arch_faults_on_old_pte() check for migratability
    e5b82790a28d sched: Introduce migratable()
    0cf3b776c423 rcu/tree: Protect rcu_rdp_is_offloaded() invocations on RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 81440b65fa..e79ff27ddc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+SRCREV_machine ?= "6f51b8d2b7dcecfffa6262c622bc252aa298ffbe"
+SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b2bd8e070c..2cf2209182 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "5fbef884c98a51679ab4ab566568b1e89123c011"
 SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e45208e436..af73fe3ed1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
 SRCREV_machine:qemux86-64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
 SRCREV_machine:qemumips64 ?= "2cf7c4b42019c88e1e6e56b660eacf355058f8b8"
 SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


