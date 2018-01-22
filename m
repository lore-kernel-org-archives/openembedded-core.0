Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1729C6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 00:13:08 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 23so5749631pfp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=t5sDHkQhqjCggkim1Flmz+5DXkSpogG7c3IS1Edxlck=;
	b=ICeRK8jKJ2bjMG5dwxsVFAw2X8owEScOGfLCMDTuuvKnxuuQ2QJlHPwZuEYP/i2ZhV
	soQvtxiuSyBVnPMpJSAF1l7ur9UEOzRmXIuX9SDfuDBjkc/AxCFn/7WclsltRsEJrQJ+
	B/waZYAJK1LhOTNJiRAR9QC1vtTbvhZfqRMfuoFJN3ybj0Z6xjE2MMDgHcVSnBnJBosH
	QJV6wlVMuewNwhnL10Ur+cwhOgfKNqxBF1S0WqyLidyDke6mL1OOKfHOuLDNATyVahfc
	ybqYGd2QQIWQyyzQ/RW9sh/EXgUqgdjvAU99vEQFCf2McWJfdUaEhscm64+cGZGk970p
	XeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t5sDHkQhqjCggkim1Flmz+5DXkSpogG7c3IS1Edxlck=;
	b=a3t6o6MwZxp/oNxEn4kyMJnH1otbnmkmAWL3FNo+picXyEE0nmNQdnJRy6mhJAMZ/6
	4SftbX6WHf92gI8m2+IjTCfkYFIcBi727sszHF4l4N13h2632FJPlPLVKroaHXLhwamU
	Gy8JBy7XpW3btoI6zUtJyQQnwufLt3szi76PB8PrG9kQk/7l9JPlGYC0f8TEJA3ZedJa
	rdoy4znZjG+MtsqDnh5nE3fOJBqe6F5UfUY9QYlmHXgW5xlS1LVJqwRabtxXI+MfpLyD
	nq5/7yuc1BuDhFCc6FREfxSyjX/wx+ROa+k/ItKXB1Nh/c2Wq+UEYjZDLkX2acm5gAf6
	T9JQ==
X-Gm-Message-State: AKwxyteAXxGOl0bEZls/hKfD1rnemvL8eX3qYqEDZO/oFirsGYKZlWRd
	hsdyY7G2eQleA0RH3Hxp6g9ayw==
X-Google-Smtp-Source: AH8x227I8H6km5BEKyQmvuiCS6NYv2dV+9Nc12aCcIwZsJE6xSzGdEhX/flcZ1TT4Pn4XY89YrPJRw==
X-Received: by 2002:a17:902:208:: with SMTP id
	8-v6mr2522673plc.359.1516579989703; 
	Sun, 21 Jan 2018 16:13:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	p68sm8043142pfp.30.2018.01.21.16.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 16:13:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun, 21 Jan 2018 16:13:06 -0800
Message-Id: <1516579986-8581-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V3][PATCH] glibc: Security Fix CVE-2017-17426
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
X-List-Received-Date: Mon, 22 Jan 2018 00:13:09 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Affects glibc < 2.27 including current master
hash 77f921dac17c5fa99bd9e926d926c327982895f7

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

[v2]
Rebased on new master

[v3]
Fix typo in patch status

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch b/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
new file mode 100644
index 0000000..bfa58bc
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
+Upstream-Status: Backport
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


