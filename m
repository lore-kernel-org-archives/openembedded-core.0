Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F19206C235
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:57:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 79so76364wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cRmZaVL0Pq0hIR3A/KTwfdzOoKOsolxhDiXuiGV6WuM=;
	b=ONu1F8qYYjA1Zsr4zySaMewSTx2IDjoDzkw2cgf+kTg5oVLCU3ZD+hUU+oGNbosl5e
	SdVKviiejJDsm7lOVNkdRfURXejOOFgDUPYbuLDk8UD+KXiO2ysJTW7USbmLix1LTwE6
	Z+lbofAXUT+Vn+YZB+WVphO062EkKmEXMDaYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cRmZaVL0Pq0hIR3A/KTwfdzOoKOsolxhDiXuiGV6WuM=;
	b=sE50PTcqDsDE7xv+dW8126SJLV5Bb6mtBsGpo1AG4d4e78m2sLnNzXaOkPXUrYpE6V
	GgSg+cmTXUv5riKUFmj45G+1wihFTjpwFY0KDesj6dOzqhwO9Stpu7pE3kZDZ1w71cX5
	t938CW55AL953qXy4REpDi1xLQpND+Tsk2llwJNZ48miegXreuulBwLExqOuSRCFRvcT
	WSgxyqZplF8VeipwlNp7p3EG+c9GKg/XC+URssjXSiFubYBVFUsl2NSn/EcUha8YHM7K
	ktPYfCxz6zsCGMa2s1WgTpG01LWhwEe0SeeDR9pueD23eXcslRI1ZrGIR29MF65POBMb
	e6ww==
X-Gm-Message-State: AA+aEWa515MpX80+yt40PpvxA7KqRQ6J0DMaoRQgqr8LDhnBbqtbaE+2
	oR100XZOxaGMFD4isJ6cxOt6x6N27AA=
X-Google-Smtp-Source: AJdET5dl0Hn5H+j1omVmgSh1n0FXplwA51kk1nIwAz8Qd83ueDrJi5TaceXP5wuE8Dy53pDph8F92Q==
X-Received: by 2002:a1c:f313:: with SMTP id
	q19-v6mr2601612wmq.87.1542495478162; 
	Sat, 17 Nov 2018 14:57:58 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.57.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:57:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:47 +0000
Message-Id: <20181117225753.15733-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/9] lttng-modules: upgrade 2.10.7 -> 2.10.8
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
X-List-Received-Date: Sat, 17 Nov 2018 22:57:58 -0000

Drop backported patch already applied upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...k-wmem-in-sock_exceed_buf_limit-trac.patch | 67 -------------------
 ...ules_2.10.7.bb => lttng-modules_2.10.8.bb} |  7 +-
 2 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.7.bb => lttng-modules_2.10.8.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
deleted file mode 100644
index 92e12df1778..00000000000
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
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
index f6c865a8751..92e8c319b65 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
@@ -15,11 +15,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch \
-"
+           "
 
-SRC_URI[md5sum] = "d3cb4520948083bf1573a2e4cb7406aa"
-SRC_URI[sha256sum] = "f049428d3d131e103a7a7038d184731bf7bcdce00503fc19a2c9b5693ecbb3b5"
+SRC_URI[md5sum] = "54bd9fca61487bbec1b3fca2f2213c98"
+SRC_URI[sha256sum] = "fe1d269bca723e8948af871c322c37d3900e647cdc5eb3efbe821e434beee44c"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


