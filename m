Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6781671B23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:47:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f201so80671589oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LOf5DMPzYofPwkNDHX8DlRQ/9hhoXrdnZGHL2u/HZkQ=;
	b=M1Dgyzr+E6nYZtHvQqquoLUtZnG1PUr4V/9eVJLkyCHV5Ucg7iU8rkwFBfgI0ib076
	5NYl4UQLCWXUnqaWYw3yoooRmFH99DCbhvHQas4OrYLYe843NKqqRbN4g7vb33wcILGg
	RNHTdjtgCeeFEOSlQerDH8NpFJzejZp6oa9jNibsZc/UjiwMr4NZH8qbPm7JTn8EsezB
	H9lC3pH0kuKrZMVz+AIWj9Mfx6K73ZZk6Bp3cgCI5/2aRwZKhCxLdRYjgDrxy95YOrPy
	NVpAkoxhw5oChMoud39g6g4qtZC4qa8n9y9t4Srz7Jnf2MiHJzPMH8LAnDGDvgRwX23P
	rvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LOf5DMPzYofPwkNDHX8DlRQ/9hhoXrdnZGHL2u/HZkQ=;
	b=qgotIXGCWA6qDRBpRo6iMFRLMf2u77+OAkeoso282hxixThiSVBlquKszolzt8wLir
	Qrm+LOWGTNoaEPZH2j7e7wE3rPZY9tcuNdL9pndaaPxZdwrx1OFiMGujVIGKrmVsCtxw
	RmGORvteFZQA4aY+YP9eH8ik+ijBuIw+CJm5lQ6NEdGZyjnk4bPMmdlLl3bfmuzkX0z0
	6mIVUFiVhIYIKd8yurzcPzHQg1pBx/zFsbbJ91PsU//MG/Ybnx/e4uJiLT8LhArEQ/T1
	+qGHWOerf35/cxJVvMuKwB6l77A9VC559zuPM1Re9bC1qLnwy7Sb23BYiCJOi+wG8cyd
	3Qqw==
X-Gm-Message-State: AIkVDXKSKPVRaMG9TIj+47Wq2e6NSlXIsOfqhQiEIebrgzoloAClLXhtwIhgIkDjB3cnCw==
X-Received: by 10.202.85.77 with SMTP id j74mr32077050oib.108.1483645612277;
	Thu, 05 Jan 2017 11:46:52 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:51 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:26 -0700
Message-Id: <6364af8ded839f04a43040b47056e70da8b6463c.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 14/16] libunwind: apply a patch to fix x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:47:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

Apply patch to fix the X32 build from https://github.com/sjnewbury/x32

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../libunwind/libunwind/libunwind-1.1-x32.patch    | 31 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch

diff --git a/meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch b/meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
new file mode 100644
index 0000000..3251646
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
@@ -0,0 +1,31 @@
+From 506bd37bd580d7382d7c58257dac4b1e502a887c Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 09:50:34 -0700
+Subject: [PATCH] Fix for X32
+
+Apply patch to fix the X32 build from https://github.com/sjnewbury/x32.
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ src/x86_64/Gos-linux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/x86_64/Gos-linux.c b/src/x86_64/Gos-linux.c
+index 9e1acfc..8169d5a 100644
+--- a/src/x86_64/Gos-linux.c
++++ b/src/x86_64/Gos-linux.c
+@@ -143,8 +143,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
+ 
+   Debug (8, "resuming at ip=%llx via sigreturn(%p)\n",
+              (unsigned long long) c->dwarf.ip, sc);
+-  __asm__ __volatile__ ("mov %0, %%rsp;"
+-                        "mov %1, %%rax;"
++  __asm__ __volatile__ ("mov %q0, %%rsp;"
++                        "mov %q1, %%rax;"
+                         "syscall"
+                         :: "r"(sc), "i"(SYS_rt_sigreturn)
+                         : "memory");
+-- 
+2.8.0
+
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index 4249430..b637c5c 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-Fix-build-on-mips-musl.patch \
            file://0001-add-knobs-to-disable-enable-tests.patch \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
+           file://libunwind-1.1-x32.patch \
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
-- 
2.8.0


