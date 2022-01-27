Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E117BC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.26494.1643278850352625179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LcHT3zeA;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id h21so3782030wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ry5E5jC9fHOvUg9ZeRgT1a5r7Qmh873/fPlgwS7c6Lk=;
        b=LcHT3zeAySQiv2Bc5CL4a0S47fbiFoF/pnbNSR2RyLWzaERo7C59UauRmUL00Z1sWG
         y5YHwuJLh16NRRtvYhoa6IMOJbLSsUKYD4WjBvjHVV5jqYPxR3pZC09+GdnmmQoCHh9s
         qK4egaX0CX01Ti0mUfaxKic0hfPHTN1XQh17i7nA+rJLeVp/t0GcIujpE21uoCN+btEr
         aY+0tiAxR1SSxMRuJlo8OonglTLVT61kKs0frAD8+9Cu+b2GC27cgKMXwaytC7yJebUB
         57N1liV/J4r6AwcyfLwrSqbjaHoK4wFyWBq4HEld4eEt98+e5ldq2KRLgQ5eSC6U/icG
         gjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ry5E5jC9fHOvUg9ZeRgT1a5r7Qmh873/fPlgwS7c6Lk=;
        b=U1/2Crt4ygHgzxtIEkBSZCKzWS7YCD72ZkZbYcwSHz1H+BKZ1zWPmZyaAXI+Fy/bRH
         xfIf1hVVhNOC3Rg1TRmz1Xd1mbXktEYNeo5Tw0Qc8youb47GMfXJCWHKsHdOZHmeVy5P
         GMwoXzVBkO74+077+1H0pgA5Q3MzVDLojEMKxXUqD9CoXm5cMFEV+bmykKwZP/UkeTwj
         95hoo6wbKeAEycKHPc71+dsvAyiCiIHsc2E9Buzx2LpXTJ53YvSiLkpjo7BEDeJ3asjV
         8rHJl9EZpCFJEzYgfZpFjPlp6kRMD2aa+GTJ8y5isr6AMNgrRq+QlvU3ldVko1j+eKwF
         oaUA==
X-Gm-Message-State: AOAM533uwZh9Xr3Wz4nzgIJ9FyRwIQdsM40IRr+Til8vkELfsK3LtFx5
	D8li560eDlYTvEToLRPB04eVHRRuSGKHkg==
X-Google-Smtp-Source: 
 ABdhPJzf1Yn0+S7Nf3aY6uN7QN2+vREE+TN9IeCVzjdtxn7S71qL1XubgViEH8YUZ+pGi+t8tkW3YQ==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2321570wri.526.1643278848739;
        Thu, 27 Jan 2022 02:20:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Li Wang <liwang@redhat.com>,
	Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 14/17] ltp: update 20210927 -> 20220121
Date: Thu, 27 Jan 2022 11:20:02 +0100
Message-Id: <20220127102005.3050843-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161036

The ltp compliancy parser is rewritten to actually
match the logs: they seem to be unstructured, test case names
are not printed and the only indication of failure is appearance of
FAIL[ED] somewhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/logparser.py              | 27 ++++-----
 ...sh-sort-filelist-for-reproducibility.patch | 28 +++++++++
 .../0002-lib-fix-MemAvailable-parsing.patch   | 36 -----------
 ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 ------------
 ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ------------------
 ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 -------------------
 .../ltp/{ltp_20210927.bb => ltp_20220121.bb}  | 11 ++--
 7 files changed, 46 insertions(+), 211 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
 rename meta/recipes-extended/ltp/{ltp_20210927.bb => ltp_20220121.bb} (94%)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 60e16d500e..879aefca33 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -135,30 +135,27 @@ class LtpComplianceParser(object):
 
     def parse(self, logfile):
         test_regex = {}
-        test_regex['PASSED'] = re.compile(r"^PASS")
-        test_regex['FAILED'] = re.compile(r"^FAIL")
-        test_regex['SKIPPED'] = re.compile(r"(?:UNTESTED)|(?:UNSUPPORTED)")
+        test_regex['FAILED'] = re.compile(r"FAIL")
 
         section_regex = {}
-        section_regex['test'] = re.compile(r"^Testing")
+        section_regex['test'] = re.compile(r"^Executing")
 
         with open(logfile, errors='replace') as f:
+            name = logfile
+            result = "PASSED"
             for line in f:
-                result = section_regex['test'].search(line)
-                if result:
-                    self.name = ""
-                    self.name = line.split()[1].strip()
-                    self.results[self.name] = "PASSED"
-                    failed = 0
+                regex_result = section_regex['test'].search(line)
+                if regex_result:
+                    name = line.split()[1].strip()
 
-                failed_result = test_regex['FAILED'].search(line)
-                if failed_result:
-                    failed = line.split()[1].strip()
-                    if int(failed) > 0:
-                        self.results[self.name] = "FAILED"
+                regex_result = test_regex['FAILED'].search(line)
+                if regex_result:
+                    result = "FAILED"
+            self.results[name] = result
 
         for test in self.results:
             result = self.results[test]
+            print (self.results)
             self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
 
         return self.results, self.section
diff --git a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch b/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
new file mode 100644
index 0000000000..e8d9f212a9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
@@ -0,0 +1,28 @@
+From 4aad23f208cc7725cd61bbe5aaadb9994c794cd0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 26 Jan 2022 20:58:46 +0100
+Subject: [PATCH] metadata/parse.sh: sort filelist for reproducibility
+
+find does not guarantee the order of the files.
+
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/907]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ metadata/parse.sh | 2 +-
+
+diff --git a/metadata/parse.sh b/metadata/parse.sh
+index b43d024c68..1811665bfe 100755
+--- a/metadata/parse.sh
++++ b/metadata/parse.sh
+@@ -29,7 +29,7 @@ echo ' "tests": {'
+ 
+ first=1
+ 
+-for test in `find testcases/ -name '*.c'`; do
++for test in `find testcases/ -name '*.c'|sort`; do
+ 	a=$($top_builddir/metadata/metaparse -Iinclude -Itestcases/kernel/syscalls/utils/ "$test")
+ 	if [ -n "$a" ]; then
+ 		if [ -z "$first" ]; then
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
deleted file mode 100644
index 1860b95ce9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
-From: Ralph Siemsen <ralph.siemsen@linaro.org>
-Date: Mon, 27 Sep 2021 22:18:50 -0400
-Subject: [PATCH] lib: fix MemAvailable parsing
-
-The amount of available memory was not being returned correctly, which
-resulted in tests being executed when they should have been skipped.
-
-Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
-Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
-Signed-off-by: Li Wang <liwang@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream-Status: Backport [e42149e28 ("lib: fix MemAvailable parsing")]
----
- lib/tst_memutils.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index ae1cad29b..a46de78f5 100644
---- a/lib/tst_memutils.c
-+++ b/lib/tst_memutils.c
-@@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
- 
- long long tst_available_mem(void)
- {
--	long long mem_available;
-+	unsigned long long mem_available = 0;
- 
--	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
-+	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %llu",
- 		&mem_available)) {
- 		mem_available = SAFE_READ_MEMINFO("MemFree:")
- 			+ SAFE_READ_MEMINFO("Cached:");
--- 
-2.33.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch b/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
deleted file mode 100644
index 6fcafaff1c..0000000000
--- a/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 881709d1e4d1bba5bf8ca365bc058f338bd72dc2 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:38:42 +0200
-Subject: [PATCH] lapi/rtnetlink.h: Fix include guards
-
-Fixes: 5fea0638a ("lapi: Add missing IFA_FLAGS")
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream-Status: Backport [a2a212cf8 ("lapi/rtnetlink.h: Fix include guards")]
----
- include/lapi/rtnetlink.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
-index 8a1b5385b..04e9ad51a 100644
---- a/include/lapi/rtnetlink.h
-+++ b/include/lapi/rtnetlink.h
-@@ -1,8 +1,8 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- /* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
-
--#ifndef LAPI_IF_ADDR_H__
--# define LAPI_IF_ADDR_H__
-+#ifndef LAPI_RTNETLINK_H__
-+# define LAPI_RTNETLINK_H__
-
- #include <linux/rtnetlink.h>
-
-@@ -10,4 +10,4 @@
- # define IFA_FLAGS 8
- #endif
-
--#endif	/* LAPI_IF_ADDR_H__ */
-+#endif	/* LAPI_RTNETLINK_H__ */
---
-2.33.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch b/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
deleted file mode 100644
index 19ac3ba046..0000000000
--- a/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From b13440627bd4a9f060a33d400a47a40daa2bc12e Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:37:19 +0200
-Subject: [PATCH] lapi: Create if_addr.h and reuse it in rtnetlink.h
-
-There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
-requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
-as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
-like <linux/rtnetlink.h> includes <linux/if_addr.h>.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream-Status: Submitted [https://lore.kernel.org/ltp/20210930183058.5240-3-petr.vorel@gmail.com/T/#u]
----
- include/lapi/if_addr.h   | 16 ++++++++++++++++
- include/lapi/rtnetlink.h |  5 +----
- 2 files changed, 17 insertions(+), 4 deletions(-)
- create mode 100644 include/lapi/if_addr.h
-
-diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
-new file mode 100644
-index 000000000..4e50a0a4e
---- /dev/null
-+++ b/include/lapi/if_addr.h
-@@ -0,0 +1,16 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
-+/*
-+ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
-+ */
-+
-+#ifndef LAPI_IF_ADDR_H__
-+#define LAPI_IF_ADDR_H__
-+
-+#include <linux/if_addr.h>
-+
-+#ifndef IFA_FLAGS
-+# define IFA_FLAGS 8
-+#endif
-+
-+
-+#endif /* LAPI_IF_ADDR_H__ */
-diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
-index 04e9ad51a..089bf1a0d 100644
---- a/include/lapi/rtnetlink.h
-+++ b/include/lapi/rtnetlink.h
-@@ -5,9 +5,6 @@
- # define LAPI_RTNETLINK_H__
-
- #include <linux/rtnetlink.h>
--
--#ifndef IFA_FLAGS
--# define IFA_FLAGS 8
--#endif
-+#include "lapi/if_addr.h"
-
- #endif	/* LAPI_RTNETLINK_H__ */
---
-2.33.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch b/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
deleted file mode 100644
index f510fda8c9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9e357fb4fc00ab9c303e314b85b9ae3836141f81 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:56:29 +0200
-Subject: [PATCH] lapi/if_addr.h: Define IFA_F_NOPREFIXROUTE
-
-and use it in icmp_rate_limit01.c.
-
-This fixes error on toolchains with very old kernel headers, e.g.
-Buildroot sourcery-arm:
-
-icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
-   IFA_F_NOPREFIXROUTE);
-
-Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
-system we still support is Cent0S 7 with 3.10 kernel.
-
-NOTE: Cent0S 7 is obviously heavily patched thus it contains
-IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream-Status: Submitted [https://lore.kernel.org/ltp/20210930183058.5240-4-petr.vorel@gmail.com/T/#u]
----
- include/lapi/if_addr.h            | 3 +++
- testcases/cve/icmp_rate_limit01.c | 3 ++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
-index 4e50a0a4e..0f7e44784 100644
---- a/include/lapi/if_addr.h
-+++ b/include/lapi/if_addr.h
-@@ -12,5 +12,8 @@
- # define IFA_FLAGS 8
- #endif
-
-+#ifndef IFA_F_NOPREFIXROUTE
-+# define IFA_F_NOPREFIXROUTE	0x200
-+#endif
-
- #endif /* LAPI_IF_ADDR_H__ */
-diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
-index b3a237b30..3ada32675 100644
---- a/testcases/cve/icmp_rate_limit01.c
-+++ b/testcases/cve/icmp_rate_limit01.c
-@@ -27,11 +27,12 @@
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
--#include <linux/if_addr.h>
- #include <linux/errqueue.h>
-
- #include <sched.h>
- #include <limits.h>
-+
-+#include "lapi/if_addr.h"
- #include "tst_test.h"
- #include "tst_netdevice.h"
-
---
-2.33.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20210927.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
similarity index 94%
rename from meta/recipes-extended/ltp/ltp_20210927.bb
rename to meta/recipes-extended/ltp/ltp_20220121.bb
index b5dfd8bb69..bf567c6fb8 100644
--- a/meta/recipes-extended/ltp/ltp_20210927.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -22,14 +22,11 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "12beeda351b5d758a729aaf695b836ccc9eb5304"
+SRCREV = "b0561ad8d9ee9fe1244b5385e941eb65a21e91a1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0002-lib-fix-MemAvailable-parsing.patch \
-           file://0003-lapi-rtnetlink.h-Fix-include-guards.patch \
-           file://0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch \
-           file://0005-lapi-if_addr.h-Define-IFA_FLAGS.patch \
+           file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -47,6 +44,10 @@ EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
+do_compile() {
+    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}"
+}
+
 do_install(){
     install -d ${D}${prefix}/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install include-install
-- 
2.20.1


