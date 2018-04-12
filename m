Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA5074585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 22:55:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 126-v6so6740872oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+837nVG9mXyTqoOnj1DTt8kDLc76wRrZweyRtVqeXE=;
	b=CpEsJ81OxAp/PypNST/AUI6fB+xoKzXuI5s5MZztN+Bdnp+DoGQ/54p4DW4YLmOcCc
	4+rMXERa1t818QdTe+TPQ3i6koSY8MDVNZfebEg8sO+rggwofKrQjepX1QNFg2tl8Xbc
	uCHq/7LesWx3/zP8OEDpzJDZwnJ65/ZbBm92Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+837nVG9mXyTqoOnj1DTt8kDLc76wRrZweyRtVqeXE=;
	b=duihUFCqXkcgikvEs+y3r/w/XKg0yV/cpVkT0zKF6vQqV9OqsRJAWabItAyUlA/A0C
	on4YMYdQ4WyJud4OzN0+FY/iwHcgwmJsiMgv+nsgzFnMbn7xq0qQZLdg1gGFDtBs14er
	+f0x2YFi5gNpXpeI0mvoacYlNZHBWAWtLnNVP0e8m0p5WeJ5mcweNx2rCU21n49UWGhG
	BGhlPhfAYWO7/2NTZt9Gank5N9IncwCiTpUIKad1kAT9mw42fJy0vfM4uuZl1VxjrrGC
	ViaHtatvzVMA55iIoPc/pNVkH+5EE/ap5XfdZAwS05F8vhV9aDaGMM/eiNv8f22Zoj5x
	LwiQ==
X-Gm-Message-State: ALQs6tBGvaKsh/C3Sk6EcQOAr542mFwTZGGvPLj2FcySNmFo37fKAqfF
	cz0C1SeGLrudxZEDrKPo1bCQUnEaztxQPA==
X-Google-Smtp-Source: AIpwx49g2ihEPPb6UdqCje1pDV5Me5JpyHX9XRZzTgAUuQT39z+4BD2WesB8IYebQQ64I89imdfylg==
X-Received: by 2002:aca:bb02:: with SMTP id
	l2-v6mr7295140oif.124.1523573716073; 
	Thu, 12 Apr 2018 15:55:16 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-190-249.PCs.InterCable.net. [187.161.190.249])
	by smtp.googlemail.com with ESMTPSA id
	k49-v6sm3259864otb.58.2018.04.12.15.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Apr 2018 15:55:14 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 17:55:07 -0500
Message-Id: <1523573708-6519-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [pyro][PATCH 1/2 v2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 12 Apr 2018 22:55:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Fathi Boudra <fathi.boudra@linaro.org>

Patch submitted upstream, pending to be merged:
https://sourceware.org/bugzilla/show_bug.cgi?id=21286

(From OE-Core rev: 11ebb5054e5ec1171ade90249e3a30ac8174a35a)

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
v2: No changes.

 ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 68 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.25.bb              |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
new file mode 100644
index 0000000..bef8887
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
@@ -0,0 +1,68 @@
+From 297aca56465035dce1f7b91b5cdda54379141957 Mon Sep 17 00:00:00 2001
+From: Pratyush Anand <panand@redhat.com>
+Date: Wed, 22 Mar 2017 17:02:38 +0530
+Subject: [PATCH] bits/siginfo.h: enum definition for TRAP_HWBKPT is missing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Compile following linux kernel test code with latest glibc:
+
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
+
+and we get following error:
+breakpoint_test_arm64.c: In function ‘run_test’:
+breakpoint_test_arm64.c:171:25: error: ‘TRAP_HWBKPT’ undeclared (first use in this function)
+  if (siginfo.si_code != TRAP_HWBKPT) {
+                         ^
+I can compile test code by modifying my local
+/usr/include/bits/siginfo.h and test works great. Therefore, this patch
+will be needed in upstream glibc so that issue is fixed there as well.
+
+Signed-off-by: Pratyush Anand <panand@redhat.com>
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=21286]
+---
+ bits/siginfo.h                         | 6 +++++-
+ sysdeps/unix/sysv/linux/bits/siginfo.h | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/bits/siginfo.h b/bits/siginfo.h
+index 4919df5..6dc714e 100644
+--- a/bits/siginfo.h
++++ b/bits/siginfo.h
+@@ -140,8 +140,12 @@ enum
+ {
+   TRAP_BRKPT = 1,		/* Process breakpoint.  */
+ #  define TRAP_BRKPT	TRAP_BRKPT
+-  TRAP_TRACE			/* Process trace trap.  */
++  TRAP_TRACE,			/* Process trace trap.  */
+ #  define TRAP_TRACE	TRAP_TRACE
++  TRAP_BRANCH,			/* Process branch trap. */
++# define TRAP_BRANCH	TRAP_BRANCH
++  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
++# define TRAP_HWBKPT	TRAP_HWBKPT
+ };
+ # endif
+ 
+diff --git a/sysdeps/unix/sysv/linux/bits/siginfo.h b/sysdeps/unix/sysv/linux/bits/siginfo.h
+index 7b0d4f6..9cdf42a 100644
+--- a/sysdeps/unix/sysv/linux/bits/siginfo.h
++++ b/sysdeps/unix/sysv/linux/bits/siginfo.h
+@@ -235,8 +235,12 @@ enum
+ {
+   TRAP_BRKPT = 1,		/* Process breakpoint.  */
+ #  define TRAP_BRKPT	TRAP_BRKPT
+-  TRAP_TRACE			/* Process trace trap.  */
++  TRAP_TRACE,			/* Process trace trap.  */
+ #  define TRAP_TRACE	TRAP_TRACE
++  TRAP_BRANCH,			/* Process branch trap. */
++# define TRAP_BRANCH	TRAP_BRANCH
++  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
++# define TRAP_HWBKPT	TRAP_HWBKPT
+ };
+ # endif
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index 58b90b7..49fcf0c 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
            file://0028-Rework-fno-omit-frame-pointer-support-on-i386.patch \
+           file://0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


