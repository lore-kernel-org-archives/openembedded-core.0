Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9A161A56
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:00:25 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so2527956pjr.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3ZfHP9aXzC7cSy49Td/cxDMHZTlF43T5CiQP6XEeS1s=;
	b=EXFUx7p81ng1AioHLGkj99y9WW/UqPaFhYKUNtMOlCSoK0kE6SeqKf4Xi0IiqHA5Uo
	P6rrio3+/aLYz2Nsma/Fc/l7SZW2DN3tP4qNEvfg3b2vC0Jk/U6DTVkteMnI5bHdNlD7
	U6mqhAH2oKDVUTSu4Cni5bJWW8inoMVq1UN3oocYbNweNSqK1ql/LcApc/9oi9cSYtkt
	HayE+hc/hGcuVaCloUBr6luFxhAiQ83ZkhHKQw2O9gzoDpQMjPIuDvbdFMp93K4LL53J
	GWUZ49kNLV0hw3iHumuItioACpds2MUY1KOFjL5FkGzJFKpF9MT2GFS49MOIohtr2D2b
	mdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3ZfHP9aXzC7cSy49Td/cxDMHZTlF43T5CiQP6XEeS1s=;
	b=kpWH6FHMadTGKolkNL96ROWgiEJlCkgci5dQcvb6l+jEhHn2jaYieM9tJj0FugxKll
	umQCj1XWZnRMQwDqSeU8smpNDZOhgDhrMJ/78AcwYYQxuS0v/z07Tao5iZgAX7fVtsb/
	IouKWyGnYx97KF79tbxLpxv9GG4Th4MXvrzafjp7f0zrLROL7SJ9MTA8re6CbqNkEv8V
	8HsZuCkhgZX3HM79y/1uWr9at//+62INvEH76Ea59RV0QO/dbaHawPe8+RBupOnr4kbW
	PTl8D0tFbOZ6KTDWJIjcVZbuMSsCRtK6vQIywyR/vvFABVzZ4mOjL1kpJ9Ce25yzTCCH
	qMaQ==
X-Gm-Message-State: APjAAAWKpC31vISq9r/4Rf6yDnGnU3lx7f1PCeA+AFgSuwyT6By2vgOv
	7+1r9gZ1+3Rnxt6bdwu60cyftKkEq8Q=
X-Google-Smtp-Source: APXvYqzjJ6duRKy+MMl9GsBkk88Iv5kcCdpNpgNibWIUoin5tDMytHwswNrS5pyaf3K45fElqYAaQQ==
X-Received: by 2002:a17:902:7591:: with SMTP id
	j17mr9088476pll.163.1582988425992; 
	Sat, 29 Feb 2020 07:00:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	r198sm16250942pfr.54.2020.02.29.07.00.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 07:00:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 07:00:36 -0800
Message-Id: <20200229150036.1900777-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200229150036.1900777-1-raj.khem@gmail.com>
References: <20200229150036.1900777-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v6 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Sat, 29 Feb 2020 15:00:26 -0000
Content-Transfer-Encoding: 8bit

From: Petr Vorel <petr.vorel@gmail.com>

Upstream just disagree on this patch
https://patchwork.ozlabs.org/comment/2012045/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes v5->v6: Rebase

 ...suite-mmap24-2-Relax-condition-a-bit.patch | 68 -------------------
 meta/recipes-extended/ltp/ltp_20200120.bb     |  1 -
 2 files changed, 69 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch

diff --git a/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch b/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
deleted file mode 100644
index d32ac1dd7c..0000000000
--- a/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a8715a1446305ffd76406f63c7f160c13a5b2e72 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Wed, 10 Oct 2018 22:07:05 -0400
-Subject: [PATCH] open_posix_testsuite/mmap24-2: Relax condition a bit
-
-Mips will return EINVAL instead of ENOMEM as expected
-if the range [addr + len) exceeds TASK_SIZE.
-
-Linux kernel code: arch/mips/mm/mmap.c
-if (flags & MAP_FIXED) {
-    /* Even MAP_FIXED mappings must reside within TASK_SIZE */
-    if (TASK_SIZE - len < addr)
-        return -EINVAL;
-
-Relax the condition and accept both ENOMEM and EINVAL
-as expected outcome.
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-October/009624.html]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- .../open_posix_testsuite/conformance/interfaces/mmap/24-2.c    | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
-index 9cf83d9..55090a6 100644
---- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
-+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
-@@ -7,7 +7,7 @@
-  * source tree.
-  *
-  * The mmap() function shall fail if:
-- * [ENOMEM] MAP_FIXED was specified,
-+ * [ENOMEM or EINVAL] MAP_FIXED was specified,
-  * and the range [addr,addr+len) exceeds that allowed
-  * for the address space of a process; or, if MAP_FIXED was not specified and
-  * there is insufficient room in the address space to effect the mapping.
-@@ -15,7 +15,7 @@
-  * Test Step:
-  * 1. Map a shared memory object, with size exceeding the value get from
-  *    rlim_cur of resource RLIMIT_AS, setting MAP_FIXED;
-- * 3. Should get ENOMEM.
-+ * 3. Should get ENOMEM or EINVAL.
-  */
- 
- #include <stdio.h>
-@@ -92,8 +92,8 @@ int main(void)
- 	       (unsigned long)len);
- 	pa = mmap(addr, len, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED, fd,
- 		  0);
--	if (pa == MAP_FAILED && errno == ENOMEM) {
--		printf("Got ENOMEM: %s\nTest PASSED\n", strerror(errno));
-+	if (pa == MAP_FAILED && (errno == ENOMEM || errno == EINVAL)) {
-+		printf("Got ENOMEM or EINVAL: %s\nTest PASSED\n", strerror(errno));
- 		exit(PTS_PASS);
- 	}
- 
-@@ -102,6 +102,6 @@ int main(void)
- 	else
- 		munmap(pa, len);
- 	close(fd);
--	printf("Test Fail: Did not get ENOMEM as expected\n");
-+	printf("Test Failed: Did not get ENOMEM or EINVAL as expected\n");
- 	return PTS_FAIL;
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index 3cc10afa0c..5be9489a75 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -35,7 +35,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch \
            "
-- 
2.25.1


