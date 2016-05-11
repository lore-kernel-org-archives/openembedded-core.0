Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D99BC76312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so5033355pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=r+6fEI1BqBIjjjvmK39KFXCCyEXk3DZrtFnNbm1UjEE=;
	b=WU1gie26EinDT2TwP7SK1pTGc2zctjswLaxtPzNa4yzf1KAIYxNn7+CQdhF3V4Bx+G
	HDHKr9q/1Cpv/NnDiZutskTftTc1OXZqwj3pRuUghsZSIobJC7c1g3ZAV3BE/7ODnNXC
	NrM7Bu/wTO/uK0ZWHHkxOC+GHTM5GHZApJ8Dj5VS5dY8yscxAjddon6ch2CY0K1qf7Um
	u/gHscKDR4+rqaXAEoDaYRpxvvwHoViG0RX5SKcH1XBRKKcRxZ4/AuMvIh1lNCxwdbFl
	a5PSsxHm9pBFqX10uHiO3K9o2qzgucvA997s4cLYhFlmAka6Zsitirf8mUim3tLtT7En
	Xecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=r+6fEI1BqBIjjjvmK39KFXCCyEXk3DZrtFnNbm1UjEE=;
	b=lQObBnYPVIgm1XgfK1Qzx19okt08mZ8ApiVs0KP5yT71pHbaT25M1biTaoH1BFcVLp
	apKplNGiZCDUZ/xPsj5F/3KMpRhBJv/PJorunaB32dHNdKzT8tfC/l5u0/NR+9BVNPdP
	yItoXqBMFn+W/hBqWQL7GjyQL1ziU44RWV5rtoM9MsZLXVzOlF2URyB7NAN0uYJ69z6k
	6O0Ck91dgT8bLJWpsnuT8xqf1EEq2xCnsOTRs8G3pHiaToWSave0DAP00xYAF51Yyqx2
	j+/3Ag3qqxRWE+fr8fkg1L3TgL98sPe67ZH53Skj9YJCX/wGqiOjnU71HgajNrd+E0tz
	VLKA==
X-Gm-Message-State: AOPr4FXvwGFOnh3kgBiSwnsuabAaLls+78P+Rt3Ecmj+fh8bhK1wa9eUl7rrCemFtefG1A==
X-Received: by 10.98.89.71 with SMTP id n68mr6899121pfb.82.1462988174915;
	Wed, 11 May 2016 10:36:14 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:25 -0700
Message-Id: <1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
new file mode 100644
index 0000000..05315ed
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
@@ -0,0 +1,50 @@
+From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Apr 2016 05:47:01 +0000
+Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access warning
+
+gcc-6 correctly warns about a out of bounds access
+
+arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}' [-Warray-bounds]
+        offsetof(struct thread_fp_state, fpr[32][0]));
+                        ^
+
+check the end of array instead of beginning of next element to fix this
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Kees Cook <keescook@chromium.org>
+Cc: Michael Ellerman <mpe@ellerman.id.au>
+Cc: Segher Boessenkool <segher@kernel.crashing.org>
+---
+Changes from v1 to v2:
+
+- Check for fpr[32] instead of fpr[31][1]
+
+ arch/powerpc/kernel/ptrace.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
+index 737c0d0..b38fd08 100644
+--- a/arch/powerpc/kernel/ptrace.c
++++ b/arch/powerpc/kernel/ptrace.c
+@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target, const struct user_regset *regset,
+ 
+ #else
+ 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+-		     offsetof(struct thread_fp_state, fpr[32][0]));
++		     offsetof(struct thread_fp_state, fpr[32]));
+ 
+ 	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+ 				   &target->thread.fp_state, 0, -1);
+@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target, const struct user_regset *regset,
+ 	return 0;
+ #else
+ 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+-		     offsetof(struct thread_fp_state, fpr[32][0]));
++		     offsetof(struct thread_fp_state, fpr[32]));
+ 
+ 	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+ 				  &target->thread.fp_state, 0, -1);
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index b74903e..fbb592a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -22,7 +22,9 @@ SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
 SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA} \
+           file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch \
+"
 
 LINUX_VERSION ?= "4.4.3"
 
-- 
2.8.2


