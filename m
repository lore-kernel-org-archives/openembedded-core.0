Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8D67471AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 15:30:59 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id o83so76737326lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Db7+Mr92Tw9KU1ta6OIImfPIVHFD7YBEHCOfvfVhsUQ=;
	b=HUTlR1YcWO+l/yPGQql7OzddKFa3baYJlhv9BONYKRN8fx4Z+uaosxpsvg/RwnLC1/
	lBindprdGiZVsSump3tO9VO+iWIOiAFdPPon2j/BKl1syBQlMqK6B2udc/SeOzP2iMMi
	m11wX2fTumYouigtuyoroyOPSZOIH9HwQG1EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Db7+Mr92Tw9KU1ta6OIImfPIVHFD7YBEHCOfvfVhsUQ=;
	b=DFT8oGT4nZ9gMGVq0As0f9dE/2mA6IsVzUsvVRQtRAPPzYiUxCAlcOQ1Ijqh6IUXSg
	AdoA0eAac4sMDalYdFdOZEd8sIRTsFaMHwrLRjImixmSCOFaDJrcCN00iC3npYPf/mNZ
	C/NYCGJ16TVClzZUufzCUCS4corwNWtNfTCuVoE8Bxr0HP7lG8mK9gsn1ErjAYEaFgmc
	CtAFNHnJAT1V+jMwFhrpUMwWaARN3Y3zjhshiqcdmOu0F7+Cm7sBUOvhQnbme5nzl6La
	WBI1a+Sowg+S87lSI3kGnG7PZ46jnfWV08fvZpru2HedI9aMJObGPcamdU7e0O01yvca
	0jkQ==
X-Gm-Message-State: AKS2vOxsTjjp1hXUVMlsHZ86CSgu5NG2/J7qcugo1g6JrhopLevDiIo0
	YFPheFHluHjitvflSpSGVg==
X-Received: by 10.25.151.213 with SMTP id z204mr10491157lfd.67.1497972659206; 
	Tue, 20 Jun 2017 08:30:59 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101]) by smtp.gmail.com with ESMTPSA id
	u19sm3067734ljd.34.2017.06.20.08.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Jun 2017 08:30:58 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 18:30:54 +0300
Message-Id: <20170620153054.22732-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Cc: naresh.kamboju@linaro.org
Subject: [PATCH] ltp: use upstream patch to fix faccessat/fchmodat build warnings
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
X-List-Received-Date: Tue, 20 Jun 2017 15:31:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use 0037-faccessat-and-fchmodat-Fx-build-warnings.patch instead of
0012-fix-faccessat01.c-build-fails-with-security-flags.patch.
The new patch has been merged upstream and will be available in next LTP
release.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...essat01.c-build-fails-with-security-flags.patch | 70 ----------------------
 ...faccessat-and-fchmodat-Fix-build-warnings.patch | 68 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  2 +-
 3 files changed, 69 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0012-fix-faccessat01.c-build-fails-with-security-flags.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch

diff --git a/meta/recipes-extended/ltp/ltp/0012-fix-faccessat01.c-build-fails-with-security-flags.patch b/meta/recipes-extended/ltp/ltp/0012-fix-faccessat01.c-build-fails-with-security-flags.patch
deleted file mode 100644
index 2600bd60d0..0000000000
--- a/meta/recipes-extended/ltp/ltp/0012-fix-faccessat01.c-build-fails-with-security-flags.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 32f563008f95975d26d1c4fcb266c72c56f934be Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 22 Feb 2017 01:21:55 -0500
-Subject: [PATCH] fix faccessat01.c build fails with security flags
-
-When the distro is poky-lsb, fix the following error:
-
-| In file included from ../../../../include/old/test.h:47:0,
-|                  from faccessat01.c:44:
-| faccessat01.c: In function 'setup':
-| ../../../../include/old/old_safe_file_ops.h:55:27: error: format not a string literal and no format arguments [-Werror=format-security]
-|                    (path), (fmt), ## __VA_ARGS__)
-|                            ^
-| faccessat01.c:132:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
-|   SAFE_FILE_PRINTF(cleanup, testfile, testfile);
-|   ^~~~~~~~~~~~~~~~
-| ../../../../include/old/old_safe_file_ops.h:55:27: error: format not a string literal and no format arguments [-Werror=format-security]
-|                    (path), (fmt), ## __VA_ARGS__)
-|                            ^
-| faccessat01.c:133:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
-|   SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-|   ^~~~~~~~~~~~~~~~
-
-This is because in macro "SAFE_FILE_PRINTF", its third argument should be a
-format arguments, but in file faccessat01.c, it passed the same argument to
-macro "SAFE_FILE_PRINTF", so it results in the fails. It should pass the format
-string to the third argument.
-
-The same for file fchmodat01.c.
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-Upstream-Status: Pending
----
- testcases/kernel/syscalls/faccessat/faccessat01.c | 4 ++--
- testcases/kernel/syscalls/fchmodat/fchmodat01.c   | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c b/testcases/kernel/syscalls/faccessat/faccessat01.c
-index 622dfd3..1ca90e9 100644
---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
-+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
-@@ -129,8 +129,8 @@ void setup(void)
- 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
- 	fds[1] = fds[4] = fds[0];
- 
--	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
--	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-+	SAFE_FILE_PRINTF(cleanup, testfile, "faccessattestfile%d.txt");
-+	SAFE_FILE_PRINTF(cleanup, testfile2, "%s/faccessattestfile%d.txt");
- 
- 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
- 
-diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-index 6bf66d8..89d072a 100644
---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-@@ -127,8 +127,8 @@ void setup(void)
- 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
- 	fds[1] = fds[4] = fds[0];
- 
--	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
--	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-+	SAFE_FILE_PRINTF(cleanup, testfile, "fchmodattest%d.txt");
-+	SAFE_FILE_PRINTF(cleanup, testfile2, "%s/fchmodattest%d.txt");
- 
- 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
- 	fds[3] = 100;
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch b/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
new file mode 100644
index 0000000000..99497d655a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
@@ -0,0 +1,68 @@
+From 4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647 Mon Sep 17 00:00:00 2001
+From: Naresh Kamboju <naresh.kamboju@linaro.org>
+Date: Mon, 19 Jun 2017 19:01:21 +0530
+Subject: [PATCH 1/7] faccessat and fchmodat: Fix build warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixing below build warnings.
+
+ltp-full-20170516/testcases/kernel/syscalls/faccessat$ make
+In file included from ../../../../include/old/test.h:51:0,
+                 from faccessat01.c:44:
+faccessat01.c: In function ‘setup’:
+../../../../include/old/old_safe_file_ops.h:55:27:
+warning: format not a string literal and no format arguments [-Wformat-security]
+                   (path), (fmt), ## __VA_ARGS__)
+                           ^
+faccessat01.c:132:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
+  SAFE_FILE_PRINTF(cleanup, testfile, testfile);
+  ^
+../../../../include/old/old_safe_file_ops.h:55:27:
+warning: format not a string literal and no format arguments [-Wformat-security]
+                   (path), (fmt), ## __VA_ARGS__)
+                           ^
+faccessat01.c:133:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
+  SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
+
+Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
+Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647]
+---
+ testcases/kernel/syscalls/faccessat/faccessat01.c | 4 ++--
+ testcases/kernel/syscalls/fchmodat/fchmodat01.c   | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c b/testcases/kernel/syscalls/faccessat/faccessat01.c
+index 622dfd3b0..def7fa755 100644
+--- a/testcases/kernel/syscalls/faccessat/faccessat01.c
++++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
+@@ -129,8 +129,8 @@ void setup(void)
+ 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
+ 	fds[1] = fds[4] = fds[0];
+ 
+-	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
+-	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
++	SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
++	SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
+ 
+ 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
+ 
+diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
+index 6bf66d8b8..7856ed3fa 100644
+--- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
++++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
+@@ -127,8 +127,8 @@ void setup(void)
+ 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
+ 	fds[1] = fds[4] = fds[0];
+ 
+-	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
+-	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
++	SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
++	SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
+ 
+ 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
+ 	fds[3] = 100;
+-- 
+2.13.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index 31f339461f..f537d60c15 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -35,7 +35,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
            file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
            file://0011-Rename-sigset-variable-to-sigset1.patch \
-           file://0012-fix-faccessat01.c-build-fails-with-security-flags.patch \
            file://0018-guard-mallocopt-with-__GLIBC__.patch \
            file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
            file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
@@ -51,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0001-dirtyc0w-Include-stdint.h.patch \
+           file://0037-faccessat-and-fchmodat-Fix-build-warnings.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.13.0


