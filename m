Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF1D787CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 18:00:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k68so5286190pga.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qou7dv95xeeiAszny1ve0NAxHAx07Z0KQ1ds/BZn7hA=;
	b=OwiM084CbJ3I6N2FaWZtLXHV3lab1p5YCHR2aLo/e2VujNxuiZOuT+Rwz2+vGjLYoj
	2KbMABYvhSLJ4zLJ5t95Q7Dgf7iTMeUPxbsbkGfLkv34pwxPif/5gvAMIFyz/WdzYihB
	Q6F0m4Tqyd4Tp+Iw7LF8150siiu9znK6OMk4mlOjxNMMIrDQD9TcRCtbB9qA38OiYBaH
	eIvL8ZSZ0fr08B2heeC5XXl33bOtFp5P6mfDvHiKhC/aT/8TKcpEX6tEGH8xdxXIMEfS
	Ln0nLdrQJgt14FXAxrmlAbskE0kYMASmikXy9TDPeYycHSFQPhwqWuAlNg6joGE9UMbc
	516A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qou7dv95xeeiAszny1ve0NAxHAx07Z0KQ1ds/BZn7hA=;
	b=Y6A+aprrDXMooF+VKmFxbls7Zp7IAtxNT5ndOZurG1ThkkD14EhyonodszYQ3HVT2b
	PDQ5KVNCAUzxrJLSHNj5lIuHwyAY4Q1EQIgHB4rGjp40PlA1uTQeVxpF4g4MjTZgY1xW
	f+sRfNAMrXYzYg5ERujrwd2TuV+Pzd1sEFWLFCSKuyM02kWrOhwaTKkql6ISeVZxpXrY
	V4kYS1R3sFgeCQf0q7N8+tI0keZ2LbuAHUIXVOnSJA46Jfnu+ZUX3WFoDjLVafxQz2rj
	QZyFKkJg9vdgmPMEEYx+psue5mg6JH9zSLL7bQx6dOh+i0THfP2PnomhloUA9qgJJ4DT
	R7lA==
X-Gm-Message-State: AKwxytczqhvYvS+oDqD/ykq/IKYjiGsx1dtAMLvehwh8me74D1+3LtU+
	vmQB1Dhe2h8osGkh/3MlYEghPg==
X-Google-Smtp-Source: AH8x224Qx4eZ5Fw24LixNgwwvOtp2Q8F85yB1jNHnaG8N1EX3ThjKqXp9bInKXPl1WjkTF1OPtcyVQ==
X-Received: by 10.101.98.85 with SMTP id q21mr4877743pgv.298.1516557621812;
	Sun, 21 Jan 2018 10:00:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:a4cf:fc1a:2afa:5e49])
	by smtp.gmail.com with ESMTPSA id
	r24sm26530525pfg.51.2018.01.21.10.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 10:00:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 10:00:20 -0800
Message-Id: <1516557620-17190-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][PATCH] glibc: Security Fix CVE-2017-17426
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
X-List-Received-Date: Sun, 21 Jan 2018 18:00:20 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Affects glibc < 2.27 including current master
hash 77f921dac17c5fa99bd9e926d926c327982895f7

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

[v2]
Rebased on new master

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch b/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
new file mode 100644
index 0000000..fadaf70
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
@@ -0,0 +1,53 @@
+From 34697694e8a93b325b18f25f7dcded55d6baeaf6 Mon Sep 17 00:00:00 2001
+From: Arjun Shankar <arjun@redhat.com>
+Date: Thu, 30 Nov 2017 13:31:45 +0100
+Subject: [PATCH] Fix integer overflow in malloc when tcache is enabled [BZ
+ #22375]
+
+When the per-thread cache is enabled, __libc_malloc uses request2size (which
+does not perform an overflow check) to calculate the chunk size from the
+requested allocation size. This leads to an integer overflow causing malloc
+to incorrectly return the last successfully allocated block when called with
+a very large size argument (close to SIZE_MAX).
+
+This commit uses checked_request2size instead, removing the overflow.
+
+Upstream-Statsu: Backport
+CVE: CVE-2017-17426
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Rebase on new master
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog       | 6 ++++++
+ malloc/malloc.c | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+Index: git/malloc/malloc.c
+===================================================================
+--- git.orig/malloc/malloc.c
++++ git/malloc/malloc.c
+@@ -3064,7 +3064,8 @@ __libc_malloc (size_t bytes)
+     return (*hook)(bytes, RETURN_ADDRESS (0));
+ #if USE_TCACHE
+   /* int_free also calls request2size, be careful to not pad twice.  */
+-  size_t tbytes = request2size (bytes);
++  size_t tbytes;
++  checked_request2size (bytes, tbytes);
+   size_t tc_idx = csize2tidx (tbytes);
+ 
+   MAYBE_INIT_TCACHE ();
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2017-11-30  Arjun Shankar  <arjun@redhat.com>
++
++       [BZ #22375]
++       * malloc/malloc.c (__libc_malloc): Use checked_request2size
++       instead of request2size.
++
+ 2017-12-30  Aurelien Jarno  <aurelien@aurel32.net>
+            Dmitry V. Levin  <ldv@altlinux.org>
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 456ce12..ff3197b 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
            file://CVE-2017-15671.patch \
            file://CVE-2017-16997.patch \
+           file://CVE-2017-17426.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


