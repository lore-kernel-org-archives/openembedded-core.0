Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.13332.1589207969171505925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RznYakCl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id x15so4243148pfa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M59OLlH9nuBElWBeHUWnPw0Mp2nbQhS8yllFRv0Hky4=;
        b=RznYakCleOCM0lYO7TQA374yeKSQI4PcnnZO3/TUAfhHSlXxXwXuhkiD3wX9sBoQ7R
         cT24TA2xD8jNz+OpdaDqyUB0F1N0r6InbQ+5ZCIUXPsXKKpUdwnH47nkqnbIGAjzJfgD
         v3W1dAEjVRb4nhTFTlM0+uFrWk9GgcL6IqwkBhur7soDhEqsJ2B6QUu89n4vpsARYlEz
         YoNC9oC1L1i+pbLyql7uLH+8lvYU9YV/ypmYqQElinq1sPVMfsCduxVBuuIz1tGFAFiw
         sxKVrjyArpW0tw3xP8XgfpoDyfI6RLMBONViqTfbGIuhQTcx/H02JMTf6ByBvebLcoHh
         Akiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M59OLlH9nuBElWBeHUWnPw0Mp2nbQhS8yllFRv0Hky4=;
        b=oZ8hs5UuonstMn8eeBokK4DAzmZjyone7u9yZ8XHwD7nfgad3FIIRRXjfSvD2Yz1zz
         DyK968lyNd06AffrBCU+Gtv32gBY3mNPNOp9ijtdO09nZnVwPzQRSX6G6UlcpjM/ENym
         FpfkZ3V9zf4sUhHLxs6KbJhaEtpG+pTIiIjUOOct9Ey6smUU7Y1xPxwgukAbBawgvBp4
         xG6oZCqCaX4qbak810VhSY2wk0RH2Djw+ukm6e8uVcd9qE3IM1BRQrwsyOkdY3F5ZhFZ
         LI9W38oEyJrlOT+W2qV+p3Q/84JygiNleWgI9YhB/nPBO3e5/nAlOJBoG/Dtn8itFMJT
         0omw==
X-Gm-Message-State: AGi0Pua8BhZUCBV59Lwk/u3FOuikf+JN6oJcSYd0f5PRT6HFs2sKOvIO
	nns2zAtmhpNSTMQyxsv0D7Ah1c3hXGQlUw==
X-Google-Smtp-Source: APiQypIwyZAITmlH/g5HAmSimWzL1Tex2j+lK8PMKbH4Iz6qsH7GQpXyr7RmGjN+VDg4sWnARmZSEQ==
X-Received: by 2002:aa7:94a3:: with SMTP id a3mr16936905pfl.101.1589207967496;
        Mon, 11 May 2020 07:39:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] util-linux: fix build error in kill
Date: Mon, 11 May 2020 04:38:45 -1000
Message-Id: <9620c4e6e0e184b2b3907c8f8da4b7b54b97354e.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589207495.git.steve@sakoman.com>
References: <cover.1589207495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Benjamin Fair <benjaminfair@google.com>

Backport patches from upstream to fix a build error in the kill utility.

Fixes:
| In file included from ../util-linux-2.35.1/misc-utils/kill.c:57:
| ../util-linux-2.35.1/include/pidfd-utils.h: In function ‘pidfd_open’:
| ../util-linux-2.35.1/include/pidfd-utils.h:19:17: error: ‘SYS_pidfd_open’ undeclared (first use in this function); did you mean ‘pidfd_open’?

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-include-cleanup-pidfd-inckudes.patch | 42 ++++++++++++
 ...-types.h-before-checking-SYS_pidfd_s.patch | 64 +++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch b/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
new file mode 100644
index 0000000000..0ef6fb4ec7
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
@@ -0,0 +1,42 @@
+From 0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 10 Mar 2020 11:43:16 +0100
+Subject: [PATCH] include: cleanup pidfd inckudes
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75]
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Benjamin Fair <benjaminfair@google.com>
+---
+ include/pidfd-utils.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 0baedd2c9..4a6c3a604 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -3,10 +3,10 @@
+ 
+ #if defined(__linux__)
+ # include <sys/syscall.h>
+-# if defined(SYS_pidfd_send_signal)
++# if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
+ #  include <sys/types.h>
+ 
+-#  ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+@@ -14,7 +14,7 @@ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ }
+ #  endif
+ 
+-#  ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+-- 
+2.26.1.301.g55bc3eb7cb9-goog
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch b/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
new file mode 100644
index 0000000000..e43e12873f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
@@ -0,0 +1,64 @@
+From 3cfde0370d3a8949df0c5bcf447cec6692910ed2 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 15 Feb 2020 21:12:50 +0000
+Subject: [PATCH] kill: include sys/types.h before checking
+ SYS_pidfd_send_signal
+
+Including sys/types.h must happen before SYS_pidfd_send_signal is checked,
+because that header defines variable in normal conditions.  When sys/types.h
+does not have SYS_pidfd_send_signal then fallback is defined in config.h
+that is included by default, and has therefore worked fine before and after
+this change.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/3cfde0370d3a8949df0c5bcf447cec6692910ed2]
+
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Signed-off-by: Benjamin Fair <benjaminfair@google.com>
+---
+ include/pidfd-utils.h | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 593346576..0baedd2c9 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -1,26 +1,28 @@
+ #ifndef UTIL_LINUX_PIDFD_UTILS
+ #define UTIL_LINUX_PIDFD_UTILS
+ 
+-#if defined(__linux__) && defined(SYS_pidfd_send_signal)
+-# include <sys/types.h>
++#if defined(__linux__)
+ # include <sys/syscall.h>
++# if defined(SYS_pidfd_send_signal)
++#  include <sys/types.h>
+ 
+-# ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_send_signal, pidfd, sig, info, flags);
+ }
+-# endif
++#  endif
+ 
+-# ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+ }
+-# endif
++#  endif
+ 
+-# define UL_HAVE_PIDFD 1
++#  define UL_HAVE_PIDFD 1
+ 
+-#endif /* __linux__ && SYS_pidfd_send_signal */
++# endif	/* SYS_pidfd_send_signal */
++#endif /* __linux__ */
+ #endif /* UTIL_LINUX_PIDFD_UTILS */
+-- 
+2.26.1.301.g55bc3eb7cb9-goog
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
index 51964c9124..516b783887 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -9,6 +9,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
             file://0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch \
+            file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch \
+            file://0001-include-cleanup-pidfd-inckudes.patch \
 "
 SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.17.1

