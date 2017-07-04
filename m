Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF7877E99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 03:36:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v643aPge010977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jul 2017 20:36:25 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Jul 2017 20:36:24 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jul 2017 23:36:21 -0400
Message-ID: <aec76af1a888728cbbf53e3274af9966079336e7.1499139296.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1499139296.git.dengke.du@windriver.com>
References: <cover.1499139296.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: Reduce local Pending patches
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
X-List-Received-Date: Tue, 04 Jul 2017 03:36:28 -0000
Content-Type: text/plain

Rebase the patch on latest ltp upstream:

    0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch

[Yocto #11548]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...TH_MAX-undeclared-when-building-with-musl.patch | 15 +++++++-------
 ...RDSIZE-undeclared-when-building-with-musl.patch | 23 +++++++++++-----------
 ...ition-of-struct-msgbuf-error-building-wit.patch |  9 +++++----
 3 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
index 8874b95..020ddfe 100644
--- a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
+++ b/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
@@ -1,22 +1,23 @@
-From 32644bde4d33b677614534ec37030e57883b8e15 Mon Sep 17 00:00:00 2001
+From b906ec2fe4711a727e198cd9259287c042eef8e2 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Thu, 9 Feb 2017 16:41:12 +0800
-Subject: [PATCH 1/3] fix PATH_MAX undeclared when building with musl
+Subject: [PATCH] fix PATH_MAX undeclared when building with musl
 
 fix PATH_MAX undeclared when building with musl.
 
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/176]
+
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
-Upstream-Status: Pending
 ---
  include/tst_test.h | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/include/tst_test.h b/include/tst_test.h
-index 7ff33b2..9779c0e 100644
+index 335c82684..4dfa1511b 100644
 --- a/include/tst_test.h
 +++ b/include/tst_test.h
-@@ -19,6 +19,9 @@
- #define TST_TEST_H__
+@@ -23,6 +23,9 @@
+ #endif /* __TEST_H__ */
  
  #include <unistd.h>
 +#ifndef __GLIBC__
@@ -26,5 +27,5 @@ index 7ff33b2..9779c0e 100644
  #include "tst_common.h"
  #include "tst_res_flags.h"
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
index 8d0e739..2f4ca63 100644
--- a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
+++ b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
@@ -1,30 +1,31 @@
-From a2639bd0f0d3f9f3049ee33e6710fed06225f54f Mon Sep 17 00:00:00 2001
+From d1a27570457fb6e1d6bafe81bfa0f3507b137e32 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Thu, 9 Feb 2017 18:20:58 +0800
-Subject: [PATCH 1/2] fix __WORDSIZE undeclared when building with musl
+Subject: [PATCH] fix __WORDSIZE undeclared when building with musl
 
 fix __WORDSIZE undeclared when building with musl.
 
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/177]
+
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
-Upstream-Status: Pending
 ---
  include/old/test.h | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/include/old/test.h b/include/old/test.h
-index d492560..263e92e 100644
+index b36764d83..cc6f1b551 100644
 --- a/include/old/test.h
 +++ b/include/old/test.h
-@@ -58,6 +58,9 @@
- #include "tst_clone.h"
- #include "old_device.h"
- #include "old_tmpdir.h"
+@@ -44,6 +44,9 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <stdint.h>
 +#ifndef __GLIBC__
 +#include <bits/reg.h>
 +#endif
  
- /*
-  * Ensure that NUMSIGS is defined.
+ #include "usctest.h"
+ 
 -- 
-2.7.4
+2.11.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch b/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
index 6886c55..dd7d283 100644
--- a/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
+++ b/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
@@ -1,18 +1,19 @@
-From 2d7ea67e8eaa41cbd6816f7ab654254b40b530a1 Mon Sep 17 00:00:00 2001
+From bf5dd2932200e0199a38f3028d3bef2253f32e38 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Thu, 9 Feb 2017 17:17:37 +0800
 Subject: [PATCH] fix redefinition of 'struct msgbuf' error building with musl
 
 When building with musl the file "sys/msg.h" already contain 'struct msgbuf'
 
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/177]
+
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
-Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
-index a757c0d..e023114 100644
+index a757c0d18..e023114d2 100644
 --- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
 +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
 @@ -47,11 +47,13 @@ const char *TCID = "msgrcv08";
@@ -31,5 +32,5 @@ index a757c0d..e023114 100644
  static void msr(int msqid)
  {
 -- 
-2.7.4
+2.11.0
 
-- 
2.8.1


