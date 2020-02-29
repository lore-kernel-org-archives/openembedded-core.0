Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8C45861A76
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 16:51:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z15so7201800wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fdwdylLPQbFwxHKP/A6aNFoME0EL6E8tgyiFb9PATdk=;
	b=i4Bsyy5MhtKFWOjYrcbUgpjFcIxr+gZJ6V2XyVQPbxc9W72LYJMmnGXqYhquzgk6/E
	DHpIUVZu+Xb2LHlp+F7DGWmLbhgxhUt2cZ5+P6fv3WOmL8JCZ7KwJT9A+WwGCYkXUiqX
	UMjIfBRUT+GmDqcaLGpGM8PqxDzvNegJDlnB1kOMoE8nbIr1br6tlutqMMA1HMEXycAo
	VGPTwtzCJmCdRJXpg8rT64k7euS1IWLU8fhVHgBmpPcB7PyrO09tiqVUOZWUVVHmc3r9
	h4nFJ4xqmimOlJV9/neBrXcG2TXkcnc4G7dlqrh712gUpkr6VgQhMIQP//IusHm37n+Z
	taWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fdwdylLPQbFwxHKP/A6aNFoME0EL6E8tgyiFb9PATdk=;
	b=ObSvdTIlt0Smd0AmoPYp/rWsImQUZKBtOj9FvVAUN1Zx/XL5DbneN+jd6QH83FUWB+
	o8UBms/xwZ51GQor6OokVikg5KJoPC5kS5qYjjNZ+bW1ylq52l0bhaRKiaER622sjQRg
	ecE1qTx7uW3K8lwTI52QR0+CASIfSrjsu9LqZ6ntBfZa4gN8F3EuNPjJ6KcjS79SNJW+
	yduwUF9CECombwc8z89N0GMEcQeRlKB5ExmFdqiZaQkVT+4+luh4eQGB/3GjTluDdrz7
	05g/pOXGdnxsN9MIXWLe3kTJvz8L09/1dIiuUm6slhVvYanG2FDzUu95FM4weprz91oy
	ALxg==
X-Gm-Message-State: APjAAAWHUfUH9uMpyXxfWyXgy3hYNgeJ+iuvAKr9HOrXlSFrV4BrxTQp
	NhJER0kS+Sza0nBNykgnRHEi6Airnl4=
X-Google-Smtp-Source: APXvYqydk77zQY+i05EEPBy1XfteooOQQWhY2XVqIMZBlp3oIslqJhcHJ7ncMJGVlhLi2BMnAucwPw==
X-Received: by 2002:a5d:61cf:: with SMTP id q15mr10979586wrv.74.1582995114691; 
	Sat, 29 Feb 2020 08:51:54 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id
	w19sm6707198wmc.22.2020.02.29.08.51.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 08:51:54 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 17:51:46 +0100
Message-Id: <20200229165146.1446912-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200229165146.1446912-1-petr.vorel@gmail.com>
References: <20200229165146.1446912-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v7 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Sat, 29 Feb 2020 16:51:54 -0000
Content-Transfer-Encoding: 8bit

Upstream just disagree on this patch
https://patchwork.ozlabs.org/comment/2012045/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes v6->v7: NONE

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
2.25.0


