Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6727C6BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:56:14 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 62106182017;
	Wed, 13 Mar 2019 16:56:15 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 7n74qbaBZZcT; Wed, 13 Mar 2019 16:56:14 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 9C44E182012;
	Wed, 13 Mar 2019 16:56:14 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9C44E182012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552510574;
	bh=OtKvP/YN4acAUFi3H9rIMXkwpTf90se0ExczbO+WXvg=;
	h=From:To:Date:Message-Id;
	b=bHx13vI+EI6TXVSQbsI0r2KF4q/Aah56F70lj5fNji2zTqpL3w1+jc1nOGF1aR2eM
	x8gUuUrYLc0+F04EYh2DA0aM+hbpaTbQnocBgCmmlSb9MsdCHhvkdsytDXHgPLfBj6
	+m02bxcCOJtBEnSbMQavdlOiIu5qwaD+JX5PrXstiLViUr5TdMkLGWEcGXHgjB1GQf
	eueuLCMrb/3SN6c9oM4vRmwW2ROd9Qp9NikcVOGAyI1+kt/1WfWdqs3E5kWsQgKjve
	pXbujOuwbUwMoxrfAMIkHMC/GK6Kulo6OpizSA1yGll2LH3ePd81O0thCuAbdoMMLb
	f76goK8L32zmw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 3S3VCFg18GHJ; Wed, 13 Mar 2019 16:56:14 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 7390818200D;
	Wed, 13 Mar 2019 16:56:14 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 20:55:54 +0000
Message-Id: <20190313205555.10007-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
Subject: [Thud][PATCH 2/3] lttng-modules: update to 2.10.9
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
X-List-Received-Date: Wed, 13 Mar 2019 20:56:14 -0000

Drop patch [1] since it is part of the 2.10.9 release.

[1] lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...k-wmem-in-sock_exceed_buf_limit-trac.patch | 67 -------------------
 ...ules_2.10.7.bb => lttng-modules_2.10.9.bb} |  5 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.7.bb => lttng-modules_2.10.9.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
deleted file mode 100644
index 92e12df177..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 9e67b4c94b94493123d38379bd9b3eceae23a6f1 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 7 Sep 2018 12:21:12 -0400
-Subject: [PATCH] Fix: net: expose sk wmem in sock_exceed_buf_limit tracepoint
- (4.19)
-
-See upstream commit:
-
-  commit d6f19938eb031ee2158272757db33258153ae59c
-  Author: Yafang Shao <laoar.shao@gmail.com>
-  Date:   Sun Jul 1 23:31:30 2018 +0800
-
-    net: expose sk wmem in sock_exceed_buf_limit tracepoint
-
-    Currently trace_sock_exceed_buf_limit() only show rmem info,
-    but wmem limit may also be hit.
-    So expose wmem info in this tracepoint as well.
-
-    Regarding memcg, I think it is better to introduce a new tracepoint(if
-    that is needed), i.e. trace_memcg_limit_hit other than show memcg info in
-    trace_sock_exceed_buf_limit.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- instrumentation/events/lttng-module/sock.h | 23 ++++++++++++++++++++++-
- 1 file changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/sock.h b/instrumentation/events/lttng-module/sock.h
-index 5cd02ca..cd0c92b 100644
---- a/instrumentation/events/lttng-module/sock.h
-+++ b/instrumentation/events/lttng-module/sock.h
-@@ -21,7 +21,28 @@ LTTNG_TRACEPOINT_EVENT(sock_rcvqueue_full,
- 	)
- )
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,15,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,19,0))
-+
-+LTTNG_TRACEPOINT_EVENT(sock_exceed_buf_limit,
-+
-+	TP_PROTO(struct sock *sk, struct proto *prot, long allocated, int kind),
-+
-+	TP_ARGS(sk, prot, allocated, kind),
-+
-+	TP_FIELDS(
-+		ctf_string(name, prot->name)
-+		ctf_array(long, sysctl_mem, prot->sysctl_mem, 3)
-+		ctf_integer(long, allocated, allocated)
-+		ctf_integer(int, sysctl_rmem, sk_get_rmem0(sk, prot))
-+		ctf_integer(int, rmem_alloc, atomic_read(&sk->sk_rmem_alloc))
-+		ctf_integer(int, sysctl_wmem, sk_get_wmem0(sk, prot))
-+		ctf_integer(int, wmem_alloc, refcount_read(&sk->sk_wmem_alloc))
-+		ctf_integer(int, wmem_queued, sk->sk_wmem_queued)
-+		ctf_integer(int, kind, kind)
-+	)
-+)
-+
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,15,0))
- 
- LTTNG_TRACEPOINT_EVENT(sock_exceed_buf_limit,
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
index f6c865a875..d297377755 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
@@ -15,11 +15,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch \
 "
 
-SRC_URI[md5sum] = "d3cb4520948083bf1573a2e4cb7406aa"
-SRC_URI[sha256sum] = "f049428d3d131e103a7a7038d184731bf7bcdce00503fc19a2c9b5693ecbb3b5"
+SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
+SRC_URI[sha256sum] = "a1855bbd02d0f71ebd180e9872309862036624f012442ab9cc5852eb60340145"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


