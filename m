Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.25232.1591602526206642649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E1QJcAWk;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id m21so12563047eds.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdEuKnjAjgWHCLJytraIeNhd5OpIWTs6pPMa+8TD/3w=;
        b=E1QJcAWk84kldMxH2t0EolUU88Ie0GzERxV5zaTFI/3qXqkNpP1yO015Nzb3BQYMI7
         2Aj5noTqPaTHXOUU/xrtrrtxSgK2K8NfBmloD+PhyfS7yk09IbJMwa/m33bxIxWX44NV
         sbmcxNajGsppQAvwtMBn86mstdS1U+PwR+SQ5wsFg9rOVBlEBXI+p4sSts+093DjIw1K
         pI2XtOHyBZNMf+aeIinet2Yze3FLqihpSUseG+4TjZTsN1//ngpcnN5Z/NVmcHKcLG5S
         42/mi7TMV1/Ntm9wHmm8f8UsT4Q4dQWbqNdaw85vZ22yszNRPGPuJudhx2k5koYoqNJP
         gF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdEuKnjAjgWHCLJytraIeNhd5OpIWTs6pPMa+8TD/3w=;
        b=K3JQmJjkw4gKROmHSSKjXZoMcPbhVJciJaYj9dDXIBMkIpqbhTKW4tv1UtKO1XpoZs
         fVPZYb5rReiC52I0hu4JX+AXqnbtcXn3w+qkrCpeTJvs2v1lOSYRAOO+N4Y9d7DDrwjc
         ReQHxKjBOnAbBYk50pae+Sw6KtGTNoym7OCUUbFjAr2Le4/MmOLrnJXqyUW3pQPrRV7v
         xGcJuxUDSzuVC7WYH1liPpzIyGR65ex98teKgNR0LtoFcjwR/0puJ3yPh3Ohf77oiawF
         nPP346k05f7WhxD1MQw8rEGr0F1ssdtwAG/Uf3yy/UQ1keP7huFUxz6cfLMBJP2FcZMw
         TesQ==
X-Gm-Message-State: AOAM5301dedI67U3egZcupbW4dIkOcJWt51JG0V0AAVqVvBrcXlWKg3w
	tX+u9LKkyL11UHMbx4/zh0xSGR8R3T8=
X-Google-Smtp-Source: ABdhPJz5qoY/caKXV5dQpPXTxr0FrkWk9TQsMRg4f116cmiv0iWOAk/wvV2CCpwnivD0BH5wZqSh6g==
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr953228edr.289.1591602523851;
        Mon, 08 Jun 2020 00:48:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/42] lttng-modules: update to 2.12.1
Date: Mon,  8 Jun 2020 09:46:51 +0200
Message-Id: <20200608074659.7051-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports.

devupstream variant was incorrectly updated in a059fc67da4
(changed to 2.12, but without updating SRCREV), so revert it back
to 2.11.2.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...l-5.7-use-vmalloc_sync_mappings-on-k.patch | 853 ------------------
 ...per-rename-to-wrapper_vmalloc_sync_m.patch |  32 -
 ..._sync_mappings-on-kernel-5.6-as-well.patch |  88 --
 ...loc_sync_mappings-for-stable-kernels.patch |  67 --
 ...ules_2.12.0.bb => lttng-modules_2.12.1.bb} |  11 +-
 5 files changed, 3 insertions(+), 1048 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-well.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Update-Use-vmalloc_sync_mappings-for-stable-kernels.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.0.bb => lttng-modules_2.12.1.bb} (75%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch
deleted file mode 100644
index 58f4d29193..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch
+++ /dev/null
@@ -1,853 +0,0 @@
-From a2cc0e06330e55eefe668f7d6370de6d3177a907 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Tue, 5 May 2020 13:38:31 -0400
-Subject: [PATCH] Update for kernel 5.7: use vmalloc_sync_mappings on kernels
- >= 5.7
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/da0fcb1497ff2437407883647a8a0bba12bd0f91]
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- lib/ringbuffer/ring_buffer_backend.c |  4 +--
- lttng-abi.c                          |  4 +--
- lttng-context-callstack.c            |  2 +-
- lttng-context-cgroup-ns.c            |  2 +-
- lttng-context-cpu-id.c               |  2 +-
- lttng-context-egid.c                 |  2 +-
- lttng-context-euid.c                 |  2 +-
- lttng-context-gid.c                  |  2 +-
- lttng-context-hostname.c             |  2 +-
- lttng-context-interruptible.c        |  2 +-
- lttng-context-ipc-ns.c               |  2 +-
- lttng-context-migratable.c           |  2 +-
- lttng-context-mnt-ns.c               |  2 +-
- lttng-context-need-reschedule.c      |  2 +-
- lttng-context-net-ns.c               |  2 +-
- lttng-context-nice.c                 |  2 +-
- lttng-context-perf-counters.c        |  2 +-
- lttng-context-pid-ns.c               |  2 +-
- lttng-context-pid.c                  |  2 +-
- lttng-context-ppid.c                 |  2 +-
- lttng-context-preemptible.c          |  2 +-
- lttng-context-prio.c                 |  2 +-
- lttng-context-procname.c             |  2 +-
- lttng-context-sgid.c                 |  2 +-
- lttng-context-suid.c                 |  2 +-
- lttng-context-tid.c                  |  2 +-
- lttng-context-uid.c                  |  2 +-
- lttng-context-user-ns.c              |  2 +-
- lttng-context-uts-ns.c               |  2 +-
- lttng-context-vegid.c                |  2 +-
- lttng-context-veuid.c                |  2 +-
- lttng-context-vgid.c                 |  2 +-
- lttng-context-vpid.c                 |  2 +-
- lttng-context-vppid.c                |  2 +-
- lttng-context-vsgid.c                |  2 +-
- lttng-context-vsuid.c                |  2 +-
- lttng-context-vtid.c                 |  2 +-
- lttng-context-vuid.c                 |  2 +-
- lttng-context.c                      |  2 +-
- lttng-events.c                       | 10 +++---
- lttng-ring-buffer-client.h           |  4 +--
- lttng-ring-buffer-metadata-client.h  |  4 +--
- lttng-syscalls.c                     |  2 +-
- probes/lttng-kprobes.c               |  2 +-
- probes/lttng-kretprobes.c            |  2 +-
- probes/lttng-tracepoint-event-impl.h |  4 +--
- probes/lttng-uprobes.c               |  2 +-
- probes/lttng.c                       |  2 +-
- tests/probes/lttng-test.c            |  2 +-
- wrapper/vmalloc.h                    | 49 ++++++++++++++++++++++++++--
- 50 files changed, 104 insertions(+), 61 deletions(-)
-
-diff --git a/lib/ringbuffer/ring_buffer_backend.c b/lib/ringbuffer/ring_buffer_backend.c
-index d4bec25..d232b7f 100644
---- a/lib/ringbuffer/ring_buffer_backend.c
-+++ b/lib/ringbuffer/ring_buffer_backend.c
-@@ -17,7 +17,7 @@
- #include <linux/vmalloc.h>
- 
- #include <wrapper/mm.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <wrapper/ringbuffer/config.h>
- #include <wrapper/ringbuffer/backend.h>
- #include <wrapper/ringbuffer/frontend.h>
-@@ -156,7 +156,7 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 	 * If kmalloc ever uses vmalloc underneath, make sure the buffer pages
- 	 * will not fault.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	wrapper_clear_current_oom_origin();
- 	vfree(pages);
- 	return 0;
-diff --git a/lttng-abi.c b/lttng-abi.c
-index b63e376..826ecab 100644
---- a/lttng-abi.c
-+++ b/lttng-abi.c
-@@ -30,7 +30,7 @@
- #include <linux/uaccess.h>
- #include <linux/slab.h>
- #include <linux/err.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <wrapper/ringbuffer/vfs.h>
- #include <wrapper/ringbuffer/backend.h>
- #include <wrapper/ringbuffer/frontend.h>
-@@ -1938,7 +1938,7 @@ int __init lttng_abi_init(void)
- {
- 	int ret = 0;
- 
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	lttng_clock_ref();
- 
- 	ret = lttng_tp_mempool_init();
-diff --git a/lttng-context-callstack.c b/lttng-context-callstack.c
-index 195990a..ba35a39 100644
---- a/lttng-context-callstack.c
-+++ b/lttng-context-callstack.c
-@@ -141,7 +141,7 @@ int __lttng_add_callstack_generic(struct lttng_ctx **ctx,
- 	field->record = lttng_callstack_record;
- 	field->priv = fdata;
- 	field->destroy = lttng_callstack_destroy;
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- 
- error_create:
-diff --git a/lttng-context-cgroup-ns.c b/lttng-context-cgroup-ns.c
-index 81486e5..f324b7e 100644
---- a/lttng-context-cgroup-ns.c
-+++ b/lttng-context-cgroup-ns.c
-@@ -97,7 +97,7 @@ int lttng_add_cgroup_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = cgroup_ns_record;
- 	field->get_value = cgroup_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_cgroup_ns_to_ctx);
-diff --git a/lttng-context-cpu-id.c b/lttng-context-cpu-id.c
-index 3778225..6e2f3f4 100644
---- a/lttng-context-cpu-id.c
-+++ b/lttng-context-cpu-id.c
-@@ -68,7 +68,7 @@ int lttng_add_cpu_id_to_ctx(struct lttng_ctx **ctx)
- 	field->record = cpu_id_record;
- 	field->get_value = cpu_id_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_cpu_id_to_ctx);
-diff --git a/lttng-context-egid.c b/lttng-context-egid.c
-index 51536e2..bdcebb9 100644
---- a/lttng-context-egid.c
-+++ b/lttng-context-egid.c
-@@ -70,7 +70,7 @@ int lttng_add_egid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = egid_record;
- 	field->get_value = egid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_egid_to_ctx);
-diff --git a/lttng-context-euid.c b/lttng-context-euid.c
-index 1bcd53f..c2b8dcd 100644
---- a/lttng-context-euid.c
-+++ b/lttng-context-euid.c
-@@ -70,7 +70,7 @@ int lttng_add_euid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = euid_record;
- 	field->get_value = euid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_euid_to_ctx);
-diff --git a/lttng-context-gid.c b/lttng-context-gid.c
-index da54207..c355e8c 100644
---- a/lttng-context-gid.c
-+++ b/lttng-context-gid.c
-@@ -70,7 +70,7 @@ int lttng_add_gid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = gid_record;
- 	field->get_value = gid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_gid_to_ctx);
-diff --git a/lttng-context-hostname.c b/lttng-context-hostname.c
-index e485aa9..17dbd57 100644
---- a/lttng-context-hostname.c
-+++ b/lttng-context-hostname.c
-@@ -101,7 +101,7 @@ int lttng_add_hostname_to_ctx(struct lttng_ctx **ctx)
- 	field->record = hostname_record;
- 	field->get_value = hostname_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_hostname_to_ctx);
-diff --git a/lttng-context-interruptible.c b/lttng-context-interruptible.c
-index f3da199..8bd279a 100644
---- a/lttng-context-interruptible.c
-+++ b/lttng-context-interruptible.c
-@@ -75,7 +75,7 @@ int lttng_add_interruptible_to_ctx(struct lttng_ctx **ctx)
- 	field->record = interruptible_record;
- 	field->get_value = interruptible_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_interruptible_to_ctx);
-diff --git a/lttng-context-ipc-ns.c b/lttng-context-ipc-ns.c
-index 78d5966..40b901b 100644
---- a/lttng-context-ipc-ns.c
-+++ b/lttng-context-ipc-ns.c
-@@ -96,7 +96,7 @@ int lttng_add_ipc_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = ipc_ns_record;
- 	field->get_value = ipc_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_ipc_ns_to_ctx);
-diff --git a/lttng-context-migratable.c b/lttng-context-migratable.c
-index e3d8ede..65154b8 100644
---- a/lttng-context-migratable.c
-+++ b/lttng-context-migratable.c
-@@ -68,7 +68,7 @@ int lttng_add_migratable_to_ctx(struct lttng_ctx **ctx)
- 	field->record = migratable_record;
- 	field->get_value = migratable_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_migratable_to_ctx);
-diff --git a/lttng-context-mnt-ns.c b/lttng-context-mnt-ns.c
-index b5bb955..cb59776 100644
---- a/lttng-context-mnt-ns.c
-+++ b/lttng-context-mnt-ns.c
-@@ -98,7 +98,7 @@ int lttng_add_mnt_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = mnt_ns_record;
- 	field->get_value = mnt_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_mnt_ns_to_ctx);
-diff --git a/lttng-context-need-reschedule.c b/lttng-context-need-reschedule.c
-index f29fb28..94efaa5 100644
---- a/lttng-context-need-reschedule.c
-+++ b/lttng-context-need-reschedule.c
-@@ -68,7 +68,7 @@ int lttng_add_need_reschedule_to_ctx(struct lttng_ctx **ctx)
- 	field->record = need_reschedule_record;
- 	field->get_value = need_reschedule_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_need_reschedule_to_ctx);
-diff --git a/lttng-context-net-ns.c b/lttng-context-net-ns.c
-index 6694037..37de09f 100644
---- a/lttng-context-net-ns.c
-+++ b/lttng-context-net-ns.c
-@@ -97,7 +97,7 @@ int lttng_add_net_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = net_ns_record;
- 	field->get_value = net_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_net_ns_to_ctx);
-diff --git a/lttng-context-nice.c b/lttng-context-nice.c
-index 563e805..acaba85 100644
---- a/lttng-context-nice.c
-+++ b/lttng-context-nice.c
-@@ -68,7 +68,7 @@ int lttng_add_nice_to_ctx(struct lttng_ctx **ctx)
- 	field->record = nice_record;
- 	field->get_value = nice_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_nice_to_ctx);
-diff --git a/lttng-context-perf-counters.c b/lttng-context-perf-counters.c
-index 43c4077..6b04d12 100644
---- a/lttng-context-perf-counters.c
-+++ b/lttng-context-perf-counters.c
-@@ -321,7 +321,7 @@ int lttng_add_perf_counter_to_ctx(uint32_t type,
- 	field->u.perf_counter = perf_field;
- 	lttng_context_update(*ctx);
- 
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
-diff --git a/lttng-context-pid-ns.c b/lttng-context-pid-ns.c
-index f039f26..ccf629d 100644
---- a/lttng-context-pid-ns.c
-+++ b/lttng-context-pid-ns.c
-@@ -98,7 +98,7 @@ int lttng_add_pid_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = pid_ns_record;
- 	field->get_value = pid_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_pid_ns_to_ctx);
-diff --git a/lttng-context-pid.c b/lttng-context-pid.c
-index b3caabb..326eabe 100644
---- a/lttng-context-pid.c
-+++ b/lttng-context-pid.c
-@@ -68,7 +68,7 @@ int lttng_add_pid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = pid_record;
- 	field->get_value = pid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_pid_to_ctx);
-diff --git a/lttng-context-ppid.c b/lttng-context-ppid.c
-index ef84ad1..ff25288 100644
---- a/lttng-context-ppid.c
-+++ b/lttng-context-ppid.c
-@@ -90,7 +90,7 @@ int lttng_add_ppid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = ppid_record;
- 	field->get_value = ppid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_ppid_to_ctx);
-diff --git a/lttng-context-preemptible.c b/lttng-context-preemptible.c
-index 328f2a4..867805b 100644
---- a/lttng-context-preemptible.c
-+++ b/lttng-context-preemptible.c
-@@ -86,7 +86,7 @@ int lttng_add_preemptible_to_ctx(struct lttng_ctx **ctx)
- 	field->record = preemptible_record;
- 	field->get_value = preemptible_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_preemptible_to_ctx);
-diff --git a/lttng-context-prio.c b/lttng-context-prio.c
-index b5d21e7..367f7bd 100644
---- a/lttng-context-prio.c
-+++ b/lttng-context-prio.c
-@@ -89,7 +89,7 @@ int lttng_add_prio_to_ctx(struct lttng_ctx **ctx)
- 	field->record = prio_record;
- 	field->get_value = prio_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_prio_to_ctx);
-diff --git a/lttng-context-procname.c b/lttng-context-procname.c
-index 54007d1..8f18ca2 100644
---- a/lttng-context-procname.c
-+++ b/lttng-context-procname.c
-@@ -72,7 +72,7 @@ int lttng_add_procname_to_ctx(struct lttng_ctx **ctx)
- 	field->record = procname_record;
- 	field->get_value = procname_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_procname_to_ctx);
-diff --git a/lttng-context-sgid.c b/lttng-context-sgid.c
-index 61c8d53..2a58cbd 100644
---- a/lttng-context-sgid.c
-+++ b/lttng-context-sgid.c
-@@ -70,7 +70,7 @@ int lttng_add_sgid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = sgid_record;
- 	field->get_value = sgid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_sgid_to_ctx);
-diff --git a/lttng-context-suid.c b/lttng-context-suid.c
-index 66d3ef5..ab3e2a9 100644
---- a/lttng-context-suid.c
-+++ b/lttng-context-suid.c
-@@ -70,7 +70,7 @@ int lttng_add_suid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = suid_record;
- 	field->get_value = suid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_suid_to_ctx);
-diff --git a/lttng-context-tid.c b/lttng-context-tid.c
-index d2a20e6..f6defc4 100644
---- a/lttng-context-tid.c
-+++ b/lttng-context-tid.c
-@@ -71,7 +71,7 @@ int lttng_add_tid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = tid_record;
- 	field->get_value = tid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_tid_to_ctx);
-diff --git a/lttng-context-uid.c b/lttng-context-uid.c
-index 5f11de2..5593852 100644
---- a/lttng-context-uid.c
-+++ b/lttng-context-uid.c
-@@ -70,7 +70,7 @@ int lttng_add_uid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = uid_record;
- 	field->get_value = uid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_uid_to_ctx);
-diff --git a/lttng-context-user-ns.c b/lttng-context-user-ns.c
-index 746e4d9..0ed62e3 100644
---- a/lttng-context-user-ns.c
-+++ b/lttng-context-user-ns.c
-@@ -82,7 +82,7 @@ int lttng_add_user_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = user_ns_record;
- 	field->get_value = user_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_user_ns_to_ctx);
-diff --git a/lttng-context-uts-ns.c b/lttng-context-uts-ns.c
-index 7352a3d..283bc73 100644
---- a/lttng-context-uts-ns.c
-+++ b/lttng-context-uts-ns.c
-@@ -96,7 +96,7 @@ int lttng_add_uts_ns_to_ctx(struct lttng_ctx **ctx)
- 	field->record = uts_ns_record;
- 	field->get_value = uts_ns_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_uts_ns_to_ctx);
-diff --git a/lttng-context-vegid.c b/lttng-context-vegid.c
-index 604da2a..1431dac 100644
---- a/lttng-context-vegid.c
-+++ b/lttng-context-vegid.c
-@@ -70,7 +70,7 @@ int lttng_add_vegid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vegid_record;
- 	field->get_value = vegid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vegid_to_ctx);
-diff --git a/lttng-context-veuid.c b/lttng-context-veuid.c
-index 983ae6a..a1b5b70 100644
---- a/lttng-context-veuid.c
-+++ b/lttng-context-veuid.c
-@@ -70,7 +70,7 @@ int lttng_add_veuid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = veuid_record;
- 	field->get_value = veuid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_veuid_to_ctx);
-diff --git a/lttng-context-vgid.c b/lttng-context-vgid.c
-index e08c77d..0eed24e 100644
---- a/lttng-context-vgid.c
-+++ b/lttng-context-vgid.c
-@@ -70,7 +70,7 @@ int lttng_add_vgid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vgid_record;
- 	field->get_value = vgid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vgid_to_ctx);
-diff --git a/lttng-context-vpid.c b/lttng-context-vpid.c
-index 982ce55..b5b6ce0 100644
---- a/lttng-context-vpid.c
-+++ b/lttng-context-vpid.c
-@@ -83,7 +83,7 @@ int lttng_add_vpid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vpid_record;
- 	field->get_value = vpid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vpid_to_ctx);
-diff --git a/lttng-context-vppid.c b/lttng-context-vppid.c
-index 66d6382..347ac63 100644
---- a/lttng-context-vppid.c
-+++ b/lttng-context-vppid.c
-@@ -112,7 +112,7 @@ int lttng_add_vppid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vppid_record;
- 	field->get_value = vppid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vppid_to_ctx);
-diff --git a/lttng-context-vsgid.c b/lttng-context-vsgid.c
-index aca5eda..3daf889 100644
---- a/lttng-context-vsgid.c
-+++ b/lttng-context-vsgid.c
-@@ -70,7 +70,7 @@ int lttng_add_vsgid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vsgid_record;
- 	field->get_value = vsgid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vsgid_to_ctx);
-diff --git a/lttng-context-vsuid.c b/lttng-context-vsuid.c
-index 66c1300..d7fb0db 100644
---- a/lttng-context-vsuid.c
-+++ b/lttng-context-vsuid.c
-@@ -70,7 +70,7 @@ int lttng_add_vsuid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vsuid_record;
- 	field->get_value = vsuid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vsuid_to_ctx);
-diff --git a/lttng-context-vtid.c b/lttng-context-vtid.c
-index 8fd68a8..e81ba0e 100644
---- a/lttng-context-vtid.c
-+++ b/lttng-context-vtid.c
-@@ -83,7 +83,7 @@ int lttng_add_vtid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vtid_record;
- 	field->get_value = vtid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vtid_to_ctx);
-diff --git a/lttng-context-vuid.c b/lttng-context-vuid.c
-index 6ae575f..33e22d3 100644
---- a/lttng-context-vuid.c
-+++ b/lttng-context-vuid.c
-@@ -70,7 +70,7 @@ int lttng_add_vuid_to_ctx(struct lttng_ctx **ctx)
- 	field->record = vuid_record;
- 	field->get_value = vuid_get_value;
- 	lttng_context_update(*ctx);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return 0;
- }
- EXPORT_SYMBOL_GPL(lttng_add_vuid_to_ctx);
-diff --git a/lttng-context.c b/lttng-context.c
-index eb4534c..a6d4ee6 100644
---- a/lttng-context.c
-+++ b/lttng-context.c
-@@ -11,7 +11,7 @@
- #include <linux/list.h>
- #include <linux/mutex.h>
- #include <linux/slab.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <lttng-events.h>
- #include <lttng-tracer.h>
- 
-diff --git a/lttng-events.c b/lttng-events.c
-index a1c8445..401f646 100644
---- a/lttng-events.c
-+++ b/lttng-events.c
-@@ -30,7 +30,7 @@
- #include <linux/uuid.h>
- #include <linux/dmi.h>
- 
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <wrapper/random.h>
- #include <wrapper/tracepoint.h>
- #include <wrapper/list.h>
-@@ -2753,9 +2753,9 @@ end:
-  * Registers a transport which can be used as output to extract the data out of
-  * LTTng. The module calling this registration function must ensure that no
-  * trap-inducing code will be executed by the transport functions. E.g.
-- * vmalloc_sync_all() must be called between a vmalloc and the moment the memory
-+ * vmalloc_sync_mappings() must be called between a vmalloc and the moment the memory
-  * is made visible to the transport function. This registration acts as a
-- * vmalloc_sync_all. Therefore, only if the module allocates virtual memory
-+ * vmalloc_sync_mappings. Therefore, only if the module allocates virtual memory
-  * after its registration must it synchronize the TLBs.
-  */
- void lttng_transport_register(struct lttng_transport *transport)
-@@ -2763,9 +2763,9 @@ void lttng_transport_register(struct lttng_transport *transport)
- 	/*
- 	 * Make sure no page fault can be triggered by the module about to be
- 	 * registered. We deal with this here so we don't have to call
--	 * vmalloc_sync_all() in each module's init.
-+	 * vmalloc_sync_mappings() in each module's init.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	mutex_lock(&sessions_mutex);
- 	list_add_tail(&transport->node, &lttng_transport_list);
-diff --git a/lttng-ring-buffer-client.h b/lttng-ring-buffer-client.h
-index d5c512c..ff62830 100644
---- a/lttng-ring-buffer-client.h
-+++ b/lttng-ring-buffer-client.h
-@@ -10,7 +10,7 @@
- #include <linux/module.h>
- #include <linux/types.h>
- #include <lib/bitfield.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <wrapper/trace-clock.h>
- #include <lttng-events.h>
- #include <lttng-tracer.h>
-@@ -766,7 +766,7 @@ static int __init lttng_ring_buffer_client_init(void)
- 	 * This vmalloc sync all also takes care of the lib ring buffer
- 	 * vmalloc'd module pages when it is built as a module into LTTng.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	lttng_transport_register(&lttng_relay_transport);
- 	return 0;
- }
-diff --git a/lttng-ring-buffer-metadata-client.h b/lttng-ring-buffer-metadata-client.h
-index 17ffd75..a098b8d 100644
---- a/lttng-ring-buffer-metadata-client.h
-+++ b/lttng-ring-buffer-metadata-client.h
-@@ -9,7 +9,7 @@
- 
- #include <linux/module.h>
- #include <linux/types.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <lttng-events.h>
- #include <lttng-tracer.h>
- 
-@@ -428,7 +428,7 @@ static int __init lttng_ring_buffer_client_init(void)
- 	 * This vmalloc sync all also takes care of the lib ring buffer
- 	 * vmalloc'd module pages when it is built as a module into LTTng.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	lttng_transport_register(&lttng_relay_transport);
- 	return 0;
- }
-diff --git a/lttng-syscalls.c b/lttng-syscalls.c
-index fb14f6b..97f1ba9 100644
---- a/lttng-syscalls.c
-+++ b/lttng-syscalls.c
-@@ -760,7 +760,7 @@ int lttng_syscalls_register(struct lttng_channel *chan, void *filter)
- 	struct lttng_kernel_event ev;
- 	int ret;
- 
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	if (!chan->sc_table) {
- 		/* create syscall table mapping syscall to events */
-diff --git a/probes/lttng-kprobes.c b/probes/lttng-kprobes.c
-index c0a15e4..a44eaa1 100644
---- a/probes/lttng-kprobes.c
-+++ b/probes/lttng-kprobes.c
-@@ -132,7 +132,7 @@ int lttng_kprobes_register(const char *name,
- 	 * Well.. kprobes itself puts the page fault handler on the blacklist,
- 	 * but we can never be too careful.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	ret = register_kprobe(&event->u.kprobe.kp);
- 	if (ret)
-diff --git a/probes/lttng-kretprobes.c b/probes/lttng-kretprobes.c
-index 4b18d46..ab98ff2 100644
---- a/probes/lttng-kretprobes.c
-+++ b/probes/lttng-kretprobes.c
-@@ -221,7 +221,7 @@ int lttng_kretprobes_register(const char *name,
- 	 * Well.. kprobes itself puts the page fault handler on the blacklist,
- 	 * but we can never be too careful.
- 	 */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	ret = register_kretprobe(&lttng_krp->krp);
- 	if (ret)
-diff --git a/probes/lttng-tracepoint-event-impl.h b/probes/lttng-tracepoint-event-impl.h
-index 321cdfa..77b8638 100644
---- a/probes/lttng-tracepoint-event-impl.h
-+++ b/probes/lttng-tracepoint-event-impl.h
-@@ -15,7 +15,7 @@
- #include <probes/lttng.h>
- #include <probes/lttng-types.h>
- #include <probes/lttng-probe-user.h>
--#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_all() */
-+#include <wrapper/vmalloc.h>	/* for wrapper_vmalloc_sync_mappings() */
- #include <wrapper/ringbuffer/frontend_types.h>
- #include <wrapper/ringbuffer/backend.h>
- #include <wrapper/rcu.h>
-@@ -1391,7 +1391,7 @@ static __used struct lttng_probe_desc TP_ID(__probe_desc___, TRACE_SYSTEM) = {
- #ifndef TP_MODULE_NOINIT
- static int TP_ID(__lttng_events_init__, TRACE_SYSTEM)(void)
- {
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	return lttng_probe_register(&TP_ID(__probe_desc___, TRACE_SYSTEM));
- }
- 
-diff --git a/probes/lttng-uprobes.c b/probes/lttng-uprobes.c
-index 64d8237..bc10128 100644
---- a/probes/lttng-uprobes.c
-+++ b/probes/lttng-uprobes.c
-@@ -161,7 +161,7 @@ int lttng_uprobes_add_callsite(struct lttng_event *event,
- 	}
- 
- 	/* Ensure the memory we just allocated don't trigger page faults. */
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	uprobe_handler->event = event;
- 	uprobe_handler->up_consumer.handler = lttng_uprobes_handler_pre;
-diff --git a/probes/lttng.c b/probes/lttng.c
-index 383202c..05bc138 100644
---- a/probes/lttng.c
-+++ b/probes/lttng.c
-@@ -116,7 +116,7 @@ int __init lttng_logger_init(void)
- {
- 	int ret = 0;
- 
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 
- 	/* /dev/lttng-logger */
- 	ret = misc_register(&logger_dev);
-diff --git a/tests/probes/lttng-test.c b/tests/probes/lttng-test.c
-index e347639..b450e7d 100644
---- a/tests/probes/lttng-test.c
-+++ b/tests/probes/lttng-test.c
-@@ -97,7 +97,7 @@ int __init lttng_test_init(void)
- 	int ret = 0;
- 
- 	(void) wrapper_lttng_fixup_sig(THIS_MODULE);
--	wrapper_vmalloc_sync_all();
-+	wrapper_vmalloc_sync_mappings();
- 	lttng_test_filter_event_dentry =
- 			proc_create_data(LTTNG_TEST_FILTER_EVENT_FILE,
- 				S_IRUGO | S_IWUGO, NULL,
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index 0c3eb86..54715b5 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -21,8 +21,35 @@
- #include <linux/kallsyms.h>
- #include <wrapper/kallsyms.h>
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
-+
-+static inline
-+void wrapper_vmalloc_sync_mappings(void)
-+{
-+	void (*vmalloc_sync_mappings_sym)(void);
-+
-+	vmalloc_sync_mappings_sym = (void *) kallsyms_lookup_funcptr("vmalloc_sync_mappings");
-+	if (vmalloc_sync_mappings_sym) {
-+		vmalloc_sync_mappings_sym();
-+	} else {
-+#ifdef CONFIG_X86
-+		/*
-+		 * Only x86 needs vmalloc_sync_mappings to make sure LTTng does not
-+		 * trigger recursive page faults.
-+		 */
-+		printk_once(KERN_WARNING "LTTng: vmalloc_sync_mappings symbol lookup failed.\n");
-+		printk_once(KERN_WARNING "Page fault handler and NMI tracing might trigger faults.\n");
-+#endif
-+	}
-+}
-+
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+
-+/*
-+ * Map vmalloc_sync_mappings to vmalloc_sync_all() on kernels before 5.7.
-+ */
- static inline
--void wrapper_vmalloc_sync_all(void)
-+void wrapper_vmalloc_sync_mappings(void)
- {
- 	void (*vmalloc_sync_all_sym)(void);
- 
-@@ -40,13 +67,29 @@ void wrapper_vmalloc_sync_all(void)
- #endif
- 	}
- }
-+
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+
- #else
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
-+
-+static inline
-+void wrapper_vmalloc_sync_mappings(void)
-+{
-+	return vmalloc_sync_mappings();
-+}
-+
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+
- static inline
--void wrapper_vmalloc_sync_all(void)
-+void wrapper_vmalloc_sync_mappings(void)
- {
- 	return vmalloc_sync_all();
- }
-+
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+
- #endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,12,0))
-@@ -61,7 +104,7 @@ void *lttng_kvmalloc_node(unsigned long size, gfp_t flags, int node)
- 		 * Make sure we don't trigger recursive page faults in the
- 		 * tracing fast path.
- 		 */
--		wrapper_vmalloc_sync_all();
-+		wrapper_vmalloc_sync_mappings();
- 	}
- 	return ret;
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch
deleted file mode 100644
index 807fe933cd..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4d1817c129310945bf0b8227ebc0fbb4f6299dc7 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 6 May 2020 11:03:32 -0400
-Subject: [PATCH 2/4] Fix: missing wrapper rename to
- wrapper_vmalloc_sync_mappings
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/c1ba644f2edf6a5bc030111ce4167a8798cc1053]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Idf7082a980c5a604bfef5c69906678b5083a9bbf
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- wrapper/vmalloc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index 54715b5..5d0b389 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -216,7 +216,7 @@ void *lttng_kvmalloc_node(unsigned long size, gfp_t flags, int node)
- 		 * Make sure we don't trigger recursive page faults in the
- 		 * tracing fast path.
- 		 */
--		wrapper_vmalloc_sync_all();
-+		wrapper_vmalloc_sync_mappings();
- 	}
- 	return ret;
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-well.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-well.patch
deleted file mode 100644
index 48d7e2f00c..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-well.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 23cfd7b53ec1521d3c23ceddfda49352c2d349dc Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Thu, 14 May 2020 13:05:24 +0300
-Subject: [PATCH 3/4] Fix: Use vmalloc_sync_mappings on kernel 5.6 as well
-
-Upstream commit [1], that got rid of vmalloc_sync_all and introduced
-vmalloc_sync_mappings, is a v5.6 commit:
-$ git tag --contains 763802b53a427ed3cbd419dbba255c414fdd9e7c
-v5.6
-v5.6-rc7
-v5.7-rc1
-v5.7-rc2
-v5.7-rc3
-
-Extend the LINUX_VERSION_CODE check to v5.6 to fix the following warnings:
-...
-[  483.242037] LTTng: vmalloc_sync_all symbol lookup failed.
-[  483.257056] Page fault handler and NMI tracing might trigger faults.
-...
-
-[1] https://github.com/torvalds/linux/commit/763802b53a427ed3cbd419dbba255c414fdd9e7c
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/da356b324dfc160e09b8966b691792037badf455]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- wrapper/vmalloc.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index 5d0b389..d905f60 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -21,7 +21,7 @@
- #include <linux/kallsyms.h>
- #include <wrapper/kallsyms.h>
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
- 
- static inline
- void wrapper_vmalloc_sync_mappings(void)
-@@ -43,7 +43,7 @@ void wrapper_vmalloc_sync_mappings(void)
- 	}
- }
- 
--#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0)) */
- 
- /*
-  * Map vmalloc_sync_mappings to vmalloc_sync_all() on kernels before 5.7.
-@@ -68,11 +68,11 @@ void wrapper_vmalloc_sync_mappings(void)
- 	}
- }
- 
--#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0)) */
- 
- #else
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
- 
- static inline
- void wrapper_vmalloc_sync_mappings(void)
-@@ -80,7 +80,7 @@ void wrapper_vmalloc_sync_mappings(void)
- 	return vmalloc_sync_mappings();
- }
- 
--#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0)) */
- 
- static inline
- void wrapper_vmalloc_sync_mappings(void)
-@@ -88,7 +88,7 @@ void wrapper_vmalloc_sync_mappings(void)
- 	return vmalloc_sync_all();
- }
- 
--#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)) */
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0)) */
- 
- #endif
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Update-Use-vmalloc_sync_mappings-for-stable-kernels.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Update-Use-vmalloc_sync_mappings-for-stable-kernels.patch
deleted file mode 100644
index a0b870486f..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Update-Use-vmalloc_sync_mappings-for-stable-kernels.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f419315f28a1da656c4faa8a852a2928ce38c72d Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Thu, 14 May 2020 14:27:17 +0300
-Subject: [PATCH 4/4] Update: Use vmalloc_sync_mappings for stable kernels
-
-Starting from v5.4.28/v5.2.37/v4.19.113/v4.14.175/v4.9.218/v4.4.218, stable
-kernel branches backported v5.6 upstream commit [1], causing the following
-warnings:
-...
-[  483.242037] LTTng: vmalloc_sync_all symbol lookup failed.
-[  483.257056] Page fault handler and NMI tracing might trigger faults.
-...
-
-Extend check for vmalloc_sync_mappings for stable kernels as well.
-
-[1] https://github.com/torvalds/linux/commit/763802b53a427ed3cbd419dbba255c414fdd9e7c
-
-[ Edit: minor coding style fix by Mathieu Desnoyers. ]
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/5939591f87dc291bc858caf72decfb8569d802e3]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- wrapper/vmalloc.h | 17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index d905f60..c7538ae 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -20,8 +20,15 @@
- 
- #include <linux/kallsyms.h>
- #include <wrapper/kallsyms.h>
-+#include <lttng-kernel-version.h>
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0) \
-+  || LTTNG_KERNEL_RANGE(5,4,28, 5,5,0)            \
-+  || LTTNG_KERNEL_RANGE(5,2,37, 5,3,0)            \
-+  || LTTNG_KERNEL_RANGE(4,19,113, 4,20,0)         \
-+  || LTTNG_KERNEL_RANGE(4,14,175, 4,15,0)         \
-+  || LTTNG_KERNEL_RANGE(4,9,218, 4,10,0)          \
-+  || LTTNG_KERNEL_RANGE(4,4,218, 4,5,0))
- 
- static inline
- void wrapper_vmalloc_sync_mappings(void)
-@@ -72,7 +79,13 @@ void wrapper_vmalloc_sync_mappings(void)
- 
- #else
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0) \
-+  || LTTNG_KERNEL_RANGE(5,4,28, 5,5,0)            \
-+  || LTTNG_KERNEL_RANGE(5,2,37, 5,3,0)            \
-+  || LTTNG_KERNEL_RANGE(4,19,113, 4,20,0)         \
-+  || LTTNG_KERNEL_RANGE(4,14,175, 4,15,0)         \
-+  || LTTNG_KERNEL_RANGE(4,9,218, 4,10,0)          \
-+  || LTTNG_KERNEL_RANGE(4,4,218, 4,5,0))
- 
- static inline
- void wrapper_vmalloc_sync_mappings(void)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
similarity index 75%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
index 4a6c42e3bf..8d3fb475c0 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
@@ -11,14 +11,9 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch \
-           file://0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch \
-           file://0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-well.patch \
-           file://0004-Update-Use-vmalloc_sync_mappings-for-stable-kernels.patch \
            "
 
-SRC_URI[md5sum] = "be252df5013ea03894921d0b493c7b6c"
-SRC_URI[sha256sum] = "efeb2ae60e96dbe9a9b342d3a80dfc7642f06a8c09686089d491ad696bb98f4d"
+SRC_URI[sha256sum] = "639c03bf8f0e920567f45c96cc7ef749a8fc29ff7fb3fb97263d67f66fb71aef"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -37,11 +32,11 @@ python do_package_prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
-PV_class-devupstream = "2.12.0+git${SRCPV}"
+PV_class-devupstream = "2.11.2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.26.2

