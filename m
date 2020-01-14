Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 835477FC39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p17so13871943wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MzapD0noAtsxJYepW6jF1hpokMlGHmgshfjrtpLzG7M=;
	b=bDcVZnpV/Kq22+ZKJpSZomB3sl9PMEGxSqSLJadT1lyMPaIgr3k2NknVKAppO/Szc7
	Nj1qK1WDd6rm87gBtkBEBB3RPidNoyUIVYQz3XBdakdGry60tDG+BWkaTEVKEg31o7RE
	ka8Sb4tilbu/3nUhUTv3cSu8G6QufOcaTh1ceztNebNHClQqsL+aAAZkD4z3t1QKzAau
	LHtpvmpGOdkxW9tCYN3WthSIocVo8urzWX8dTrLtomUo6jDV8lyMkHs+iITz0AjjvFJ5
	7o29F6BU6hmKb/KKJQIdH6gagB/N7+LcQ3DyBa3+V/8RpzrERFyRcZMzvHB31Gs8FBh6
	DpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MzapD0noAtsxJYepW6jF1hpokMlGHmgshfjrtpLzG7M=;
	b=pusZq5r6G+HlzBjQlRYL/Q/15ffIhYGeU4SPF/+Y0XMJJOCli+rRyvHaeoFEAgglUE
	YkKsNNbu/+4OwYPAVBmo/7dTS6z5XI9TFqQdrZdEXx+74Snc4aicNN7WR5QUJJkwdQqj
	0ET/KgZeuGSnxnyijC/NNGIl5elBEuUpP+B+NrAT4WEF4jHEU1l8kmLl6mMpaQdlucIE
	HGhBFFhSL1kpON379pKC0Ue92N3s/eZf8x89nh4mTJNkMFzF6hpI7kJ2XT2ymzVxtof7
	jyeDY9LTVeP7uy9ox+lCWTISN46SFiLiNSZqszKk89Xr8V8uVsmcc6EPv3C2NYTbepfY
	RbeQ==
X-Gm-Message-State: APjAAAXGnWW9o85szhvp/DQz8UIEIEgYKcc52XND3SHrGwR+3fMwoHdj
	i9AmqyycH3HgqjhjxpjLcjPovprE
X-Google-Smtp-Source: APXvYqwWEQT/JLfnIcH/H64RDnhUuQLrI1R7oNqmaUb5joVOPzZFV64VDZiX89K8psZnL/5dB5StuQ==
X-Received: by 2002:a1c:1b41:: with SMTP id b62mr26634523wmb.53.1579010427065; 
	Tue, 14 Jan 2020 06:00:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:02 +0100
Message-Id: <20200114140007.36622-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/20] libevent: disable ptests that require a DNS and an intenet connection
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ....c-patch-out-tests-that-require-a-wo.patch | 37 +++++++++++++++++++
 .../libevent/libevent_2.1.11.bb               | 10 ++---
 2 files changed, 42 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch

diff --git a/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
new file mode 100644
index 00000000000..505153d285e
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
@@ -0,0 +1,37 @@
+From 7c17967b8fd2d18b74a8934fd9bb8212ebd6a271 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Jan 2020 13:22:46 +0100
+Subject: [PATCH] test/regress_dns.c: patch out tests that require a working
+ DNS
+
+This is not guaranteed for ptests under qemu, and in the absence
+of a DNS that can reach to the internet, these tests fail.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ test/regress_dns.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/test/regress_dns.c b/test/regress_dns.c
+index d2084b7..a1a8f3b 100644
+--- a/test/regress_dns.c
++++ b/test/regress_dns.c
+@@ -2394,8 +2394,6 @@ struct testcase_t dns_testcases[] = {
+ 	{ "reissue_disable_when_inactive", dns_reissue_disable_when_inactive_test,
+ 	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
+ 	{ "inflight", dns_inflight_test, TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
+-	{ "bufferevent_connect_hostname", test_bufferevent_connect_hostname,
+-	  TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
+ #ifdef EVENT__HAVE_SETRLIMIT
+ 	{ "bufferevent_connect_hostname_emfile", test_bufferevent_connect_hostname,
+ 	  TT_FORK|TT_NEED_BASE, &basic_setup, (char*)"emfile" },
+@@ -2405,8 +2403,6 @@ struct testcase_t dns_testcases[] = {
+ 	{ "disable_when_inactive_no_ns", dns_disable_when_inactive_no_ns_test,
+ 	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
+ 
+-	{ "initialize_nameservers", dns_initialize_nameservers_test,
+-	  TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
+ #ifndef _WIN32
+ 	{ "nameservers_no_default", dns_nameservers_no_default_test,
+ 	  TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index 8c7c49e7ddd..fb186eb89f3 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -6,11 +6,11 @@ SECTION = "libs"
 LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 
-SRC_URI = " \
-    https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
-    file://Makefile-missing-test-dir.patch \
-    file://run-ptest \
-"
+SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
+           file://Makefile-missing-test-dir.patch \
+           file://run-ptest \
+           file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
+           "
 
 SRC_URI[md5sum] = "7f35cfe69b82d879111ec0d7b7b1c531"
 SRC_URI[sha256sum] = "a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d"
-- 
2.17.1


