Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DD6C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:00 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.13211.1668953754587176914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uBDNCa5s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 136so9024484pga.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcKQllrGDjvqbm2MA9svqZXWKVjGseefosu8UFab5YY=;
        b=uBDNCa5soXM4QnwBLjLYaoqqk5aakMsCo0VRUosuG8Axj/UAV6DhFEx1raC4bpWkV7
         2MflBt/qx+rV4bzMLuiDK5BNWdshmqLBj7FbTnjEM9WT1G12IZvNCPF8vQJe7ZErFH6u
         xxuhtmHjnjEJO5dEE86K2xBRRJa93epunCA4jpyFQSboqqRJ4mcdPC8rVw7WVS2HB2ha
         xZcXtJeHtLnI58DpGgDIqMbOhTKESZTsizwEWyZpshrfQK1Cb85SFjzRn5VhXUp5Xg5W
         cTm4QguTvygoJSBKV/KsAlNvdeaKowH/1h6AY3UzKeUKjcjbRvsd3u5/dRKoZN/6aBGU
         YqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcKQllrGDjvqbm2MA9svqZXWKVjGseefosu8UFab5YY=;
        b=Abo3s/1v5K6irj0DwvtSHBu8mub11uS+K9jJew/kwPbIEhHRvli0QZ+xDSNqXGGjmI
         zoZZoTdYMPZQFTKSaG6yIPfaqjOlkBMvjaGtsamZ3EqqkAdLVB071zL2SDxy6YDPbT7i
         +YoepCr6UWGiLr32M2xJfJsllokURuwuYOyDKhKuRdQbv5qXkUaNTeqJPaBz0dPXMLEB
         zr7Pk7ht5v5YQUCCScyCRfRns1SfKlC4s5207KrOIPYu48s5jWfA98fLa3D//NgGNnC8
         TVD9StMmYOKUHH1C06XK4swB/Gcz3RuGOooQgDb+DVv566Nvq9UIjTf83S5UCsaYPQZQ
         XoVQ==
X-Gm-Message-State: ANoB5pl4t6PA+Hio5TRmF6UiZwOurJhmMT7fY3+gUoosKHbilv6h56AT
	tZgWkql0B0wdlrmKDAR9wq+CHSXWXIEaLfa9iLM=
X-Google-Smtp-Source: AA0mqf5ey3vMXPgbTvyOaoD0a+KjMn5hfOOBE1Ul9UAqu4fHEE4pN6Ryh9CQ3wUagGgmVvXqZw7y1g==
X-Received: by 2002:a05:6a00:4009:b0:563:2ada:30a3 with SMTP id by9-20020a056a00400900b005632ada30a3mr2905950pfb.27.1668953753382;
        Sun, 20 Nov 2022 06:15:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/35] lttng-modules: upgrade 2.13.5 -> 2.13.7
Date: Sun, 20 Nov 2022 04:14:58 -1000
Message-Id: <7f5ec92b3865fcd094898f4cd2d7daba76464a5e.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173609

From: Richard Purdie <richard.purdie@linuxfoundation.org>

2022-09-30 (National Day for Truth and Reconciliation) LTTng modules 2.13.7
	* Fix: handle integer capture page faults as skip field

2022-09-30 (National Day for Truth and Reconciliation) LTTng modules 2.13.6
	* Fix: bytecode validator: reject specialized load field/context ref instructions
	* Fix: bytecode validator: reject specialized load instructions
	* Fix: honor "user" attribute for array/sequence of user integers
	* wrapper: powerpc64: fix kernel crash caused by do_get_kallsyms
	* Fix: event notification: Remove duplicate event enabled check
	* Fix: event notification capture: validate buffer length
	* Fix: handle capture page faults as skip field
	* Fix: event notification capture error handling
	* Fix: capture_sequence_element_{un,}signed: handle user-space input
	* Fix: notification capture: handle userspace strings
	* Implement lttng_msgpack_write_user_str
	* Fix: bytecode interpreter: LOAD_FIELD: handle user fields
	* Fix: move "user" attribute from field to type
	* Introduce lttng_copy_from_user_check_nofault
	* fix: adjust range v5.10.137 in block probe

Remove "fix: adjust range v5.10.137 in block probe" and "wrapper: powerpc64: fix kernel
crash caused by do_get_kallsyms" since they are  included in this version bump.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1243d6afc075e3c89ca69af214e70c0d159cb832)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...djust-range-v5.10.137-in-block-probe.patch | 92 ------------------
 ...4-fix-kernel-crash-caused-by-do_get_.patch | 94 -------------------
 ...ules_2.13.5.bb => lttng-modules_2.13.7.bb} |  4 +-
 3 files changed, 1 insertion(+), 189 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (86%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
deleted file mode 100644
index 1c3918be5c..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 5dab3d515b6f5c5ac80c8e7674628495e3bf4ac6 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 22 Aug 2022 14:16:27 -0400
-Subject: [PATCH] fix: adjust range v5.10.137 in block probe
-
-See upstream commit, backported in v5.10.137 :
-
-commit 1cb3032406423b25aa984854b4d78e0100d292dd
-Author: Christoph Hellwig <hch@lst.de>
-Date:   Thu Dec 3 17:21:39 2020 +0100
-
-    block: remove the request_queue to argument request based tracepoints
-
-    [ Upstream commit a54895fa057c67700270777f7661d8d3c7fda88a ]
-
-    The request_queue can trivially be derived from the request.
-
-Change-Id: I01f96a437641421faf993b4b031171c372bd0374
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/5dab3d515b6f5c5ac80c8e7674628495e3bf4ac6]
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
-
----
- include/instrumentation/events/block.h | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
-index 882e6e08..d4821c12 100644
---- a/include/instrumentation/events/block.h
-+++ b/include/instrumentation/events/block.h
-@@ -366,7 +366,8 @@ LTTNG_TRACEPOINT_EVENT(block_rq_requeue,
- 			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
- 	)
- )
--#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- /**
-  * block_rq_requeue - place block IO request back on a queue
-  * @rq: block IO operation request
-@@ -611,7 +612,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
- 		ctf_array_text(char, comm, current->comm, TASK_COMM_LEN)
- 	)
- )
--#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
- 
- 	TP_PROTO(struct request *rq),
-@@ -746,7 +748,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS_CODE(block_rq,
- )
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0)) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- /**
-  * block_rq_insert - insert block operation request into queue
-  * @rq: block IO operation request
-@@ -781,7 +784,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq, block_rq_insert,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- /**
-  * block_rq_issue - issue pending block IO request operation to device driver
-  * @rq: block IO operation operation request
-@@ -812,7 +816,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq, block_rq_issue,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- /**
-  * block_rq_merge - merge request with another one in the elevator
-  * @rq: block IO operation operation request
-@@ -1632,7 +1637,8 @@ LTTNG_TRACEPOINT_EVENT(block_rq_remap,
- 			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
- 	)
- )
--#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
- /**
-  * block_rq_remap - map request for a block operation request
-  * @rq: block IO operation request
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
deleted file mode 100644
index b3b191c7ac..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 480cce4315ce5bf59a509e8a53a52545f393de68 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Tue, 27 Sep 2022 15:59:42 +0800
-Subject: [PATCH] wrapper: powerpc64: fix kernel crash caused by
- do_get_kallsyms
-
-Kernel crashes on powerpc64 ABIv2 as follow when lttng_tracer initializes,
-since do_get_kallsyms in lttng_wrapper fails to return a proper address of
-kallsyms_lookup_name.
-
-root@qemuppc64:~# lttng create trace_session --live -U net://127.0.0.1
-Spawning a session daemon
-lttng_kretprobes: loading out-of-tree module taints kernel.
-BUG: Unable to handle kernel data access on read at 0xfffffffffffffff8
-Faulting instruction address: 0xc0000000001f6fd0
-Oops: Kernel access of bad area, sig: 11 [#1]
-<snip>
-NIP [c0000000001f6fd0] module_kallsyms_lookup_name+0xf0/0x180
-LR [c0000000001f6f28] module_kallsyms_lookup_name+0x48/0x180
-Call Trace:
-module_kallsyms_lookup_name+0x34/0x180 (unreliable)
-kallsyms_lookup_name+0x258/0x2b0
-wrapper_kallsyms_lookup_name+0x4c/0xd0 [lttng_wrapper]
-wrapper_get_pfnblock_flags_mask_init+0x28/0x60 [lttng_wrapper]
-lttng_events_init+0x40/0x344 [lttng_tracer]
-do_one_initcall+0x78/0x340
-do_init_module+0x6c/0x2f0
-__do_sys_finit_module+0xd0/0x120
-system_call_exception+0x194/0x2f0
-system_call_vectored_common+0xe8/0x278
-<snip>
-
-do_get_kallsyms makes use of kprobe_register and in turn kprobe_lookup_name
-to get the address of the kernel function kallsyms_lookup_name. In case of
-PPC64_ELF_ABI_v2, when kprobes are placed at function entry,
-kprobe_lookup_name adjusts the global entry point of the function returned
-by kallsyms_lookup_name to the local entry point(at some fixed offset of
-global one). This adjustment is all for kprobes to be able to work properly.
-Global and local entry point are defined in powerpc64 ABIv2.
-
-When the local entry point is given, some instructions at the beginning of
-the function are skipped and thus causes the above kernel crash. We just
-want to make a simple function call which needs global entry point.
-
-This patch adds 4 bytes which is the length of one instruction to
-kallsyms_lookup_name so that it will not trigger the global to local
-adjustment, and then substracts 4 bytes from the returned address. See the
-following kernel change for more details.
-
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=290e3070762ac80e5fc4087d8c4de7e3f1d90aca
-
-Upstream-Status: Backport
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I34e68e886b97e3976d0b5e25be295a8bb866c1a4
----
- src/wrapper/kallsyms.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/wrapper/kallsyms.c b/src/wrapper/kallsyms.c
-index d2848764..93017adc 100644
---- a/src/wrapper/kallsyms.c
-+++ b/src/wrapper/kallsyms.c
-@@ -39,10 +39,26 @@ unsigned long do_get_kallsyms(void)
- 	memset(&probe, 0, sizeof(probe));
- 	probe.pre_handler = dummy_kprobe_handler;
- 	probe.symbol_name = "kallsyms_lookup_name";
-+#ifdef PPC64_ELF_ABI_v2
-+	/*
-+	 * With powerpc64 ABIv2, we need the global entry point of
-+	 * kallsyms_lookup_name to call it later, while kprobe_register would
-+	 * automatically adjust the global entry point to the local entry point,
-+	 * when a kprobe was registered at a function entry. So we add 4 bytes
-+	 * which is the length of one instruction to kallsyms_lookup_name to
-+	 * avoid the adjustment.
-+	 */
-+	probe.offset = 4;
-+#endif
- 	ret = register_kprobe(&probe);
- 	if (ret)
- 		return 0;
-+#ifdef PPC64_ELF_ABI_v2
-+	/* Substract 4 bytes to get what we originally want */
-+	addr = (unsigned long)(((char *)probe.addr) - 4);
-+#else
- 	addr = (unsigned long)probe.addr;
-+#endif
- #ifdef CONFIG_ARM
- #ifdef CONFIG_THUMB2_KERNEL
- 	if (addr)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
similarity index 86%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index 307fb912cf..49c584dff4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -11,14 +11,12 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-adjust-range-v5.10.137-in-block-probe.patch \
-           file://0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "eceb3428d80e85a9f008425beb9526195c9f7f02b302f28add56df53aef3e708"
+SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


