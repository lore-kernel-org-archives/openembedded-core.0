Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A98C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 19:09:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17510.1633028966746259705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 12:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOEivWaD;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m22so6302381wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6vlKvRh0ZpAegJdkpeQieUEEm3OwIedbzFDJ1OPJPJg=;
        b=dOEivWaD89hYk3V7dzbG4GqQLeEapGqTU1Ig/eKYT6fL131d+5AjxMlu4yh1/G55xn
         gxE7Nlkh1i10DiBMPYLs2qqzZnEjx9OpWv67F6NkkDCVF3affEeCRXFBkdL52X8IXf4e
         89kIdkjzowM2s0kd53J+WXxMBn0mSRUwIsv7Z+Bgg37zqZT+n71uCAXGuDOCyzBZqdFs
         gNud8JCLrPwRM90hob3dyOhhTIEF8eRIfle+oHxCXMmPkdZs6bk3fWwGqoV7KVC3p9qM
         SbzYS8V2GXtzOZSx1R0LwYU0U+ER8ELIJLU9hUStyD+ASOBm3dOqNlH/V0ijRVBdKo0F
         Ne8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6vlKvRh0ZpAegJdkpeQieUEEm3OwIedbzFDJ1OPJPJg=;
        b=qWb8Ky7xciJG+IO5KSgvHGDx8xHQXmFpdhueYWGPt0hSw4nF89DFErpN0az/V7PAAE
         6I8oTSlEfT9CHwpgZz7i1B5pOU6VL7yZrLPmezKYuu4jin8vUBh2bHYA0AacScpqcExF
         fa+7Wl6gQvgBzZX5snIB9+BJWA4g4Qc2abh+fBhHTjOECl+Sid0FkyaD8iAdrB3/9xqe
         e0KL3apxN0EuD9CZHEpOzWEJC9CDvPEPBPiyak8nUXbghNQxCqUmgTMhcHg5E104OzsE
         UOfcutXHdX4k40A0wGIcJzQf03I9DaeONFQrM9VZADjY4lFhB1vLqqBs7jCdirMksSfw
         641w==
X-Gm-Message-State: AOAM533nzXp7IYS/lpvehefLrj+3+XnG5S2MS8kKs3ZVFj1yB6Uh8MlF
	WeKabo0pN+O40cXAtXBhgtMIqfTazaQ=
X-Google-Smtp-Source: 
 ABdhPJztnsQQW2u29/uIH8FlAoLXFQXUfaJ7PLIb2xmdMlxHaIlvYHrwO3UQHn1/T5O/YH3FZyLUYQ==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr7947640wro.94.1633028964799;
        Thu, 30 Sep 2021 12:09:24 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id
 l25sm3609321wmi.29.2021.09.30.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 12:09:24 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH 1/1] ltp: Update to 20210927
Date: Thu, 30 Sep 2021 21:09:11 +0200
Message-Id: <20210930190911.31243-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 19:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156507

New patches to fix functionality:
* 0002-lib-fix-MemAvailable-parsing.patch
* 0003-lapi-rtnetlink.h-Fix-include-guards.patch
* 0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
* 0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

Removed patch from this release
* 0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch

Rebased patch
* 0001-Remove-OOM-tests-from-runtest-mm.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

@Anders, @Naresh: could you please test it?

Kind regards,
Petr

 ...001-Remove-OOM-tests-from-runtest-mm.patch | 12 ++--
 ...s05.c-ioctl_ns06.c-Fix-too-small-buf.patch | 59 ------------------
 .../0002-lib-fix-MemAvailable-parsing.patch   | 36 +++++++++++
 ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 ++++++++++++
 ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ++++++++++++++++++
 ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 +++++++++++++++++++
 .../ltp/{ltp_20210524.bb => ltp_20210927.bb}  | 10 ++--
 7 files changed, 205 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
 rename meta/recipes-extended/ltp/{ltp_20210524.bb => ltp_20210927.bb} (93%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index e51950f153..6d945700be 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
+From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -7,16 +7,17 @@ Disable OOM tests, as they might cause oeqa ssh connection lost
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
+[ pvorel: rebased for 20210927 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  runtest/mm | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 481d39691..cf207d10e 100644
+index 6537666a9..e5a091a5a 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
+@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
  
  cpuset01 cpuset01
  
@@ -29,3 +30,6 @@ index 481d39691..cf207d10e 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
+-- 
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
deleted file mode 100644
index 08b88a38f3..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From af2b6f5ee6b171078b18246dd73f71cf6e350859 Mon Sep 17 00:00:00 2001
-From: Marius Hillenbrand <mhillen@linux.ibm.com>
-Date: Mon, 19 Jul 2021 13:58:35 +0800
-Subject: [PATCH] syscalls/ioctl_ns05.c, ioctl_ns06.c: Fix too small buffer for
- path
-
-commit af2b6f5ee6b171078b18246dd73f71cf6e350859 upstream.
-
-Resize the buffer used for paths into /proc/ to grant enough space
-for long PIDs. While at it, replace sprintf with snprintf to avoid
-buffer overflows if we ever ran out of space again.
-
-Fixes: #847
-Signed-off-by: Marius Hillenbrand <mhillen@linux.ibm.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
-Upstream-Status: Backport
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-index a67ddbe2c66f..52613810c7ce 100644
---- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-@@ -59,10 +59,10 @@ static void run(void)
- 	if (pid == -1)
- 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
- 
--	char child_namespace[20];
-+	char child_namespace[30];
- 	int my_fd, child_fd, parent_fd;
- 
--	sprintf(child_namespace, "/proc/%i/ns/pid", pid);
-+	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/pid", pid);
- 	my_fd = SAFE_OPEN("/proc/self/ns/pid", O_RDONLY);
- 	child_fd = SAFE_OPEN(child_namespace, O_RDONLY);
- 	parent_fd = ioctl(child_fd, NS_GET_PARENT);
-diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-index b6ac80208d02..c30f7de91e09 100644
---- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-@@ -51,14 +51,14 @@ static int child(void *arg LTP_ATTRIBUTE_UNUSED)
- 
- static void run(void)
- {
--	char child_namespace[20];
-+	char child_namespace[30];
- 
- 	pid_t pid = ltp_clone(CLONE_NEWUSER | SIGCHLD, &child, 0,
- 		STACK_SIZE, child_stack);
- 	if (pid == -1)
- 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
- 
--	sprintf(child_namespace, "/proc/%i/ns/user", pid);
-+	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/user", pid);
- 	int my_fd, child_fd, parent_fd;
- 
- 	my_fd = SAFE_OPEN("/proc/self/ns/user", O_RDONLY);
--- 
-2.32.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
new file mode 100644
index 0000000000..4a9a5b2363
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
@@ -0,0 +1,36 @@
+From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
+From: Ralph Siemsen <ralph.siemsen@linaro.org>
+Date: Mon, 27 Sep 2021 22:18:50 -0400
+Subject: [PATCH] lib: fix MemAvailable parsing
+
+The amount of available memory was not being returned correctly, which
+resulted in tests being executed when they should have been skipped.
+
+Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+Signed-off-by: Li Wang <liwang@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: e42149e28 ("lib: fix MemAvailable parsing") ]
+---
+ lib/tst_memutils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
+index ae1cad29b..a46de78f5 100644
+--- a/lib/tst_memutils.c
++++ b/lib/tst_memutils.c
+@@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
+ 
+ long long tst_available_mem(void)
+ {
+-	long long mem_available;
++	unsigned long long mem_available = 0;
+ 
+-	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
++	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %llu",
+ 		&mem_available)) {
+ 		mem_available = SAFE_READ_MEMINFO("MemFree:")
+ 			+ SAFE_READ_MEMINFO("Cached:");
+-- 
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch b/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
new file mode 100644
index 0000000000..3c1b1ea486
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
@@ -0,0 +1,37 @@
+From 881709d1e4d1bba5bf8ca365bc058f338bd72dc2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:38:42 +0200
+Subject: [PATCH] lapi/rtnetlink.h: Fix include guards
+
+Fixes: 5fea0638a ("lapi: Add missing IFA_FLAGS")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: a2a212cf8 ("lapi/rtnetlink.h: Fix include guards") ]
+---
+ include/lapi/rtnetlink.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 8a1b5385b..04e9ad51a 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -1,8 +1,8 @@
+ // SPDX-License-Identifier: GPL-2.0-or-later
+ /* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
+
+-#ifndef LAPI_IF_ADDR_H__
+-# define LAPI_IF_ADDR_H__
++#ifndef LAPI_RTNETLINK_H__
++# define LAPI_RTNETLINK_H__
+
+ #include <linux/rtnetlink.h>
+
+@@ -10,4 +10,4 @@
+ # define IFA_FLAGS 8
+ #endif
+
+-#endif	/* LAPI_IF_ADDR_H__ */
++#endif	/* LAPI_RTNETLINK_H__ */
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch b/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
new file mode 100644
index 0000000000..e3108eeeeb
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
@@ -0,0 +1,58 @@
+From b13440627bd4a9f060a33d400a47a40daa2bc12e Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:37:19 +0200
+Subject: [PATCH] lapi: Create if_addr.h and reuse it in rtnetlink.h
+
+There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
+requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
+as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
+like <linux/rtnetlink.h> includes <linux/if_addr.h>.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-3-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h   | 16 ++++++++++++++++
+ include/lapi/rtnetlink.h |  5 +----
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+ create mode 100644 include/lapi/if_addr.h
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+new file mode 100644
+index 000000000..4e50a0a4e
+--- /dev/null
++++ b/include/lapi/if_addr.h
+@@ -0,0 +1,16 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
++ */
++
++#ifndef LAPI_IF_ADDR_H__
++#define LAPI_IF_ADDR_H__
++
++#include <linux/if_addr.h>
++
++#ifndef IFA_FLAGS
++# define IFA_FLAGS 8
++#endif
++
++
++#endif /* LAPI_IF_ADDR_H__ */
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 04e9ad51a..089bf1a0d 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -5,9 +5,6 @@
+ # define LAPI_RTNETLINK_H__
+
+ #include <linux/rtnetlink.h>
+-
+-#ifndef IFA_FLAGS
+-# define IFA_FLAGS 8
+-#endif
++#include "lapi/if_addr.h"
+
+ #endif	/* LAPI_RTNETLINK_H__ */
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch b/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
new file mode 100644
index 0000000000..639091ae52
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
@@ -0,0 +1,60 @@
+From 9e357fb4fc00ab9c303e314b85b9ae3836141f81 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:56:29 +0200
+Subject: [PATCH] lapi/if_addr.h: Define IFA_FLAGS
+
+and use it in icmp_rate_limit01.c.
+
+This fixes error on toolchains with very old kernel headers, e.g.
+Buildroot sourcery-arm:
+
+icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
+   IFA_F_NOPREFIXROUTE);
+
+Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
+system we still support is Cent0S 7 with 3.10 kernel.
+
+NOTE: Cent0S 7 is obviously heavily patched thus it contains
+IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-4-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h            | 3 +++
+ testcases/cve/icmp_rate_limit01.c | 3 ++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+index 4e50a0a4e..0f7e44784 100644
+--- a/include/lapi/if_addr.h
++++ b/include/lapi/if_addr.h
+@@ -12,5 +12,8 @@
+ # define IFA_FLAGS 8
+ #endif
+
++#ifndef IFA_F_NOPREFIXROUTE
++# define IFA_F_NOPREFIXROUTE	0x200
++#endif
+
+ #endif /* LAPI_IF_ADDR_H__ */
+diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
+index b3a237b30..3ada32675 100644
+--- a/testcases/cve/icmp_rate_limit01.c
++++ b/testcases/cve/icmp_rate_limit01.c
+@@ -27,11 +27,12 @@
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-#include <linux/if_addr.h>
+ #include <linux/errqueue.h>
+
+ #include <sched.h>
+ #include <limits.h>
++
++#include "lapi/if_addr.h"
+ #include "tst_test.h"
+ #include "tst_netdevice.h"
+
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-extended/ltp/ltp_20210927.bb
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20210524.bb
rename to meta/recipes-extended/ltp/ltp_20210927.bb
index 20e2deffa5..2088fb2ff3 100644
--- a/meta/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta/recipes-extended/ltp/ltp_20210927.bb
@@ -27,11 +27,14 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
+SRCREV = "12beeda351b5d758a729aaf695b836ccc9eb5304"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch \
+           file://0002-lib-fix-MemAvailable-parsing.patch \
+           file://0003-lapi-rtnetlink.h-Fix-include-guards.patch \
+           file://0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch \
+           file://0005-lapi-if_addr.h-Define-IFA_FLAGS.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -119,9 +122,8 @@ remove_broken_musl_sources() {
 	echo "WARNING: remove unsupported tests (until they're fixed)"
 
 	# sync with upstream
-	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
+	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
 	rm -rfv \
-		testcases/kernel/sched/process_stress/process.c \
 		testcases/kernel/syscalls/confstr/confstr01.c \
 		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 		testcases/kernel/syscalls/getcontext/getcontext01.c \
-- 
2.33.0


