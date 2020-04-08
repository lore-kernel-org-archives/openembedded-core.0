Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4036.1586311321587231098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 19:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 038220c0019091
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2020 19:02:00 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 19:02:00 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysklogd: update the patch
Date: Wed, 8 Apr 2020 10:01:58 +0800
Message-ID: <1586311318-440757-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-one-rarely-reproduced-parallel-build-problem.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch b/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
index 334577a..97bf6ae 100644
--- a/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
+++ b/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
@@ -27,14 +27,14 @@ index 993dbfd..06b706d 100644
  libsyslog_la_LIBADD   = $(LTLIBOBJS)
 +
 +# Both libsyslog_la and syslogd/logger requires objects like lib/pidfile.o, for
-+# # libsyslog_la, the objects should be compiled with -fPIC, but for
-+# # syslogd/logger, it doesn't need -fPIC, so there is a race issue when the two
-+# # different lib/pidfile.o are compiled at the same time, which would cause errors like:
-+# # ld: syslogd-syslogd.o: in function `main':
-+# # syslogd.c:417: undefined reference to `__pidfile'
-+# #
-+# # Make LIBOBJS depend on LTLIBOBJS to fix the problem.
-+# $(LIBOBJS): $(LTLIBOBJS)
++# libsyslog_la, the objects should be compiled with -fPIC, but for
++# syslogd/logger, it doesn't need -fPIC, so there is a race issue when the two
++# different lib/pidfile.o are compiled at the same time, which would cause errors like:
++# ld: syslogd-syslogd.o: in function `main':
++# syslogd.c:417: undefined reference to `__pidfile'
++#
++# Make LIBOBJS depend on LTLIBOBJS to fix the problem.
++$(LIBOBJS): $(LTLIBOBJS)
 -- 
 2.7.4
 
-- 
2.7.4

