Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web11.958.1625021597875477548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 19:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qE4+gDVP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625021595; i=@fujitsu.com;
	bh=WgEdg9UILqwXLkQbLJkMpCdAy07T6Kb0+lFo7eiurzY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qE4+gDVPWANqJQMkG3vhk0joFhoDCJ1qoRASDE9vG93jjkUUw4wKs/eFjPIZ3tXU6
	 YP7wqYWm3PaF3QAhogEY17n7y/p6zFdc0uOKtsXaB8UYKGEua+CuKeXhfP76zhWygD
	 Zu2LJBMRSS8lao+HtSh0WH2yUP/QzBNnnlfhh+4ckYpwcT3vV+qzeezTgqsiis67XU
	 WPjch7QjiWeLVAgCQEDv/zs6PrfFb6pvQiaZF9QvmllBOXYrhRI851Im0wUY96ijjV
	 u2GjriVkUc8xOSqB1YxETzMuWXJr1CQsaxeE+UkfZl1lQ2wJRQ6ljU5tNnJC0qVytW
	 DoN0zTCRe5M9A==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 0D/00-62504-B9CDBD06; Wed, 30 Jun 2021 02:53:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxRXfWnds
  JBo9mWFrc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnXLt5kK3grU/H3wAqWBsatkl2MXBxCArOY
  JN7N+8gC4exhlHj6eBZTFyMnB5uArsS5x2vZuxg5OEQE9CSu/hMFCQsLWElMm/qIDSTMIqAqs
  Xm1HUiYV8BDYtmF1cwgtoSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvnjBDNIqIaAoMXu6PER5hc
  SMGdvYJjDyzELSMQtJxwJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlha6RoameolVukl6qaW
  65anFJbqGeonlxXrFlbnJOSl6eaklmxiBIZRScOz6Dsarrz/oHWKU5GBSEuWdcuN2ghBfUn5K
  ZUZicUZ8UWlOavEhRhkODiUJ3kaQnGBRanpqRVpmDjCcYdISHDxKIryPbwGleYsLEnOLM9MhU
  qcYdTne/Vy8iFmIJS8/L1VKnNcWpEgApCijNA9uBCy2LjHKSgnzMjIwMAjxFKQW5WaWoMq/Yh
  TnYFQS5vUBuYQnM68EbtMroCOYgI5Y9OQmyBEliQgpqQamvmd/4k2fL23icDtYNGFxbGvLksN
  HZVQkhcT4Z398/oY/XfF2a/7f72KhSx164wOYGGQMN7PHHGmvZso1X2Q44+PpOf8MNybu4t2d
  nSi8Y55E4DZFr8B5u+rTDLb/SO5wbnOc90GDV+fVwrrOEwxXXGsW73JbtJNB7qKPyOXdCrYeQ
  uabb6gKn1slk9MRu3rK+2CdRX9qalayfFteW31ZK7sj+cGkyU8D2sM4y435Eo7t//Xg7q8d3y
  X/HrC5fiRrf8ARh6QVWSfVVSrqjfkz/X+uyM/SWdYonWT7y3RtQPinzL78tJdFXb86DTcv8ji
  s66I4j++l/XU2r4tntF3ZDtU/n7SxME/ElSFyap8SS3FGoqEWc1FxIgB55pPoKAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-285.messagelabs.com!1625021594!93609!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26976 invoked from network); 30 Jun 2021 02:53:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Jun 2021 02:53:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15U2rEPS025685
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 03:53:14 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 30 Jun 2021 03:53:13 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3: upgrade 3.9.5 -> 3.9.6
Date: Wed, 30 Jun 2021 10:53:04 +0800
Message-ID: <1625021584-64945-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
removed since it is included in 3.9.6

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...sue36464-parallel-build-race-problem.patch | 33 -------------------
 .../{python3_3.9.5.bb => python3_3.9.6.bb}    |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
 rename meta/recipes-devtools/python/{python3_3.9.5.bb => python3_3.9.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
deleted file mode 100644
index 9ed03858d4..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 8 May 2019 16:10:29 +0800
-Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
-
-When using make -j with the 'install' target, it's possible for altbininstall
-(which normally creates BINDIR) and libainstall (which doesn't, though it
-installs python-config there) to race, resulting in a failure due to
-attempting to install python-config into a nonexistent BINDIR. Ensure it also
-exists in the libainstall target.
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/a25c46bd7dd47a2f95b32d17ee2f66de214892c6]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile.pre.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 15f3687..7e9f173 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1456,7 +1456,7 @@ LIBPL=		@LIBPL@
- LIBPC=		$(LIBDIR)/pkgconfig
- 
- libainstall:	@DEF_MAKE_RULE@ python-config
--	@for i in $(LIBDIR) $(LIBPL) $(LIBPC); \
-+	@for i in $(LIBDIR) $(LIBPL) $(LIBPC) $(BINDIR); \
- 	do \
- 		if test ! -d $(DESTDIR)$$i; then \
- 			echo "Creating directory $$i"; \
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.9.5.bb
rename to meta/recipes-devtools/python/python3_3.9.6.bb
index 503f810fae..af7ed208b9 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -20,7 +20,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            file://crosspythonpath.patch \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
@@ -39,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83"
+SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

