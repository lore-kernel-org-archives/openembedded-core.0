Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABA1CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.38027.1655842614661233111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lk3B3dXp;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id cw10so6103399ejb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rF+XyY0OGlQ6xuU4xeqh6cFeAqFS5NGKL2cvJbK7nbg=;
        b=lk3B3dXpmxK4O2F3JW/fWA8CF62NAlyb50bRdjfW26q/AdysdpneX8ouxQ9DSE291k
         UCEhdBGnV2Yone0UcbulhlAAhqTmP0ZRuteuzSvw4B3Dx0sH+NKyWq4n7usiThCKupmJ
         aeUc9SYVGpyGPhWrOihqUbKvK04nGHppgGW4hwJ6mKHgESv4FULiesYPvDMo23B7MkmE
         l/yt36MJJFhHCv+GcJIYZW+0pCcSkCT5ZzM9kOlnYZuIw3xvfPi7HV6imt3J9sEha/Is
         gqvtYSx79gsKZY13T5dOC07l8cdALwFgjdgbNQ8KYEqHktsZsrNRrh/DL4eIKAov42nc
         9Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rF+XyY0OGlQ6xuU4xeqh6cFeAqFS5NGKL2cvJbK7nbg=;
        b=kC3pVjFo0jXduwkGV+ErvpjnDgPb+W1uaOa9Ju1hhsRxq1QUuZHI9BrZLvtPveSrl/
         2BbjJArgQiCHG4lFdqVUzFBDCKSWSd5ce6AHFFzpBYklBfkL6YJM90bW/xy36OwMHVoZ
         U/vctXF7tCIR1eMVGATgTriva9OMxHcXiOWJ5GI11YboKQQ68M0/AqMtv4MJYBaYEgP2
         nuJWapohzTwueXAOG606E0aMkBdxylKGH9ZS2CFpV/uNvewGCNzmewiPlxHIy50xCJ6O
         n01/Csc56MKVjkL7AXzgP/+tF4vkjtDO6OLPpyhxN2bgvGui9A4zq6BrIF2GL2aJkUvf
         J1OA==
X-Gm-Message-State: AJIora8IrdhfxAoMs9ACLGhji+UiGuw/M9yAOvNWlqVnPJ5acYVBSFjG
	UMd04HJ22UBKzQc0lUqvI6IGzzlgcfTi4Q==
X-Google-Smtp-Source: 
 AGRyM1viINeM0HwTRtfVx3nKdTJJnaZEVvrs8b2BKAH6Q2MlciYaI0AmS9rdyBh3fs+SCCFRY7y7nw==
X-Received: by 2002:a17:906:65c8:b0:713:ee3e:254d with SMTP id
 z8-20020a17090665c800b00713ee3e254dmr27777490ejn.0.1655842612863;
        Tue, 21 Jun 2022 13:16:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/18] lttng-modules: update 2.13.3 -> 2.13.4
Date: Tue, 21 Jun 2022 22:16:26 +0200
Message-Id: <20220621201637.1378306-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167175

Drop backports; one of them (0009) is present only
on the master branch and not on 2.13 branch, and so
stays in the recipe.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...x-compaction-migratepages-event-name.patch |  37 ----
 ...emove-unused-tracepoints-v5.10-v5.15.patch |  44 -----
 ...g-Append-prev_state-to-tp-args-inste.patch |  59 ------
 ...vent-allow-same-provider-and-event-n.patch |  48 -----
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ------------------
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 -----
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 --------
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 -----
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 -------
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 -----
 ...n-cleanup-the-compaction-trace-event.patch | 106 ----------
 ...ules_2.13.3.bb => lttng-modules_2.13.4.bb} |  15 +-
 12 files changed, 2 insertions(+), 777 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.3.bb => lttng-modules_2.13.4.bb} (60%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
deleted file mode 100644
index e988f7a3d5..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c312bda00d2dc10ce5f6c1189acbefee5c6c8c6c Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Tue, 29 Mar 2022 16:34:07 -0400
-Subject: [PATCH 01/10] Fix: compaction migratepages event name
-
-The commit "fix: mm: compaction: fix the migration stats in trace_mm_compaction_migratepages() (v5.17)"
-
-Triggers this warning:
-
-    LTTng: event provider mismatch: The event name needs to start with provider name + _ + one or more letter, provider: compaction, event name: mm_compaction_migratepages
-
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I01c7485af765084dafb33bf33ae392e60bfbf1e7
----
- include/instrumentation/events/compaction.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
-index 340e41f5..15964537 100644
---- a/include/instrumentation/events/compaction.h
-+++ b/include/instrumentation/events/compaction.h
-@@ -98,7 +98,9 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
--LTTNG_TRACEPOINT_EVENT(mm_compaction_migratepages,
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-+
-+	compaction_migratepages,
- 
- 	TP_PROTO(unsigned long nr_all,
- 		unsigned int nr_succeeded),
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
deleted file mode 100644
index d27cbc314f..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 13e4c978d45237b8780f1de6d404812b3af26a49 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Thu, 2 Jun 2022 06:36:08 +0000
-Subject: [PATCH] fix: random: remove unused tracepoints (v5.10, v5.15)
-
-The following kernel commit has been back ported to v5.10.119 and v5.15.44.
-
-commit 14c174633f349cb41ea90c2c0aaddac157012f74
-Author: Jason A. Donenfeld <Jason@zx2c4.com>
-Date:   Thu Feb 10 16:40:44 2022 +0100
-
-  random: remove unused tracepoints
-
-  These explicit tracepoints aren't really used and show sign of aging.
-  It's work to keep these up to date, and before I attempted to keep them
-  up to date, they weren't up to date, which indicates that they're not
-  really used. These days there are better ways of introspecting anyway.
-
-Upstream-Status: Pending
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- src/probes/Kbuild | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/probes/Kbuild b/src/probes/Kbuild
-index 5478447..31e0ee8 100644
---- a/src/probes/Kbuild
-+++ b/src/probes/Kbuild
-@@ -204,7 +204,10 @@ endif
- 
- # Introduced in v3.6, remove in v5.18
- obj-$(CONFIG_LTTNG) +=  $(shell \
--    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
-+    if [ \( ! \( $(VERSION) -ge 6 \
-+      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
-+      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
-+      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119 \) \) \) \
-       -a \
-       $(VERSION) -ge 4 \
-       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
--- 
-2.32.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
deleted file mode 100644
index b41053b6bc..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9c5b8de32b5745f3ff31079c02da64595e101bee Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 17 May 2022 11:46:29 -0400
-Subject: [PATCH] fix: sched/tracing: Append prev_state to tp args instead
- (v5.18)
-
-See upstream commit :
-
-  commit 9c2136be0878c88c53dea26943ce40bb03ad8d8d
-  Author: Delyan Kratunov <delyank@fb.com>
-  Date:   Wed May 11 18:28:36 2022 +0000
-
-    sched/tracing: Append prev_state to tp args instead
-
-    Commit fa2c3254d7cf (sched/tracing: Don't re-read p->state when emitting
-    sched_switch event, 2022-01-20) added a new prev_state argument to the
-    sched_switch tracepoint, before the prev task_struct pointer.
-
-    This reordering of arguments broke BPF programs that use the raw
-    tracepoint (e.g. tp_btf programs). The type of the second argument has
-    changed and existing programs that assume a task_struct* argument
-    (e.g. for bpf_task_storage access) will now fail to verify.
-
-    If we instead append the new argument to the end, all existing programs
-    would continue to work and can conditionally extract the prev_state
-    argument on supported kernel versions.
-
-
-Upstream-Status: Backport
-
-Change-Id: Ife2ec88a8bea2743562590cbd357068d7773863f
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/sched.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
-index 339bec94..c1c3df15 100644
---- a/include/instrumentation/events/sched.h
-+++ b/include/instrumentation/events/sched.h
-@@ -356,11 +356,11 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
- LTTNG_TRACEPOINT_EVENT(sched_switch,
- 
- 	TP_PROTO(bool preempt,
--		unsigned int prev_state,
- 		struct task_struct *prev,
--		struct task_struct *next),
-+		struct task_struct *next,
-+		unsigned int prev_state),
- 
--	TP_ARGS(preempt, prev_state, prev, next),
-+	TP_ARGS(preempt, prev, next, prev_state),
- 
- 	TP_FIELDS(
- 		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
deleted file mode 100644
index 00367eebf8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a7eb2e3d0a4beb1ee80b132927641dd05ef2d542 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Mon, 4 Apr 2022 15:49:32 -0400
-Subject: [PATCH 02/10] Fix: tracepoint event: allow same provider and event
- name
-
-Using the same name for the provider (TRACE_SYSTEM) and event name
-causes a compilation error because the same identifiers are emitted
-twice.
-
-Fix this by prefixing the provider identifier with
-"__provider_event_desc___".
-
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I8cdf8f859e35b8bd5c19737860d12f1ed546dfc2
----
- include/lttng/tracepoint-event-impl.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/lttng/tracepoint-event-impl.h b/include/lttng/tracepoint-event-impl.h
-index 38b1dc43..dcb22247 100644
---- a/include/lttng/tracepoint-event-impl.h
-+++ b/include/lttng/tracepoint-event-impl.h
-@@ -1255,7 +1255,7 @@ static const struct lttng_kernel_event_desc __event_desc___##_map = {	\
- #define TP_ID1(_token, _system)	_token##_system
- #define TP_ID(_token, _system)	TP_ID1(_token, _system)
- 
--static const struct lttng_kernel_event_desc * const TP_ID(__event_desc___, TRACE_SYSTEM)[] = {
-+static const struct lttng_kernel_event_desc * const TP_ID(__provider_event_desc___, TRACE_SYSTEM)[] = {
- #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
- };
- 
-@@ -1274,8 +1274,8 @@ static const struct lttng_kernel_event_desc * const TP_ID(__event_desc___, TRACE
- /* non-const because list head will be modified when registered. */
- static __used struct lttng_kernel_probe_desc TP_ID(__probe_desc___, TRACE_SYSTEM) = {
- 	.provider_name = __stringify(TRACE_SYSTEM),
--	.event_desc = TP_ID(__event_desc___, TRACE_SYSTEM),
--	.nr_events = ARRAY_SIZE(TP_ID(__event_desc___, TRACE_SYSTEM)),
-+	.event_desc = TP_ID(__provider_event_desc___, TRACE_SYSTEM),
-+	.nr_events = ARRAY_SIZE(TP_ID(__provider_event_desc___, TRACE_SYSTEM)),
- 	.head = { NULL, NULL },
- 	.lazy_init_head = { NULL, NULL },
- 	.lazy = 0,
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
deleted file mode 100644
index afe514de82..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From 8e52fd71e693619f7a58de2692e59f0c826e9988 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 13:52:57 -0400
-Subject: [PATCH 03/10] fix: sched/tracing: Don't re-read p->state when
- emitting sched_switch event (v5.18)
-
-See upstream commit :
-
-  commit fa2c3254d7cfff5f7a916ab928a562d1165f17bb
-  Author: Valentin Schneider <valentin.schneider@arm.com>
-  Date:   Thu Jan 20 16:25:19 2022 +0000
-
-    sched/tracing: Don't re-read p->state when emitting sched_switch event
-
-    As of commit
-
-      c6e7bd7afaeb ("sched/core: Optimize ttwu() spinning on p->on_cpu")
-
-    the following sequence becomes possible:
-
-                          p->__state = TASK_INTERRUPTIBLE;
-                          __schedule()
-                            deactivate_task(p);
-      ttwu()
-        READ !p->on_rq
-        p->__state=TASK_WAKING
-                            trace_sched_switch()
-                              __trace_sched_switch_state()
-                                task_state_index()
-                                  return 0;
-
-    TASK_WAKING isn't in TASK_REPORT, so the task appears as TASK_RUNNING in
-    the trace event.
-
-    Prevent this by pushing the value read from __schedule() down the trace
-    event.
-
-Upstream-Status: Backport
-
-Change-Id: I46743cd006be4b4d573cae2d77df7d6d16744d04
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/sched.h | 88 +++++++++++++++++++++++---
- 1 file changed, 78 insertions(+), 10 deletions(-)
-
-diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
-index 91953a6f..339bec94 100644
---- a/include/instrumentation/events/sched.h
-+++ b/include/instrumentation/events/sched.h
-@@ -20,7 +20,37 @@
- #ifndef _TRACE_SCHED_DEF_
- #define _TRACE_SCHED_DEF_
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,15,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+
-+static inline long __trace_sched_switch_state(bool preempt,
-+		unsigned int prev_state,
-+		struct task_struct *p)
-+{
-+        unsigned int state;
-+
-+#ifdef CONFIG_SCHED_DEBUG
-+        BUG_ON(p != current);
-+#endif /* CONFIG_SCHED_DEBUG */
-+
-+        /*
-+         * Preemption ignores task state, therefore preempted tasks are always
-+         * RUNNING (we will not have dequeued if state != RUNNING).
-+         */
-+        if (preempt)
-+                return TASK_REPORT_MAX;
-+
-+        /*
-+         * task_state_index() uses fls() and returns a value from 0-8 range.
-+         * Decrement it by 1 (except TASK_RUNNING state i.e 0) before using
-+         * it for left shift operation to get the correct task->state
-+         * mapping.
-+         */
-+	state = __task_state_index(prev_state, p->exit_state);
-+
-+        return state ? (1 << (state - 1)) : state;
-+}
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,15,0))
- 
- static inline long __trace_sched_switch_state(bool preempt, struct task_struct *p)
- {
-@@ -321,43 +351,81 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
- /*
-  * Tracepoint for task switches, performed by the scheduler:
-  */
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- LTTNG_TRACEPOINT_EVENT(sched_switch,
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
- 	TP_PROTO(bool preempt,
--		 struct task_struct *prev,
--		 struct task_struct *next),
-+		unsigned int prev_state,
-+		struct task_struct *prev,
-+		struct task_struct *next),
- 
--	TP_ARGS(preempt, prev, next),
-+	TP_ARGS(preempt, prev_state, prev, next),
-+
-+	TP_FIELDS(
-+		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
-+		ctf_integer(pid_t, prev_tid, prev->pid)
-+		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
-+#ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
-+		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
- #else
--	TP_PROTO(struct task_struct *prev,
-+		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
-+#endif
-+		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
-+		ctf_integer(pid_t, next_tid, next->pid)
-+		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
-+	)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
-+
-+LTTNG_TRACEPOINT_EVENT(sched_switch,
-+
-+	TP_PROTO(bool preempt,
-+		 struct task_struct *prev,
- 		 struct task_struct *next),
- 
--	TP_ARGS(prev, next),
--#endif /* #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0)) */
-+	TP_ARGS(preempt, prev, next),
- 
- 	TP_FIELDS(
- 		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
- 		ctf_integer(pid_t, prev_tid, prev->pid)
- 		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
- #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
- 		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev))
- #else
- 		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev))
- #endif
-+		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
-+		ctf_integer(pid_t, next_tid, next->pid)
-+		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
-+	)
-+)
-+
- #else
-+
-+LTTNG_TRACEPOINT_EVENT(sched_switch,
-+
-+	TP_PROTO(struct task_struct *prev,
-+		 struct task_struct *next),
-+
-+	TP_ARGS(prev, next),
-+
-+	TP_FIELDS(
-+		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
-+		ctf_integer(pid_t, prev_tid, prev->pid)
-+		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
- #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
- 		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(prev))
- #else
- 		ctf_integer(long, prev_state, __trace_sched_switch_state(prev))
--#endif
- #endif
- 		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
- 		ctf_integer(pid_t, next_tid, next->pid)
- 		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
- 	)
- )
-+#endif
- 
- /*
-  * Tracepoint for a task being migrated:
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
deleted file mode 100644
index 9248ffe4ff..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 868e0b6db59159197c2cec3550fa4ad5e6572bc5 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 13:54:59 -0400
-Subject: [PATCH 04/10] fix: block: remove genhd.h (v5.18)
-
-See upstream commit :
-
-  commit 322cbb50de711814c42fb088f6d31901502c711a
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Mon Jan 24 10:39:13 2022 +0100
-
-    block: remove genhd.h
-
-    There is no good reason to keep genhd.h separate from the main blkdev.h
-    header that includes it.  So fold the contents of genhd.h into blkdev.h
-    and remove genhd.h entirely.
-
-Upstream-Status: Backport
-
-Change-Id: I7cf2aaa3a4c133320b95f2edde49f790f9515dbd
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/genhd.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/wrapper/genhd.h b/include/wrapper/genhd.h
-index 3c6dbcbe..4a59b68e 100644
---- a/include/wrapper/genhd.h
-+++ b/include/wrapper/genhd.h
-@@ -12,7 +12,11 @@
- #ifndef _LTTNG_WRAPPER_GENHD_H
- #define _LTTNG_WRAPPER_GENHD_H
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+#include <linux/blkdev.h>
-+#else
- #include <linux/genhd.h>
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
- #define LTTNG_GENHD_FL_HIDDEN GENHD_FL_HIDDEN
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
deleted file mode 100644
index 0751827613..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 2bc7cb7193124d20aa4e1b5dbad0410bfb97a470 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 14:12:13 -0400
-Subject: [PATCH 05/10] fix: scsi: block: Remove REQ_OP_WRITE_SAME support
- (v5.18)
-
-See upstream commit :
-
-  commit 73bd66d9c834220579c881a3eb020fd8917075d8
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Wed Feb 9 09:28:28 2022 +0100
-
-    scsi: block: Remove REQ_OP_WRITE_SAME support
-
-    No more users of REQ_OP_WRITE_SAME or drivers implementing it are left,
-    so remove the infrastructure.
-
-Upstream-Status: Backport
-
-Change-Id: Ifbff71f79f8b590436fc7cb79f82d90c6e033d84
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/block.h | 32 ++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
-index 3e1104d7..050a59a2 100644
---- a/include/instrumentation/events/block.h
-+++ b/include/instrumentation/events/block.h
-@@ -66,6 +66,37 @@ LTTNG_TRACEPOINT_ENUM(block_rq_type,
- #define lttng_bio_op(bio)	bio_op(bio)
- #define lttng_bio_rw(bio)	((bio)->bi_opf)
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+#ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
-+#define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
-+		ctf_enum(block_rq_type, type, rwbs,					      \
-+			( (op) == REQ_OP_WRITE ? RWBS_FLAG_WRITE : \
-+			( (op) == REQ_OP_DISCARD ? RWBS_FLAG_DISCARD :	      \
-+			( (op) == REQ_OP_SECURE_ERASE ? (RWBS_FLAG_DISCARD | RWBS_FLAG_SECURE) : \
-+			( (op) == REQ_OP_FLUSH ? RWBS_FLAG_FLUSH :	      \
-+			( (op) == REQ_OP_READ ? RWBS_FLAG_READ :	      \
-+			( 0 ))))))					      \
-+			| ((rw) & REQ_RAHEAD ? RWBS_FLAG_RAHEAD : 0)	      \
-+			| ((rw) & REQ_SYNC ? RWBS_FLAG_SYNC : 0)	      \
-+			| ((rw) & REQ_META ? RWBS_FLAG_META : 0)	      \
-+			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
-+			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
-+#else
-+#define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
-+		ctf_integer(type, rwbs,					      \
-+			( (op) == REQ_OP_WRITE ? RWBS_FLAG_WRITE : \
-+			( (op) == REQ_OP_DISCARD ? RWBS_FLAG_DISCARD :	      \
-+			( (op) == REQ_OP_SECURE_ERASE ? (RWBS_FLAG_DISCARD | RWBS_FLAG_SECURE) : \
-+			( (op) == REQ_OP_FLUSH ? RWBS_FLAG_FLUSH :	      \
-+			( (op) == REQ_OP_READ ? RWBS_FLAG_READ :	      \
-+			( 0 ))))))					      \
-+			| ((rw) & REQ_RAHEAD ? RWBS_FLAG_RAHEAD : 0)	      \
-+			| ((rw) & REQ_SYNC ? RWBS_FLAG_SYNC : 0)	      \
-+			| ((rw) & REQ_META ? RWBS_FLAG_META : 0)	      \
-+			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
-+			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
-+#endif /* CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM */
-+#else
- #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
- #define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
- 		ctf_enum(block_rq_type, type, rwbs,					      \
-@@ -95,6 +126,7 @@ LTTNG_TRACEPOINT_ENUM(block_rq_type,
- 			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
- 			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
- #endif /* CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM */
-+#endif
- 
- #elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,1,0))
- 
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
deleted file mode 100644
index 9c2f70d4af..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 369d82bb1746447514c877088d7c5fd0f39140f8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 14:33:42 -0400
-Subject: [PATCH 06/10] fix: random: remove unused tracepoints (v5.18)
-
-See upstream commit :
-
-  commit 14c174633f349cb41ea90c2c0aaddac157012f74
-  Author: Jason A. Donenfeld <Jason@zx2c4.com>
-  Date:   Thu Feb 10 16:40:44 2022 +0100
-
-    random: remove unused tracepoints
-
-    These explicit tracepoints aren't really used and show sign of aging.
-    It's work to keep these up to date, and before I attempted to keep them
-    up to date, they weren't up to date, which indicates that they're not
-    really used. These days there are better ways of introspecting anyway.
-
-Upstream-Status: Backport
-
-Change-Id: I3b8c3e2732e7efdd76ce63204ac53a48784d0df6
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- src/probes/Kbuild | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/probes/Kbuild b/src/probes/Kbuild
-index e26b4359..8d6ff0f2 100644
---- a/src/probes/Kbuild
-+++ b/src/probes/Kbuild
-@@ -187,8 +187,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
-   CFLAGS_lttng-probe-printk.o += -Wframe-larger-than=2200
- endif
- 
-+# Introduced in v3.6, remove in v5.18
- obj-$(CONFIG_LTTNG) +=  $(shell \
--    if [ $(VERSION) -ge 4 \
-+    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
-+      -a \
-+      $(VERSION) -ge 4 \
-       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
-       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge 2 \) \
-       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge 9 \) \
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
deleted file mode 100644
index effd37ffe1..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 3c46ddc134621dba65030263aa321dd6bdae3ba3 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 15:02:10 -0400
-Subject: [PATCH 07/10] fix: kprobes: Use rethook for kretprobe if possible
- (v5.18)
-
-See upstream commit :
-
-  commit 73f9b911faa74ac5107879de05c9489c419f41bb
-  Author: Masami Hiramatsu <mhiramat@kernel.org>
-  Date:   Sat Mar 26 11:27:05 2022 +0900
-
-    kprobes: Use rethook for kretprobe if possible
-
-    Use rethook for kretprobe function return hooking if the arch sets
-    CONFIG_HAVE_RETHOOK=y. In this case, CONFIG_KRETPROBE_ON_RETHOOK is
-    set to 'y' automatically, and the kretprobe internal data fields
-    switches to use rethook. If not, it continues to use kretprobe
-    specific function return hooks.
-
-Upstream-Status: Backport
-
-Change-Id: I2b7670dc04e4769c1e3c372582ad2f555f6d7a66
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/kprobes.h     | 17 +++++++++++++++++
- src/probes/lttng-kretprobes.c |  2 +-
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/include/wrapper/kprobes.h b/include/wrapper/kprobes.h
-index b546d615..51d32b7c 100644
---- a/include/wrapper/kprobes.h
-+++ b/include/wrapper/kprobes.h
-@@ -29,4 +29,21 @@ struct kretprobe *lttng_get_kretprobe(struct kretprobe_instance *ri)
- 
- #endif /* LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) */
- 
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+static inline
-+unsigned long lttng_get_kretprobe_retaddr(struct kretprobe_instance *ri)
-+{
-+	return get_kretprobe_retaddr(ri);
-+}
-+
-+#else
-+
-+static inline
-+unsigned long lttng_get_kretprobe_retaddr(struct kretprobe_instance *ri)
-+{
-+	return (unsigned long) ri->ret_addr;
-+}
-+#endif
-+
- #endif /* _LTTNG_WRAPPER_KPROBES_H */
-diff --git a/src/probes/lttng-kretprobes.c b/src/probes/lttng-kretprobes.c
-index 5cb2e953..565df739 100644
---- a/src/probes/lttng-kretprobes.c
-+++ b/src/probes/lttng-kretprobes.c
-@@ -81,7 +81,7 @@ int _lttng_kretprobes_handler(struct kretprobe_instance *krpi,
- 		int ret;
- 
- 		payload.ip = (unsigned long) lttng_get_kretprobe(krpi)->kp.addr;
--		payload.parent_ip = (unsigned long) krpi->ret_addr;
-+		payload.parent_ip = lttng_get_kretprobe_retaddr(krpi);
- 
- 		lib_ring_buffer_ctx_init(&ctx, event_recorder, sizeof(payload),
- 					 lttng_alignof(payload), &lttng_probe_ctx);
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
deleted file mode 100644
index 13c504b859..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e8d2f286b5b208ac8870d0a9c167b170e96169b3 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 15:08:48 -0400
-Subject: [PATCH 08/10] fix: scsi: core: Remove <scsi/scsi_request.h> (v5.18)
-
-See upstream commit :
-
-  commit 26440303310591e29121964ede0048583cb3126d
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Thu Feb 24 18:55:52 2022 +0100
-
-    scsi: core: Remove <scsi/scsi_request.h>
-
-    This header is empty now except for an include of <linux/blk-mq.h>, so
-    remove it.
-
-Upstream-Status: Backport
-
-Change-Id: Ic8ee3352f1e8bddfcd44c31be9b788db82f183aa
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/block.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
-index 050a59a2..882e6e08 100644
---- a/include/instrumentation/events/block.h
-+++ b/include/instrumentation/events/block.h
-@@ -11,9 +11,9 @@
- #include <linux/trace_seq.h>
- #include <lttng/kernel-version.h>
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0))
-+#if LTTNG_KERNEL_RANGE(4,11,0, 5,18,0)
- #include <scsi/scsi_request.h>
--#endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0)) */
-+#endif /* LTTNG_KERNEL_RANGE(4,11,0, 5,18,0) */
- 
- #ifndef _TRACE_BLOCK_DEF_
- #define _TRACE_BLOCK_DEF_
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
deleted file mode 100644
index 892d3f0d23..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From f9208dc00756dfa0a2f191799722030bdf3f793d Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 4 Apr 2022 15:14:01 -0400
-Subject: [PATCH 10/10] fix: mm: compaction: cleanup the compaction trace
- events (v5.18)
-
-See upstream commit :
-
-  commit abd4349ff9b8d242376b67711254221f64f447c7
-  Author: Baolin Wang <baolin.wang@linux.alibaba.com>
-  Date:   Tue Mar 22 14:45:56 2022 -0700
-
-    mm: compaction: cleanup the compaction trace events
-
-    As Steven suggested [1], we should access the pointers from the trace
-    event to avoid dereferencing them to the tracepoint function when the
-    tracepoint is disabled.
-
-    [1] https://lkml.org/lkml/2021/11/3/409
-
-Upstream-Status: Backport
-
-Change-Id: I6c08250df8596e8dbc76780ae5d95c899c12e6fe
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/compaction.h | 17 ++++++++++++++++-
- src/probes/Kbuild                           | 17 ++++++++++++++++-
- src/probes/lttng-probe-compaction.c         |  5 +++++
- 3 files changed, 37 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
-index 15964537..ecae39a8 100644
---- a/include/instrumentation/events/compaction.h
-+++ b/include/instrumentation/events/compaction.h
-@@ -97,7 +97,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
- 
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-+
-+	compaction_migratepages,
-+
-+	TP_PROTO(struct compact_control *cc,
-+		unsigned int nr_succeeded),
-+
-+	TP_ARGS(cc, nr_succeeded),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
-+		ctf_integer(unsigned long, nr_failed, cc->nr_migratepages - nr_succeeded)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
- 
- 	compaction_migratepages,
-diff --git a/src/probes/Kbuild b/src/probes/Kbuild
-index 8d6ff0f2..54784477 100644
---- a/src/probes/Kbuild
-+++ b/src/probes/Kbuild
-@@ -167,7 +167,22 @@ ifneq ($(CONFIG_BTRFS_FS),)
-   endif # $(wildcard $(btrfs_dep))
- endif # CONFIG_BTRFS_FS
- 
--obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
-+# A dependency on internal header 'mm/internal.h' was introduced in v5.18
-+compaction_dep = $(srctree)/mm/internal.h
-+compaction_dep_wildcard = $(wildcard $(compaction_dep))
-+compaction_dep_check = $(shell \
-+if [ \( $(VERSION) -ge 6 \
-+   -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
-+   -z "$(compaction_dep_wildcard)" ] ; then \
-+  echo "warn" ; \
-+else \
-+  echo "ok" ; \
-+fi ;)
-+ifeq ($(compaction_dep_check),ok)
-+  obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
-+else
-+  $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
-+endif # $(wildcard $(compaction_dep))
- 
- ifneq ($(CONFIG_EXT4_FS),)
-   ext4_dep = $(srctree)/fs/ext4/*.h
-diff --git a/src/probes/lttng-probe-compaction.c b/src/probes/lttng-probe-compaction.c
-index f8ddf384..ffaf45f0 100644
---- a/src/probes/lttng-probe-compaction.c
-+++ b/src/probes/lttng-probe-compaction.c
-@@ -10,6 +10,11 @@
- 
- #include <linux/module.h>
- #include <lttng/tracer.h>
-+#include <lttng/kernel-version.h>
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
-+#include "../mm/internal.h"
-+#endif
- 
- /*
-  * Create the tracepoint static inlines from the kernel to validate that our
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
similarity index 60%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index e049bdc6d2..90d48e5867 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -10,24 +10,13 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-compaction-migratepages-event-name.patch \
-           file://0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch \
-           file://0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch \
-           file://0004-fix-block-remove-genhd.h-v5.18.patch \
-           file://0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch \
-           file://0006-fix-random-remove-unused-tracepoints-v5.18.patch \
-           file://0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch \
-           file://0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
-           file://0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch \
-           file://0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
-          "
+           "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "7cf1acbb50b84116acc9b4281b81dcc2643d6018bbd1e8514ad1270239896c4b"
+SRC_URI[sha256sum] = "6159d00e4e1d59546eec8d4a67e1aa39c1084ceb5e5afeb666eab4b8a5b5a9ee"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.30.2


