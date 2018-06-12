Return-Path: <naresh.kamboju@linaro.org>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id B7BBB78DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 07:34:22 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id z9-v6so13860348plk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=OmNMXTikRRo1rTZnSsNRDB0tEIigeiBGiClMAz9ZsgM=;
	b=Zh71LEstDXMIM9GGAN+HBPxWR5s5MLgkys1rCMswFiazUR8HzR25aodpiqKRzQDt/N
	llbBa4l9WnaRQj9Ic41yYD8q4IO6DQhsKodz+y8P11YRzhE3ygsLjImbKTe2CEKYsBO2
	zP4xaEG9JK5m7xTW/JYshcPpEiaq/bvYgS1zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OmNMXTikRRo1rTZnSsNRDB0tEIigeiBGiClMAz9ZsgM=;
	b=CgX/rg8+SWQ5+yeSNXoFoPicyHKwcV91rPyXOJuZoJZpCxgxQjLRd6G3/Any7N2bk2
	Nq2GXU3GO2AQb5Grr6SYkxj5T6mOsHt+Hgya64hbTBRKw69wETNfkJ/TzYhrgIWWa2Dv
	YQJAg0ydtnt6JZ2vxYFAVOfZlhxy3xuF/L8BxAnhBAYa9+x3Oft5TdjwESYF3h+Tbpyg
	ITp3ZHYwPetlauTmt4OrRcZIrRLCM9+OzfINexVpqQSdZD052j5P7VSlVPt/6OEZwqGX
	ROyEMMiU8hXRHnqvUm58vmQ+0N6QYqLBb2B6WPuE7mWZcknR1lmZfOPv/oXK20ieTYh2
	FPPQ==
X-Gm-Message-State: APt69E13OwdOvpt1nszyCxvbHqa67tDFiEDTSwqk5SOANxtF193lFmRl
	vi+Dj+zfqiRFS4/9GAsgMxOqypgojZc=
X-Google-Smtp-Source: ADUXVKLx6zvi+71FKGfXKrEzCqkKeTohdbAKLRPcDbOsXuKaiTEG9+FPEc3Tsa02vM/eaEEUfYAoQA==
X-Received: by 2002:a17:902:44a4:: with SMTP id
	l33-v6mr2810507pld.134.1528788863214; 
	Tue, 12 Jun 2018 00:34:23 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:6487:b39:1483:44d3:2d1f:ed8b])
	by smtp.gmail.com with ESMTPSA id
	c17-v6sm520208pgw.11.2018.06.12.00.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jun 2018 00:34:21 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 13:04:14 +0530
Message-Id: <1528788854-29279-1-git-send-email-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] ltp: fix cve-2017-5669 test case
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
X-List-Received-Date: Tue, 12 Jun 2018 07:34:22 -0000

Adding cve-2017-5669 test fix patch which is accepted upstream in LTP repo.

Ref:
cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has to fail with REMAPs
https://github.com/linux-test-project/ltp/pull/324

Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/pull/324]
CVE: cve-2017-5669
Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 ...69-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch | 97 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
new file mode 100644
index 0000000..2a47785
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
@@ -0,0 +1,97 @@
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
+CVE: cve-2017-5669
+Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
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


