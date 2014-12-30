Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43C9260557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 16:25:56 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id id10so5832037vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=ZoOCZFyycp4ykGHhAqs78SQSK055rcpkRJRCxJPYfzA=;
	b=N74ZPoB5tvHsZt7h5ymShH6bWYTtXAXqUgF6Vj5PwpgkvZkKPKKI7yL2g+VQTlU8fP
	8DkGgm7XjXiuXW0aFxkq10AqlY6PtMGL7NJKZq83YIaerXZouf/Jx11WZZ/40LnJ8mKu
	QFgfWEmPLvpgMVgbOK/u2iJKQR/NYZYTpsEQB8y26+uAc2SbBu7z3s1r6ftce8kAEdqo
	yUzVrMfo9EEJ1TlbAr6Uq8Sx7Sty4pqyFPjKnGO3tpewbBSnrGyzHyuI7qQ5RQguUnVg
	XibVY3J/MJEIjFBqerJLn2q37UISvFkx6vMWwjm7lXacFPD/tgNaU8Nm1NOGpZZn+wHl
	OBLg==
X-Received: by 10.220.83.193 with SMTP id g1mr18209678vcl.46.1419956757376;
	Tue, 30 Dec 2014 08:25:57 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	gp7sm11103172vdb.27.2014.12.30.08.25.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 08:25:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 470FB1C9F1E41; Tue, 30 Dec 2014 14:25:52 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 14:25:49 -0200
Message-Id: <1419956751-12552-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] lttng-modules: Update to revision to 16d7431c3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Dec 2014 16:26:01 -0000

This update the source code to the 2.5.2 version and also brings two
fixes from stable-2.5 branch. The update also allowed the removal of
some already applied patches from the metadata.

Doing this update, it fixes following build error:

,----
| make[1]: Entering directory `.../build-framebuffer/tmp/sysroots/imx23evk/usr/src/kernel'
|
|   ERROR: Kernel configuration is invalid.
|          include/generated/autoconf.h or include/config/auto.conf are missing.
|          Run 'make oldconfig && make prepare' on kernel src to fix it.
|
|   Building modules, stage 2.
| ./scripts/Makefile.modpost:42: include/config/auto.conf: No such file or directory
| make[2]: *** No rule to make target `include/config/auto.conf'.  Stop.
| make[1]: *** [modules] Error 2
| make[1]: Leaving directory `.../build-framebuffer/tmp/sysroots/imx23evk/usr/src/kernel'
| make: *** [default] Error 2
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...compaction-instrumentation-to-3.16-kernel.patch |  83 ---------------
 .../Update-statedump-to-3.17-nsproxy-locking.patch |  70 -------------
 ...ate-vmscan-instrumentation-to-3.16-kernel.patch |  70 -------------
 ...-fix-mm_compaction_isolate_template-build.patch |  41 --------
 .../fix_build_with_v3.17_kernel.patch              | 113 ---------------------
 ...tng-modules_2.5.0.bb => lttng-modules_2.5.2.bb} |   7 +-
 6 files changed, 1 insertion(+), 383 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.5.0.bb => lttng-modules_2.5.2.bb} (77%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
deleted file mode 100644
index 0a056a9..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 0007344741ef65259bc52dea72259173dfbf96c0 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Sun, 13 Jul 2014 13:33:21 -0400
-Subject: [PATCH 2/2] Update compaction instrumentation to 3.16 kernel
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/compaction.h | 45 +++++++++++++++++++++++-
- 1 file changed, 44 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/compaction.h b/instrumentation/events/lttng-module/compaction.h
-index 1b237fa45ab0..22024e9ee582 100644
---- a/instrumentation/events/lttng-module/compaction.h
-+++ b/instrumentation/events/lttng-module/compaction.h
-@@ -6,6 +6,7 @@
- 
- #include <linux/types.h>
- #include <linux/tracepoint.h>
-+#include <linux/version.h>
- #include <trace/events/gfpflags.h>
- 
- DECLARE_EVENT_CLASS(mm_compaction_isolate_template,
-@@ -45,6 +46,48 @@ DEFINE_EVENT(mm_compaction_isolate_template, mm_compaction_isolate_freepages,
- 	TP_ARGS(nr_scanned, nr_taken)
- )
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
-+TRACE_EVENT(mm_compaction_migratepages,
-+
-+	TP_PROTO(unsigned long nr_all,
-+		int migrate_rc,
-+		struct list_head *migratepages),
-+
-+	TP_ARGS(nr_all, migrate_rc, migratepages),
-+
-+	TP_STRUCT__entry(
-+		__field(unsigned long, nr_migrated)
-+		__field(unsigned long, nr_failed)
-+	),
-+
-+	TP_fast_assign(
-+		tp_assign(nr_migrated,
-+			nr_all -
-+			(migrate_rc >= 0 ? migrate_rc :
-+				({
-+					unsigned long nr_failed = 0;
-+					struct list_head *page_lru;
-+
-+					list_for_each(page_lru, migratepages)
-+						nr_failed++;
-+					nr_failed;
-+				})))
-+		tp_assign(nr_failed,
-+				({
-+					unsigned long nr_failed = 0;
-+					struct list_head *page_lru;
-+
-+					list_for_each(page_lru, migratepages)
-+						nr_failed++;
-+					nr_failed;
-+				}))
-+	),
-+
-+	TP_printk("nr_migrated=%lu nr_failed=%lu",
-+		__entry->nr_migrated,
-+		__entry->nr_failed)
-+)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
- TRACE_EVENT(mm_compaction_migratepages,
- 
- 	TP_PROTO(unsigned long nr_migrated,
-@@ -66,7 +109,7 @@ TRACE_EVENT(mm_compaction_migratepages,
- 		__entry->nr_migrated,
- 		__entry->nr_failed)
- )
--
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
- 
- #endif /* _TRACE_COMPACTION_H */
- 
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
deleted file mode 100644
index 0f18c8a..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
-From 4ba1f53c5aebb4433fedc25d65af010274985043 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Thu, 21 Aug 2014 10:53:12 -0400
-Subject: [PATCH 2/3] Update statedump to 3.17 nsproxy locking
-
-This Linux upstream commit introduces locking strategy back and forth:
-
-commit 728dba3a39c66b3d8ac889ddbe38b5b1c264aec3
-Author: Eric W. Biederman <ebiederm@xmission.com>
-Date:   Mon Feb 3 19:13:49 2014 -0800
-
-    namespaces: Use task_lock and not rcu to protect nsproxy
-
-Use the task lock starting from kernel 3.17 rather than RCU to access
-the task nsproxy.
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lttng-statedump-impl.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
-index dad51ddaa250..e4caa488e436 100644
---- a/lttng-statedump-impl.c
-+++ b/lttng-statedump-impl.c
-@@ -378,6 +378,9 @@ int lttng_list_interrupts(struct lttng_session *session)
- }
- #endif
- 
-+/*
-+ * Called with task lock held.
-+ */
- static
- void lttng_statedump_process_ns(struct lttng_session *session,
- 		struct task_struct *p,
-@@ -389,8 +392,18 @@ void lttng_statedump_process_ns(struct lttng_session *session,
- 	struct nsproxy *proxy;
- 	struct pid_namespace *pid_ns;
- 
-+	/*
-+	 * Back and forth on locking strategy within Linux upstream for nsproxy.
-+	 * See Linux upstream commit 728dba3a39c66b3d8ac889ddbe38b5b1c264aec3
-+	 * "namespaces: Use task_lock and not rcu to protect nsproxy"
-+	 * for details.
-+	 */
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
- 	rcu_read_lock();
- 	proxy = task_nsproxy(p);
-+#else /* #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
-+	proxy = p->nsproxy;
-+#endif /* #else #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
- 	if (proxy) {
- 		pid_ns = lttng_get_proxy_pid_ns(proxy);
- 		do {
-@@ -402,7 +415,9 @@ void lttng_statedump_process_ns(struct lttng_session *session,
- 		trace_lttng_statedump_process_state(session,
- 			p, type, mode, submode, status, NULL);
- 	}
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
- 	rcu_read_unlock();
-+#endif /* #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
- }
- 
- static
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
deleted file mode 100644
index 5f02270..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 5defe623568273e9b87da1b817e373ff087fd862 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Sun, 13 Jul 2014 13:27:01 -0400
-Subject: [PATCH 1/2] Update vmscan instrumentation to 3.16 kernel
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/vmscan.h | 39 ++++++++++++++++++++++++++++
- 1 file changed, 39 insertions(+)
-
-diff --git a/instrumentation/events/lttng-module/vmscan.h b/instrumentation/events/lttng-module/vmscan.h
-index 1fd50ba7c235..0b4aa56761dc 100644
---- a/instrumentation/events/lttng-module/vmscan.h
-+++ b/instrumentation/events/lttng-module/vmscan.h
-@@ -238,6 +238,44 @@ TRACE_EVENT(mm_shrink_slab_start,
- 		__entry->total_scan)
- )
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
-+TRACE_EVENT(mm_shrink_slab_end,
-+	TP_PROTO(struct shrinker *shr, int nid, int shrinker_retval,
-+		long unused_scan_cnt, long new_scan_cnt, long total_scan),
-+
-+	TP_ARGS(shr, nid, shrinker_retval, unused_scan_cnt, new_scan_cnt,
-+		total_scan),
-+
-+	TP_STRUCT__entry(
-+		__field(struct shrinker *, shr)
-+		__field(int, nid)
-+		__field(void *, shrink)
-+		__field(long, unused_scan)
-+		__field(long, new_scan)
-+		__field(int, retval)
-+		__field(long, total_scan)
-+	),
-+
-+	TP_fast_assign(
-+		tp_assign(shr, shr)
-+		tp_assign(nid, nid)
-+		tp_assign(shrink, shr->scan_objects)
-+		tp_assign(unused_scan, unused_scan_cnt)
-+		tp_assign(new_scan, new_scan_cnt)
-+		tp_assign(retval, shrinker_retval)
-+		tp_assign(total_scan, total_scan)
-+	),
-+
-+	TP_printk("%pF %p: nid %d unused scan count %ld new scan count %ld total_scan %ld last shrinker return val %d",
-+		__entry->shrink,
-+		__entry->shr,
-+		__entry->nid,
-+		__entry->unused_scan,
-+		__entry->new_scan,
-+		__entry->total_scan,
-+		__entry->retval)
-+)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
- TRACE_EVENT(mm_shrink_slab_end,
- 	TP_PROTO(struct shrinker *shr, int shrinker_retval,
- 		long unused_scan_cnt, long new_scan_cnt),
-@@ -274,6 +312,7 @@ TRACE_EVENT(mm_shrink_slab_end,
- 		__entry->total_scan,
- 		__entry->retval)
- )
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
- #endif
- 
- DECLARE_EVENT_CLASS(mm_vmscan_lru_isolate_template,
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch b/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
deleted file mode 100644
index a99871a..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From af48c7b08de4b811d3d974e65e362b86ce8c4a34 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 10 Dec 2014 03:19:28 -0500
-Subject: [PATCH] compaction: fix mm_compaction_isolate_template build
-
-linux-stable integrated the 3.16 commit f8c9301fa5a2a [mm/compaction: do
-not count migratepages when unnecessary] with the 3.14.25 update.
-
-So we have to update the lttng-module linux version codes to use the
-new definition in builds greater than 3.14.24 or 3.16.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- instrumentation/events/lttng-module/compaction.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/compaction.h b/instrumentation/events/lttng-module/compaction.h
-index 22024e9ee582..07afbe06f1a6 100644
---- a/instrumentation/events/lttng-module/compaction.h
-+++ b/instrumentation/events/lttng-module/compaction.h
-@@ -46,7 +46,7 @@ DEFINE_EVENT(mm_compaction_isolate_template, mm_compaction_isolate_freepages,
- 	TP_ARGS(nr_scanned, nr_taken)
- )
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25))
- TRACE_EVENT(mm_compaction_migratepages,
- 
- 	TP_PROTO(unsigned long nr_all,
-@@ -87,7 +87,7 @@ TRACE_EVENT(mm_compaction_migratepages,
- 		__entry->nr_migrated,
- 		__entry->nr_failed)
- )
--#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25)) */
- TRACE_EVENT(mm_compaction_migratepages,
- 
- 	TP_PROTO(unsigned long nr_migrated,
--- 
-2.1.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
deleted file mode 100644
index 97b7a53..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-
-Upstream-Status: Backport
-
-commit 7df57eb5d6bdc85ddcf2b9afb6cd0cacfb22096e
-Author: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date:   Thu Sep 25 18:19:43 2014 -0700
-
-    asoc.h: fix build with v3.17 kernel
-    
-    The snd_soc_codec structure has changed in the v3.17 kernel. Some
-    of the redundant fields have been removed. To be specific this commit
-    from the v3.17 kernel causes the build failure for lttng-modules.
-    
-    |commit f4333203ec933f9272c90c7add01774ec2cf94d3
-    |Author: Lars-Peter Clausen <lars@metafoo.de>
-    |Date:   Mon Jun 16 18:13:02 2014 +0200
-    |
-    |    ASoC: Move name and id from CODEC/platform to component
-    |
-    |    The component struct already has a name and id field which are initialized to
-    |    the same values as the same fields in the CODEC and platform structs. So remove
-    |    them from the CODEC and platform structs and used the ones from the component
-    |    struct instead.
-    |
-    |    Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
-    |    Signed-off-by: Mark Brown <broonie@linaro.org>
-    
-    The asoc.h is changed according to the change in the above kernel commit
-    to fix the lttng-modules build. The change in the lttng-modules code is
-    conditional on the kernel version, so that it does not break builds with
-    previous kernel versions.
-    
-    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-    Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-diff --git a/instrumentation/events/lttng-module/asoc.h b/instrumentation/events/lttng-module/asoc.h
-index 672bea4..bf9cf86 100644
---- a/instrumentation/events/lttng-module/asoc.h
-+++ b/instrumentation/events/lttng-module/asoc.h
-@@ -21,6 +21,14 @@ struct snd_soc_card;
- struct snd_soc_dapm_widget;
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
-+#define CODEC_NAME_FIELD component.name
-+#define CODEC_ID_FIELD component.id
-+#else
-+#define CODEC_NAME_FIELD name
-+#define CODEC_ID_FIELD id
-+#endif
-+
- /*
-  * Log register events
-  */
-@@ -32,15 +40,15 @@ DECLARE_EVENT_CLASS(snd_soc_reg,
- 	TP_ARGS(codec, reg, val),
- 
- 	TP_STRUCT__entry(
--		__string(	name,		codec->name	)
-+		__string(	name,		codec->CODEC_NAME_FIELD	)
- 		__field(	int,		id		)
- 		__field(	unsigned int,	reg		)
- 		__field(	unsigned int,	val		)
- 	),
- 
- 	TP_fast_assign(
--		tp_strcpy(name, codec->name)
--		tp_assign(id, codec->id)
-+		tp_strcpy(name, codec->CODEC_NAME_FIELD)
-+		tp_assign(id, codec->CODEC_ID_FIELD)
- 		tp_assign(reg, reg)
- 		tp_assign(val, val)
- 	),
-@@ -77,15 +85,15 @@ DECLARE_EVENT_CLASS(snd_soc_preg,
- 	TP_ARGS(platform, reg, val),
- 
- 	TP_STRUCT__entry(
--		__string(	name,		platform->name	)
-+		__string(	name,		platform->CODEC_NAME_FIELD	)
- 		__field(	int,		id		)
- 		__field(	unsigned int,	reg		)
- 		__field(	unsigned int,	val		)
- 	),
- 
- 	TP_fast_assign(
--		tp_strcpy(name, platform->name)
--		tp_assign(id, platform->id)
-+		tp_strcpy(name, platform->CODEC_NAME_FIELD)
-+		tp_assign(id, platform->CODEC_ID_FIELD)
- 		tp_assign(reg, reg)
- 		tp_assign(val, val)
- 	),
-@@ -399,17 +407,17 @@ TRACE_EVENT(snd_soc_cache_sync,
- 	TP_ARGS(codec, type, status),
- 
- 	TP_STRUCT__entry(
--		__string(	name,		codec->name	)
-+		__string(	name,		codec->CODEC_NAME_FIELD	)
- 		__string(	status,		status		)
- 		__string(	type,		type		)
- 		__field(	int,		id		)
- 	),
- 
- 	TP_fast_assign(
--		tp_strcpy(name, codec->name)
-+		tp_strcpy(name, codec->CODEC_NAME_FIELD)
- 		tp_strcpy(status, status)
- 		tp_strcpy(type, type)
--		tp_assign(id, codec->id)
-+		tp_assign(id, codec->CODEC_ID_FIELD)
- 	),
- 
- 	TP_printk("codec=%s.%d type=%s status=%s", __get_str(name),
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
similarity index 77%
rename from meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
index f9475e9..55df07f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
@@ -11,19 +11,14 @@ do_configure[depends] += "virtual/kernel:do_install"
 
 inherit module
 
-SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
+SRCREV = "16d7431c3a78605ea598dbd3f081a2b1a8463f23"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://Update-compaction-instrumentation-to-3.16-kernel.patch \
-           file://Update-vmscan-instrumentation-to-3.16-kernel.patch \
            file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
-           file://Update-statedump-to-3.17-nsproxy-locking.patch \
            file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
-           file://fix_build_with_v3.17_kernel.patch \
-           file://compaction-fix-mm_compaction_isolate_template-build.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
2.1.4


