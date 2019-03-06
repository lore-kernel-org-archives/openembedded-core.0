Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id ACA457CDA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:22 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id w18so10442355itj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ML9IkhotUA1rwkDnKWJHWLDzA/5QoIx+Q/G9BjDHjMk=;
	b=lFe8XztHMqOa7vqM1q1ty19fuxaUIcmzzVG3aR/FH/sO3d7U1VQxO855K8hvjBvgfA
	hWObBz2FdBDbYIjkHOJYggER22fEy07UvqHItMKKUhNKs9LzfpOK49pxtPS/x1yJz9am
	XBRU4Gh9uOv5TCfYEJDgO2/ZEc8aODM5yo2sLM4rfBvsarvFxirYJbBT6fIIMgXKhrYI
	RL2V9TcU/hGv9AocEkoV7e0ruI9jA32ZcUvApkrKVYD3VSXWEf2VzHXwD+baocxii/mu
	WKTPDlA5dXddjP7cVUsLh19l8MdSW37VSRDNfhkRiOVem9KE1yQCgc3INR0FvwrQtPI2
	wXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ML9IkhotUA1rwkDnKWJHWLDzA/5QoIx+Q/G9BjDHjMk=;
	b=kjByAtujoeb5Mvhtzw7h45ESwVTveKdFPWqPFHga9caUvyGo6hcf+RI1kJSn7Ii/ij
	9O/SeZ5JIQ86cXdPNMzK6fABVtnwPLgCApEVnz8pH+038Oengo9oYI6DRUmuXt17Ezsa
	p76fBTMy3gd9D0pldQYo5lJMbM3D+VqKw23dYEo8rtG4e5pJkEVEjSdmLwia7Rgv0DqX
	5AmZctCOGT0UFRyxyhf4VroRMjGASwCxV5E9HDqfbmbHUpB6rjkaIEx55YWrA2fqaPYu
	lwp2jNt2XxBsRHdiXwlzDzOHwO5cHxX1ZjWacZuNZ7WYcMiL5IWAPdUGbWU2g57NzlwG
	29qg==
X-Gm-Message-State: APjAAAUpbYwuSpfKrZHMNYbzfIYcfTmxRBqvQtFYvvj8EQNiKCNxOg3Y
	TaM5Cr5TVWsvThMAqMODQ8WPo/YM4Ss=
X-Google-Smtp-Source: APXvYqzziLSET3BAim+VtdUbpK2cCTOjj4Cs7NrhmL+jLbXsr/jE/koA+WoMe8kxA/bnNCzmkLo0kA==
X-Received: by 2002:a02:a58a:: with SMTP id b10mr4659292jam.82.1551890242861; 
	Wed, 06 Mar 2019 08:37:22 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:12 -0500
Message-Id: <6023902af59eb91d5ea45b2615cc4404504d7969.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] lttng: add 5.x fixup patches to 2.10.8 release
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:22 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

lttng hasn't released 2.10.9, but the stable/2.10 branch
contains changes that we need to build against the 5.0
kernel.

We add them here as patches, and we can drop them in the
future when lttng is updated.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...nguish-between-kernel_siginfo-and-si.patch | 133 +++++++
 ...-signal-Remove-SEND_SIG_FORCED-v4.20.patch |  67 ++++
 ...reserved-cluster-count-when-removing.patch | 149 ++++++++
 ...x-timer-instrumentation-for-RHEL-7.6.patch |  32 ++
 ...argument-from-access_ok-function-v5..patch | 204 +++++++++++
 ...ter-values-with-task-tk_pid-and-rpc_.patch | 186 ++++++++++
 ...ify-defining-common-RPC-trace-events.patch | 183 ++++++++++
 ...-fsid-metadata_fsid-fields-from-btrf.patch | 341 ++++++++++++++++++
 ...p-mempool-Remove-logically-dead-code.patch |  46 +++
 .../lttng/lttng-modules_2.10.8.bb             |   9 +
 10 files changed, 1350 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
new file mode 100644
index 0000000000..351184dabb
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
@@ -0,0 +1,133 @@
+From 0a0d736ec89dffdbc83e7181166a99d5563acfe8 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 5 Nov 2018 11:35:52 -0500
+Subject: [PATCH 1/9] Fix: signal: Distinguish between kernel_siginfo and
+ siginfo (v4.20)
+
+See upstream commit :
+
+  commit ae7795bc6187a15ec51cf258abae656a625f9980
+  Author: Eric W. Biederman <ebiederm@xmission.com>
+  Date:   Tue Sep 25 11:27:20 2018 +0200
+
+    signal: Distinguish between kernel_siginfo and siginfo
+
+    Linus recently observed that if we did not worry about the padding
+    member in struct siginfo it is only about 48 bytes, and 48 bytes is
+    much nicer than 128 bytes for allocating on the stack and copying
+    around in the kernel.
+
+    The obvious thing of only adding the padding when userspace is
+    including siginfo.h won't work as there are sigframe definitions in
+    the kernel that embed struct siginfo.
+
+    So split siginfo in two; kernel_siginfo and siginfo.  Keeping the
+    traditional name for the userspace definition.  While the version that
+    is used internally to the kernel and ultimately will not be padded to
+    128 bytes is called kernel_siginfo.
+
+    The definition of struct kernel_siginfo I have put in include/signal_types.h
+
+    A set of buildtime checks has been added to verify the two structures have
+    the same field offsets.
+
+    To make it easy to verify the change kernel_siginfo retains the same
+    size as siginfo.  The reduction in size comes in a following change.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/0a0d736ec89dffdbc83e7181166a99d5563acfe8
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ instrumentation/events/lttng-module/signal.h | 41 ++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 4 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/signal.h b/instrumentation/events/lttng-module/signal.h
+index b3c9126..8783b52 100644
+--- a/instrumentation/events/lttng-module/signal.h
++++ b/instrumentation/events/lttng-module/signal.h
+@@ -35,21 +35,24 @@
+  * SEND_SIG_NOINFO means that si_code is SI_USER, and SEND_SIG_PRIV
+  * means that si_code is SI_KERNEL.
+  */
+-#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
+ LTTNG_TRACEPOINT_EVENT(signal_generate,
+ 
+-	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task),
++	TP_PROTO(int sig, struct kernel_siginfo *info, struct task_struct *task,
++			int group, int result),
+ 
+-	TP_ARGS(sig, info, task),
++	TP_ARGS(sig, info, task, group, result),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer(int, sig, sig)
+ 		LTTNG_FIELDS_SIGINFO(info)
+ 		ctf_array_text(char, comm, task->comm, TASK_COMM_LEN)
+ 		ctf_integer(pid_t, pid, task->pid)
++		ctf_integer(int, group, group)
++		ctf_integer(int, result, result)
+ 	)
+ )
+-#else
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0))
+ LTTNG_TRACEPOINT_EVENT(signal_generate,
+ 
+ 	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task,
+@@ -66,6 +69,20 @@ LTTNG_TRACEPOINT_EVENT(signal_generate,
+ 		ctf_integer(int, result, result)
+ 	)
+ )
++#else
++LTTNG_TRACEPOINT_EVENT(signal_generate,
++
++	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task),
++
++	TP_ARGS(sig, info, task),
++
++	TP_FIELDS(
++		ctf_integer(int, sig, sig)
++		LTTNG_FIELDS_SIGINFO(info)
++		ctf_array_text(char, comm, task->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, pid, task->pid)
++	)
++)
+ #endif
+ 
+ /**
+@@ -82,6 +99,21 @@ LTTNG_TRACEPOINT_EVENT(signal_generate,
+  * This means, this can show which signals are actually delivered, but
+  * matching generated signals and delivered signals may not be correct.
+  */
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
++LTTNG_TRACEPOINT_EVENT(signal_deliver,
++
++	TP_PROTO(int sig, struct kernel_siginfo *info, struct k_sigaction *ka),
++
++	TP_ARGS(sig, info, ka),
++
++	TP_FIELDS(
++		ctf_integer(int, sig, sig)
++		LTTNG_FIELDS_SIGINFO(info)
++		ctf_integer(unsigned long, sa_handler, (unsigned long) ka->sa.sa_handler)
++		ctf_integer(unsigned long, sa_flags, ka->sa.sa_flags)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(signal_deliver,
+ 
+ 	TP_PROTO(int sig, struct siginfo *info, struct k_sigaction *ka),
+@@ -95,6 +127,7 @@ LTTNG_TRACEPOINT_EVENT(signal_deliver,
+ 		ctf_integer(unsigned long, sa_flags, ka->sa.sa_flags)
+ 	)
+ )
++#endif
+ 
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(signal_queue_overflow,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
new file mode 100644
index 0000000000..905b68165b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
@@ -0,0 +1,67 @@
+From 26bc064a4d4c85e6000393aadb38659f99b59162 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 5 Nov 2018 11:35:53 -0500
+Subject: [PATCH 2/9] Fix: signal: Remove SEND_SIG_FORCED (v4.20)
+
+See upstream commit :
+
+  commit 4ff4c31a6e85f4c49fbeebeaa28018d002884b5a
+  Author: Eric W. Biederman <ebiederm@xmission.com>
+  Date:   Mon Sep 3 10:39:04 2018 +0200
+
+    signal: Remove SEND_SIG_FORCED
+
+    There are no more users of SEND_SIG_FORCED so it may be safely removed.
+
+    Remove the definition of SEND_SIG_FORCED, it's use in is_si_special,
+    it's use in TP_STORE_SIGINFO, and it's use in __send_signal as without
+    any users the uses of SEND_SIG_FORCED are now unncessary.
+
+    This makes the code simpler, easier to understand and use.  Users of
+    signal sending functions now no longer need to ask themselves do I
+    need to use SEND_SIG_FORCED.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/26bc064a4d4c85e6000393aadb38659f99b59162
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> 
+
+---
+ instrumentation/events/lttng-module/signal.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/signal.h b/instrumentation/events/lttng-module/signal.h
+index 8783b52..ad8fe69 100644
+--- a/instrumentation/events/lttng-module/signal.h
++++ b/instrumentation/events/lttng-module/signal.h
+@@ -12,6 +12,17 @@
+ #include <linux/signal.h>
+ #include <linux/sched.h>
+ #undef LTTNG_FIELDS_SIGINFO
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
++#define LTTNG_FIELDS_SIGINFO(info)				\
++		ctf_integer(int, errno,				\
++			(info == SEND_SIG_NOINFO || info == SEND_SIG_PRIV) ? \
++			0 :					\
++			info->si_errno)				\
++		ctf_integer(int, code,				\
++			(info == SEND_SIG_NOINFO) ? 		\
++			SI_USER : 				\
++			((info == SEND_SIG_PRIV) ? SI_KERNEL : info->si_code))
++#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0) */
+ #define LTTNG_FIELDS_SIGINFO(info)				\
+ 		ctf_integer(int, errno,				\
+ 			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED || info == SEND_SIG_PRIV) ? \
+@@ -21,6 +32,7 @@
+ 			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED) ? \
+ 			SI_USER : 				\
+ 			((info == SEND_SIG_PRIV) ? SI_KERNEL : info->si_code))
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0) */
+ #endif /* _TRACE_SIGNAL_DEF */
+ 
+ /**
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
new file mode 100644
index 0000000000..7edffee542
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
@@ -0,0 +1,149 @@
+From cb9f1a821bcf55cecf3813195fd6d4eff8070927 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 5 Nov 2018 11:35:54 -0500
+Subject: [PATCH 3/9] Fix: ext4: adjust reserved cluster count when removing
+ extents (v4.20)
+
+See upstream commit :
+
+  commit 9fe671496b6c286f9033aedfc1718d67721da0ae
+  Author: Eric Whitney <enwlinux@gmail.com>
+  Date:   Mon Oct 1 14:25:08 2018 -0400
+
+    ext4: adjust reserved cluster count when removing extents
+
+    Modify ext4_ext_remove_space() and the code it calls to correct the
+    reserved cluster count for pending reservations (delayed allocated
+    clusters shared with allocated blocks) when a block range is removed
+    from the extent tree.  Pending reservations may be found for the clusters
+    at the ends of written or unwritten extents when a block range is removed.
+    If a physical cluster at the end of an extent is freed, it's necessary
+    to increment the reserved cluster count to maintain correct accounting
+    if the corresponding logical cluster is shared with at least one
+    delayed and unwritten extent as found in the extents status tree.
+
+    Add a new function, ext4_rereserve_cluster(), to reapply a reservation
+    on a delayed allocated cluster sharing blocks with a freed allocated
+    cluster.  To avoid ENOSPC on reservation, a flag is applied to
+    ext4_free_blocks() to briefly defer updating the freeclusters counter
+    when an allocated cluster is freed.  This prevents another thread
+    from allocating the freed block before the reservation can be reapplied.
+
+    Redefine the partial cluster object as a struct to carry more state
+    information and to clarify the code using it.
+
+    Adjust the conditional code structure in ext4_ext_remove_space to
+    reduce the indentation level in the main body of the code to improve
+    readability.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/cb9f1a821bcf55cecf3813195fd6d4eff8070927
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+---
+ instrumentation/events/lttng-module/ext4.h | 72 +++++++++++++++++++++-
+ 1 file changed, 69 insertions(+), 3 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
+index fe6f802..83a80ba 100644
+--- a/instrumentation/events/lttng-module/ext4.h
++++ b/instrumentation/events/lttng-module/ext4.h
+@@ -1602,7 +1602,30 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_show_extent,
+ 	)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
++
++LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
++	TP_PROTO(struct inode *inode, struct ext4_extent *ex,
++		 ext4_lblk_t from, ext4_fsblk_t to,
++		 struct partial_cluster *pc),
++
++	TP_ARGS(inode, ex, from, to, pc),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(ext4_lblk_t, from, from)
++		ctf_integer(ext4_lblk_t, to, to)
++		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
++		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
++		ctf_integer(unsigned short, ee_len, ext4_ext_get_actual_len(ex))
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
+ 	    TP_PROTO(struct inode *inode, struct ext4_extent *ex,
+@@ -1646,7 +1669,29 @@ LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
+ 
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
++
++LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
++	TP_PROTO(struct inode *inode, ext4_lblk_t start,
++		 struct ext4_extent *ex,
++		 struct partial_cluster *pc),
++
++	TP_ARGS(inode, start, ex, pc),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(ext4_lblk_t, start, start)
++		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
++		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
++		ctf_integer(short, ee_len, ext4_ext_get_actual_len(ex))
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
+ 	TP_PROTO(struct inode *inode, ext4_lblk_t start,
+@@ -1733,7 +1778,28 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space,
+ 
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
++
++LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
++	TP_PROTO(struct inode *inode, ext4_lblk_t start, ext4_lblk_t end,
++		 int depth, struct partial_cluster *pc, __le16 eh_entries),
++
++	TP_ARGS(inode, start, end, depth, pc, eh_entries),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(ext4_lblk_t, start, start)
++		ctf_integer(ext4_lblk_t, end, end)
++		ctf_integer(int, depth, depth)
++		ctf_integer(unsigned short, eh_entries, le16_to_cpu(eh_entries))
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
+ 	TP_PROTO(struct inode *inode, ext4_lblk_t start, ext4_lblk_t end,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
new file mode 100644
index 0000000000..b5d50dba1c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
@@ -0,0 +1,32 @@
+From 4eaeb54a27fbf701c2a4908a6e90a978b93deb06 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 6 Dec 2018 11:31:51 -0500
+Subject: [PATCH 4/9] Fix: timer instrumentation for RHEL 7.6
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/4eaeb54a27fbf701c2a4908a6e90a978b93deb06
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ instrumentation/events/lttng-module/timer.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/timer.h b/instrumentation/events/lttng-module/timer.h
+index 6f0cb7f..8807ad5 100644
+--- a/instrumentation/events/lttng-module/timer.h
++++ b/instrumentation/events/lttng-module/timer.h
+@@ -44,7 +44,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
+ 	TP_ARGS(timer)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0) || \
++	LTTNG_RHEL_KERNEL_RANGE(3,10,0,957,0,0, 3,11,0,0,0,0))
+ /**
+  * timer_start - called when the timer is started
+  * @timer:	pointer to struct timer_list
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
new file mode 100644
index 0000000000..2266bbd9e0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
@@ -0,0 +1,204 @@
+From 0039dbe9891cfdf2c0d04691f83c2f342993dfd7 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 9 Jan 2019 14:59:15 -0500
+Subject: [PATCH 5/9] Fix: Remove 'type' argument from access_ok() function
+ (v5.0)
+
+See upstream commit :
+
+  commit 96d4f267e40f9509e8a66e2b39e8b95655617693
+  Author: Linus Torvalds <torvalds@linux-foundation.org>
+  Date:   Thu Jan 3 18:57:57 2019 -0800
+
+    Remove 'type' argument from access_ok() function
+
+    Nobody has actually used the type (VERIFY_READ vs VERIFY_WRITE) argument
+    of the user address range verification function since we got rid of the
+    old racy i386-only code to walk page tables by hand.
+
+    It existed because the original 80386 would not honor the write protect
+    bit when in kernel mode, so you had to do COW by hand before doing any
+    user access.  But we haven't supported that in a long time, and these
+    days the 'type' argument is a purely historical artifact.
+
+    A discussion about extending 'user_access_begin()' to do the range
+    checking resulted this patch, because there is no way we're going to
+    move the old VERIFY_xyz interface to that model.  And it's best done at
+    the end of the merge window when I've done most of my merges, so let's
+    just get this done once and for all.
+
+    This patch was mostly done with a sed-script, with manual fix-ups for
+    the cases that weren't of the trivial 'access_ok(VERIFY_xyz' form.
+
+    There were a couple of notable cases:
+
+     - csky still had the old "verify_area()" name as an alias.
+
+     - the iter_iov code had magical hardcoded knowledge of the actual
+       values of VERIFY_{READ,WRITE} (not that they mattered, since nothing
+       really used it)
+
+     - microblaze used the type argument for a debug printout
+
+    but other than those oddities this should be a total no-op patch.
+
+    I tried to fix up all architectures, did fairly extensive grepping for
+    access_ok() uses, and the changes are trivial, but I may have missed
+    something.  Any missed conversion should be trivially fixable, though.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/0039dbe9891cfdf2c0d04691f83c2f342993dfd7
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ lib/ringbuffer/backend.h              |  8 ++++----
+ lib/ringbuffer/ring_buffer_iterator.c |  3 ++-
+ lttng-filter-interpreter.c            |  4 ++--
+ probes/lttng-probe-user.c             |  3 ++-
+ wrapper/uaccess.h                     | 28 +++++++++++++++++++++++++++
+ 5 files changed, 38 insertions(+), 8 deletions(-)
+ create mode 100644 wrapper/uaccess.h
+
+diff --git a/lib/ringbuffer/backend.h b/lib/ringbuffer/backend.h
+index 0b75de8..3f8c108 100644
+--- a/lib/ringbuffer/backend.h
++++ b/lib/ringbuffer/backend.h
+@@ -34,7 +34,7 @@
+ #include <linux/list.h>
+ #include <linux/fs.h>
+ #include <linux/mm.h>
+-#include <linux/uaccess.h>
++#include <wrapper/uaccess.h>
+ 
+ /* Internal helpers */
+ #include <wrapper/ringbuffer/backend_internal.h>
+@@ -302,7 +302,7 @@ void lib_ring_buffer_copy_from_user_inatomic(const struct lib_ring_buffer_config
+ 
+ 	set_fs(KERNEL_DS);
+ 	pagefault_disable();
+-	if (unlikely(!access_ok(VERIFY_READ, src, len)))
++	if (unlikely(!lttng_access_ok(VERIFY_READ, src, len)))
+ 		goto fill_buffer;
+ 
+ 	if (likely(pagecpy == len)) {
+@@ -372,7 +372,7 @@ void lib_ring_buffer_strcpy_from_user_inatomic(const struct lib_ring_buffer_conf
+ 
+ 	set_fs(KERNEL_DS);
+ 	pagefault_disable();
+-	if (unlikely(!access_ok(VERIFY_READ, src, len)))
++	if (unlikely(!lttng_access_ok(VERIFY_READ, src, len)))
+ 		goto fill_buffer;
+ 
+ 	if (likely(pagecpy == len)) {
+@@ -462,7 +462,7 @@ unsigned long lib_ring_buffer_copy_from_user_check_nofault(void *dest,
+ 	unsigned long ret;
+ 	mm_segment_t old_fs;
+ 
+-	if (!access_ok(VERIFY_READ, src, len))
++	if (!lttng_access_ok(VERIFY_READ, src, len))
+ 		return 1;
+ 	old_fs = get_fs();
+ 	set_fs(KERNEL_DS);
+diff --git a/lib/ringbuffer/ring_buffer_iterator.c b/lib/ringbuffer/ring_buffer_iterator.c
+index 61eaa5b..9645946 100644
+--- a/lib/ringbuffer/ring_buffer_iterator.c
++++ b/lib/ringbuffer/ring_buffer_iterator.c
+@@ -27,6 +27,7 @@
+ 
+ #include <wrapper/ringbuffer/iterator.h>
+ #include <wrapper/file.h>
++#include <wrapper/uaccess.h>
+ #include <linux/jiffies.h>
+ #include <linux/delay.h>
+ #include <linux/module.h>
+@@ -621,7 +622,7 @@ ssize_t channel_ring_buffer_file_read(struct file *filp,
+ 	ssize_t len;
+ 
+ 	might_sleep();
+-	if (!access_ok(VERIFY_WRITE, user_buf, count))
++	if (!lttng_access_ok(VERIFY_WRITE, user_buf, count))
+ 		return -EFAULT;
+ 
+ 	/* Finish copy of previous record */
+diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
+index e131462..bee2918 100644
+--- a/lttng-filter-interpreter.c
++++ b/lttng-filter-interpreter.c
+@@ -24,7 +24,7 @@
+  * SOFTWARE.
+  */
+ 
+-#include <linux/uaccess.h>
++#include <wrapper/uaccess.h>
+ #include <wrapper/frame.h>
+ #include <wrapper/types.h>
+ 
+@@ -46,7 +46,7 @@ char get_char(struct estack_entry *reg, size_t offset)
+ 		char c;
+ 
+ 		/* Handle invalid access as end of string. */
+-		if (unlikely(!access_ok(VERIFY_READ,
++		if (unlikely(!lttng_access_ok(VERIFY_READ,
+ 				reg->u.s.user_str + offset,
+ 				sizeof(c))))
+ 			return '\0';
+diff --git a/probes/lttng-probe-user.c b/probes/lttng-probe-user.c
+index 099a66b..ed566dd 100644
+--- a/probes/lttng-probe-user.c
++++ b/probes/lttng-probe-user.c
+@@ -20,6 +20,7 @@
+ 
+ #include <linux/uaccess.h>
+ #include <linux/module.h>
++#include <wrapper/uaccess.h>
+ #include <probes/lttng-probe-user.h>
+ 
+ /*
+@@ -43,7 +44,7 @@ long lttng_strlen_user_inatomic(const char *addr)
+ 		char v;
+ 		unsigned long ret;
+ 
+-		if (unlikely(!access_ok(VERIFY_READ,
++		if (unlikely(!lttng_access_ok(VERIFY_READ,
+ 				(__force const char __user *) addr,
+ 				sizeof(v))))
+ 			break;
+diff --git a/wrapper/uaccess.h b/wrapper/uaccess.h
+new file mode 100644
+index 0000000..c56427c
+--- /dev/null
++++ b/wrapper/uaccess.h
+@@ -0,0 +1,28 @@
++/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
++ *
++ * wrapper/uaccess.h
++ *
++ * wrapper around linux/uaccess.h.
++ *
++ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
++ */
++
++#ifndef _LTTNG_WRAPPER_UACCESS_H
++#define _LTTNG_WRAPPER_UACCESS_H
++
++#include <linux/uaccess.h>
++#include <lttng-kernel-version.h>
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
++
++#define VERIFY_READ	0
++#define VERIFY_WRITE	1
++#define lttng_access_ok(type, addr, size) access_ok(addr, size)
++
++#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0) */
++
++#define lttng_access_ok(type, addr, size) access_ok(type, addr, size)
++
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0) */
++
++#endif /* _LTTNG_WRAPPER_UACCESS_H */
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
new file mode 100644
index 0000000000..089486f51b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
@@ -0,0 +1,186 @@
+From 89f0be35e1baf411df6852014013ac64ad1bbcf8 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 9 Jan 2019 14:59:16 -0500
+Subject: [PATCH 6/9] Fix: Replace pointer values with task->tk_pid and
+ rpc_clnt->cl_clid
+
+Introduced in v3.12.
+
+See upstream commit :
+
+  commit 92cb6c5be8134db6f7c38f25f6afd13e444cebaf
+  Author: Trond Myklebust <Trond.Myklebust@netapp.com>
+  Date:   Wed Sep 4 22:09:50 2013 -0400
+
+    SUNRPC: Replace pointer values with task->tk_pid and rpc_clnt->cl_clid
+
+    Instead of the pointer values, use the task and client identifier values
+    for tracing purposes.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/89f0be35e1baf411df6852014013ac64ad1bbcf8
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ instrumentation/events/lttng-module/rpc.h | 108 ++++++++++++++++++++--
+ 1 file changed, 102 insertions(+), 6 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
+index b9e45fe..a4ac557 100644
+--- a/instrumentation/events/lttng-module/rpc.h
++++ b/instrumentation/events/lttng-module/rpc.h
+@@ -8,6 +8,20 @@
+ #include <linux/sunrpc/sched.h>
+ #include <linux/sunrpc/clnt.h>
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
++
++	TP_PROTO(struct rpc_task *task),
++
++	TP_ARGS(task),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer(int, status, task->tk_status)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 
+ 	TP_PROTO(struct rpc_task *task),
+@@ -20,6 +34,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 		ctf_integer(int, status, task->tk_status)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
+ 	TP_PROTO(struct rpc_task *task),
+@@ -40,8 +55,8 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+ 	TP_ARGS(task),
+ 
+ 	TP_FIELDS(
+-		ctf_integer_hex(const struct rpc_task *, task, task)
+-		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
+ 		ctf_integer(int, status, task->tk_status)
+ 	)
+ )
+@@ -53,8 +68,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
+ 	TP_ARGS(task, action),
+ 
+ 	TP_FIELDS(
+-		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
+-		ctf_integer_hex(const struct rpc_task *, task, task)
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
+ 		ctf_integer_hex(const void *, action, action)
+ 		ctf_integer(unsigned long, runstate, task->tk_runstate)
+ 		ctf_integer(int, status, task->tk_status)
+@@ -90,8 +105,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
+ 	TP_ARGS(task, q),
+ 
+ 	TP_FIELDS(
+-		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
+-		ctf_integer_hex(const struct rpc_task *, task, task)
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
+ 		ctf_integer(unsigned long, timeout, task->tk_timeout)
+ 		ctf_integer(unsigned long, runstate, task->tk_runstate)
+ 		ctf_integer(int, status, task->tk_status)
+@@ -114,6 +129,87 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
+ 	TP_ARGS(task, q)
+ )
+ 
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
++	TP_PROTO(struct rpc_task *task, int status),
++
++	TP_ARGS(task, status),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer(int, status, status)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
++
++	TP_ARGS(clnt, task, action),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer_hex(const void *, action, action)
++		ctf_integer(unsigned long, runstate, task->tk_runstate)
++		ctf_integer(int, status, task->tk_status)
++		ctf_integer(unsigned short, flags, task->tk_flags)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_begin,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
++
++	TP_ARGS(clnt, task, action)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_run_action,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
++
++	TP_ARGS(clnt, task, action)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_complete,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
++
++	TP_ARGS(clnt, task, action)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
++
++	TP_ARGS(clnt, task, q),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer(unsigned long, timeout, task->tk_timeout)
++		ctf_integer(unsigned long, runstate, task->tk_runstate)
++		ctf_integer(int, status, task->tk_status)
++		ctf_integer(unsigned short, flags, task->tk_flags)
++		ctf_string(q_name, rpc_qname(q))
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_sleep,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
++
++	TP_ARGS(clnt, task, q)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
++
++	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
++
++	TP_ARGS(clnt, task, q)
++)
++
+ #else
+ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+ 	TP_PROTO(struct rpc_task *task, int status),
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
new file mode 100644
index 0000000000..f3673301de
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
@@ -0,0 +1,183 @@
+From d11b568681f87c2df6ecb0516d3f16d153f24bd2 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 9 Jan 2019 14:59:17 -0500
+Subject: [PATCH 7/9] Fix: SUNRPC: Simplify defining common RPC trace events
+ (v5.0)
+
+See upstream commit :
+
+  commit dc5820bd21d84ee34770b0a1e2fca9378f8f7456
+  Author: Chuck Lever <chuck.lever@oracle.com>
+  Date:   Wed Dec 19 11:00:16 2018 -0500
+
+    SUNRPC: Simplify defining common RPC trace events
+
+    Clean up, no functional change is expected.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/d11b568681f87c2df6ecb0516d3f16d153f24bd2
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ instrumentation/events/lttng-module/rpc.h | 99 ++++++++++++++++-------
+ 1 file changed, 72 insertions(+), 27 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
+index a4ac557..4239280 100644
+--- a/instrumentation/events/lttng-module/rpc.h
++++ b/instrumentation/events/lttng-module/rpc.h
+@@ -8,7 +8,32 @@
+ #include <linux/sunrpc/sched.h>
+ #include <linux/sunrpc/clnt.h>
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
++
++	TP_PROTO(const struct rpc_task *task),
++
++	TP_ARGS(task),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer(int, status, task->tk_status)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
++	TP_PROTO(const struct rpc_task *task),
++
++	TP_ARGS(task)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
++	TP_PROTO(const struct rpc_task *task),
++
++	TP_ARGS(task)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 
+ 	TP_PROTO(struct rpc_task *task),
+@@ -21,6 +46,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 		ctf_integer(int, status, task->tk_status)
+ 	)
+ )
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
++	TP_PROTO(struct rpc_task *task),
++
++	TP_ARGS(task)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
++	TP_PROTO(struct rpc_task *task),
++
++	TP_ARGS(task)
++)
+ #else
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 
+@@ -34,7 +71,6 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
+ 		ctf_integer(int, status, task->tk_status)
+ 	)
+ )
+-#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
+ 	TP_PROTO(struct rpc_task *task),
+@@ -47,8 +83,15 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
+ 
+ 	TP_ARGS(task)
+ )
++#endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
++LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_connect_status,
++	TP_PROTO(const struct rpc_task *task),
++
++	TP_ARGS(task)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
+ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+ 	TP_PROTO(const struct rpc_task *task),
+ 
+@@ -60,7 +103,33 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+ 		ctf_integer(int, status, task->tk_status)
+ 	)
+ )
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
++	TP_PROTO(struct rpc_task *task, int status),
++
++	TP_ARGS(task, status),
++
++	TP_FIELDS(
++		ctf_integer(unsigned int, task_id, task->tk_pid)
++		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
++		ctf_integer(int, status, status)
++	)
++)
++#else
++LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
++	TP_PROTO(struct rpc_task *task, int status),
++
++	TP_ARGS(task, status),
++
++	TP_FIELDS(
++		ctf_integer_hex(const struct rpc_task *, task, task)
++		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
++		ctf_integer(int, status, status)
++	)
++)
++#endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
+ 
+ 	TP_PROTO(const struct rpc_task *task, const void *action),
+@@ -130,18 +199,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
+-LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+-	TP_PROTO(struct rpc_task *task, int status),
+-
+-	TP_ARGS(task, status),
+-
+-	TP_FIELDS(
+-		ctf_integer(unsigned int, task_id, task->tk_pid)
+-		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
+-		ctf_integer(int, status, status)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
+ 
+ 	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
+@@ -211,18 +268,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
+ )
+ 
+ #else
+-LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
+-	TP_PROTO(struct rpc_task *task, int status),
+-
+-	TP_ARGS(task, status),
+-
+-	TP_FIELDS(
+-		ctf_integer_hex(const struct rpc_task *, task, task)
+-		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
+-		ctf_integer(int, status, status)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
+ 
+ 	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
new file mode 100644
index 0000000000..5f12989956
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
@@ -0,0 +1,341 @@
+From 8af8245f6f86370d01cc4acaabafb90de45e143f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 10 Jan 2019 14:56:15 -0500
+Subject: [PATCH 8/9] Fix: btrfs: Remove fsid/metadata_fsid fields from
+ btrfs_info
+
+Introduced in v5.0.
+
+See upstream commit :
+
+  commit de37aa513105f864d3c21105bf5542d498f21ca2
+  Author: Nikolay Borisov <nborisov@suse.com>
+  Date:   Tue Oct 30 16:43:24 2018 +0200
+
+    btrfs: Remove fsid/metadata_fsid fields from btrfs_info
+
+    Currently btrfs_fs_info structure contains a copy of the
+    fsid/metadata_uuid fields. Same values are also contained in the
+    btrfs_fs_devices structure which fs_info has a reference to. Let's
+    reduce duplication by removing the fields from fs_info and always refer
+    to the ones in fs_devices. No functional changes.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/8af8245f6f86370d01cc4acaabafb90de45e143f
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 100 +++++++++++---------
+ 1 file changed, 53 insertions(+), 47 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 4dfbf5b..ec45a1e 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -32,6 +32,12 @@ struct extent_state;
+ 
+ #define BTRFS_UUID_SIZE 16
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
++#define lttng_fs_info_fsid fs_info->fs_devices->fsid
++#else
++#define lttng_fs_info_fsid fs_info->fsid
++#endif
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+@@ -629,7 +635,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
+ 	TP_ARGS(fs_info, block_group, create),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, offset, block_group->key.objectid)
+ 		ctf_integer(u64, size, block_group->key.offset)
+ 		ctf_integer(u64, flags, block_group->flags)
+@@ -647,7 +653,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
+ 	TP_ARGS(fs_info, block_group, create),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, offset, block_group->key.objectid)
+ 		ctf_integer(u64, size, block_group->key.offset)
+ 		ctf_integer(u64, flags, block_group->flags)
+@@ -1015,18 +1021,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, const struct map_lookup *map,
++	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct map_lookup *map,
+ 		 u64 offset, u64 size),
+ 
+-	TP_ARGS(info, map, offset, size)
++	TP_ARGS(fs_info, map, offset, size)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, const struct map_lookup *map,
++	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct map_lookup *map,
+ 		 u64 offset, u64 size),
+ 
+-	TP_ARGS(info, map, offset, size)
++	TP_ARGS(fs_info, map, offset, size)
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
+@@ -1050,18 +1056,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, struct map_lookup *map,
++	TP_PROTO(struct btrfs_fs_info *fs_info, struct map_lookup *map,
+ 		 u64 offset, u64 size),
+ 
+-	TP_ARGS(info, map, offset, size)
++	TP_ARGS(fs_info, map, offset, size)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, struct map_lookup *map,
++	TP_PROTO(struct btrfs_fs_info *fs_info, struct map_lookup *map,
+ 		 u64 offset, u64 size),
+ 
+-	TP_ARGS(info, map, offset, size)
++	TP_ARGS(fs_info, map, offset, size)
+ )
+ 
+ #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+@@ -1192,7 +1198,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
+ 	TP_ARGS(fs_info, type, val, bytes, reserve),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_string(type, type)
+ 		ctf_integer(u64, val, val)
+ 		ctf_integer(u64, bytes, bytes)
+@@ -1208,7 +1214,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
+ 	TP_ARGS(fs_info, type, val, bytes, reserve),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_string(type, type)
+ 		ctf_integer(u64, val, val)
+ 		ctf_integer(u64, bytes, bytes)
+@@ -1221,9 +1227,9 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len),
++	TP_ARGS(fs_info, start, len),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer(u64, start, start)
+@@ -1233,25 +1239,25 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_alloc,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len)
++	TP_ARGS(fs_info, start, len)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_free,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len)
++	TP_ARGS(fs_info, start, len)
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len),
++	TP_ARGS(fs_info, start, len),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer(u64, start, start)
+@@ -1261,16 +1267,16 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_alloc,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len)
++	TP_ARGS(fs_info, start, len)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_free,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
+ 
+-	TP_ARGS(info, start, len)
++	TP_ARGS(fs_info, start, len)
+ )
+ 
+ #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+@@ -1341,13 +1347,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+ 		 u64 data),
+ 
+-	TP_ARGS(info, num_bytes, empty_size, data),
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, num_bytes, num_bytes)
+ 		ctf_integer(u64, empty_size, empty_size)
+ 		ctf_integer(u64, data, data)
+@@ -1362,7 +1368,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 	TP_ARGS(block_group, start, len),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, block_group->fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, block_group->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
+ 		ctf_integer(u64, flags, block_group->flags)
+ 		ctf_integer(u64, start, start)
+@@ -1391,13 +1397,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+ 		 u64 data),
+ 
+-	TP_ARGS(info, num_bytes, empty_size, data),
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, num_bytes, num_bytes)
+ 		ctf_integer(u64, empty_size, empty_size)
+ 		ctf_integer(u64, data, data)
+@@ -1406,14 +1412,14 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info,
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
+ 		 const struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len),
++	TP_ARGS(fs_info, block_group, start, len),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
+ 		ctf_integer(u64, flags, block_group->flags)
+ 		ctf_integer(u64, start, start)
+@@ -1423,20 +1429,20 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info,
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
+ 		 const struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len)
++	TP_ARGS(fs_info, block_group, start, len)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
+ 
+-	TP_PROTO(const struct btrfs_fs_info *info,
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
+ 		 const struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len)
++	TP_ARGS(fs_info, block_group, start, len)
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
+@@ -1445,13 +1451,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+ 		 u64 data),
+ 
+-	TP_ARGS(info, num_bytes, empty_size, data),
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
+ 
+ 	TP_FIELDS(
+-		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, num_bytes, num_bytes)
+ 		ctf_integer(u64, empty_size, empty_size)
+ 		ctf_integer(u64, data, data)
+@@ -1460,11 +1466,11 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info,
++	TP_PROTO(struct btrfs_fs_info *fs_info,
+ 		 struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len),
++	TP_ARGS(fs_info, block_group, start, len),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
+@@ -1476,20 +1482,20 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info,
++	TP_PROTO(struct btrfs_fs_info *fs_info,
+ 		 struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len)
++	TP_ARGS(fs_info, block_group, start, len)
+ )
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
+ 
+-	TP_PROTO(struct btrfs_fs_info *info,
++	TP_PROTO(struct btrfs_fs_info *fs_info,
+ 		 struct btrfs_block_group_cache *block_group, u64 start,
+ 		 u64 len),
+ 
+-	TP_ARGS(info, block_group, start, len)
++	TP_ARGS(fs_info, block_group, start, len)
+ )
+ #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
new file mode 100644
index 0000000000..4ffe488677
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
@@ -0,0 +1,46 @@
+From 416cee8707053a9015dfec8332e12f8c263098e3 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 14 Feb 2019 11:40:50 -0500
+Subject: [PATCH 9/9] Cleanup: tp mempool: Remove logically dead code
+
+Found by Coverity:
+CID 1391045 (#1 of 1): Logically dead code (DEADCODE)
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/416cee8707053a9015dfec8332e12f8c263098e3
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ lttng-tp-mempool.c | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/lttng-tp-mempool.c b/lttng-tp-mempool.c
+index d984bd4..21e8376 100644
+--- a/lttng-tp-mempool.c
++++ b/lttng-tp-mempool.c
+@@ -151,19 +151,12 @@ void lttng_tp_mempool_free(void *ptr)
+ 	struct lttng_tp_buf_entry *entry;
+ 	struct per_cpu_buf *cpu_buf;
+ 
+-	if (!ptr) {
++	if (!ptr)
+ 		goto end;
+-	}
+-
+ 	entry = container_of(ptr, struct lttng_tp_buf_entry, buf);
+-	if (!entry) {
+-		goto end;
+-	}
+-
+ 	cpu_buf = per_cpu_ptr(pool, entry->cpu);
+-	if (!cpu_buf) {
++	if (!cpu_buf)
+ 		goto end;
+-	}
+ 	/* Add it to the free list. */
+ 	list_add_tail(&entry->list, &cpu_buf->free_list);
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
index 92e8c319b6..086254d3d3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
@@ -15,6 +15,15 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch \
+           file://0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch \
+           file://0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch \
+           file://0004-Fix-timer-instrumentation-for-RHEL-7.6.patch \
+           file://0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch \
+           file://0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch \
+           file://0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch \
+           file://0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch \
+           file://0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch \
            "
 
 SRC_URI[md5sum] = "54bd9fca61487bbec1b3fca2f2213c98"
-- 
2.19.1


