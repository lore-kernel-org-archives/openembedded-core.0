Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7D161687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 06:12:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so1912990wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E+y4aD6hlwvqAhs9aIpOBF7ttQVX/t2b7yzO6+mKrX8=;
	b=TN6ot0VtNoP/V716SBUP+DfYCG7fHd8fDwWsUxcYja3cJ46ajCthTeLQRS9RhJRkbp
	cxYAuouJhzNjLj2v+DWdb9DsQ3SMwaTW50EImso2pCeL4X9U8xBh7FcC5mTjm9HUfyZD
	s5Wr5YDeOzHkfygKeDM+OsjKQ5Vr1Jo6sXHyU6SzlWSOmpvBcs13AFAkeWprJuaT3uUN
	Cr6ytCGxUCE+QZZr1NfiP6ENkKhdQBynm5fRtzvwBFPwipXLeNOPM/BVQWsPwrY2XJ0Q
	4DBJNqycS3q0jw+LIIaIiaV9+i8IhJP/rzqNw9Gry7z9JxiTdUJ+xX9Du1husb/CyJiR
	x6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E+y4aD6hlwvqAhs9aIpOBF7ttQVX/t2b7yzO6+mKrX8=;
	b=ZSJqAPR5w9D1jBQyDo2Ykda9/WwCEJh6aknVlVJMuKK7C49KpAfEodrwsJsHDKHxOU
	x+xU5LMLysKANu+Bcay3Q8xDmJxN261kjuhKftEfhMCDYPOrtbz4yV6fJQTx8ztG/YI1
	cILXFTcKkF7RSRy/pLxm5gRPkjJv3cIypx17JkZdosLMIjmybNF5BS8QbSFRNDvFOrrc
	kclfW0u9Zc2GW+IudHkCpf3RZPQSO9tZlGqOHxXQOz1TIeaGhdw+wMGAvRdeSRGa9fAT
	0MVXjm/oHCEBile0OFsaNmvrVCLR81o9Bk2RyExdF2Irf/zCeVvbe6iPCyitCSFLXHZe
	JNrg==
X-Gm-Message-State: APjAAAV7dLEbF555k2W8dJliRiPmXOiNbXXkfVum+X0G43h/vLjVtkzg
	IdHt8pgVXqBsnEQnFmbV3p6wFGLbCvA=
X-Google-Smtp-Source: APXvYqywL4G5kBhWKOZz0SQB3D2Q3MtaYJsI5ewkCDBdiY4fr9/TSxYv+5VT+JaPF+9MkCVD5eWctw==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr2937235wma.31.1582870354961;
	Thu, 27 Feb 2020 22:12:34 -0800 (PST)
Received: from dell5510.arch.suse.de ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id b67sm694562wmc.38.2020.02.27.22.12.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 22:12:34 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 07:12:25 +0100
Message-Id: <20200228061225.32003-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200228061225.32003-1-petr.vorel@gmail.com>
References: <20200228061225.32003-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Fri, 28 Feb 2020 06:12:36 -0000
Content-Transfer-Encoding: 8bit

Upstream just disagree on this patch
https://patchwork.ozlabs.org/comment/2012045/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v3->v4: NONE

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
index 312eeca114..847f267b0b 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -34,7 +34,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch \
            "
-- 
2.25.1


