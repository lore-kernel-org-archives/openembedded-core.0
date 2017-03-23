Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6344C6FF80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:54:15 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id j90so77375245lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 22:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iX5hXklSJ6iW9GQ7zBKF73TRlQkvdo8SySVI8shsPRM=;
	b=Kvlwhg4qraJQIHKv4IFWg1CCWin+JvB6j47+3gEmCtNIs9CkYn6VL1uWA5sDN4G5Zo
	XNrgyhwJt9hIRrtm+VJQsFH9E1/PKFDNtGCOf7/vqT5k4eU6c4D0Tmea/RN0247HU3S9
	jXduTulsNrZhikpGdo1xwPT8Q2D5pIaAF+swI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iX5hXklSJ6iW9GQ7zBKF73TRlQkvdo8SySVI8shsPRM=;
	b=k7nR38kTLoXxyyxFBQ6joeQMdnmsmd+rxnuFZBvOvD6z5KjU5Y1/s2O/OPoRWOvkm/
	i/PEYytJYjRg/955d23GqIdBJLKjMIDKyYADOdLo+Qj4pfBoMlXB94wUF3yl40m+LQ5X
	+HPNHjqDcI+V0nxkrIx7SeGgAg3K5vTNZ/MnLYlPQruR+JIDGy59+mETHsaFaAjdlW7y
	JEBSTNvHXNivG5XrOcE3phhH1O2RECs2o/RZ8g9PwydbIWZilgLkMREAZy8zmF33rnXC
	jFAx5y/ZTx2jVmTZHAJVz70dQP+EUdElkLQ4DpvxVRvtsK79OsdK4XE4crHQ7cwHrMlq
	kjfw==
X-Gm-Message-State: AFeK/H1HU8Id+1ClT0CmEPtQFSMVpZKoi86oOyIvRqE2Zk/sxnG9WQj77yCHRHfRMuGafG6s
X-Received: by 10.25.80.86 with SMTP id z22mr316385lfj.157.1490248456219;
	Wed, 22 Mar 2017 22:54:16 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id c28sm877665lfh.49.2017.03.22.22.54.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Mar 2017 22:54:14 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 07:54:12 +0200
Message-Id: <20170323055412.10238-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 05:54:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch submitted upstream, pending to be merged:
https://sourceware.org/bugzilla/show_bug.cgi?id=21286

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 69 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.25.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch

diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
new file mode 100644
index 0000000000..fe22cc3442
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
@@ -0,0 +1,69 @@
+From af3054b3856379d353a779801678f330e1b58c9a Mon Sep 17 00:00:00 2001
+Message-Id: <af3054b3856379d353a779801678f330e1b58c9a.1490183611.git.panand@redhat.com>
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
+Upstream-Status : Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=21286]
+---
+ bits/siginfo.h                         | 6 +++++-
+ sysdeps/unix/sysv/linux/bits/siginfo.h | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/bits/siginfo.h b/bits/siginfo.h
+index 4919df543634..6dc714e8f30b 100644
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
+index 7b0d4f62a331..9cdf42a42557 100644
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
+2.9.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index cf9c4f71b8..3f3d6ae2ae 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.11.0


