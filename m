Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF50A78919
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 16:17:44 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 95-v6so179925ote.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LW1pxWc5nBKQ2cVD9bdI8bVrM+vfbjq/Ff/CGbM4/dU=;
	b=Ad400wHbtJYxf83/NqZSgnxKp2Ujv0wU8oRHy86RwW1Dfk/bwSP3qR7K5ReO/289G5
	eQzMvToFuzNy+P+eCkjymeGvlIH53UXR3mOJM8I00J3OhNYqpBVnKy0Dl+RVt1ruepMj
	Gwcdytv8vYEPaw7k5JmGqdKhkoY78Y2N9ZwJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LW1pxWc5nBKQ2cVD9bdI8bVrM+vfbjq/Ff/CGbM4/dU=;
	b=oqE4JQfJIFM4nRJ3UswlNcKnTw8rKm3TGyAVZTr0/mSZEJqfxJK8thd8OFkatUS6ES
	GuYZt4qv0DM4JqjEQU1cAv4ooPq5TW2uwPoeVf2gFDx99ysn8pm78mAfF4Rizej+iblt
	G9sSiYFfVbttxGCYq9DSHD+aX2MEcypccVTyjsCMKUtlg/l95MMq69O+WAwtGgy5Pm1W
	vXxyo3dncmkT+50kcI20CHloapW9jWh1l6pP6dhQomCiPz2ch71pcLUPJSsPbdHy421/
	assNZw9OJXVN63iANNdJw911c/JM6TtqgoR+JKqLQAjXc1Kwk8mmVjFJYtMk8hTwoN/J
	7PfQ==
X-Gm-Message-State: AElRT7EEbEu2NFnxScVOuiwI6CTlInM+mrtuvmP7JLS2sUSOfIVVSdpJ
	t13ou7f2dtRF+ch843GZ7KZaK3J2stg=
X-Google-Smtp-Source: AG47ELsfuN2iXBgKUEImeaAA7Pq7ygMmXDXkv8+2XHlL6PdSxoR2SIhBNeBPKy7l3ZyM47BL8q5f4g==
X-Received: by 10.157.14.5 with SMTP id c5mr913323otc.314.1520957865042;
	Tue, 13 Mar 2018 09:17:45 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	c33sm283789ote.79.2018.03.13.09.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Mar 2018 09:17:43 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:17:37 -0600
Message-Id: <1520957858-7006-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Tue, 13 Mar 2018 16:17:44 -0000
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
 ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 69 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
new file mode 100644
index 0000000..fe22cc3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
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
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 6ea4585..09694f2 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-build_local_scope.patch \
            file://0028-Bug-20116-Fix-use-after-free-in-pthread_create.patch \
+           file://0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch \
            file://CVE-2016-6323.patch \
            file://0001-Add-atomic_exchange_relaxed.patch \
            file://0002-Add-atomic-operations-required-by-the-new-condition-.patch \
-- 
2.7.4


