Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.1465.1613783586123502871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 17:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=bOxDgqoL;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1ADF39EF;
	Fri, 19 Feb 2021 20:13:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 20:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=Lcwxo6+qGp+qX0wu9nit6nsPsu
	aaISGor+vIDQEjzmU=; b=bOxDgqoL46eM6x8nxoVP6DVYDP2sKCeZMGiyrBCOos
	DY1j+r1HeCImYj8D/zJp1xqbXp90i2VzCJcVtfobOleTRj28JUG8nyxKdgjJoIJn
	GEs26V7BujSnfABpWGlvEEzyGhVMkaJ0zVu8tVa1NeyMRVABCFb1fiTPg0hklMr7
	eE7h9yiRl1odQ+sCONJ7B5SbSVrWjTsNraCON4+FRSknj3z9kZxw6xG7NBPhngFh
	blQxfww+9Fpc1Z/dXp1RFJyzFhuvv+T2z/BC+uJh6XMtbpiQgWcIhRQCh/qzT/nd
	5wp5KiVbHv7sJ59tCTVTkVTo8e/xMwEC0GenhoeWgoUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Lcwxo6+qGp+qX0wu9
	nit6nsPsuaaISGor+vIDQEjzmU=; b=fct4+ynxk8/Kk7ybWllcXB8NxYUmI86ZA
	hjrvpm+hOEP/Y739DGkGnMQcZj4XJ+lZ0iUskDmKNIfB+c4dWIDYa4DJH8lISu3Y
	m3c6JX9f45gUV69pKAg9nQWUTq720+0r8BL/3Y5/xj1NQQoIB14pFcNZPLSbL72p
	Vj/gVpdZm2c8TjSi7VRQAo8u0YdwiSvI8ipzR/Ae5+YPhVJoVmPYwdZ1Yr8k3w2q
	9HvZRDUc+LvBonwLWboAsROEhzo/ALo5mM7S3vIOyyg6AnnbYK9Le7ELxohPh5/N
	Zco01qq2gVXfdwj7PLv1IsSQASQWX9VQQb4JXTavVElm1mq4RWTVQ==
X-ME-Sender: <xms:IGIwYF2_EwmKoi7WvW-WcLskFk90LggoNfnCjut5BZ5fQ4n49MyzSQ>
    <xme:IGIwYMEkCPPuFZpyv76ZStzEpD75zGFM4Zjn6DrTl-yGjfqN1VwDHgdEIxI-QRyOz
    H_KRWkznwKXhdsLphQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepfeevjeevfeejtdevkeeigedvueeile
    evffevgffgjeejfedufedtvdduteevteeknecuffhomhgrihhnpeihohgtthhophhrohhj
    vggtthdrohhrghenucfkphepkeeirddufedtrddugeeirdduvddvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhii
    rghnrdgtohhm
X-ME-Proxy: <xmx:IGIwYF5kyQLU0UgfeHX194OHOQFtx0ufwQSAOziD6DjPo3PuiIm_Ow>
    <xmx:IGIwYC2cd2_uWHAGhTNTg2C93EnIXjrXonNDtp9V6qDzw8RBBfd7cw>
    <xmx:IGIwYIGx_SfjdS0htUcbEEdr9BNxgGr4LILKnRlAeNbaZM7AhIyGsg>
    <xmx:IGIwYLzOiQGBUNJ8vIogDuA5xV8GZJKtoC-0UT5mMDhN34eg0WmjeA>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id A85D824005A;
	Fri, 19 Feb 2021 20:13:03 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [dunfell][PATCH 1/4] pseudo: Backport fixes for glibc 2.33
Date: Sat, 20 Feb 2021 01:12:52 +0000
Message-Id: <20210220011255.823050-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...h-Fix-pseudo-to-work-with-glibc-2.33.patch | 46 +++++++++++
 ...wrapper-for-fstatat-fstatat64-in-gli.patch | 77 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-linux-portdefs.h-Fix-pseudo-to-work-with-glibc-2.33.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-ports-linux-Add-wrapper-for-fstatat-fstatat64-in-gli.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-linux-portdefs.h-Fix-pseudo-to-work-with-glibc-2.33.patch b/meta/recipes-devtools/pseudo/files/0001-linux-portdefs.h-Fix-pseudo-to-work-with-glibc-2.33.patch
new file mode 100644
index 0000000000..7347e13a7d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-linux-portdefs.h-Fix-pseudo-to-work-with-glibc-2.33.patch
@@ -0,0 +1,46 @@
+From 3a72456779ff958ab9db274eab665ddb5333d9b2 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 5 Feb 2021 08:19:01 +0000
+Subject: [PATCH 3/3] linux/portdefs.h: Fix pseudo to work with glibc 2.33
+
+In glibc 2.33, they've removed the _STAT_VER and _MKNOD_VER definitions
+from public headers. They have no plans to add these back so pseudo needs
+to attempt its own definitions. There is some protection as if they were
+wrong and there was a mismatch, we'd get an error art runtime.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Backported [oe-core branch]
+---
+ ports/linux/portdefs.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/ports/linux/portdefs.h b/ports/linux/portdefs.h
+index a92e969..9545550 100644
+--- a/ports/linux/portdefs.h
++++ b/ports/linux/portdefs.h
+@@ -34,3 +34,22 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
+ #include <sys/syscall.h>
+ #include <sys/prctl.h>
+ #include <linux/seccomp.h>
++
++#ifndef _STAT_VER
++#if defined (__aarch64__)
++#define _STAT_VER 0
++#elif defined (__x86_64__)
++#define _STAT_VER 1
++#else
++#define _STAT_VER 3
++#endif
++#endif
++#ifndef _MKNOD_VER
++#if defined (__aarch64__)
++#define _MKNOD_VER 0
++#elif defined (__x86_64__)
++#define _MKNOD_VER 0
++#else
++#define _MKNOD_VER 1
++#endif
++#endif
+-- 
+2.30.1
+
diff --git a/meta/recipes-devtools/pseudo/files/0002-ports-linux-Add-wrapper-for-fstatat-fstatat64-in-gli.patch b/meta/recipes-devtools/pseudo/files/0002-ports-linux-Add-wrapper-for-fstatat-fstatat64-in-gli.patch
new file mode 100644
index 0000000000..8316770f3d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0002-ports-linux-Add-wrapper-for-fstatat-fstatat64-in-gli.patch
@@ -0,0 +1,77 @@
+From 7a5f9e43711d372f4f3c9346b3c3c2959b00770f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 15 Feb 2021 20:47:39 +0000
+Subject: [PATCH 2/3] ports/linux: Add wrapper for fstatat/fstatat64 in glibc
+ 2.33
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Backported [oe-core branch]
+---
+ ports/linux/guts/fstatat.c   | 15 +++++++++++++++
+ ports/linux/guts/fstatat64.c | 15 +++++++++++++++
+ ports/linux/wrapfuncs.in     |  2 ++
+ 3 files changed, 32 insertions(+)
+ create mode 100644 ports/linux/guts/fstatat.c
+ create mode 100644 ports/linux/guts/fstatat64.c
+
+diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
+new file mode 100644
+index 0000000..3267641
+--- /dev/null
++++ b/ports/linux/guts/fstatat.c
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2021 Linux Foundation; see
++ * guts/COPYRIGHT for information.
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int fstatat(int dirfd, const char *path, struct stat *buf, int flags)
++ *	int rc = -1;
++ */
++
++	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
++
++/*	return rc;
++ * }
++ */
+diff --git a/ports/linux/guts/fstatat64.c b/ports/linux/guts/fstatat64.c
+new file mode 100644
+index 0000000..c981e14
+--- /dev/null
++++ b/ports/linux/guts/fstatat64.c
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2021 Linux Foundation; see
++ * guts/COPYRIGHT for information.
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags)
++ *	int rc = -1;
++ */
++
++	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
++
++/*	return rc;
++ * }
++ */
+diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
+index aae0f0d..ea27392 100644
+--- a/ports/linux/wrapfuncs.in
++++ b/ports/linux/wrapfuncs.in
+@@ -22,9 +22,11 @@ int creat64(const char *path, mode_t mode);
+ int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
+ int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
+ int fstat(int fd, struct stat *buf); /* real_func=pseudo_fstat */
++int fstatat(int dirfd, const char *path, struct stat *buf, int flags);
+ int stat64(const char *path, struct stat64 *buf); /* real_func=pseudo_stat64 */
+ int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW */
+ int fstat64(int fd, struct stat64 *buf); /* real_func=pseudo_fstat64 */
++int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags);
+ int __xstat64(int ver, const char *path, struct stat64 *buf);
+ int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
+ int __fxstat64(int ver, int fd, struct stat64 *buf);
+-- 
+2.30.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba7b50355..173c5cfbe3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,8 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
+           file://0001-linux-portdefs.h-Fix-pseudo-to-work-with-glibc-2.33.patch \
+           file://0002-ports-linux-Add-wrapper-for-fstatat-fstatat64-in-gli.patch \
            "
 
 SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
-- 
2.30.1

