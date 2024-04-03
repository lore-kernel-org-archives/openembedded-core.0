Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAF1CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 18:10:48 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.18744.1712167839449203604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 11:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaqizHAO;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-476d13e405fso67388137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712167838; x=1712772638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfP1Bpuo/+AdAr6PelCuvjmmHW81pjANBkxoWsRd8R8=;
        b=ZaqizHAO64l/EZxygU8qYYYsvEanYWOK+mKmESj//xJhKRFrdZuiy23S0avPTUvq/C
         GhYRBHzKx77jeO/3YBYrQ6AGG0sHkLCGjqQu+/g5mVwykY22ct6z9NPhXtyIlivJOnUd
         cuNRVfkqtINFDEQcGQrFazWoipd2iXwwViXih6HvsgMMKeFOAmvSD5sjgyaJJtbPaJkT
         fWnupHDDicgm0hF66j/c3jqdPulUXMRHSzDv71wWIa8ihF1VxLtQav9NBv5bj4Gp2pbD
         OmUg3kmYFl4hMrNNRsgwknNGjpD3Zw1mAKml932yYAaRE+W64X7T27sSF9GUoMHyUdAb
         ynJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167838; x=1712772638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfP1Bpuo/+AdAr6PelCuvjmmHW81pjANBkxoWsRd8R8=;
        b=bN+m3VsXcn5FOyzjCMh6HutjaNrelGL7DREClbpxgxNu8gmLIGmZLip+4qAFnbU/5H
         DFn2fHcsjkp5U2UImieXDaE6KVXIaT3j7nzsXDsA+3pTPiAkAkgN3vE9OY+yersd/rgA
         zDpEiFJwpldg1m66/Rph7xzCmVCBy67l4NN5NeOxoq5ZqnWTqmll4cQTZxbGsx/qxdX9
         grYm5ssHgF8XxoMxnY34y5EJM//bznsbsdNTKhbfuw4kwF3YYQe7/TsDbEx6BvqC6RfU
         Yk3rbAw1MQeSvsuQKk2StOD1Q3MZurc4O3eLl3lr41uED2+kdwrbvxzivWnH6VI2+QWd
         xUWA==
X-Gm-Message-State: AOJu0YyLruKrE086Xx0wkqdBqqPqg+aiyN8zpSc0bx4T/+aQXiDgjgb8
	vlk67SlHevleBZYUaullNLQVEm40gK6oxg7MAVkCFXh9VVtjZYj0XvBtLZN3
X-Google-Smtp-Source: AGHT+IELyEYjHB8kzpFfwFPYSEBTlOn+8SoVOR6kzaI7J6QuhcQcCyzebQB5W5UXWtau6jy0soT9Rw==
X-Received: by 2002:a05:6102:1606:b0:479:b913:bd2 with SMTP id cu6-20020a056102160600b00479b9130bd2mr116144vsb.25.1712167837615;
        Wed, 03 Apr 2024 11:10:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id gy10-20020a056214242a00b00698c11f70d0sm6095650qvb.61.2024.04.03.11.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:10:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: update to v2.13.12
Date: Wed,  3 Apr 2024 14:10:32 -0400
Message-Id: <20240403181033.1575986-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403181033.1575986-1-bruce.ashfield@gmail.com>
References: <20240403181033.1575986-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197937

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We drop our previously backported patches for v6.8 kernels as they are
part of the 2.13.12 release of lttng and we add backports for v6.9+
kernels.

Bumping lttng-modules to version v2.13.12-7-g52eb2ee9, which comprises the following commits:

    52eb2ee9 Fix: dev_base_lock removed in linux 6.9-rc1
    175fe77c Fix: mm_compaction_migratepages changed in linux 6.9-rc1
    303434ab Fix: ASoC add component to set_bias_level events in linux 6.9-rc1
    88c4e0fe Fix: ASoC snd_doc_dapm on linux 6.9-rc1
    578ab207 Fix: build kvm probe on EL 8.4+
    057ad399 Fix: support ext4_journal_start on EL 8.4+
    3ca21738 Fix: correct RHEL range for kmem_cache_free define
    4ba4f0ec Version 2.13.12
    1124749b docs: Add supported versions and fix-backport policy
    c302cf1d docs: Add links to project resources
    d6b75831 Fix: Correct minimum version in jbd2 SLE kernel range
    9e6736d6 Fix: Handle recent SLE major version codes
    5d331562 Fix: build on sles15sp4
    f6800492 Compile fixes for RHEL 9.3 kernels
    d988f04a Fix: ext4_discard_preallocations changed in linux 6.8.0-rc3
    616c60b9 Fix: btrfs_get_extent flags and compress_type changed in linux 6.8.0-rc1
    8d195927 Fix: btrfs_chunk tracepoints changed in linux 6.8.0-rc1
    7e8d89d1 Fix: strlcpy removed in linux 6.8.0-rc1
    f4c1678d Fix: timer_start changed in linux 6.8.0-rc1
    60a1e809 Fix: sched_stat_runtime changed in linux 6.8.0-rc1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...x-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch |  93 ++++++++++++
 ...t_runtime-changed-in-linux-6.8.0-rc1.patch |  70 ----------
 ...ponent-to-set_bias_level-events-in-l.patch | 132 ++++++++++++++++++
 ...mer_start-changed-in-linux-6.8.0-rc1.patch | 100 -------------
 ...n_migratepages-changed-in-linux-6.9-.patch |  81 +++++++++++
 ...-strlcopy-removed-in-linux-6.8.0-rc1.patch |  46 ------
 ...tracepoints-changed-in-linux-6.8.0-r.patch | 124 ----------------
 ...v_base_lock-removed-in-linux-6.9-rc1.patch |  57 ++++++++
 ...tent-flags-and-compress_type-changed.patch |  88 ------------
 ..._preallocations-changed-in-linux-6.8.patch |  52 -------
 ...es_2.13.11.bb => lttng-modules_2.13.12.bb} |  12 +-
 11 files changed, 368 insertions(+), 487 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.11.bb => lttng-modules_2.13.12.bb} (72%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
new file mode 100644
index 0000000000..9d5fd0de60
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
@@ -0,0 +1,93 @@
+From fec007d9630e010062cf5699a08460f71f46b527 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 25 Mar 2024 08:54:42 -0400
+Subject: [PATCH 1/4] Fix: ASoC snd_doc_dapm on linux 6.9-rc1
+
+See upstream commit:
+
+    commit 7df3eb4cdb6bbfa482f51548b9fd47c2723c68ba
+    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+    Date:   Wed Mar 6 10:30:01 2024 +0100
+
+        ASoC: trace: add event to snd_soc_dapm trace events
+
+        Add the event value to the snd_soc_dapm_start and snd_soc_dapm_done trace
+        events to make them more informative.
+
+        Trace before:
+
+                   aplay-229   [000]   250.140309: snd_soc_dapm_start:   card=vscn-2046
+                   aplay-229   [000]   250.167531: snd_soc_dapm_done:    card=vscn-2046
+                   aplay-229   [000]   251.169588: snd_soc_dapm_start:   card=vscn-2046
+                   aplay-229   [000]   251.195245: snd_soc_dapm_done:    card=vscn-2046
+
+        Trace after:
+
+                   aplay-214   [000]   693.290612: snd_soc_dapm_start:   card=vscn-2046 event=1
+                   aplay-214   [000]   693.315508: snd_soc_dapm_done:    card=vscn-2046 event=1
+                   aplay-214   [000]   694.537349: snd_soc_dapm_start:   card=vscn-2046 event=2
+                   aplay-214   [000]   694.563241: snd_soc_dapm_done:    card=vscn-2046 event=2
+
+Upstream-Status: Backport [88c4e0fe Fix: ASoC snd_doc_dapm on linux 6.9-rc1]
+
+Change-Id: If0d33544b8dd1dfb3d12ca9390892190fc0444b0
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/asoc.h | 33 +++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/include/instrumentation/events/asoc.h b/include/instrumentation/events/asoc.h
+index 21d13a0f..5126d4c1 100644
+--- a/include/instrumentation/events/asoc.h
++++ b/include/instrumentation/events/asoc.h
+@@ -51,6 +51,38 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_card, snd_soc_bias_level_done,
+ 
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
++
++	TP_PROTO(struct snd_soc_card *card, int event),
++
++	TP_ARGS(card, event),
++
++	TP_FIELDS(
++		ctf_string(name, card->name)
++		ctf_integer(int, event, event)
++	)
++)
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_start,
++
++	asoc_snd_soc_dapm_start,
++
++	TP_PROTO(struct snd_soc_card *card, int event),
++
++	TP_ARGS(card, event)
++
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
++
++	asoc_snd_soc_dapm_done,
++
++	TP_PROTO(struct snd_soc_card *card, int event),
++
++	TP_ARGS(card, event)
++
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
+ 
+ 	TP_PROTO(struct snd_soc_card *card),
+@@ -81,6 +113,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
+ 	TP_ARGS(card)
+ 
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_widget,
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
deleted file mode 100644
index a0d932c7b7..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 9e59c2f6387aeb832ae3af3095f987529722e08f Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 22 Jan 2024 11:10:37 -0500
-Subject: [PATCH 1/5] Fix: sched_stat_runtime changed in linux 6.8.0-rc1
-
-See upstream commit:
-
-    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
-    Author: Peter Zijlstra <peterz@infradead.org>
-    Date:   Mon Nov 6 13:41:43 2023 +0100
-
-        sched: Remove vruntime from trace_sched_stat_runtime()
-
-        Tracing the runtime delta makes sense, observer can sum over time.
-        Tracing the absolute vruntime makes less sense, inconsistent:
-        absolute-vs-delta, but also vruntime delta can be computed from
-        runtime delta.
-
-        Removing the vruntime thing also makes the two tracepoint sites
-        identical, allowing to unify the code in a later patch.
-
-Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
-
-Change-Id: I24ebb4e06dbb646a1af75ac62b74f3821ff197de
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/instrumentation/events/sched.h | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
-index 066a0f8..24cf37c 100644
---- a/include/instrumentation/events/sched.h
-+++ b/include/instrumentation/events/sched.h
-@@ -646,6 +646,24 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
- 	     TP_ARGS(tsk, delay))
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+/*
-+ * Tracepoint for accounting runtime (time the task is executing
-+ * on a CPU).
-+ */
-+LTTNG_TRACEPOINT_EVENT(sched_stat_runtime,
-+
-+	TP_PROTO(struct task_struct *tsk, u64 runtime),
-+
-+	TP_ARGS(tsk, runtime),
-+
-+	TP_FIELDS(
-+		ctf_array_text(char, comm, tsk->comm, TASK_COMM_LEN)
-+		ctf_integer(pid_t, tid, tsk->pid)
-+		ctf_integer(u64, runtime, runtime)
-+	)
-+)
-+#else
- /*
-  * Tracepoint for accounting runtime (time the task is executing
-  * on a CPU).
-@@ -663,6 +681,7 @@ LTTNG_TRACEPOINT_EVENT(sched_stat_runtime,
- 		ctf_integer(u64, vruntime, vruntime)
- 	)
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,12,0) || \
- 	LTTNG_RT_KERNEL_RANGE(4,9,27,18, 4,10,0,0) || \
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
new file mode 100644
index 0000000000..6ea10ffc91
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
@@ -0,0 +1,132 @@
+From d8379ec6365a925db33cae94fb6783cdbdb6a922 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 25 Mar 2024 09:40:29 -0400
+Subject: [PATCH 2/4] Fix: ASoC add component to set_bias_level events in linux
+ 6.9-rc1
+
+See upstream commit:
+
+    commit 6ef46a69ec32fe1cf56de67742fcd01af4bf48af
+    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+    Date:   Wed Mar 6 10:30:00 2024 +0100
+
+        ASoC: trace: add component to set_bias_level trace events
+
+        The snd_soc_bias_level_start and snd_soc_bias_level_done trace events
+        currently look like:
+
+                   aplay-229   [000]  1250.140778: snd_soc_bias_level_start: card=vscn-2046 val=1
+                   aplay-229   [000]  1250.140784: snd_soc_bias_level_done: card=vscn-2046 val=1
+                   aplay-229   [000]  1250.140786: snd_soc_bias_level_start: card=vscn-2046 val=2
+                   aplay-229   [000]  1250.140788: snd_soc_bias_level_done: card=vscn-2046 val=2
+            kworker/u8:1-21    [000]  1250.140871: snd_soc_bias_level_start: card=vscn-2046 val=1
+            kworker/u8:0-11    [000]  1250.140951: snd_soc_bias_level_start: card=vscn-2046 val=1
+            kworker/u8:0-11    [000]  1250.140956: snd_soc_bias_level_done: card=vscn-2046 val=1
+            kworker/u8:0-11    [000]  1250.140959: snd_soc_bias_level_start: card=vscn-2046 val=2
+            kworker/u8:0-11    [000]  1250.140961: snd_soc_bias_level_done: card=vscn-2046 val=2
+            kworker/u8:1-21    [000]  1250.167219: snd_soc_bias_level_done: card=vscn-2046 val=1
+            kworker/u8:1-21    [000]  1250.167222: snd_soc_bias_level_start: card=vscn-2046 val=2
+            kworker/u8:1-21    [000]  1250.167232: snd_soc_bias_level_done: card=vscn-2046 val=2
+            kworker/u8:0-11    [000]  1250.167440: snd_soc_bias_level_start: card=vscn-2046 val=3
+            kworker/u8:0-11    [000]  1250.167444: snd_soc_bias_level_done: card=vscn-2046 val=3
+            kworker/u8:1-21    [000]  1250.167497: snd_soc_bias_level_start: card=vscn-2046 val=3
+            kworker/u8:1-21    [000]  1250.167506: snd_soc_bias_level_done: card=vscn-2046 val=3
+
+        There are clearly multiple calls, one per component, but they cannot be
+        discriminated from each other.
+
+        Change the ftrace events to also print the component name, to make it clear
+        which part of the code is involved. This requires changing the passed value
+        from a struct snd_soc_card, where the DAPM context is not kwown, to a
+        struct snd_soc_dapm_context where it is obviously known but the a card
+        pointer is also available.
+
+        With this change, the resulting trace becomes:
+
+                   aplay-247   [000]  1436.357332: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=1
+                   aplay-247   [000]  1436.357338: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=1
+                   aplay-247   [000]  1436.357340: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=2
+                   aplay-247   [000]  1436.357343: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=2
+            kworker/u8:4-215   [000]  1436.357437: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=1
+            kworker/u8:5-231   [000]  1436.357518: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=1
+            kworker/u8:5-231   [000]  1436.357523: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=1
+            kworker/u8:5-231   [000]  1436.357526: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=2
+            kworker/u8:5-231   [000]  1436.357528: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=2
+            kworker/u8:4-215   [000]  1436.383217: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=1
+            kworker/u8:4-215   [000]  1436.383221: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=2
+            kworker/u8:4-215   [000]  1436.383231: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=2
+            kworker/u8:5-231   [000]  1436.383468: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=3
+            kworker/u8:5-231   [000]  1436.383472: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=3
+            kworker/u8:4-215   [000]  1436.383503: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=3
+            kworker/u8:4-215   [000]  1436.383513: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=3
+
+Upstream-Status: Backport [303434ab Fix: ASoC add component to set_bias_level events in linux 6.9-rc1]
+
+Change-Id: I959f1680c002acdf29828b968d3975247f5433d8
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/asoc.h | 36 +++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+
+Index: lttng-modules-2.13.12/include/instrumentation/events/asoc.h
+===================================================================
+--- lttng-modules-2.13.12.orig/include/instrumentation/events/asoc.h
++++ lttng-modules-2.13.12/include/instrumentation/events/asoc.h
+@@ -10,6 +10,7 @@
+ #include <lttng/kernel-version.h>
+ 
+ #define DAPM_DIRECT "(direct)"
++#define DAPM_COMPONENT_NONE "(none)"
+ 
+ #ifndef _TRACE_ASOC_DEF
+ #define _TRACE_ASOC_DEF
+@@ -119,6 +120,40 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_context,
++
++	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
++
++	TP_ARGS(dapm, val),
++
++	TP_FIELDS(
++		ctf_string(name, dapm->card->name)
++		ctf_string(component, dapm->component ? dapm->component->name : DAPM_COMPONENT_NONE)
++		ctf_integer(int, val, val)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_start,
++
++	asoc_snd_soc_bias_level_start,
++
++	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
++
++	TP_ARGS(dapm, val)
++
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_done,
++
++	asoc_snd_soc_bias_level_done,
++
++	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
++
++	TP_ARGS(dapm, val)
++
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_card,
+ 
+ 	TP_PROTO(struct snd_soc_card *card, int val),
+@@ -150,6 +185,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
+ 	TP_ARGS(card, val)
+ 
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
deleted file mode 100644
index 5a4294db02..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From d52ab4b9a71a4bef535dadb8e7062112ac5c0c88 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 22 Jan 2024 11:33:39 -0500
-Subject: [PATCH 2/5] Fix: timer_start changed in linux 6.8.0-rc1
-
-See upstream commit
-
-    commit dbcdcb62b59db2cf6a24113873b90da15c6f0b19
-    Author: Anna-Maria Behnsen <anna-maria@linutronix.de>
-    Date:   Fri Dec 1 10:26:26 2023 +0100
-
-        tracing/timers: Enhance timer_start tracepoint
-
-        For starting a timer, the timer is enqueued into a bucket of the timer
-        wheel. The bucket expiry is the defacto expiry of the timer but it is not
-        equal the timer expiry because of increasing granularity when bucket is in
-        a higher level of the wheel. To be able to figure out in a trace whether a
-        timer expired in time or not, the bucket expiry time is required as well.
-
-        Add bucket expiry time to the timer_start tracepoint and thereby simplify
-        the arguments.
-
-Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
-
-Change-Id: I4868092765745b1efd0c48f13c0b837f2007dcb6
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/instrumentation/events/timer.h | 24 +++++++++++++-----------
- 1 file changed, 13 insertions(+), 11 deletions(-)
-
-diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
-index 91a2cd9..ce571f5 100644
---- a/include/instrumentation/events/timer.h
-+++ b/include/instrumentation/events/timer.h
-@@ -45,8 +45,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
- 	TP_ARGS(timer)
- )
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0) || \
--	LTTNG_RHEL_KERNEL_RANGE(3,10,0,957,0,0, 3,11,0,0,0,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
- /**
-  * timer_start - called when the timer is started
-  * @timer:	pointer to struct timer_list
-@@ -55,39 +54,42 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
-  */
- LTTNG_TRACEPOINT_EVENT(timer_start,
- 
--	TP_PROTO(struct timer_list *timer, unsigned long expires,
--		unsigned int flags),
-+	TP_PROTO(struct timer_list *timer, unsigned long bucket_expiry),
- 
--	TP_ARGS(timer, expires, flags),
-+	TP_ARGS(timer, bucket_expiry),
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(void *, timer, timer)
- 		ctf_integer_hex(void *, function, timer->function)
--		ctf_integer(unsigned long, expires, expires)
-+		ctf_integer(unsigned long, expires, timer->expires)
-+		ctf_integer(unsigned long, bucket_expiry, bucket_expiry)
- 		ctf_integer(unsigned long, now, jiffies)
--		ctf_integer(unsigned int, flags, flags)
-+		ctf_integer(unsigned int, flags, timer->flags)
- 	)
- )
--#else /* #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0)) */
-+#else
- /**
-  * timer_start - called when the timer is started
-  * @timer:	pointer to struct timer_list
-  * @expires:	the timers expiry time
-+ * @flags:	the timers expiry time
-  */
- LTTNG_TRACEPOINT_EVENT(timer_start,
- 
--	TP_PROTO(struct timer_list *timer, unsigned long expires),
-+	TP_PROTO(struct timer_list *timer, unsigned long expires,
-+		unsigned int flags),
- 
--	TP_ARGS(timer, expires),
-+	TP_ARGS(timer, expires, flags),
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(void *, timer, timer)
- 		ctf_integer_hex(void *, function, timer->function)
- 		ctf_integer(unsigned long, expires, expires)
- 		ctf_integer(unsigned long, now, jiffies)
-+		ctf_integer(unsigned int, flags, flags)
- 	)
- )
--#endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0)) */
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0) || \
- 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,193,0,0, 4,19,0,0,0,0))
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
new file mode 100644
index 0000000000..66c48ebe8f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
@@ -0,0 +1,81 @@
+From f4a6415f8d5fa447868d1fdc7119e0a328966379 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 25 Mar 2024 10:30:32 -0400
+Subject: [PATCH 3/4] Fix: mm_compaction_migratepages changed in linux 6.9-rc1
+
+See upstream commit:
+
+    commit ab755bf4249b992fc2140d615ab0a686d50765b4
+    Author: Baolin Wang <baolin.wang@linux.alibaba.com>
+    Date:   Tue Feb 20 14:16:31 2024 +0800
+
+        mm: compaction: update the cc->nr_migratepages when allocating or freeing the freepages
+
+        Currently we will use 'cc->nr_freepages >= cc->nr_migratepages' comparison
+        to ensure that enough freepages are isolated in isolate_freepages(),
+        however it just decreases the cc->nr_freepages without updating
+        cc->nr_migratepages in compaction_alloc(), which will waste more CPU
+        cycles and cause too many freepages to be isolated.
+
+        So we should also update the cc->nr_migratepages when allocating or
+        freeing the freepages to avoid isolating excess freepages.  And I can see
+        fewer free pages are scanned and isolated when running thpcompact on my
+        Arm64 server:
+
+                                               k6.7         k6.7_patched
+        Ops Compaction pages isolated      120692036.00   118160797.00
+        Ops Compaction migrate scanned     131210329.00   154093268.00
+        Ops Compaction free scanned       1090587971.00  1080632536.00
+        Ops Compact scan efficiency               12.03          14.26
+
+        Moreover, I did not see an obvious latency improvements, this is likely
+        because isolating freepages is not the bottleneck in the thpcompact test
+        case.
+
+                                      k6.7                  k6.7_patched
+        Amean     fault-both-1      1089.76 (   0.00%)     1080.16 *   0.88%*
+        Amean     fault-both-3      1616.48 (   0.00%)     1636.65 *  -1.25%*
+        Amean     fault-both-5      2266.66 (   0.00%)     2219.20 *   2.09%*
+        Amean     fault-both-7      2909.84 (   0.00%)     2801.90 *   3.71%*
+        Amean     fault-both-12     4861.26 (   0.00%)     4733.25 *   2.63%*
+        Amean     fault-both-18     7351.11 (   0.00%)     6950.51 *   5.45%*
+        Amean     fault-both-24     9059.30 (   0.00%)     9159.99 *  -1.11%*
+        Amean     fault-both-30    10685.68 (   0.00%)    11399.02 *  -6.68%*
+
+Upstream-Status: Backport [175fe77c Fix: mm_compaction_migratepages changed in linux 6.9-rc1]
+
+Change-Id: I103a43fd1b549360b3fc978fd409b7c17ef3e192
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/compaction.h | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+Index: lttng-modules-2.13.12/include/instrumentation/events/compaction.h
+===================================================================
+--- lttng-modules-2.13.12.orig/include/instrumentation/events/compaction.h
++++ lttng-modules-2.13.12/include/instrumentation/events/compaction.h
+@@ -97,7 +97,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(comp
+ 
+ #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
++LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
++
++	compaction_migratepages,
++
++	TP_PROTO(unsigned int nr_migratepages,
++		unsigned int nr_succeeded),
++
++	TP_ARGS(nr_migratepages, nr_succeeded),
++
++	TP_FIELDS(
++		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
++		ctf_integer(unsigned long, nr_failed, nr_migratepages - nr_succeeded)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
+     LTTNG_RHEL_KERNEL_RANGE(5,14,0,163,0,0, 5,15,0,0,0,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+ 
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
deleted file mode 100644
index 4ad9adc5c2..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7432f583674294b676577b6505b89fc74dc5c7ab Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 22 Jan 2024 11:47:40 -0500
-Subject: [PATCH 3/5] Fix: strlcopy removed in linux 6.8.0-rc1
-
-See upstream commit:
-
-    commit d26270061ae66b915138af7cd73ca6f8b85e6b44
-    Author: Kees Cook <keescook@chromium.org>
-    Date:   Thu Jan 18 12:31:55 2024 -0800
-
-        string: Remove strlcpy()
-
-        With all the users of strlcpy() removed[1] from the kernel, remove the
-        API, self-tests, and other references. Leave mentions in Documentation
-        (about its deprecation), and in checkpatch.pl (to help migrate host-only
-        tools/ usage). Long live strscpy().
-
-Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
-
-Change-Id: I27cdff70a504b25340cc59150ed8e959d9629e43
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- src/lib/ringbuffer/ring_buffer_backend.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/lib/ringbuffer/ring_buffer_backend.c b/src/lib/ringbuffer/ring_buffer_backend.c
-index 9a339be..2181145 100644
---- a/src/lib/ringbuffer/ring_buffer_backend.c
-+++ b/src/lib/ringbuffer/ring_buffer_backend.c
-@@ -405,7 +405,11 @@ int channel_backend_init(struct channel_backend *chanb,
- 	chanb->extra_reader_sb =
- 			(config->mode == RING_BUFFER_OVERWRITE) ? 1 : 0;
- 	chanb->num_subbuf = num_subbuf;
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+	strscpy(chanb->name, name, NAME_MAX);
-+#else
- 	strlcpy(chanb->name, name, NAME_MAX);
-+#endif
- 	memcpy(&chanb->config, config, sizeof(chanb->config));
- 
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
deleted file mode 100644
index c9b1af37c8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From c8198382fe1cede3e16aae9978642a113a217e4c Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 22 Jan 2024 12:17:33 -0500
-Subject: [PATCH 4/5] Fix: btrfs_chunk tracepoints changed in linux 6.8.0-rc1
-
-See upstream commit:
-
-    commit 7dc66abb5a47778d7db327783a0ba172b8cff0b5
-    Author: Filipe Manana <fdmanana@suse.com>
-    Date:   Tue Nov 21 13:38:38 2023 +0000
-
-        btrfs: use a dedicated data structure for chunk maps
-
-        Currently we abuse the extent_map structure for two purposes:
-
-        1) To actually represent extents for inodes;
-        2) To represent chunk mappings.
-
-        This is odd and has several disadvantages:
-
-        1) To create a chunk map, we need to do two memory allocations: one for
-           an extent_map structure and another one for a map_lookup structure, so
-           more potential for an allocation failure and more complicated code to
-           manage and link two structures;
-
-        2) For a chunk map we actually only use 3 fields (24 bytes) of the
-           respective extent map structure: the 'start' field to have the logical
-           start address of the chunk, the 'len' field to have the chunk's size,
-           and the 'orig_block_len' field to contain the chunk's stripe size.
-
-           Besides wasting a memory, it's also odd and not intuitive at all to
-           have the stripe size in a field named 'orig_block_len'.
-
-           We are also using 'block_len' of the extent_map structure to contain
-           the chunk size, so we have 2 fields for the same value, 'len' and
-           'block_len', which is pointless;
-
-        3) When an extent map is associated to a chunk mapping, we set the bit
-           EXTENT_FLAG_FS_MAPPING on its flags and then make its member named
-           'map_lookup' point to the associated map_lookup structure. This means
-           that for an extent map associated to an inode extent, we are not using
-           this 'map_lookup' pointer, so wasting 8 bytes (on a 64 bits platform);
-
-        4) Extent maps associated to a chunk mapping are never merged or split so
-           it's pointless to use the existing extent map infrastructure.
-
-        So add a dedicated data structure named 'btrfs_chunk_map' to represent
-        chunk mappings, this is basically the existing map_lookup structure with
-        some extra fields:
-
-        1) 'start' to contain the chunk logical address;
-        2) 'chunk_len' to contain the chunk's length;
-        3) 'stripe_size' for the stripe size;
-        4) 'rb_node' for insertion into a rb tree;
-        5) 'refs' for reference counting.
-
-        This way we do a single memory allocation for chunk mappings and we don't
-        waste memory for them with unused/unnecessary fields from an extent_map.
-
-        We also save 8 bytes from the extent_map structure by removing the
-        'map_lookup' pointer, so the size of struct extent_map is reduced from
-        144 bytes down to 136 bytes, and we can now have 30 extents map per 4K
-        page instead of 28.
-
-Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
-
-Change-Id: Ie52b5ac83df4bc6abeb84d958c4f5d24ae0d8c75
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/instrumentation/events/btrfs.h | 37 +++++++++++++++++++++++++-
- 1 file changed, 36 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 7c7b9b0..a2a412b 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -1609,7 +1609,42 @@ LTTNG_TRACEPOINT_EVENT(btrfs_delayed_ref_head,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
-+		 u64 offset, u64 size),
-+
-+	TP_ARGS(fs_info, map, offset, size),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, num_stripes, map->num_stripes)
-+		ctf_integer(u64, type, map->type)
-+		ctf_integer(int, sub_stripes, map->sub_stripes)
-+		ctf_integer(u64, offset, offset)
-+		ctf_integer(u64, size, size)
-+		ctf_integer(u64, root_objectid, fs_info->chunk_root->root_key.objectid)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
-+		 u64 offset, u64 size),
-+
-+	TP_ARGS(fs_info, map, offset, size)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
-+		 u64 offset, u64 size),
-+
-+	TP_ARGS(fs_info, map, offset, size)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
new file mode 100644
index 0000000000..59ef4f9313
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
@@ -0,0 +1,57 @@
+From 217bc2e4685050dddce9bdd2557b64f6b8c16622 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 25 Mar 2024 10:53:46 -0400
+Subject: [PATCH 4/4] Fix: dev_base_lock removed in linux 6.9-rc1
+
+See upstream commit:
+
+    commit 1b3ef46cb7f2618cc0b507393220a69810f6da12
+    Author: Eric Dumazet <edumazet@google.com>
+    Date:   Tue Feb 13 06:32:45 2024 +0000
+
+        net: remove dev_base_lock
+
+        dev_base_lock is not needed anymore, all remaining users also hold RTNL.
+
+Upstream-Status: Backport [52eb2ee9 Fix: dev_base_lock removed in linux 6.9-rc1]
+
+Change-Id: I6b07e6eed07fd398302ca14d23162ed24d74df15
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ src/lttng-statedump-impl.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+Index: lttng-modules-2.13.12/src/lttng-statedump-impl.c
+===================================================================
+--- lttng-modules-2.13.12.orig/src/lttng-statedump-impl.c
++++ lttng-modules-2.13.12/src/lttng-statedump-impl.c
+@@ -392,6 +392,20 @@ void lttng_enumerate_device(struct lttng
+ 	}
+ }
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
++static
++int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
++{
++	struct net_device *dev;
++
++	rtnl_lock();
++	for_each_netdev(&init_net, dev)
++		lttng_enumerate_device(session, dev);
++	rtnl_unlock();
++
++	return 0;
++}
++#else
+ static
+ int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
+ {
+@@ -404,6 +418,7 @@ int lttng_enumerate_network_ip_interface
+ 
+ 	return 0;
+ }
++#endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0)) */
+ #else /* CONFIG_INET */
+ static inline
+ int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch
deleted file mode 100644
index 65c33dafef..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 86db094386b43bb5c6b47552f9a4826ca8ba917d Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 22 Jan 2024 13:13:36 -0500
-Subject: [PATCH 5/5] Fix: btrfs_get_extent flags and compress_type changed in
- linux 6.8.0-rc1
-
-See upstream commit:
-
-    commit f86f7a75e2fb5fd7d31d00eab8a392f97ba42ce9
-    Author: Filipe Manana <fdmanana@suse.com>
-    Date:   Mon Dec 4 16:20:33 2023 +0000
-
-        btrfs: use the flags of an extent map to identify the compression type
-
-        Currently, in struct extent_map, we use an unsigned int (32 bits) to
-        identify the compression type of an extent and an unsigned long (64 bits
-        on a 64 bits platform, 32 bits otherwise) for flags. We are only using
-        6 different flags, so an unsigned long is excessive and we can use flags
-        to identify the compression type instead of using a dedicated 32 bits
-        field.
-
-        We can easily have tens or hundreds of thousands (or more) of extent maps
-        on busy and large filesystems, specially with compression enabled or many
-        or large files with tons of small extents. So it's convenient to have the
-        extent_map structure as small as possible in order to use less memory.
-
-        So remove the compression type field from struct extent_map, use flags
-        to identify the compression type and shorten the flags field from an
-        unsigned long to a u32. This saves 8 bytes (on 64 bits platforms) and
-        reduces the size of the structure from 136 bytes down to 128 bytes, using
-        now only two cache lines, and increases the number of extent maps we can
-        have per 4K page from 30 to 32. By using a u32 for the flags instead of
-        an unsigned long, we no longer use test_bit(), set_bit() and clear_bit(),
-        but that level of atomicity is not needed as most flags are never cleared
-        once set (before adding an extent map to the tree), and the ones that can
-        be cleared or set after an extent map is added to the tree, are always
-        performed while holding the write lock on the extent map tree, while the
-        reader holds a lock on the tree or tests for a flag that never changes
-        once the extent map is in the tree (such as compression flags).
-
-Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
-
-Change-Id: I95402d43f064c016b423b48652e4968d3db9b8a9
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/instrumentation/events/btrfs.h | 25 ++++++++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index a2a412b..ffb1b64 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -177,7 +177,30 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+
-+LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
-+
-+	TP_PROTO(const struct btrfs_root *root, const struct btrfs_inode *inode,
-+		const struct extent_map *map),
-+
-+	TP_ARGS(root, inode, map),
-+
-+	TP_FIELDS(
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, ino, btrfs_ino(inode))
-+		ctf_integer(u64, start, map->start)
-+		ctf_integer(u64, len, map->len)
-+		ctf_integer(u64, orig_start, map->orig_start)
-+		ctf_integer(u64, block_start, map->block_start)
-+		ctf_integer(u64, block_len, map->block_len)
-+		ctf_integer(unsigned int, flags, map->flags)
-+		ctf_integer(int, refs, refcount_read(&map->refs))
-+		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
-+	)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
- 
- LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch
deleted file mode 100644
index c35f5b61fa..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From c1e074414f087b6ecc229a9385a44eb3b3dfeaea Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 5 Feb 2024 08:52:29 -0500
-Subject: [PATCH] Fix: ext4_discard_preallocations changed in linux 6.8.0-rc3
-
-See upstream commit:
-
-    commit f0e54b6087de9571ec61c189d6c378b81edbe3b2
-    Author: Kemeng Shi <shikemeng@huaweicloud.com>
-    Date:   Fri Jan 5 17:21:02 2024 +0800
-
-        ext4: remove 'needed' in trace_ext4_discard_preallocations
-
-        As 'needed' to trace_ext4_discard_preallocations is always 0 which
-        is meaningless. Just remove it.
-
-Change-Id: Ib6b698ca553c4beebd4ca791c83bbbb927901758
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/2da4de37de6382b4440737fdf4320e08a089afcd]
-
-Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
----
- include/instrumentation/events/ext4.h | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 222416e..05a6453 100644
---- a/include/instrumentation/events/ext4.h
-+++ b/include/instrumentation/events/ext4.h
-@@ -490,7 +490,19 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
-+	TP_PROTO(struct inode *inode, unsigned int len),
-+
-+	TP_ARGS(inode, len),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(unsigned int, len, len)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
- 	LTTNG_KERNEL_RANGE(5,8,6, 5,9,0))
- LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
- 	TP_PROTO(struct inode *inode, unsigned int len, unsigned int needed),
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
similarity index 72%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
index 5d2379df84..95d5e2d615 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
@@ -10,18 +10,16 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch \
-           file://0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch \
-           file://0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch \
-           file://0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch \
-           file://0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch \
-           file://0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch \
+           file://0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch \
+           file://0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch \
+           file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
+           file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "297211d6fda459c85793c1f498c90fad2939cda7939d503f3ec5eaaf5fbec3c7"
+SRC_URI[sha256sum] = "d85fcb66c7bd31003ab8735e8c77700e5e4f417b4c22fe1f20112cf435abad79"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.39.2


