Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1541178995
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 04:21:58 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f186so8530291oig.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zUOXZOa8xPJ0PblNoOJRqrWUu96LnyFoTiGUKg1tSVU=;
	b=jDgDx1iS6gY1R07hUw7EK1kO7LLVg7YmjJlQnHZvAVpWaYhcUlF6DyhftQ0aOvNZUy
	kfzQbRudpIPJLUeZ00s645CTyUmuuOYYWqxNI/tFwkR3B3B/GLe2ijyY+UBWL3xyKK1W
	gHiCguFUDZV6U4RYULc8sH0N7cKv+lzmfUxoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zUOXZOa8xPJ0PblNoOJRqrWUu96LnyFoTiGUKg1tSVU=;
	b=HQtyINheipnvgTlEhR19mz32pm761Jp44LlfSucEU1mPcTAuTCoIBEAIe2M0KpZ8O0
	GunOFyBuvzg5u4IQugMuwpLDW9SNPzqTZx6gZ/+VTbwpPaovNOGEkTSTfRuxLrT86bCM
	+gybWfAab0aQcSt+kGNXVeHWIw2K0uix2UYZJq/uh+uLRnVay/UkobJGUa/6z2kDv52x
	pkf/0xJr5T4SUJHiMzeYMIY9QZ7FT6+ZVRa2UBux8/ZwKQLMb5ZJMBApY9iphgBWRAil
	mMvIpmt5KdcWlOhZt5ayUlvL7T/A/5eLCdojSHggXf5ZI6NH8cjzgQ481OwWx8SXfenl
	Os3g==
X-Gm-Message-State: AElRT7FuVnA2OWFhsLMB7Kz+wnDDdwYKKdiofZn4uvfUZyXmQe6DyE7P
	5w22vkNAB2Q6JByNugYFv3aTlwwRLro=
X-Google-Smtp-Source: AG47ELtzwfj+1MDZxk6bPTuDJ43+j7Cu7i8jq4VCixjDsnwe7t5jGgl3wIq0RlYAJB3nJ5aG9GlyIA==
X-Received: by 10.202.173.19 with SMTP id w19mr4829389oie.299.1520050919597;
	Fri, 02 Mar 2018 20:21:59 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	y9sm4046621oia.54.2018.03.02.20.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 20:21:58 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 22:21:30 -0600
Message-Id: <1520050890-6366-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20170323055412.10238-1-fathi.boudra@linaro.org>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
Subject: [PATCH v2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Sat, 03 Mar 2018 04:21:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Fathi Boudra <fathi.boudra@linaro.org>

Patch submitted upstream, pending to be merged:
https://sourceware.org/bugzilla/show_bug.cgi?id=21286

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Refresh to glibc 2.27

 ...o-consts.h-enum-definition-for-TRAP_HWBKP.patch | 69 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch

diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
new file mode 100644
index 0000000..436c847
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
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
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index bcc1acf..c4042d1 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
            file://0026-reset-dl_load_write_lock-after-forking.patch \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
+           file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


