Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E195C4706C
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.51766.1703168716660090727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fybAQYES;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78104f6f692so60381185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168715; x=1703773515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ljIQotyv15hg+X2b0D+Hd96axKJ+v/ATizkTUTmy8Y=;
        b=fybAQYESe4/d4OgVivTdWCE05QUktJsXV4EtjXQy1Fw0LCqWFxItAiRBZTGhtPXLUK
         ivgDlAfhrCK7KbjfZIR8bcIX4tA4RADtjTSswvJ21kiZMl1Zk2/68S8GP+52qg4m5nV6
         YDMvt/5EpDdLMP0mGasVd9TpJfKJGWhq1qq92bXja1297Q3vWiQSxuGnIa5JKx+QD0ik
         DuWTlSP8uH1pS1KF0WArKWDW2IHyrVsnJSNGa9YKNJkDTAP7D/iCH3a8CGcBW6rZpcdN
         kUYtQMZsUyo2dO0anIJ/p1oJ8Z6LoGYOHsRwZM9M0msp3dcZS4xEMfPu1gY+I11fynDS
         Sysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168715; x=1703773515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ljIQotyv15hg+X2b0D+Hd96axKJ+v/ATizkTUTmy8Y=;
        b=SN6rL6sJK/SL3KV7ca719WSUeVhe3pwOwE5ik9/dmbM9WTofsJvfLUe351l/Hvv8Sg
         LzJub2ZbTWzw5PXprMtQZDnWm+ImbG64B0Hkyz9v3qOqjaXBrABz0lLV5otxYobYIPMa
         8u5Onqo6mqmECqKjwhA0qqyTvVBuffbXCZBlzC7rjo8nQBqXOIfocdRoFVfgm+MBz6i+
         3gPnIBZVKZzRO/rZcfd7q22oWSB3RL4K3SPMMuJtYU62so3OhTJ5necPTuyZ3YfbMnro
         bUv2T11FcEqewd0w6Z0gFZmjoWUAs7WPaSHDHwE/a/UJo2jPmaOFLyhJldSTvMxlna8+
         fCOg==
X-Gm-Message-State: AOJu0YxyR2aNoDI3f8lJFcEH/WEU9b6CxTzTv7pBK2VOGMc6P2vtO8/u
	3HD1OKlT8kkz77OFlDStAIK7JUJo/toGLLmS
X-Google-Smtp-Source: AGHT+IHvVZCkpegzohBVIcO+l4W5CgOtl81HZ5G5b1XPSyNJZlxeo8T7XxwB8dViVG55jbhiNQTOpw==
X-Received: by 2002:a05:620a:948:b0:781:242d:3e98 with SMTP id w8-20020a05620a094800b00781242d3e98mr830529qkw.17.1703168715414;
        Thu, 21 Dec 2023 06:25:15 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto-rt/6.1: update to -rt18
Date: Thu, 21 Dec 2023 09:25:05 -0500
Message-Id: <3c5e91c440e98548e7224a98356d0815a4655bdb.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192832

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/6.1:

1/17 [
    Author: Tvrtko Ursulin
    Email: tvrtko.ursulin@intel.com
    Subject: drm/i915: Do not disable preemption for resets
    Date: Fri, 18 Aug 2023 22:45:25 -0400

    [commit 40cd2835ced288789a685aa4aa7bc04b492dcd45 in linux-rt-devel]

    Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
    preempt disable section over the hardware reset callback to prepare the
    driver for being able to reset from atomic contexts.

    In retrospect I can see that the work item at a time was about removing
    the struct mutex from the reset path. Code base also briefly entertained
    the idea of doing the reset under stop_machine in order to serialize
    userspace mmap and temporary glitch in the fence registers (see
    eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex"),
    but that never materialized and was soon removed in 2caffbf11762
    ("drm/i915: Revoke mmaps and prevent access to fence registers across
    reset") and replaced with a SRCU based solution.

    As such, as far as I can see, today we still have a requirement that
    resets must not sleep (invoked from submission tasklets), but no need to
    support invoking them from a truly atomic context.

    Given that the preemption section is problematic on RT kernels, since the
    uncore lock becomes a sleeping lock and so is invalid in such section,
    lets try and remove it. Potential downside is that our short waits on GPU
    to complete the reset may get extended if CPU scheduling interferes, but
    in practice that probably isn't a deal breaker.

    In terms of mechanics, since the preemption disabled block is being
    removed we just need to replace a few of the wait_for_atomic macros into
    busy looping versions which will work (and not complain) when called from
    non-atomic sections.

    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Cc: Chris Wilson <chris.p.wilson@intel.com>
    Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
    Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Link: https://lore.kernel.org/r/20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    [PG: backport from v6.4-rt ; minor context fixup caused by b7d70b8b06ed]
    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Clark Williams <williams@redhat.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/17 [
    Author: Clark Williams
    Email: clrkwllms@kernel.org
    Subject: 'Linux 6.1.33-rt11'
    Date: Mon, 12 Jun 2023 10:40:02 -0500

    Signed-off-by: Clark Williams <clrkwllms@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

5/17 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: io-mapping: don't disable preempt on RT in io_mapping_map_atomic_wc().
    Date: Fri, 10 Mar 2023 17:29:05 +0100

    io_mapping_map_atomic_wc() disables preemption and pagefaults for
    historical reasons.  The conversion to io_mapping_map_local_wc(), which
    only disables migration, cannot be done wholesale because quite some call
    sites need to be updated to accommodate with the changed semantics.

    On PREEMPT_RT enabled kernels the io_mapping_map_atomic_wc() semantics are
    problematic due to the implicit disabling of preemption which makes it
    impossible to acquire 'sleeping' spinlocks within the mapped atomic
    sections.

    PREEMPT_RT replaces the preempt_disable() with a migrate_disable() for
    more than a decade.  It could be argued that this is a justification to do
    this unconditionally, but PREEMPT_RT covers only a limited number of
    architectures and it disables some functionality which limits the coverage
    further.

    Limit the replacement to PREEMPT_RT for now.  This is also done
    kmap_atomic().

    Link: https://lkml.kernel.org/r/20230310162905.O57Pj7hh@linutronix.de
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Reported-by: Richard Weinberger <richard.weinberger@gmail.com>
      Link: https://lore.kernel.org/CAFLxGvw0WMxaMqYqJ5WgvVSbKHq2D2xcXTOgMCpgq9nDC-MWTQ@mail.gmail.com
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    (cherry picked from commit 7eb16f23b9a415f062db22739e59bb144e0b24ab)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

6/17 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: locking/rwbase: Mitigate indefinite writer starvation
    Date: Tue, 21 Mar 2023 17:11:40 +0100

    On PREEMPT_RT, rw_semaphore and rwlock_t locks are unfair to writers.
    Readers can indefinitely acquire the lock unless the writer fully acquired
    the lock, which might never happen if there is always a reader in the
    critical section owning the lock.

    Mel Gorman reported that since LTP-20220121 the dio_truncate test case
    went from having 1 reader to having 16 readers and that number of readers
    is sufficient to prevent the down_write ever succeeding while readers
    exist. Eventually the test is killed after 30 minutes as a failure.

    Mel proposed a timeout to limit how long a writer can be blocked until
    the reader is forced into the slowpath.

    Thomas argued that there is no added value by providing this timeout.  From
    a PREEMPT_RT point of view, there are no critical rw_semaphore or rwlock_t
    locks left where the reader must be preferred.

    Mitigate indefinite writer starvation by forcing the READER into the
    slowpath once the WRITER attempts to acquire the lock.

    Reported-by: Mel Gorman <mgorman@techsingularity.net>
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>
    Acked-by: Mel Gorman <mgorman@techsingularity.net>
    Link: https://lore.kernel.org/877cwbq4cq.ffs@tglx
    Link: https://lore.kernel.org/r/20230321161140.HMcQEhHb@linutronix.de
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    (cherry picked from commit 286deb7ec03d941664ac3ffaff58814b454adf65)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

7/17 [
    Author: Paolo Abeni
    Email: pabeni@redhat.com
    Subject: revert: "softirq: Let ksoftirqd do its job"
    Date: Mon, 8 May 2023 08:17:44 +0200

    Due to the mentioned commit, when the ksoftirqd processes take charge
    of softirq processing, the system can experience high latencies.

    In the past a few workarounds have been implemented for specific
    side-effects of the above:

    commit 1ff688209e2e ("watchdog: core: make sure the watchdog_worker is not deferred")
    commit 8d5755b3f77b ("watchdog: softdog: fire watchdog even if softirqs do not get to run")
    commit 217f69743681 ("net: busy-poll: allow preemption in sk_busy_loop()")
    commit 3c53776e29f8 ("Mark HI and TASKLET softirq synchronous")

    but the latency problem still exists in real-life workloads, see the
    link below.

    The reverted commit intended to solve a live-lock scenario that can now
    be addressed with the NAPI threaded mode, introduced with commit
    29863d41bb6e ("net: implement threaded-able napi poll loop support"),
    and nowadays in a pretty stable status.

    While a complete solution to put softirq processing under nice resource
    control would be preferable, that has proven to be a very hard task. In
    the short term, remove the main pain point, and also simplify a bit the
    current softirq implementation.

    Note that this change also reverts commit 3c53776e29f8 ("Mark HI and
    TASKLET softirq synchronous") and commit 1342d8080f61 ("softirq: Don't
    skip softirq execution when softirq thread is parking"), which are
    direct follow-ups of the feature commit. A single change is preferred to
    avoid known bad intermediate states introduced by a patch series
    reverting them individually.

    Link: https://lore.kernel.org/netdev/305d7742212cbe98621b16be782b0562f1012cb6.camel@redhat.com/
    Signed-off-by: Paolo Abeni <pabeni@redhat.com>
    Tested-by: Jason Xing <kerneljasonxing@gmail.com>
    Reviewed-by: Jakub Kicinski <kuba@kernel.org>
    Reviewed-by: Eric Dumazet <edumazet@google.com>
    Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Link: https://lore.kernel.org/r/57e66b364f1b6f09c9bc0316742c3b14f4ce83bd.1683526542.git.pabeni@redhat.com
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    (cherry picked from commit b8a04a538ed4755dc97c403ee3b8dd882955c98c)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

8/17 [
    Author: Peter Zijlstra
    Email: peterz@infradead.org
    Subject: debugobjects,locking: Annotate debug_object_fill_pool() wait type violation
    Date: Tue, 25 Apr 2023 17:03:13 +0200

    There is an explicit wait-type violation in debug_object_fill_pool()
    for PREEMPT_RT=n kernels which allows them to more easily fill the
    object pool and reduce the chance of allocation failures.

    Lockdep's wait-type checks are designed to check the PREEMPT_RT
    locking rules even for PREEMPT_RT=n kernels and object to this, so
    create a lockdep annotation to allow this to stand.

    Specifically, create a 'lock' type that overrides the inner wait-type
    while it is held -- allowing one to temporarily raise it, such that
    the violation is hidden.

    Reported-by: Vlastimil Babka <vbabka@suse.cz>
    Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Tested-by: Qi Zheng <zhengqi.arch@bytedance.com>
    Link: https://lkml.kernel.org/r/20230429100614.GA1489784@hirez.programming.kicks-ass.net
    (cherry picked from commit 0cce06ba859a515bd06224085d3addb870608b6d)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

9/17 [
    Author: Wander Lairson Costa
    Email: wander@redhat.com
    Subject: sched: avoid false lockdep splat in put_task_struct()
    Date: Wed, 14 Jun 2023 09:23:22 -0300

    In put_task_struct(), a spin_lock is indirectly acquired under the kernel
    stock. When running the kernel in real-time (RT) configuration, the
    operation is dispatched to a preemptible context call to ensure
    guaranteed preemption. However, if PROVE_RAW_LOCK_NESTING is enabled
    and __put_task_struct() is called while holding a raw_spinlock, lockdep
    incorrectly reports an "Invalid lock context" in the stock kernel.

    This false splat occurs because lockdep is unaware of the different
    route taken under RT. To address this issue, override the inner wait
    type to prevent the false lockdep splat.

    Signed-off-by: Wander Lairson Costa <wander@redhat.com>
    Suggested-by: Oleg Nesterov <oleg@redhat.com>
    Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Suggested-by: Peter Zijlstra <peterz@infradead.org>
    Cc: Steven Rostedt <rostedt@goodmis.org>
    Cc: Luis Goncalves <lgoncalv@redhat.com>
    Link: https://lore.kernel.org/r/20230614122323.37957-3-wander@redhat.com
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    (cherry picked from commit a5e446e728e89d5f5c5e427cc919bc7813c64c28)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

10/17 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: mm/page_alloc: Use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().
    Date: Fri, 23 Jun 2023 22:15:17 +0200

    __build_all_zonelists() acquires zonelist_update_seq by first disabling
    interrupts via local_irq_save() and then acquiring the seqlock with
    write_seqlock(). This is troublesome and leads to problems on
    PREEMPT_RT. The problem is that the inner spinlock_t becomes a sleeping
    lock on PREEMPT_RT and must not be acquired with disabled interrupts.

    The API provides write_seqlock_irqsave() which does the right thing in
    one step.
    printk_deferred_enter() has to be invoked in non-migrate-able context to
    ensure that deferred printing is enabled and disabled on the same CPU.
    This is the case after zonelist_update_seq has been acquired.

    There was discussion on the first submission that the order should be:
    	local_irq_disable();
    	printk_deferred_enter();
    	write_seqlock();

    to avoid pitfalls like having an unaccounted printk() coming from
    write_seqlock_irqsave() before printk_deferred_enter() is invoked. The
    only origin of such a printk() can be a lockdep splat because the
    lockdep annotation happens after the sequence count is incremented.
    This is exceptional and subject to change.

    It was also pointed that PREEMPT_RT can be affected by the printk
    problem since its write_seqlock_irqsave() does not really disable
    interrupts. This isn't the case because PREEMPT_RT's printk
    implementation differs from the mainline implementation in two important
    aspects:
    - Printing happens in a dedicated threads and not at during the
      invocation of printk().
    - In emergency cases where synchronous printing is used, a different
      driver is used which does not use tty_port::lock.

    Acquire zonelist_update_seq with write_seqlock_irqsave() and then defer
    printk output.

    Fixes: 1007843a91909 ("mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock")
    Acked-by: Michal Hocko <mhocko@suse.com>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Link: https://lore.kernel.org/r/20230623201517.yw286Knb@linutronix.de
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    (cherry picked from commit 4d1139baae8bc4fff3728d1d204bdb04c13dbe10)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

11/17 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: bpf: Remove in_atomic() from bpf_link_put().
    Date: Wed, 14 Jun 2023 10:34:30 +0200

    bpf_free_inode() is invoked as a RCU callback. Usually RCU callbacks are
    invoked within softirq context. By setting rcutree.use_softirq=0 boot
    option the RCU callbacks will be invoked in a per-CPU kthread with
    bottom halves disabled which implies a RCU read section.

    On PREEMPT_RT the context remains fully preemptible. The RCU read
    section however does not allow schedule() invocation. The latter happens
    in mutex_lock() performed by bpf_trampoline_unlink_prog() originated
    from bpf_link_put().

    It was pointed out that the bpf_link_put() invocation should not be
    delayed if originated from close(). It was also pointed out that other
    invocations from within a syscall should also avoid the workqueue.
    Everyone else should use workqueue by default to remain safe in the
    future (while auditing the code, every caller was preemptible except for
    the RCU case).

    Let bpf_link_put() use the worker unconditionally. Add
    bpf_link_put_direct() which will directly free the resources and is used
    by close() and from within __sys_bpf().

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
    Link: https://lore.kernel.org/bpf/20230614083430.oENawF8f@linutronix.de
    (cherry picked from commit ab5d47bd41b1db82c295b0e751e2b822b43a4b5a)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

12/17 [
    Author: Thomas Gleixner
    Email: tglx@linutronix.de
    Subject: posix-timers: Ensure timer ID search-loop limit is valid
    Date: Thu, 1 Jun 2023 20:58:47 +0200

    posix_timer_add() tries to allocate a posix timer ID by starting from the
    cached ID which was stored by the last successful allocation.

    This is done in a loop searching the ID space for a free slot one by
    one. The loop has to terminate when the search wrapped around to the
    starting point.

    But that's racy vs. establishing the starting point. That is read out
    lockless, which leads to the following problem:

    CPU0	  	      	     	   CPU1
    posix_timer_add()
      start = sig->posix_timer_id;
      lock(hash_lock);
      ...				   posix_timer_add()
      if (++sig->posix_timer_id < 0)
          			             start = sig->posix_timer_id;
         sig->posix_timer_id = 0;

    So CPU1 can observe a negative start value, i.e. -1, and the loop break
    never happens because the condition can never be true:

      if (sig->posix_timer_id == start)
         break;

    While this is unlikely to ever turn into an endless loop as the ID space is
    huge (INT_MAX), the racy read of the start value caught the attention of
    KCSAN and Dmitry unearthed that incorrectness.

    Rewrite it so that all id operations are under the hash lock.

    Reported-by: syzbot+5c54bd3eb218bb595aa9@syzkaller.appspotmail.com
    Reported-by: Dmitry Vyukov <dvyukov@google.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
    Link: https://lore.kernel.org/r/87bkhzdn6g.ffs@tglx

    (cherry picked from commit 8ce8849dd1e78dadcee0ec9acbd259d239b7069f)
    Signed-off-by: Clark Williams <clark.williams@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 8d07058b71..78e7dd4d13 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2fc300ad2664d72a382351afaa02208e3bcec857"
-SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
+SRCREV_machine ?= "4c0acd6ff800dc4d1630b11640984343bffe7825"
+SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index c0871532df..d91ed65999 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
+SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6564731da9..f431e4a937 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
 SRCREV_machine:qemux86-64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
 SRCREV_machine:qemumips64 ?= "a5de8564807b47662da3670c5b358a1494faef77"
 SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
+SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


