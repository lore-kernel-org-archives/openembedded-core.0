Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7CD7D577
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 14:15:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d21so776577plr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=r+cSR4ToFuvu6QXY1OPrrulcD8RrtvqnZNMUbVORG5Y=;
	b=oHkHbNQD7sTdjQkGBkSm7KldBSj6Jix7dVmGRAfvztiovq8/gQLmKgcRaWPg7WfSDJ
	52J905x/AufXMFMyxYAvTcN89gbBgJnF1d0Q9wo6X4z391N6rwurEGatADvSM3mzYGE6
	tMmlu9AF3UCBrZewoJ+xJYIwcw7qjO78DnwQSbon34+Wv34COq/lsrdBi5c+9BIMw6tj
	y72Biwie80WZ/PlfFPXNgYRJSQUB6UYx9X3+q1S6cX0vRAwRKSbs9V0Gp0GpXxx76fqg
	MmTwD0+G27C9dKT8+2SUH0k5NHmUJqn4xliZXmJ0YW5ogTh19K6/6iyt1z7CKVLBlyc8
	7fLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=r+cSR4ToFuvu6QXY1OPrrulcD8RrtvqnZNMUbVORG5Y=;
	b=KppHeUgN3WqqvPPTewBJTYUv7mB0O9+Q9SpBtRHmAV5QMn425Vyclzn6ftSt0T7PeT
	JSo7eNOYLP6qGMDNWu0MbyggO36NBb2kLyS5f6VBc6R/AfVpxAMOjTXopiWiBwu5w2OB
	oIBKURNGGB7oMxDsLx92dp+x2IjBQfpIYUHWNiWZqtkm4EePRfxq0qyQUmUqe8TmFniY
	T7bfdtbVZb+ZWFG+Y88IwoaolzFaeH7+lvuDLeFamK6+jN+sQ9d91rEjZGmKdduFr+Ba
	3FR3gQColMjTxbciXC4RyM9fErPVbP11TPAqjPg3DxwoiGDUSoBCbNjqTYPSYoiK89B/
	Jjeg==
X-Gm-Message-State: APjAAAXXkejq9BKweHpopXgHEArOMoTJhm6HCIcVk9gmV7MZW8NIxR9p
	6S858XF+YsqGH0hB0UszvksFPV11
X-Google-Smtp-Source: APXvYqyK9GbZaHhKmSx+s76oft1kuiOWcR/EGPm5r12xRHnEyAzFxRQxyHpoQNuzP/V6eDtw5es9rA==
X-Received: by 2002:a17:902:968c:: with SMTP id
	n12mr40555505plp.105.1557238525694; 
	Tue, 07 May 2019 07:15:25 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8476:cc3a:1f1b:599b?
	([2601:202:4180:c33:8476:cc3a:1f1b:599b])
	by smtp.gmail.com with ESMTPSA id
	u5sm17339301pfm.121.2019.05.07.07.15.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 07:15:24 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190507131151.31070-12-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d4fea73f-27ae-48a8-a71c-97d43e17c01c@gmail.com>
Date: Tue, 7 May 2019 07:15:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507131151.31070-12-bunk@stusta.de>
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Tue, 07 May 2019 14:15:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/7/19 6:11 AM, Adrian Bunk wrote:
> Remove the backported patches.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...nguish-between-kernel_siginfo-and-si.patch | 133 -------
>  ...-signal-Remove-SEND_SIG_FORCED-v4.20.patch |  67 ----
>  ...reserved-cluster-count-when-removing.patch | 149 --------
>  ...x-timer-instrumentation-for-RHEL-7.6.patch |  32 --
>  ...argument-from-access_ok-function-v5..patch | 204 -----------
>  ...ter-values-with-task-tk_pid-and-rpc_.patch | 186 ----------
>  ...ify-defining-common-RPC-trace-events.patch | 183 ----------
>  ...-fsid-metadata_fsid-fields-from-btrf.patch | 341 ------------------
>  ...p-mempool-Remove-logically-dead-code.patch |  46 ---
>  ...ules_2.10.8.bb => lttng-modules_2.10.9.bb} |  13 +-
>  10 files changed, 2 insertions(+), 1352 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.10.8.bb => lttng-modules_2.10.9.bb} (61%)

Does this fix the ptest issues?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13255

- armin
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
> deleted file mode 100644
> index 351184dabb..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 0a0d736ec89dffdbc83e7181166a99d5563acfe8 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Mon, 5 Nov 2018 11:35:52 -0500
> -Subject: [PATCH 1/9] Fix: signal: Distinguish between kernel_siginfo and
> - siginfo (v4.20)
> -
> -See upstream commit :
> -
> -  commit ae7795bc6187a15ec51cf258abae656a625f9980
> -  Author: Eric W. Biederman <ebiederm@xmission.com>
> -  Date:   Tue Sep 25 11:27:20 2018 +0200
> -
> -    signal: Distinguish between kernel_siginfo and siginfo
> -
> -    Linus recently observed that if we did not worry about the padding
> -    member in struct siginfo it is only about 48 bytes, and 48 bytes is
> -    much nicer than 128 bytes for allocating on the stack and copying
> -    around in the kernel.
> -
> -    The obvious thing of only adding the padding when userspace is
> -    including siginfo.h won't work as there are sigframe definitions in
> -    the kernel that embed struct siginfo.
> -
> -    So split siginfo in two; kernel_siginfo and siginfo.  Keeping the
> -    traditional name for the userspace definition.  While the version that
> -    is used internally to the kernel and ultimately will not be padded to
> -    128 bytes is called kernel_siginfo.
> -
> -    The definition of struct kernel_siginfo I have put in include/signal_types.h
> -
> -    A set of buildtime checks has been added to verify the two structures have
> -    the same field offsets.
> -
> -    To make it easy to verify the change kernel_siginfo retains the same
> -    size as siginfo.  The reduction in size comes in a following change.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/0a0d736ec89dffdbc83e7181166a99d5563acfe8
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - instrumentation/events/lttng-module/signal.h | 41 ++++++++++++++++++--
> - 1 file changed, 37 insertions(+), 4 deletions(-)
> -
> -diff --git a/instrumentation/events/lttng-module/signal.h b/instrumentation/events/lttng-module/signal.h
> -index b3c9126..8783b52 100644
> ---- a/instrumentation/events/lttng-module/signal.h
> -+++ b/instrumentation/events/lttng-module/signal.h
> -@@ -35,21 +35,24 @@
> -  * SEND_SIG_NOINFO means that si_code is SI_USER, and SEND_SIG_PRIV
> -  * means that si_code is SI_KERNEL.
> -  */
> --#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> - LTTNG_TRACEPOINT_EVENT(signal_generate,
> - 
> --	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task),
> -+	TP_PROTO(int sig, struct kernel_siginfo *info, struct task_struct *task,
> -+			int group, int result),
> - 
> --	TP_ARGS(sig, info, task),
> -+	TP_ARGS(sig, info, task, group, result),
> - 
> - 	TP_FIELDS(
> - 		ctf_integer(int, sig, sig)
> - 		LTTNG_FIELDS_SIGINFO(info)
> - 		ctf_array_text(char, comm, task->comm, TASK_COMM_LEN)
> - 		ctf_integer(pid_t, pid, task->pid)
> -+		ctf_integer(int, group, group)
> -+		ctf_integer(int, result, result)
> - 	)
> - )
> --#else
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0))
> - LTTNG_TRACEPOINT_EVENT(signal_generate,
> - 
> - 	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task,
> -@@ -66,6 +69,20 @@ LTTNG_TRACEPOINT_EVENT(signal_generate,
> - 		ctf_integer(int, result, result)
> - 	)
> - )
> -+#else
> -+LTTNG_TRACEPOINT_EVENT(signal_generate,
> -+
> -+	TP_PROTO(int sig, struct siginfo *info, struct task_struct *task),
> -+
> -+	TP_ARGS(sig, info, task),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(int, sig, sig)
> -+		LTTNG_FIELDS_SIGINFO(info)
> -+		ctf_array_text(char, comm, task->comm, TASK_COMM_LEN)
> -+		ctf_integer(pid_t, pid, task->pid)
> -+	)
> -+)
> - #endif
> - 
> - /**
> -@@ -82,6 +99,21 @@ LTTNG_TRACEPOINT_EVENT(signal_generate,
> -  * This means, this can show which signals are actually delivered, but
> -  * matching generated signals and delivered signals may not be correct.
> -  */
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> -+LTTNG_TRACEPOINT_EVENT(signal_deliver,
> -+
> -+	TP_PROTO(int sig, struct kernel_siginfo *info, struct k_sigaction *ka),
> -+
> -+	TP_ARGS(sig, info, ka),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(int, sig, sig)
> -+		LTTNG_FIELDS_SIGINFO(info)
> -+		ctf_integer(unsigned long, sa_handler, (unsigned long) ka->sa.sa_handler)
> -+		ctf_integer(unsigned long, sa_flags, ka->sa.sa_flags)
> -+	)
> -+)
> -+#else
> - LTTNG_TRACEPOINT_EVENT(signal_deliver,
> - 
> - 	TP_PROTO(int sig, struct siginfo *info, struct k_sigaction *ka),
> -@@ -95,6 +127,7 @@ LTTNG_TRACEPOINT_EVENT(signal_deliver,
> - 		ctf_integer(unsigned long, sa_flags, ka->sa.sa_flags)
> - 	)
> - )
> -+#endif
> - 
> - #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,4,0))
> - LTTNG_TRACEPOINT_EVENT_CLASS(signal_queue_overflow,
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
> deleted file mode 100644
> index 905b68165b..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 26bc064a4d4c85e6000393aadb38659f99b59162 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Mon, 5 Nov 2018 11:35:53 -0500
> -Subject: [PATCH 2/9] Fix: signal: Remove SEND_SIG_FORCED (v4.20)
> -
> -See upstream commit :
> -
> -  commit 4ff4c31a6e85f4c49fbeebeaa28018d002884b5a
> -  Author: Eric W. Biederman <ebiederm@xmission.com>
> -  Date:   Mon Sep 3 10:39:04 2018 +0200
> -
> -    signal: Remove SEND_SIG_FORCED
> -
> -    There are no more users of SEND_SIG_FORCED so it may be safely removed.
> -
> -    Remove the definition of SEND_SIG_FORCED, it's use in is_si_special,
> -    it's use in TP_STORE_SIGINFO, and it's use in __send_signal as without
> -    any users the uses of SEND_SIG_FORCED are now unncessary.
> -
> -    This makes the code simpler, easier to understand and use.  Users of
> -    signal sending functions now no longer need to ask themselves do I
> -    need to use SEND_SIG_FORCED.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/26bc064a4d4c85e6000393aadb38659f99b59162
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> 
> -
> ----
> - instrumentation/events/lttng-module/signal.h | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> -
> -diff --git a/instrumentation/events/lttng-module/signal.h b/instrumentation/events/lttng-module/signal.h
> -index 8783b52..ad8fe69 100644
> ---- a/instrumentation/events/lttng-module/signal.h
> -+++ b/instrumentation/events/lttng-module/signal.h
> -@@ -12,6 +12,17 @@
> - #include <linux/signal.h>
> - #include <linux/sched.h>
> - #undef LTTNG_FIELDS_SIGINFO
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> -+#define LTTNG_FIELDS_SIGINFO(info)				\
> -+		ctf_integer(int, errno,				\
> -+			(info == SEND_SIG_NOINFO || info == SEND_SIG_PRIV) ? \
> -+			0 :					\
> -+			info->si_errno)				\
> -+		ctf_integer(int, code,				\
> -+			(info == SEND_SIG_NOINFO) ? 		\
> -+			SI_USER : 				\
> -+			((info == SEND_SIG_PRIV) ? SI_KERNEL : info->si_code))
> -+#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0) */
> - #define LTTNG_FIELDS_SIGINFO(info)				\
> - 		ctf_integer(int, errno,				\
> - 			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED || info == SEND_SIG_PRIV) ? \
> -@@ -21,6 +32,7 @@
> - 			(info == SEND_SIG_NOINFO || info == SEND_SIG_FORCED) ? \
> - 			SI_USER : 				\
> - 			((info == SEND_SIG_PRIV) ? SI_KERNEL : info->si_code))
> -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0) */
> - #endif /* _TRACE_SIGNAL_DEF */
> - 
> - /**
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
> deleted file mode 100644
> index 7edffee542..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
> +++ /dev/null
> @@ -1,149 +0,0 @@
> -From cb9f1a821bcf55cecf3813195fd6d4eff8070927 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Mon, 5 Nov 2018 11:35:54 -0500
> -Subject: [PATCH 3/9] Fix: ext4: adjust reserved cluster count when removing
> - extents (v4.20)
> -
> -See upstream commit :
> -
> -  commit 9fe671496b6c286f9033aedfc1718d67721da0ae
> -  Author: Eric Whitney <enwlinux@gmail.com>
> -  Date:   Mon Oct 1 14:25:08 2018 -0400
> -
> -    ext4: adjust reserved cluster count when removing extents
> -
> -    Modify ext4_ext_remove_space() and the code it calls to correct the
> -    reserved cluster count for pending reservations (delayed allocated
> -    clusters shared with allocated blocks) when a block range is removed
> -    from the extent tree.  Pending reservations may be found for the clusters
> -    at the ends of written or unwritten extents when a block range is removed.
> -    If a physical cluster at the end of an extent is freed, it's necessary
> -    to increment the reserved cluster count to maintain correct accounting
> -    if the corresponding logical cluster is shared with at least one
> -    delayed and unwritten extent as found in the extents status tree.
> -
> -    Add a new function, ext4_rereserve_cluster(), to reapply a reservation
> -    on a delayed allocated cluster sharing blocks with a freed allocated
> -    cluster.  To avoid ENOSPC on reservation, a flag is applied to
> -    ext4_free_blocks() to briefly defer updating the freeclusters counter
> -    when an allocated cluster is freed.  This prevents another thread
> -    from allocating the freed block before the reservation can be reapplied.
> -
> -    Redefine the partial cluster object as a struct to carry more state
> -    information and to clarify the code using it.
> -
> -    Adjust the conditional code structure in ext4_ext_remove_space to
> -    reduce the indentation level in the main body of the code to improve
> -    readability.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/cb9f1a821bcf55cecf3813195fd6d4eff8070927
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -
> ----
> - instrumentation/events/lttng-module/ext4.h | 72 +++++++++++++++++++++-
> - 1 file changed, 69 insertions(+), 3 deletions(-)
> -
> -diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
> -index fe6f802..83a80ba 100644
> ---- a/instrumentation/events/lttng-module/ext4.h
> -+++ b/instrumentation/events/lttng-module/ext4.h
> -@@ -1602,7 +1602,30 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_show_extent,
> - 	)
> - )
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> -+
> -+LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
> -+	TP_PROTO(struct inode *inode, struct ext4_extent *ex,
> -+		 ext4_lblk_t from, ext4_fsblk_t to,
> -+		 struct partial_cluster *pc),
> -+
> -+	TP_ARGS(inode, ex, from, to, pc),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
> -+		ctf_integer(ino_t, ino, inode->i_ino)
> -+		ctf_integer(ext4_lblk_t, from, from)
> -+		ctf_integer(ext4_lblk_t, to, to)
> -+		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
> -+		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
> -+		ctf_integer(unsigned short, ee_len, ext4_ext_get_actual_len(ex))
> -+		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
> -+		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
> -+		ctf_integer(int, pc_state, pc->state)
> -+	)
> -+)
> -+
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> - 
> - LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
> - 	    TP_PROTO(struct inode *inode, struct ext4_extent *ex,
> -@@ -1646,7 +1669,29 @@ LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
> - 
> - #endif
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> -+
> -+LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
> -+	TP_PROTO(struct inode *inode, ext4_lblk_t start,
> -+		 struct ext4_extent *ex,
> -+		 struct partial_cluster *pc),
> -+
> -+	TP_ARGS(inode, start, ex, pc),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
> -+		ctf_integer(ino_t, ino, inode->i_ino)
> -+		ctf_integer(ext4_lblk_t, start, start)
> -+		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
> -+		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
> -+		ctf_integer(short, ee_len, ext4_ext_get_actual_len(ex))
> -+		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
> -+		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
> -+		ctf_integer(int, pc_state, pc->state)
> -+	)
> -+)
> -+
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> - 
> - LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
> - 	TP_PROTO(struct inode *inode, ext4_lblk_t start,
> -@@ -1733,7 +1778,28 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space,
> - 
> - #endif
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,20,0))
> -+
> -+LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
> -+	TP_PROTO(struct inode *inode, ext4_lblk_t start, ext4_lblk_t end,
> -+		 int depth, struct partial_cluster *pc, __le16 eh_entries),
> -+
> -+	TP_ARGS(inode, start, end, depth, pc, eh_entries),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
> -+		ctf_integer(ino_t, ino, inode->i_ino)
> -+		ctf_integer(ext4_lblk_t, start, start)
> -+		ctf_integer(ext4_lblk_t, end, end)
> -+		ctf_integer(int, depth, depth)
> -+		ctf_integer(unsigned short, eh_entries, le16_to_cpu(eh_entries))
> -+		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
> -+		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
> -+		ctf_integer(int, pc_state, pc->state)
> -+	)
> -+)
> -+
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> - 
> - LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
> - 	TP_PROTO(struct inode *inode, ext4_lblk_t start, ext4_lblk_t end,
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
> deleted file mode 100644
> index b5d50dba1c..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 4eaeb54a27fbf701c2a4908a6e90a978b93deb06 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Thu, 6 Dec 2018 11:31:51 -0500
> -Subject: [PATCH 4/9] Fix: timer instrumentation for RHEL 7.6
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/4eaeb54a27fbf701c2a4908a6e90a978b93deb06
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - instrumentation/events/lttng-module/timer.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/instrumentation/events/lttng-module/timer.h b/instrumentation/events/lttng-module/timer.h
> -index 6f0cb7f..8807ad5 100644
> ---- a/instrumentation/events/lttng-module/timer.h
> -+++ b/instrumentation/events/lttng-module/timer.h
> -@@ -44,7 +44,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
> - 	TP_ARGS(timer)
> - )
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0) || \
> -+	LTTNG_RHEL_KERNEL_RANGE(3,10,0,957,0,0, 3,11,0,0,0,0))
> - /**
> -  * timer_start - called when the timer is started
> -  * @timer:	pointer to struct timer_list
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
> deleted file mode 100644
> index 2266bbd9e0..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
> +++ /dev/null
> @@ -1,204 +0,0 @@
> -From 0039dbe9891cfdf2c0d04691f83c2f342993dfd7 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Wed, 9 Jan 2019 14:59:15 -0500
> -Subject: [PATCH 5/9] Fix: Remove 'type' argument from access_ok() function
> - (v5.0)
> -
> -See upstream commit :
> -
> -  commit 96d4f267e40f9509e8a66e2b39e8b95655617693
> -  Author: Linus Torvalds <torvalds@linux-foundation.org>
> -  Date:   Thu Jan 3 18:57:57 2019 -0800
> -
> -    Remove 'type' argument from access_ok() function
> -
> -    Nobody has actually used the type (VERIFY_READ vs VERIFY_WRITE) argument
> -    of the user address range verification function since we got rid of the
> -    old racy i386-only code to walk page tables by hand.
> -
> -    It existed because the original 80386 would not honor the write protect
> -    bit when in kernel mode, so you had to do COW by hand before doing any
> -    user access.  But we haven't supported that in a long time, and these
> -    days the 'type' argument is a purely historical artifact.
> -
> -    A discussion about extending 'user_access_begin()' to do the range
> -    checking resulted this patch, because there is no way we're going to
> -    move the old VERIFY_xyz interface to that model.  And it's best done at
> -    the end of the merge window when I've done most of my merges, so let's
> -    just get this done once and for all.
> -
> -    This patch was mostly done with a sed-script, with manual fix-ups for
> -    the cases that weren't of the trivial 'access_ok(VERIFY_xyz' form.
> -
> -    There were a couple of notable cases:
> -
> -     - csky still had the old "verify_area()" name as an alias.
> -
> -     - the iter_iov code had magical hardcoded knowledge of the actual
> -       values of VERIFY_{READ,WRITE} (not that they mattered, since nothing
> -       really used it)
> -
> -     - microblaze used the type argument for a debug printout
> -
> -    but other than those oddities this should be a total no-op patch.
> -
> -    I tried to fix up all architectures, did fairly extensive grepping for
> -    access_ok() uses, and the changes are trivial, but I may have missed
> -    something.  Any missed conversion should be trivially fixable, though.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/0039dbe9891cfdf2c0d04691f83c2f342993dfd7
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - lib/ringbuffer/backend.h              |  8 ++++----
> - lib/ringbuffer/ring_buffer_iterator.c |  3 ++-
> - lttng-filter-interpreter.c            |  4 ++--
> - probes/lttng-probe-user.c             |  3 ++-
> - wrapper/uaccess.h                     | 28 +++++++++++++++++++++++++++
> - 5 files changed, 38 insertions(+), 8 deletions(-)
> - create mode 100644 wrapper/uaccess.h
> -
> -diff --git a/lib/ringbuffer/backend.h b/lib/ringbuffer/backend.h
> -index 0b75de8..3f8c108 100644
> ---- a/lib/ringbuffer/backend.h
> -+++ b/lib/ringbuffer/backend.h
> -@@ -34,7 +34,7 @@
> - #include <linux/list.h>
> - #include <linux/fs.h>
> - #include <linux/mm.h>
> --#include <linux/uaccess.h>
> -+#include <wrapper/uaccess.h>
> - 
> - /* Internal helpers */
> - #include <wrapper/ringbuffer/backend_internal.h>
> -@@ -302,7 +302,7 @@ void lib_ring_buffer_copy_from_user_inatomic(const struct lib_ring_buffer_config
> - 
> - 	set_fs(KERNEL_DS);
> - 	pagefault_disable();
> --	if (unlikely(!access_ok(VERIFY_READ, src, len)))
> -+	if (unlikely(!lttng_access_ok(VERIFY_READ, src, len)))
> - 		goto fill_buffer;
> - 
> - 	if (likely(pagecpy == len)) {
> -@@ -372,7 +372,7 @@ void lib_ring_buffer_strcpy_from_user_inatomic(const struct lib_ring_buffer_conf
> - 
> - 	set_fs(KERNEL_DS);
> - 	pagefault_disable();
> --	if (unlikely(!access_ok(VERIFY_READ, src, len)))
> -+	if (unlikely(!lttng_access_ok(VERIFY_READ, src, len)))
> - 		goto fill_buffer;
> - 
> - 	if (likely(pagecpy == len)) {
> -@@ -462,7 +462,7 @@ unsigned long lib_ring_buffer_copy_from_user_check_nofault(void *dest,
> - 	unsigned long ret;
> - 	mm_segment_t old_fs;
> - 
> --	if (!access_ok(VERIFY_READ, src, len))
> -+	if (!lttng_access_ok(VERIFY_READ, src, len))
> - 		return 1;
> - 	old_fs = get_fs();
> - 	set_fs(KERNEL_DS);
> -diff --git a/lib/ringbuffer/ring_buffer_iterator.c b/lib/ringbuffer/ring_buffer_iterator.c
> -index 61eaa5b..9645946 100644
> ---- a/lib/ringbuffer/ring_buffer_iterator.c
> -+++ b/lib/ringbuffer/ring_buffer_iterator.c
> -@@ -27,6 +27,7 @@
> - 
> - #include <wrapper/ringbuffer/iterator.h>
> - #include <wrapper/file.h>
> -+#include <wrapper/uaccess.h>
> - #include <linux/jiffies.h>
> - #include <linux/delay.h>
> - #include <linux/module.h>
> -@@ -621,7 +622,7 @@ ssize_t channel_ring_buffer_file_read(struct file *filp,
> - 	ssize_t len;
> - 
> - 	might_sleep();
> --	if (!access_ok(VERIFY_WRITE, user_buf, count))
> -+	if (!lttng_access_ok(VERIFY_WRITE, user_buf, count))
> - 		return -EFAULT;
> - 
> - 	/* Finish copy of previous record */
> -diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
> -index e131462..bee2918 100644
> ---- a/lttng-filter-interpreter.c
> -+++ b/lttng-filter-interpreter.c
> -@@ -24,7 +24,7 @@
> -  * SOFTWARE.
> -  */
> - 
> --#include <linux/uaccess.h>
> -+#include <wrapper/uaccess.h>
> - #include <wrapper/frame.h>
> - #include <wrapper/types.h>
> - 
> -@@ -46,7 +46,7 @@ char get_char(struct estack_entry *reg, size_t offset)
> - 		char c;
> - 
> - 		/* Handle invalid access as end of string. */
> --		if (unlikely(!access_ok(VERIFY_READ,
> -+		if (unlikely(!lttng_access_ok(VERIFY_READ,
> - 				reg->u.s.user_str + offset,
> - 				sizeof(c))))
> - 			return '\0';
> -diff --git a/probes/lttng-probe-user.c b/probes/lttng-probe-user.c
> -index 099a66b..ed566dd 100644
> ---- a/probes/lttng-probe-user.c
> -+++ b/probes/lttng-probe-user.c
> -@@ -20,6 +20,7 @@
> - 
> - #include <linux/uaccess.h>
> - #include <linux/module.h>
> -+#include <wrapper/uaccess.h>
> - #include <probes/lttng-probe-user.h>
> - 
> - /*
> -@@ -43,7 +44,7 @@ long lttng_strlen_user_inatomic(const char *addr)
> - 		char v;
> - 		unsigned long ret;
> - 
> --		if (unlikely(!access_ok(VERIFY_READ,
> -+		if (unlikely(!lttng_access_ok(VERIFY_READ,
> - 				(__force const char __user *) addr,
> - 				sizeof(v))))
> - 			break;
> -diff --git a/wrapper/uaccess.h b/wrapper/uaccess.h
> -new file mode 100644
> -index 0000000..c56427c
> ---- /dev/null
> -+++ b/wrapper/uaccess.h
> -@@ -0,0 +1,28 @@
> -+/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
> -+ *
> -+ * wrapper/uaccess.h
> -+ *
> -+ * wrapper around linux/uaccess.h.
> -+ *
> -+ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
> -+ */
> -+
> -+#ifndef _LTTNG_WRAPPER_UACCESS_H
> -+#define _LTTNG_WRAPPER_UACCESS_H
> -+
> -+#include <linux/uaccess.h>
> -+#include <lttng-kernel-version.h>
> -+
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
> -+
> -+#define VERIFY_READ	0
> -+#define VERIFY_WRITE	1
> -+#define lttng_access_ok(type, addr, size) access_ok(addr, size)
> -+
> -+#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0) */
> -+
> -+#define lttng_access_ok(type, addr, size) access_ok(type, addr, size)
> -+
> -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0) */
> -+
> -+#endif /* _LTTNG_WRAPPER_UACCESS_H */
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
> deleted file mode 100644
> index 089486f51b..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -From 89f0be35e1baf411df6852014013ac64ad1bbcf8 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Wed, 9 Jan 2019 14:59:16 -0500
> -Subject: [PATCH 6/9] Fix: Replace pointer values with task->tk_pid and
> - rpc_clnt->cl_clid
> -
> -Introduced in v3.12.
> -
> -See upstream commit :
> -
> -  commit 92cb6c5be8134db6f7c38f25f6afd13e444cebaf
> -  Author: Trond Myklebust <Trond.Myklebust@netapp.com>
> -  Date:   Wed Sep 4 22:09:50 2013 -0400
> -
> -    SUNRPC: Replace pointer values with task->tk_pid and rpc_clnt->cl_clid
> -
> -    Instead of the pointer values, use the task and client identifier values
> -    for tracing purposes.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/89f0be35e1baf411df6852014013ac64ad1bbcf8
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - instrumentation/events/lttng-module/rpc.h | 108 ++++++++++++++++++++--
> - 1 file changed, 102 insertions(+), 6 deletions(-)
> -
> -diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
> -index b9e45fe..a4ac557 100644
> ---- a/instrumentation/events/lttng-module/rpc.h
> -+++ b/instrumentation/events/lttng-module/rpc.h
> -@@ -8,6 +8,20 @@
> - #include <linux/sunrpc/sched.h>
> - #include <linux/sunrpc/clnt.h>
> - 
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> -+LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> -+
> -+	TP_PROTO(struct rpc_task *task),
> -+
> -+	TP_ARGS(task),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer(int, status, task->tk_status)
> -+	)
> -+)
> -+#else
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 
> - 	TP_PROTO(struct rpc_task *task),
> -@@ -20,6 +34,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 		ctf_integer(int, status, task->tk_status)
> - 	)
> - )
> -+#endif
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
> - 	TP_PROTO(struct rpc_task *task),
> -@@ -40,8 +55,8 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> - 	TP_ARGS(task),
> - 
> - 	TP_FIELDS(
> --		ctf_integer_hex(const struct rpc_task *, task, task)
> --		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> - 		ctf_integer(int, status, task->tk_status)
> - 	)
> - )
> -@@ -53,8 +68,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> - 	TP_ARGS(task, action),
> - 
> - 	TP_FIELDS(
> --		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
> --		ctf_integer_hex(const struct rpc_task *, task, task)
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> - 		ctf_integer_hex(const void *, action, action)
> - 		ctf_integer(unsigned long, runstate, task->tk_runstate)
> - 		ctf_integer(int, status, task->tk_status)
> -@@ -90,8 +105,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
> - 	TP_ARGS(task, q),
> - 
> - 	TP_FIELDS(
> --		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
> --		ctf_integer_hex(const struct rpc_task *, task, task)
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> - 		ctf_integer(unsigned long, timeout, task->tk_timeout)
> - 		ctf_integer(unsigned long, runstate, task->tk_runstate)
> - 		ctf_integer(int, status, task->tk_status)
> -@@ -114,6 +129,87 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
> - 	TP_ARGS(task, q)
> - )
> - 
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> -+LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> -+	TP_PROTO(struct rpc_task *task, int status),
> -+
> -+	TP_ARGS(task, status),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer(int, status, status)
> -+	)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> -+
> -+	TP_ARGS(clnt, task, action),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer_hex(const void *, action, action)
> -+		ctf_integer(unsigned long, runstate, task->tk_runstate)
> -+		ctf_integer(int, status, task->tk_status)
> -+		ctf_integer(unsigned short, flags, task->tk_flags)
> -+	)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_begin,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> -+
> -+	TP_ARGS(clnt, task, action)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_run_action,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> -+
> -+	TP_ARGS(clnt, task, action)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_running, rpc_task_complete,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> -+
> -+	TP_ARGS(clnt, task, action)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_queued,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
> -+
> -+	TP_ARGS(clnt, task, q),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer(unsigned long, timeout, task->tk_timeout)
> -+		ctf_integer(unsigned long, runstate, task->tk_runstate)
> -+		ctf_integer(int, status, task->tk_status)
> -+		ctf_integer(unsigned short, flags, task->tk_flags)
> -+		ctf_string(q_name, rpc_qname(q))
> -+	)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_sleep,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
> -+
> -+	TP_ARGS(clnt, task, q)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
> -+
> -+	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const struct rpc_wait_queue *q),
> -+
> -+	TP_ARGS(clnt, task, q)
> -+)
> -+
> - #else
> - LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> - 	TP_PROTO(struct rpc_task *task, int status),
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
> deleted file mode 100644
> index f3673301de..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
> +++ /dev/null
> @@ -1,183 +0,0 @@
> -From d11b568681f87c2df6ecb0516d3f16d153f24bd2 Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Wed, 9 Jan 2019 14:59:17 -0500
> -Subject: [PATCH 7/9] Fix: SUNRPC: Simplify defining common RPC trace events
> - (v5.0)
> -
> -See upstream commit :
> -
> -  commit dc5820bd21d84ee34770b0a1e2fca9378f8f7456
> -  Author: Chuck Lever <chuck.lever@oracle.com>
> -  Date:   Wed Dec 19 11:00:16 2018 -0500
> -
> -    SUNRPC: Simplify defining common RPC trace events
> -
> -    Clean up, no functional change is expected.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/d11b568681f87c2df6ecb0516d3f16d153f24bd2
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - instrumentation/events/lttng-module/rpc.h | 99 ++++++++++++++++-------
> - 1 file changed, 72 insertions(+), 27 deletions(-)
> -
> -diff --git a/instrumentation/events/lttng-module/rpc.h b/instrumentation/events/lttng-module/rpc.h
> -index a4ac557..4239280 100644
> ---- a/instrumentation/events/lttng-module/rpc.h
> -+++ b/instrumentation/events/lttng-module/rpc.h
> -@@ -8,7 +8,32 @@
> - #include <linux/sunrpc/sched.h>
> - #include <linux/sunrpc/clnt.h>
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
> -+LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> -+
> -+	TP_PROTO(const struct rpc_task *task),
> -+
> -+	TP_ARGS(task),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer(int, status, task->tk_status)
> -+	)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
> -+	TP_PROTO(const struct rpc_task *task),
> -+
> -+	TP_ARGS(task)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
> -+	TP_PROTO(const struct rpc_task *task),
> -+
> -+	TP_ARGS(task)
> -+)
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 
> - 	TP_PROTO(struct rpc_task *task),
> -@@ -21,6 +46,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 		ctf_integer(int, status, task->tk_status)
> - 	)
> - )
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
> -+	TP_PROTO(struct rpc_task *task),
> -+
> -+	TP_ARGS(task)
> -+)
> -+
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
> -+	TP_PROTO(struct rpc_task *task),
> -+
> -+	TP_ARGS(task)
> -+)
> - #else
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 
> -@@ -34,7 +71,6 @@ LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_status,
> - 		ctf_integer(int, status, task->tk_status)
> - 	)
> - )
> --#endif
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_call_status,
> - 	TP_PROTO(struct rpc_task *task),
> -@@ -47,8 +83,15 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_bind_status,
> - 
> - 	TP_ARGS(task)
> - )
> -+#endif
> - 
> --#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
> -+LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_status, rpc_connect_status,
> -+	TP_PROTO(const struct rpc_task *task),
> -+
> -+	TP_ARGS(task)
> -+)
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
> - LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> - 	TP_PROTO(const struct rpc_task *task),
> - 
> -@@ -60,7 +103,33 @@ LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> - 		ctf_integer(int, status, task->tk_status)
> - 	)
> - )
> -+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> -+LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> -+	TP_PROTO(struct rpc_task *task, int status),
> -+
> -+	TP_ARGS(task, status),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer(unsigned int, task_id, task->tk_pid)
> -+		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> -+		ctf_integer(int, status, status)
> -+	)
> -+)
> -+#else
> -+LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> -+	TP_PROTO(struct rpc_task *task, int status),
> -+
> -+	TP_ARGS(task, status),
> -+
> -+	TP_FIELDS(
> -+		ctf_integer_hex(const struct rpc_task *, task, task)
> -+		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
> -+		ctf_integer(int, status, status)
> -+	)
> -+)
> -+#endif
> - 
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0))
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> - 
> - 	TP_PROTO(const struct rpc_task *task, const void *action),
> -@@ -130,18 +199,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
> - )
> - 
> - #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
> --LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> --	TP_PROTO(struct rpc_task *task, int status),
> --
> --	TP_ARGS(task, status),
> --
> --	TP_FIELDS(
> --		ctf_integer(unsigned int, task_id, task->tk_pid)
> --		ctf_integer(unsigned int, client_id, task->tk_client->cl_clid)
> --		ctf_integer(int, status, status)
> --	)
> --)
> --
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> - 
> - 	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> -@@ -211,18 +268,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(rpc_task_queued, rpc_task_wakeup,
> - )
> - 
> - #else
> --LTTNG_TRACEPOINT_EVENT(rpc_connect_status,
> --	TP_PROTO(struct rpc_task *task, int status),
> --
> --	TP_ARGS(task, status),
> --
> --	TP_FIELDS(
> --		ctf_integer_hex(const struct rpc_task *, task, task)
> --		ctf_integer_hex(const struct rpc_clnt *, clnt, task->tk_client)
> --		ctf_integer(int, status, status)
> --	)
> --)
> --
> - LTTNG_TRACEPOINT_EVENT_CLASS(rpc_task_running,
> - 
> - 	TP_PROTO(const struct rpc_clnt *clnt, const struct rpc_task *task, const void *action),
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
> deleted file mode 100644
> index 5f12989956..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
> +++ /dev/null
> @@ -1,341 +0,0 @@
> -From 8af8245f6f86370d01cc4acaabafb90de45e143f Mon Sep 17 00:00:00 2001
> -From: Michael Jeanson <mjeanson@efficios.com>
> -Date: Thu, 10 Jan 2019 14:56:15 -0500
> -Subject: [PATCH 8/9] Fix: btrfs: Remove fsid/metadata_fsid fields from
> - btrfs_info
> -
> -Introduced in v5.0.
> -
> -See upstream commit :
> -
> -  commit de37aa513105f864d3c21105bf5542d498f21ca2
> -  Author: Nikolay Borisov <nborisov@suse.com>
> -  Date:   Tue Oct 30 16:43:24 2018 +0200
> -
> -    btrfs: Remove fsid/metadata_fsid fields from btrfs_info
> -
> -    Currently btrfs_fs_info structure contains a copy of the
> -    fsid/metadata_uuid fields. Same values are also contained in the
> -    btrfs_fs_devices structure which fs_info has a reference to. Let's
> -    reduce duplication by removing the fields from fs_info and always refer
> -    to the ones in fs_devices. No functional changes.
> -
> -Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/8af8245f6f86370d01cc4acaabafb90de45e143f
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - instrumentation/events/lttng-module/btrfs.h | 100 +++++++++++---------
> - 1 file changed, 53 insertions(+), 47 deletions(-)
> -
> -diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
> -index 4dfbf5b..ec45a1e 100644
> ---- a/instrumentation/events/lttng-module/btrfs.h
> -+++ b/instrumentation/events/lttng-module/btrfs.h
> -@@ -32,6 +32,12 @@ struct extent_state;
> - 
> - #define BTRFS_UUID_SIZE 16
> - 
> -+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
> -+#define lttng_fs_info_fsid fs_info->fs_devices->fsid
> -+#else
> -+#define lttng_fs_info_fsid fs_info->fsid
> -+#endif
> -+
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
> - 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
> - 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
> -@@ -629,7 +635,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
> - 	TP_ARGS(fs_info, block_group, create),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, offset, block_group->key.objectid)
> - 		ctf_integer(u64, size, block_group->key.offset)
> - 		ctf_integer(u64, flags, block_group->flags)
> -@@ -647,7 +653,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
> - 	TP_ARGS(fs_info, block_group, create),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, offset, block_group->key.objectid)
> - 		ctf_integer(u64, size, block_group->key.offset)
> - 		ctf_integer(u64, flags, block_group->flags)
> -@@ -1015,18 +1021,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, const struct map_lookup *map,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct map_lookup *map,
> - 		 u64 offset, u64 size),
> - 
> --	TP_ARGS(info, map, offset, size)
> -+	TP_ARGS(fs_info, map, offset, size)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, const struct map_lookup *map,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct map_lookup *map,
> - 		 u64 offset, u64 size),
> - 
> --	TP_ARGS(info, map, offset, size)
> -+	TP_ARGS(fs_info, map, offset, size)
> - )
> - 
> - #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
> -@@ -1050,18 +1056,18 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, struct map_lookup *map,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, struct map_lookup *map,
> - 		 u64 offset, u64 size),
> - 
> --	TP_ARGS(info, map, offset, size)
> -+	TP_ARGS(fs_info, map, offset, size)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, struct map_lookup *map,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, struct map_lookup *map,
> - 		 u64 offset, u64 size),
> - 
> --	TP_ARGS(info, map, offset, size)
> -+	TP_ARGS(fs_info, map, offset, size)
> - )
> - 
> - #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
> -@@ -1192,7 +1198,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
> - 	TP_ARGS(fs_info, type, val, bytes, reserve),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_string(type, type)
> - 		ctf_integer(u64, val, val)
> - 		ctf_integer(u64, bytes, bytes)
> -@@ -1208,7 +1214,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
> - 	TP_ARGS(fs_info, type, val, bytes, reserve),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, fs_info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_string(type, type)
> - 		ctf_integer(u64, val, val)
> - 		ctf_integer(u64, bytes, bytes)
> -@@ -1221,9 +1227,9 @@ LTTNG_TRACEPOINT_EVENT(btrfs_space_reservation,
> - 
> - LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len),
> -+	TP_ARGS(fs_info, start, len),
> - 
> - 	TP_FIELDS(
> - 		ctf_integer(u64, start, start)
> -@@ -1233,25 +1239,25 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_alloc,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len)
> -+	TP_ARGS(fs_info, start, len)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_free,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len)
> -+	TP_ARGS(fs_info, start, len)
> - )
> - 
> - #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
> - 
> - LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len),
> -+	TP_ARGS(fs_info, start, len),
> - 
> - 	TP_FIELDS(
> - 		ctf_integer(u64, start, start)
> -@@ -1261,16 +1267,16 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserved_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_alloc,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len)
> -+	TP_ARGS(fs_info, start, len)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_free,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, u64 start, u64 len),
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, u64 start, u64 len),
> - 
> --	TP_ARGS(info, start, len)
> -+	TP_ARGS(fs_info, start, len)
> - )
> - 
> - #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
> -@@ -1341,13 +1347,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
> - 
> - 	btrfs_find_free_extent,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
> - 		 u64 data),
> - 
> --	TP_ARGS(info, num_bytes, empty_size, data),
> -+	TP_ARGS(fs_info, num_bytes, empty_size, data),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, num_bytes, num_bytes)
> - 		ctf_integer(u64, empty_size, empty_size)
> - 		ctf_integer(u64, data, data)
> -@@ -1362,7 +1368,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
> - 	TP_ARGS(block_group, start, len),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, block_group->fs_info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, block_group->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
> - 		ctf_integer(u64, flags, block_group->flags)
> - 		ctf_integer(u64, start, start)
> -@@ -1391,13 +1397,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
> - 
> - 	btrfs_find_free_extent,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
> - 		 u64 data),
> - 
> --	TP_ARGS(info, num_bytes, empty_size, data),
> -+	TP_ARGS(fs_info, num_bytes, empty_size, data),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, num_bytes, num_bytes)
> - 		ctf_integer(u64, empty_size, empty_size)
> - 		ctf_integer(u64, data, data)
> -@@ -1406,14 +1412,14 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info,
> - 		 const struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len),
> -+	TP_ARGS(fs_info, block_group, start, len),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
> - 		ctf_integer(u64, flags, block_group->flags)
> - 		ctf_integer(u64, start, start)
> -@@ -1423,20 +1429,20 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info,
> - 		 const struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len)
> -+	TP_ARGS(fs_info, block_group, start, len)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
> - 
> --	TP_PROTO(const struct btrfs_fs_info *info,
> -+	TP_PROTO(const struct btrfs_fs_info *fs_info,
> - 		 const struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len)
> -+	TP_ARGS(fs_info, block_group, start, len)
> - )
> - 
> - #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
> -@@ -1445,13 +1451,13 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
> - 
> - 	btrfs_find_free_extent,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
> - 		 u64 data),
> - 
> --	TP_ARGS(info, num_bytes, empty_size, data),
> -+	TP_ARGS(fs_info, num_bytes, empty_size, data),
> - 
> - 	TP_FIELDS(
> --		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
> -+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
> - 		ctf_integer(u64, num_bytes, num_bytes)
> - 		ctf_integer(u64, empty_size, empty_size)
> - 		ctf_integer(u64, data, data)
> -@@ -1460,11 +1466,11 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info,
> - 		 struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len),
> -+	TP_ARGS(fs_info, block_group, start, len),
> - 
> - 	TP_FIELDS(
> - 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
> -@@ -1476,20 +1482,20 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info,
> - 		 struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len)
> -+	TP_ARGS(fs_info, block_group, start, len)
> - )
> - 
> - LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
> - 
> --	TP_PROTO(struct btrfs_fs_info *info,
> -+	TP_PROTO(struct btrfs_fs_info *fs_info,
> - 		 struct btrfs_block_group_cache *block_group, u64 start,
> - 		 u64 len),
> - 
> --	TP_ARGS(info, block_group, start, len)
> -+	TP_ARGS(fs_info, block_group, start, len)
> - )
> - #elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
> - 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
> deleted file mode 100644
> index 4ffe488677..0000000000
> --- a/meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 416cee8707053a9015dfec8332e12f8c263098e3 Mon Sep 17 00:00:00 2001
> -From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -Date: Thu, 14 Feb 2019 11:40:50 -0500
> -Subject: [PATCH 9/9] Cleanup: tp mempool: Remove logically dead code
> -
> -Found by Coverity:
> -CID 1391045 (#1 of 1): Logically dead code (DEADCODE)
> -
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -
> -Upstream-Status: backport https://github.com/lttng/lttng-modules/commit/416cee8707053a9015dfec8332e12f8c263098e3
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - lttng-tp-mempool.c | 11 ++---------
> - 1 file changed, 2 insertions(+), 9 deletions(-)
> -
> -diff --git a/lttng-tp-mempool.c b/lttng-tp-mempool.c
> -index d984bd4..21e8376 100644
> ---- a/lttng-tp-mempool.c
> -+++ b/lttng-tp-mempool.c
> -@@ -151,19 +151,12 @@ void lttng_tp_mempool_free(void *ptr)
> - 	struct lttng_tp_buf_entry *entry;
> - 	struct per_cpu_buf *cpu_buf;
> - 
> --	if (!ptr) {
> -+	if (!ptr)
> - 		goto end;
> --	}
> --
> - 	entry = container_of(ptr, struct lttng_tp_buf_entry, buf);
> --	if (!entry) {
> --		goto end;
> --	}
> --
> - 	cpu_buf = per_cpu_ptr(pool, entry->cpu);
> --	if (!cpu_buf) {
> -+	if (!cpu_buf)
> - 		goto end;
> --	}
> - 	/* Add it to the free list. */
> - 	list_add_tail(&entry->list, &cpu_buf->free_list);
> - 
> --- 
> -2.19.1
> -
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> similarity index 61%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> index 15e75e51c9..70a6843263 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> @@ -15,19 +15,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> -           file://0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch \
> -           file://0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch \
> -           file://0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch \
> -           file://0004-Fix-timer-instrumentation-for-RHEL-7.6.patch \
> -           file://0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch \
> -           file://0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch \
> -           file://0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch \
> -           file://0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch \
> -           file://0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch \
>             "
>  
> -SRC_URI[md5sum] = "54bd9fca61487bbec1b3fca2f2213c98"
> -SRC_URI[sha256sum] = "fe1d269bca723e8948af871c322c37d3900e647cdc5eb3efbe821e434beee44c"
> +SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
> +SRC_URI[sha256sum] = "a1855bbd02d0f71ebd180e9872309862036624f012442ab9cc5852eb60340145"
>  
>  export INSTALL_MOD_DIR="kernel/lttng-modules"
>  


