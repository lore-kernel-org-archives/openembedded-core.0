Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3DE78907
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 16:07:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id e9so131404oii.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HW3nQVDOyB5q/Hm6Wmh7G0dTLv+fsl2ocJxIL6JoMGU=;
	b=GIKKH3hbGP8PNd965KOsKThsbnCv+59W2qXo2kFDzFOsVgVMJ4kcHZSI3Y/plER7JO
	BRFDnQEEUprHh1cy9sXgExMzP3/vI41b1E1wX65lQr6HKwIgQvVQ8IvEYmk1+nKrOoIq
	AskwOvfHzsFQlwTqGU1m8+bQPwOQ8diVjTVkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HW3nQVDOyB5q/Hm6Wmh7G0dTLv+fsl2ocJxIL6JoMGU=;
	b=gnCbx3hvODVXsNWdNRWc6+sReqH895dY1zF4uK3ZZIaFTs3f4DIFFKneg/GdfqxKXU
	dblTql61PRPxnsvWRHCA4p03BGgsZmaqqeeHomdF0ix2BrxJlwDUdmUErJeObOELqkz8
	VkgA6CXZOkne//sdzML5w+ty5QljR26qa0zreifv9Q2Uip23xt4l5EdRzqF88eRAD2ED
	NlvvCa7djAaukMIR53QPueK0VwWwfVE0U6825tWsgpshZmu1qiE/Cd4W2KjxR+FwlAKD
	bUpwNIyKGiZu2CqBAs70U3LKQAEKuQbLNm5k802D0+sq7NGpZvAJWDtUzCNDX8qcWjo7
	f8SQ==
X-Gm-Message-State: AElRT7HEUJZbzaWCMvqq+LuhQeIlaNzGuWoklFrKjFPSlnoyl/83/w1C
	YQhlfOaUPZJhMgQ+HYcCItUDFU4urhI=
X-Google-Smtp-Source: AG47ELsYUokdPyqJzfArFPfxa3Qm8gYlEIw9srid5ec8VcTFllaR3u8QTuUJ+yBZCi3RZyGdsgA4vw==
X-Received: by 10.202.236.15 with SMTP id k15mr804805oih.81.1520957236670;
	Tue, 13 Mar 2018 09:07:16 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	w15sm245570oie.58.2018.03.13.09.07.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Mar 2018 09:07:15 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:06:53 -0600
Message-Id: <1520957214-5689-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko] [PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Tue, 13 Mar 2018 16:07:16 -0000
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
 ...o-consts.h-enum-definition-for-TRAP_HWBKP.patch | 69 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch b/meta/recipes-core/glibc/glibc/0029-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
new file mode 100644
index 0000000..436c847
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
@@ -0,0 +1,69 @@
+From af3054b3856379d353a779801678f330e1b58c9a Mon Sep 17 00:00:00 2001
+Message-Id: <af3054b3856379d353a779801678f330e1b58c9a.1490183611.git.panand@redhat.com>
+From: Pratyush Anand <panand@redhat.com>
+Date: Wed, 22 Mar 2017 17:02:38 +0530
+Subject: [PATCH] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT is missing
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
+ bits/siginfo-consts.h                         | 6 +++++-
+ sysdeps/unix/sysv/linux/bits/siginfo-consts.h | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/bits/siginfo-consts.h b/bits/siginfo-consts.h
+index a58ac4b..8448fac 100644
+--- a/bits/siginfo-consts.h
++++ b/bits/siginfo-consts.h
+@@ -106,8 +106,12 @@ enum
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
+diff --git a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
+index 525840c..57a9edb 100644
+--- a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
++++ b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
+@@ -137,8 +137,12 @@ enum
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
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 464b654..30dfe4d 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
+           file://0029-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


