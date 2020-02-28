Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4F761954
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 17:57:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m3so4218713wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FFgOipWcocJfymtUlJrcgyUXyGmlfzpxuL/9exK+mcA=;
	b=oCRcp/tTgedHB91FyjFKy1nb8nMUv1IJksC5cKfVifPFQyVH7CEfirTOkhiYmzlSKS
	3NEVfPyyvEEOaWpFfB2UeOae29o88Qmqi6LqAZpn+olxKADPuQWk45Y/15zeJbzmcmy6
	GTONFJ8utbB+Ag76VfHkhQiM6eoODOEDC/AHwXsraR4B7+AA7pjg1zAnnA5zxaxGWztc
	sPKlOWJk1cllK44cJMyg4YkXsQI2MxNm+2BzceKy6Pv85b+lKS+bJ1eIm0Hjxj+ufOCK
	bPivkUYuIwFGpzRvotyKr2GUGfM4KgcXIYhNZeL8uYzabc5f5enP6+fRoRe0qlurDowi
	+O2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FFgOipWcocJfymtUlJrcgyUXyGmlfzpxuL/9exK+mcA=;
	b=PD9Qc4cIZfmI4pQTy14ZWjDlz/aVcv1AwAjFDXsz/UHTOzo7LfS8DKWewY2UgZ4dIJ
	dmON1JbVJ0C+jdqiBfa6B2SV+w8XUEiSjToY2J3ntAveGRjBz9IZ9oHtdznV2B2uVnsd
	P17rzAMyCNd504P4INvBwbXA+jy+D1hCzmC5ApPOJLfeKYD77baQga36C03RyxMQwsVu
	xjdB6bQujjT8FfyYTFG33HOorZ8nHXeJVnDTtDnUlamwQAIemspnBqR9Rm48vP0wC3qT
	6LYZ4DS+o/kMHlT+2tDig8X3XR38WHv0kZEeUtPWICpPMBq3EXfjiBbU2srua6ZQuTY0
	VtSg==
X-Gm-Message-State: APjAAAUU4S5bl2t+PiUeTTLxwwqPK8cOVPa0NMBKRt0Vh8ExrH9sObOg
	DYpFaJfFtdnmrKkQLJeINAOxjcUiRcE=
X-Google-Smtp-Source: APXvYqwsYiQxajo/C7hcUbSxGHilM0yO9MbXUY4OfhboYZHuU1rouxLc8tQoG5VJbU2A9R4fQhH7Dw==
X-Received: by 2002:a05:600c:294a:: with SMTP id
	n10mr6017280wmd.11.1582912659572; 
	Fri, 28 Feb 2020 09:57:39 -0800 (PST)
Received: from dell5510.arch.suse.de ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id
	y139sm3403274wmd.24.2020.02.28.09.57.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 09:57:39 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 18:57:31 +0100
Message-Id: <20200228175731.10604-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200228175731.10604-1-petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v5 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Fri, 28 Feb 2020 17:57:39 -0000
Content-Transfer-Encoding: 8bit

Upstream just disagree on this patch
https://patchwork.ozlabs.org/comment/2012045/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v4->v5: NONE

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


