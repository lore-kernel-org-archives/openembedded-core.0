Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6406F0A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:33:10 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so15730136pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vAwyh3a9JCXobF/Zt4RT+X7K4xDK9EPnXBtJySMbd2I=;
	b=GzLrEvTUXiZy6GiTrcSR4UfyPxhUsnSD714w2gAcraky92Mha/6qu815ltimx2MwsL
	oPyfhq0wyGlIXyMmWUF9R+UsZ7zKEga902MCj+flw1urqH/W/XQAaF3O3WlWQGDr3Mqd
	JtatxqkhXu8XJQ24Gg3MXOn99OybMtgzs5WO1XRQso5OCG5pBx+mOBTsPSDyUE4pbeSP
	x/bMI/DP1h1VVt2C2k12ZcavFnQUpnNmHp3SZgXQOul0NUJ3OasW1hBD3wZUJ3f13jFu
	RWfSdk469dCGK/bGEq+Pg6abt+fhbO/MrT8aScT/rH68gUYGmwJ94QFExbz3uaqh6TNc
	ruOw==
X-Received: by 10.68.194.65 with SMTP id hu1mr5262445pbc.158.1392665591308;
	Mon, 17 Feb 2014 11:33:11 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.33.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:33:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:18 -0800
Message-Id: <e114cc405bd98ebbe5376e094842c9d49e7ca9b8.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] uclibc: Update to git tip
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
X-List-Received-Date: Mon, 17 Feb 2014 19:33:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    3 +-
 .../0001-add-posix_fadvise-for-arm.patch           |   68 --------------------
 2 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 2005ae1..f2a1256 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,4 +1,4 @@
-SRCREV="f22cca4722fa66e424562e69f4afa2bca0af871d"
+SRCREV="19f21a1d974d802f05c43e4cabd6ed6891a8ae50"
 
 PV = "0.9.33+git${SRCPV}"
 
@@ -21,6 +21,5 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
-	file://0001-add-posix_fadvise-for-arm.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch b/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
deleted file mode 100644
index 7c17a19..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 236a65abe0a6810e20498fc0ba8d02d90978953b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 29 Jun 2013 22:46:53 -0700
-Subject: [PATCH] add posix_fadvise() for arm
-
-arm call to posix_fadvise simply calls posix_fadvise64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libc/sysdeps/linux/common/posix_fadvise.c |   24 ++++++++++++++++--------
- 1 file changed, 16 insertions(+), 8 deletions(-)
-
-Upstream-Status: Pending
-
-diff --git a/libc/sysdeps/linux/common/posix_fadvise.c b/libc/sysdeps/linux/common/posix_fadvise.c
-index d3e1bd4..e102ce7 100644
---- a/libc/sysdeps/linux/common/posix_fadvise.c
-+++ b/libc/sysdeps/linux/common/posix_fadvise.c
-@@ -10,30 +10,38 @@
- 
- #include <sys/syscall.h>
- 
--#ifdef __NR_fadvise64
-+#if defined(__NR_fadvise64) || defined(__NR_arm_fadvise64_64)
- # include <fcntl.h>
- # include <endian.h>
- # include <bits/wordsize.h>
- 
-+# ifdef __NR_arm_fadvise64_64
-+int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
-+# endif
-+
- int posix_fadvise(int fd, off_t offset, off_t len, int advice)
- {
-+# ifdef __NR_arm_fadvise64_64
-+	return posix_fadvise64(fd, offset, len, advice);
-+# else
- 	int ret;
- 	INTERNAL_SYSCALL_DECL(err);
--# if __WORDSIZE == 64
-+#  if __WORDSIZE == 64
- 	ret = INTERNAL_SYSCALL(fadvise64, err, 4, fd, offset, len, advice);
--# else
--#  if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__)
--	ret = INTERNAL_SYSCALL(fadvise64, err, 6, fd, /*unused*/0,
- #  else
-+#   if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__)
-+	ret = INTERNAL_SYSCALL(fadvise64, err, 6, fd, /*unused*/0,
-+#   else
- 	ret = INTERNAL_SYSCALL(fadvise64, err, 5, fd,
--#  endif
-+#   endif
- 			OFF_HI_LO (offset), len, advice);
--# endif
-+#  endif
- 	if (INTERNAL_SYSCALL_ERROR_P (ret, err))
- 		return INTERNAL_SYSCALL_ERRNO (ret, err);
- 	return 0;
-+#  endif
- }
--# if defined __UCLIBC_HAS_LFS__ && (!defined __NR_fadvise64_64 || __WORDSIZE == 64)
-+# if defined __UCLIBC_HAS_LFS__ && ((!defined __NR_fadvise64_64 && !defined __NR_arm_fadvise64_64) || __WORDSIZE == 64)
- strong_alias(posix_fadvise,posix_fadvise64)
- # endif
- #endif
--- 
-1.7.9.5
-
-- 
1.7.10.4


