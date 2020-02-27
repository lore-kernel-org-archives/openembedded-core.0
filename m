Return-Path: <petr.vorel@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD7A6188F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:47:12 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q81so663367oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=foEERgZk725rWiBV5s0V4xnR/8ewAx36Ip2n0/inydo=;
	b=htlLF+YqDcosrvR8d4IrWJBtlHmSLc1wLNg1HEvNl7OcX+UmhpV0UfLs3xeH5BZNXv
	Ba5fkVlZ4yScasoeLzgXShWPsjQENPstXqpj25pHDT8gPJLk40z0UKiRjkViE1NkS0yN
	6JeXf6Hf7qyOklrt4Ea/1H53kbkdqSmzw2jv/Wqx9oPvUBaorKW5bdv2f8uGVqt0rwE8
	bheuyPJhuXmBOLQGglR6ESugkVBk6wxFeifyEpmY+W522+BZtVC98WWcGJ+/R7/7gzEr
	iDwAvx74J4o+j21LLRJ1BzfvakX7wynO7gdqqwoctvs2hnPxKlc0uTujPo5D1VRAqlI1
	JtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=foEERgZk725rWiBV5s0V4xnR/8ewAx36Ip2n0/inydo=;
	b=BhGTCptWBpvHZix6zHtXsYhnX5NqQTGQU7W7abu44Cp0ziCb0M319o4/Aeyg/t934q
	zsq7W/UOqTfXn9p50mnFHm/SMOxcgAgffX7o5NLX2aOJIig6vPiMvCpPrK9u+ZxwB9+1
	+c7CctRktu4iLRzyB30JGhg+oEZhfOXVzdBvQfIXOLqy+sONEnVcDjJysxte7vO291O3
	nHQhzFu1EgCHfFUS6pBCTEipPgnXr427LKuNaL6sskyDtxF4V4IU8vIw7kRrcOrnb7DG
	KBoLo/qCwl+pDkLOZyLKmbbLXdMKWDfqGKs3UGN0QwXXnSX1R/b0O1ycvKIf0pFdMnhf
	jkLw==
X-Gm-Message-State: APjAAAX2DqxuHoVCUme4lHvyXIRL38+UREIsimQfkKwh0zBMZwbMrHgE
	esIicl1yRuPjRMGCPOWZfSyElFOOd2A=
X-Google-Smtp-Source: APXvYqzRr3/gzACqN9DWNljgc7c/V2iEmR8nmE7RiGMQ4CdE2CjXuzkoI6xqrkfTaqKMFy/yFstebA==
X-Received: by 2002:aca:815:: with SMTP id 21mr743260oii.52.1582836433040;
	Thu, 27 Feb 2020 12:47:13 -0800 (PST)
Received: from dell5510.arch.suse.de ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id
	k18sm2305365oiw.44.2020.02.27.12.47.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:47:12 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 21:47:01 +0100
Message-Id: <20200227204701.3830-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227204701.3830-1-petr.vorel@gmail.com>
References: <20200227204701.3830-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Thu, 27 Feb 2020 20:47:12 -0000
Content-Transfer-Encoding: 8bit

Upstream just disagree on this patch
https://patchwork.ozlabs.org/comment/2012045/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2: NONE

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
index 38fd0f6f87..069d9c2e0b 100644
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


