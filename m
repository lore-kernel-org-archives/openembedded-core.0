Return-Path: <naresh.kamboju@linaro.org>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id E84DD78D85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 05:32:08 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id c22-v6so11064093pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7cyVgkTcCQ1qibf4h3Ygzgk3mrDVchhcLwOFqdm5FeA=;
	b=QSkH4hQ6y8U1k2Z0yogRLS1Kh8Zwn2bceorFi16k15/EFpv+BtQXAvTo6fR3+0jEe5
	dGMJxCaxJZcz50KVtj1hoCVvwu61kmZ0YpMZGmIphJyNuZbXpLKRtwKNnme7imypPx9p
	V0On+QY55c5ubq43gNmk7Y5qdAXtM/YoGUPYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7cyVgkTcCQ1qibf4h3Ygzgk3mrDVchhcLwOFqdm5FeA=;
	b=Sm+Qa521VKEtXOTTE2pFhIPM5jebe8ddqqnz1WWIUf1PQA89sApKus5CnPvX78a4vP
	aQ9dlh8BlIW91d6kfQty9OztuOiKbnxxarCmmOiK0GLWIcQ/XUgKBp5yghzyDj6ByUT/
	c2tTlYx+DZs3LDALHhbYBbnzGxah4nMA7+NjPHSJU5u19fPdgkEjK8H5t4iXRj6CA6Ew
	XK5m4JP9g4QuoRYtuPYOL/0bol0nHcKjonsPZWSVT20U2pZvEggyrZzBZXvuugKHOUHZ
	GSztZ4WlCcNF3xNlABI5wVF5CPMqkRU786HDh4CCk2QdKJs1tIFF/nGham6jZaxaoc7N
	6klA==
X-Gm-Message-State: APt69E2YrMZVf/8ViZmquQbkOoBnvOnlgZYvL94cMGePAlTuO15gMIh4
	55OR1SQGYCqWqB7WdL03KywYXy3L49Y=
X-Google-Smtp-Source: ADUXVKKnUNwVenfN14636hmTllpYdJcG1oSwtOxId1pSXbjU0vJo1rgP80rujBea944hXZMabYEM4w==
X-Received: by 2002:a62:9c9c:: with SMTP id
	u28-v6mr2315983pfk.90.1528781529421; 
	Mon, 11 Jun 2018 22:32:09 -0700 (PDT)
Received: from localhost.localdomain ([183.82.210.238])
	by smtp.gmail.com with ESMTPSA id
	r20-v6sm186722pgu.25.2018.06.11.22.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jun 2018 22:32:08 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 11:02:03 +0530
Message-Id: <1528781523-25424-1-git-send-email-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] ltp: fix cve-2017-5669 test case
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
X-List-Received-Date: Tue, 12 Jun 2018 05:32:09 -0000

Adding cve-2017-5669 test fix patch which is accepted upstream in LTP repo.

Ref:
cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has to fail with REMAPs
https://github.com/linux-test-project/ltp/pull/324

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 ...69-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch | 95 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
new file mode 100644
index 0000000..c8498d9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
@@ -0,0 +1,95 @@
+From b767b73ef027ba8d35f297c7d3659265ac80425b Mon Sep 17 00:00:00 2001
+From: Rafael David Tinoco <rafael.tinoco@canonical.com>
+Date: Wed, 30 May 2018 09:14:34 -0300
+Subject: [PATCH] cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has
+ to fail with REMAPs
+
+Fixes: https://github.com/linux-test-project/ltp/issues/319
+
+According to upstream thread (https://lkml.org/lkml/2018/5/28/2056),
+cve-2017-5669 needs to address the "new" way of handling nil addresses
+for shmat() when used with MAP_FIXED or SHM_REMAP flags.
+
+- mapping nil-page is OK on lower addresses with MAP_FIXED (or else X11 is broken)
+- mapping nil-page is NOT OK with SHM_REMAP on lower addresses
+
+Addresses Davidlohr Bueso's comments/changes:
+
+commit 8f89c007b6de
+Author: Davidlohr Bueso <dave@stgolabs.net>
+Date:   Fri May 25 14:47:30 2018 -0700
+
+    ipc/shm: fix shmat() nil address after round-down when remapping
+
+commit a73ab244f0da
+Author: Davidlohr Bueso <dave@stgolabs.net>
+Date:   Fri May 25 14:47:27 2018 -0700
+
+    Revert "ipc/shm: Fix shmat mmap nil-page protection"
+
+For previously test, and now broken, made based on:
+
+commit 95e91b831f87
+Author: Davidlohr Bueso <dave@stgolabs.net>
+Date:   Mon Feb 27 14:28:24 2017 -0800
+
+    ipc/shm: Fix shmat mmap nil-page protection
+
+Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
+Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
+Reviewed-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/pull/324]
+---
+ testcases/cve/cve-2017-5669.c | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/cve/cve-2017-5669.c b/testcases/cve/cve-2017-5669.c
+index 1ca5983..0834626 100644
+--- a/testcases/cve/cve-2017-5669.c
++++ b/testcases/cve/cve-2017-5669.c
+@@ -28,7 +28,20 @@
+  * is just to see if we get an access error or some other unexpected behaviour.
+  *
+  * See commit 95e91b831f (ipc/shm: Fix shmat mmap nil-page protection)
++ *
++ * The commit above disallowed SHM_RND maps to zero (and rounded) entirely and
++ * that broke userland for cases like Xorg. New behavior disallows REMAPs to
++ * lower addresses (0<=PAGESIZE).
++ *
++ * See commit a73ab244f0da (Revert "ipc/shm: Fix shmat mmap nil-page protect...)
++ * See commit 8f89c007b6de (ipc/shm: fix shmat() nil address after round-dow...)
++ * See https://github.com/linux-test-project/ltp/issues/319
++ *
++ * This test needs root permissions or else security_mmap_addr(), from
++ * get_unmapped_area(), will cause permission errors when trying to mmap lower
++ * addresses.
+  */
++
+ #include <sys/types.h>
+ #include <sys/ipc.h>
+ #include <sys/shm.h>
+@@ -60,7 +73,11 @@ static void cleanup(void)
+ static void run(void)
+ {
+ 	tst_res(TINFO, "Attempting to attach shared memory to null page");
+-	shm_addr = shmat(shm_id, ((void *)1), SHM_RND);
++	/*
++	 * shmat() for 0 (or < PAGESIZE with RND flag) has to fail with REMAPs
++	 * https://github.com/linux-test-project/ltp/issues/319
++	 */
++	shm_addr = shmat(shm_id, ((void *)1), SHM_RND | SHM_REMAP);
+ 	if (shm_addr == (void *)-1) {
+ 		shm_addr = NULL;
+ 		if (errno == EINVAL) {
+@@ -89,6 +106,7 @@ static void run(void)
+ }
+ 
+ static struct tst_test test = {
++	.needs_root = 1,
+ 	.setup = setup,
+ 	.cleanup = cleanup,
+ 	.test_all = run,
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index b07c1b9..48739f1 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
+           file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


