Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.56051.1629300735990613516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=li6KnMct;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id jv8so1875610qvb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gGoDJ8tHvp3h8qh3aPN+NK21tr+feaQ3kjMm1SIAHcc=;
        b=li6KnMctpjr9gC+kuSOXFesjakakZd/Xtq1lQX/EUMNKngz8fyeSN9r+9+39TdZpVc
         S8Jz9xaeBGRxxlc0pHRh8PkTa+kDxztb6VwlTJsNQRf6IswYg5n7is6WWwVeP9vuctRd
         Ref63DAbUjqmUvhE4sgZis2DGcsyePXWN8EmhHRu2lqVopJYzEcE7rYdTX3mpqJr7zxs
         N0GbYLKzf5A2zlD/hg3Nhfg76OBS9Q6xJS/XkHSOAXsJj3sjZL/XTx7ZKV2Zws5qb5tY
         /NGOebPXqQKeP/E8p+0kR+W6StxmOHBakgc7ntru7IvsgI0JgTszouGyClXubtrAtAj3
         G2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gGoDJ8tHvp3h8qh3aPN+NK21tr+feaQ3kjMm1SIAHcc=;
        b=bvXkpViEXNeiDIK/oWE3C4a0shi18BXImACpmHvEnwLwmnovMWCFnDcNdKSn4fDBax
         9kW1GYauojlSYXZxxxYzvfG/1TreKAHQLk0ydg3+OWUZKRm1oCXJFu+xLSHYl2/SzqjE
         5vf1BgNdBvuZ8NJlgXf8/BwU50G76NHMCZlACxLpfmazMIlwEhQHoJ07PNQHPyJ3pjp7
         a7mJJ1Ry7acK2ustYJ0kEihbrVPKvcyZChTXEWnsI8tlCFaZPeviW6bO64w+YyLwIL1f
         Hx8RP98BPoCcuzKLDW1xJPdmK9USndTtOC1r702vgbpOiwe5Cw3x5YCAA5Jzjangz7CP
         5B5w==
X-Gm-Message-State: AOAM5327w3f+EX9wmWTuyI4kCUC1mwKOUjge5WehNIPON40lXrfIScwz
	HJYDM9DljzfjdwWzI7jWmE9CPygmDn9TL9Sc
X-Google-Smtp-Source: ABdhPJzVYe0nGNq7IxKmW3v0PlFfK4mhMkZc9zlTYrnjWfEiSKidEwut41lBbddHhiqZR/+JpqXFRQ==
X-Received: by 2002:ad4:45a8:: with SMTP id y8mr9579752qvu.49.1629300734825;
        Wed, 18 Aug 2021 08:32:14 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id 14sm136437qtp.19.2021.08.18.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 08:32:14 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	ernstp@gmail.com,
	khairul.rohaizzat.jamaluddin@intel.com,
	alexandre.belloni@bootlin.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH] glibc: Fix CVE-2021-38604
Date: Wed, 18 Aug 2021 08:31:41 -0700
Message-Id: <20210818153141.187933-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Source: https://sourceware.org/git/glibc.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28213

Backported upstream commits b805aebd42364fe696e417808a700fdb9800c9e8 and 4cc79c217744743077bf7a0ec5e0a4318f1e6641
to glibc-2.34 source.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641]

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../glibc/glibc/0001-CVE-2021-38604.patch     |  43 +++++
 .../glibc/glibc/0002-CVE-2021-38604.patch     | 150 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   2 +
 3 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
new file mode 100644
index 0000000000..1e94049004
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
@@ -0,0 +1,43 @@
+From b805aebd42364fe696e417808a700fdb9800c9e8 Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npv1310@gmail.com>
+Date: Mon, 9 Aug 2021 20:17:34 +0530
+Subject: [PATCH] librt: fix NULL pointer dereference (bug 28213)
+
+Helper thread frees copied attribute on NOTIFY_REMOVED message
+received from the OS kernel.  Unfortunately, it fails to check whether
+copied attribute actually exists (data.attr != NULL).  This worked
+earlier because free() checks passed pointer before actually
+attempting to release corresponding memory.  But
+__pthread_attr_destroy assumes pointer is not NULL.
+
+So passing NULL pointer to __pthread_attr_destroy will result in
+segmentation fault.  This scenario is possible if
+notification->sigev_notify_attributes == NULL (which means default
+thread attributes should be used).
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8]
+CVE: CVE-2021-38604
+
+Signed-off-by: Nikita Popov <npv1310@gmail.com>
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ sysdeps/unix/sysv/linux/mq_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
+index 9799dcdaa4..eccae2e4c6 100644
+--- a/sysdeps/unix/sysv/linux/mq_notify.c
++++ b/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -131,7 +131,7 @@ helper_thread (void *arg)
+ 	       to wait until it is done with it.  */
+ 	    (void) __pthread_barrier_wait (&notify_barrier);
+ 	}
+-      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
++      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED && data.attr != NULL)
+ 	{
+ 	  /* The only state we keep is the copy of the thread attributes.  */
+ 	  __pthread_attr_destroy (data.attr);
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
new file mode 100644
index 0000000000..9f71fecddb
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
@@ -0,0 +1,150 @@
+From 4cc79c217744743077bf7a0ec5e0a4318f1e6641 Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npv1310@gmail.com>
+Date: Thu, 12 Aug 2021 16:09:50 +0530
+Subject: [PATCH] librt: add test (bug 28213)
+
+This test implements following logic:
+1) Create POSIX message queue.
+   Register a notification with mq_notify (using NULL attributes).
+   Then immediately unregister the notification with mq_notify.
+   Helper thread in a vulnerable version of glibc
+   should cause NULL pointer dereference after these steps.
+2) Once again, register the same notification.
+   Try to send a dummy message.
+   Test is considered successfulif the dummy message
+   is successfully received by the callback function.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641]
+CVE: CVE-2021-38604
+
+Signed-off-by: Nikita Popov <npv1310@gmail.com>
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ rt/Makefile      |   1 +
+ rt/tst-bz28213.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 102 insertions(+)
+ create mode 100644 rt/tst-bz28213.c
+
+diff --git a/rt/Makefile b/rt/Makefile
+index 113cea03a5..910e775995 100644
+--- a/rt/Makefile
++++ b/rt/Makefile
+@@ -74,6 +74,7 @@ tests := tst-shm tst-timer tst-timer2 \
+ 	 tst-aio7 tst-aio8 tst-aio9 tst-aio10 \
+ 	 tst-mqueue1 tst-mqueue2 tst-mqueue3 tst-mqueue4 \
+ 	 tst-mqueue5 tst-mqueue6 tst-mqueue7 tst-mqueue8 tst-mqueue9 \
++	 tst-bz28213 \
+ 	 tst-timer3 tst-timer4 tst-timer5 \
+ 	 tst-cpuclock2 tst-cputimer1 tst-cputimer2 tst-cputimer3 \
+ 	 tst-shm-cancel \
+diff --git a/rt/tst-bz28213.c b/rt/tst-bz28213.c
+new file mode 100644
+index 0000000000..0c096b5a0a
+--- /dev/null
++++ b/rt/tst-bz28213.c
+@@ -0,0 +1,101 @@
++/* Bug 28213: test for NULL pointer dereference in mq_notify.
++   Copyright (C) The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <mqueue.h>
++#include <signal.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++
++static mqd_t m = -1;
++static const char msg[] = "hello";
++
++static void
++check_bz28213_cb (union sigval sv)
++{
++  char buf[sizeof (msg)];
++
++  (void) sv;
++
++  TEST_VERIFY_EXIT ((size_t) mq_receive (m, buf, sizeof (buf), NULL)
++		    == sizeof (buf));
++  TEST_VERIFY_EXIT (memcmp (buf, msg, sizeof (buf)) == 0);
++
++  exit (0);
++}
++
++static void
++check_bz28213 (void)
++{
++  struct sigevent sev;
++
++  memset (&sev, '\0', sizeof (sev));
++  sev.sigev_notify = SIGEV_THREAD;
++  sev.sigev_notify_function = check_bz28213_cb;
++
++  /* Step 1: Register & unregister notifier.
++     Helper thread should receive NOTIFY_REMOVED notification.
++     In a vulnerable version of glibc, NULL pointer dereference follows. */
++  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
++  TEST_VERIFY_EXIT (mq_notify (m, NULL) == 0);
++
++  /* Step 2: Once again, register notification.
++     Try to send one message.
++     Test is considered successful, if the callback does exit (0). */
++  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
++  TEST_VERIFY_EXIT (mq_send (m, msg, sizeof (msg), 1) == 0);
++
++  /* Wait... */
++  pause ();
++}
++
++static int
++do_test (void)
++{
++  static const char m_name[] = "/bz28213_queue";
++  struct mq_attr m_attr;
++
++  memset (&m_attr, '\0', sizeof (m_attr));
++  m_attr.mq_maxmsg = 1;
++  m_attr.mq_msgsize = sizeof (msg);
++
++  m = mq_open (m_name,
++               O_RDWR | O_CREAT | O_EXCL,
++               0600,
++               &m_attr);
++
++  if (m < 0)
++    {
++      if (errno == ENOSYS)
++        FAIL_UNSUPPORTED ("POSIX message queues are not implemented\n");
++      FAIL_EXIT1 ("Failed to create POSIX message queue: %m\n");
++    }
++
++  TEST_VERIFY_EXIT (mq_unlink (m_name) == 0);
++
++  check_bz28213 ();
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 66494c5c23..eafc0216ff 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -55,6 +55,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0001-CVE-2021-38604.patch \
+           file://0002-CVE-2021-38604.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

