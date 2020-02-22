Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 037D560AD8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 22:09:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c9so5990868wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqqdG2AwK5q8mvTDoliwxXp4LHeGfdz3gm7eBSFaybc=;
	b=gUudx9mQesLrdsce101Ioy/ljJvpgf0MjtkBeTWzi8snOIy+3DL+dS2VgN/8ChHcIf
	GGIuljlMyqsuogLGTEZCZxImTx0Q1beNbTPthVYftQbQVjYaCs0glDLKt5p2JtrBpR66
	oYSlATsERTemCbquZWhmdD+w13p1fbk3VcNzwTl31swFEsIfrDz48286t1aXMZD9oh8K
	Sik4ntGuFKrBE8ba4xghszwzaTYYn/SdoRBIjWB5SO/87ZJOkTtXFORe4P2sSZzVXLn2
	V0+0zceKYmVQytDm5y4OXorSYetVBjxNNbQtESV7gc++etJJkfgeCMHf9WXRKEWlluzC
	Hsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqqdG2AwK5q8mvTDoliwxXp4LHeGfdz3gm7eBSFaybc=;
	b=uWU2xYsDv0D1bHLdru9neeVz4IRC/97Wue/t8j1m77qcRpP8ZmqrhDsuMQhnLAHJ7X
	u9U53f8JbmM+urJ3JHqwhioLdm4sYxs8AhvHASeBkM56FkEXPEczJaRSsLpwDmEhIB4U
	guaBEBCZaXXkOxF6XXsTKBTUcQklVknO9pq/6h95oL0q/tKaeLoQUJ7k94THvLYJ19BA
	FsdHygE/7J89uvfHnAJQiFCINm7hPpQgmrFvm02uUhZy91aWF9bqpBSDsRVoJlJEjkbQ
	pjXUZEx8csRAoE2cazSCUzYeReI92Tf2/plD8EhzC5CrWrjPilJFqJUeCQMUaNZVpQBS
	iItQ==
X-Gm-Message-State: APjAAAXq+AmFbBCAU4WoCmtl3+UqxDHwYWnrEpbUIkOB3440II4svf+/
	AskH7eHw+9esDUwbzuLtJHRu2JQu
X-Google-Smtp-Source: APXvYqzJ1niDW7bUdhCDjhlqKvThIlQFcYFEwuJjtc1cFh8jHOCgk/DmvfrNBtSOj6XkfWmM20j0nA==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr54168307wro.22.1582409371984; 
	Sat, 22 Feb 2020 14:09:31 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id e8sm3729734wrr.69.2020.02.22.14.09.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 14:09:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 23:09:06 +0100
Message-Id: <20200222220909.12019-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/4] valgrind: replace a submitted patch with one that was merged
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
X-List-Received-Date: Sat, 22 Feb 2020 22:09:32 -0000
Content-Transfer-Encoding: 8bit

This addresses a ptest failure in particular that the submitted
patch caused.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ad_detatch-call-portable-across-plat.patch | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
index 44d707a235..f407d8191b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
@@ -1,25 +1,31 @@
-From 90fdb0ae0418f7907f09b763343a457bdf6855fa Mon Sep 17 00:00:00 2001
+From 92fcf75d6d3903e45492b041bf4ad07787d2e58a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 27 Jan 2020 17:17:19 -0800
-Subject: [PATCH] tests: Make pthread_detatch call portable across platforms
+Date: Mon, 27 Jan 2020 19:50:04 -0800
+Subject: [PATCH] drd/tests/pth_detached3: Make pthread_detach() call portable
+ across platforms
 
-pthread_t is opaque type therefore we can not apply simple arithmetic to variables of pthread_t type
-this test needs to pass a invalid pthread_t handle, typcasting to uintptr_t works too and is portable
-across glibc and musl
+pthread_t is opaque type therefore we can not apply simple arithmetic to
+variables of pthread_t type this test needs to pass a invalid pthread_t
+handle, typcasting to uintptr_t works too and is portable across glibc and
+musl
 
 Fixes
 | pth_detached3.c:24:25: error: invalid use of undefined type 'struct __pthread'
 |    24 |   pthread_detach(thread + 8);
 |       |                         ^
 
-Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36910506/]
+[ bvanassche: reformatted patch description and fixed up line numbers ]
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=92fcf75d6d3903e45492b041bf4ad07787d2e58a]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- drd/tests/pth_detached3.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ drd/tests/pth_detached3.c           | 3 ++-
+ drd/tests/pth_detached3.stderr.exp1 | 4 ++--
+ drd/tests/pth_detached3.stderr.exp2 | 4 ++--
+ 3 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
-index c02eef11a..efeb15b72 100644
+index c02eef1..efeb15b 100644
 --- a/drd/tests/pth_detached3.c
 +++ b/drd/tests/pth_detached3.c
 @@ -4,6 +4,7 @@
@@ -39,6 +45,43 @@ index c02eef11a..efeb15b72 100644
  
    fprintf(stderr, "Finished.\n");
  
+diff --git a/drd/tests/pth_detached3.stderr.exp1 b/drd/tests/pth_detached3.stderr.exp1
+index 58412ec..8dd58ba 100644
+--- a/drd/tests/pth_detached3.stderr.exp1
++++ b/drd/tests/pth_detached3.stderr.exp1
+@@ -1,11 +1,11 @@
+ 
+ pthread_detach(): invalid thread ID 0x........
+    at 0x........: pthread_detach (drd_pthread_intercepts.c:?)
+-   by 0x........: main (pth_detached3.c:21)
++   by 0x........: main (pth_detached3.c:22)
+ 
+ pthread_detach(): invalid thread ID 0x........
+    at 0x........: pthread_detach (drd_pthread_intercepts.c:?)
+-   by 0x........: main (pth_detached3.c:24)
++   by 0x........: main (pth_detached3.c:25)
+ 
+ Finished.
+ 
+diff --git a/drd/tests/pth_detached3.stderr.exp2 b/drd/tests/pth_detached3.stderr.exp2
+index bdc5cf8..e82dee1 100644
+--- a/drd/tests/pth_detached3.stderr.exp2
++++ b/drd/tests/pth_detached3.stderr.exp2
+@@ -2,12 +2,12 @@
+ pthread_detach(): invalid thread ID 0x........
+    at 0x........: vgDrd_set_joinable (drd_pthread_intercepts.c:?)
+    by 0x........: pthread_detach (drd_pthread_intercepts.c:?)
+-   by 0x........: main (pth_detached3.c:21)
++   by 0x........: main (pth_detached3.c:22)
+ 
+ pthread_detach(): invalid thread ID 0x........
+    at 0x........: vgDrd_set_joinable (drd_pthread_intercepts.c:?)
+    by 0x........: pthread_detach (drd_pthread_intercepts.c:?)
+-   by 0x........: main (pth_detached3.c:24)
++   by 0x........: main (pth_detached3.c:25)
+ 
+ Finished.
+ 
 -- 
-2.25.0
+2.9.3
 
-- 
2.25.0


