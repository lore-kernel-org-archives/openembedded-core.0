Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63703731F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:20 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so5033520pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=b3bNY5deVoiOQPAoMgjKuXwk2biIEPBfvL6lwabsNwA=;
	b=d3DN1ME3NA3oRDox4d8TZQJiRX406lxlXc9Yd1khQ8ziO/3jZt3SCAsm6Os6O8VlvS
	xXbhnZGcLLPnIaRwFQzEmy4zbf5rYlbmSJorj+Kt0gn/Aslexf5g4z7BcbKLbuzxYzwS
	bLXU79M5sa7vPupfmUgP/9cQKcW3NfIUTIUYKL5c+chL9cK1vZIneAQwy2LvCT1vwKwG
	6Eg2O50j7MLZeoXgGXL9RqbYln2Ijta1AzQLZS3EvqQIJS8lcSJK+2s24WuD5OOaTgrH
	B0Zwv8DjRFkdqt5ev7IUcptAzJh0z/GQmWacz9Q9mbzRaeFmP+UegDEA2ecTPa5We14n
	HrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b3bNY5deVoiOQPAoMgjKuXwk2biIEPBfvL6lwabsNwA=;
	b=anMAoParo/7dCALlr0YiQV+AOSKRr9ucfUjMlORP4eQWpAdZ6bWVUkzL40IoG5QOhF
	+RvfXQOD8PJ3121QSbKSKmNp2nTLD06CsWHTxK49dPs8nBAKcvOwgDd4Dgt9c1icLKL0
	h7rzE3AY+QNprrpqNFZk2VjZ+8gKcWIOMokW2n2gN7bECOFmFHNPgSa0SyzXA+5R7PqC
	1M1YVjHMrmOttW0zLu4uB2FHL5bEKDuPHEygbEo2b3K/rDlOZkmlVOzrjjsC6NnQu6vm
	xPt/dhEH7hehVAH0MxcbQX5bxZHVtMX3kD2lg8Lio75IAzSyA4OCFQDtMaEbWFIBoWv6
	glRA==
X-Gm-Message-State: AOPr4FWhjB8ifq3hb6549ClSC8WNGpHXpa2apbZIKFAG/XkMANpcqEclAXngFZm07nZatg==
X-Received: by 10.98.9.154 with SMTP id 26mr6724875pfj.121.1462988181344;
	Wed, 11 May 2016 10:36:21 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:32 -0700
Message-Id: <d8a611007b124b3dca74d456f69e7a228fb5915b.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 29/42] libunwind: Upgrade to 1.2rc1+
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
X-List-Received-Date: Wed, 11 May 2016 17:36:20 -0000

This helps in compiling with gcc6
drop patches backported to 1.1
remove musl conditional patches, they should work
on glibc too now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...roduce-build-support-for-aarch64_be-targe.patch | 33 ---------------------
 ...-wrong-big_endian-flag-in-aarch64_be-case.patch | 34 ----------------------
 2 files changed, 67 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
deleted file mode 100644
index b8afb90..0000000
--- a/meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 743668f66916b6bb03c92b04be5216400951ace6 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky@linaro.org>
-Date: Wed, 3 Dec 2014 17:35:43 -0800
-Subject: [PATCH 1/2] aarch64: introduce build support for aarch64_be target
-
-Upstream-Status: backport
-
-Introduce support for aarch64_be, aarch64 big endian, target.
-We would like to reuse all code that was done for aarch64
-(little endian) target. So we do similar thing that is done
-for ARM v7 (arm) target for any aarch64* arch we set it
-just to aarch64.
-
-Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 582e71f..c59f526 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -88,6 +88,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- 
- AC_DEFUN([SET_ARCH],[
-     AS_CASE([$1],
-+        [aarch64*],[$2=aarch64],
-         [arm*],[$2=arm],
-         [i?86],[$2=x86],
-         [hppa*],[$2=hppa],
--- 
-1.9.1
-
diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch b/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
deleted file mode 100644
index 2ae4477..0000000
--- a/meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 16e98c8cf37b006c3879ee57acc23c9af13c40d5 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky@linaro.org>
-Date: Wed, 3 Dec 2014 17:35:44 -0800
-Subject: [PATCH 2/2] aarch64: fix wrong big_endian flag in aarch64_be case
-
-Upstream-Status: backport
-
-Set local_addr_space.big_endian flag according to current target
-endianness. Before it was set by memset to 0, which corresponds
-to little endian and it worked perfectly fine for aarch64.
-But it breaks aarch64_be because dwarf_readu16, dwarf_readu32,
-etc functions do not read values correctly since they operate
-with wrong idea about current target endianness.
-
-Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
----
- src/aarch64/Ginit.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/aarch64/Ginit.c b/src/aarch64/Ginit.c
-index 0bc8997..b9181ef 100644
---- a/src/aarch64/Ginit.c
-+++ b/src/aarch64/Ginit.c
-@@ -181,6 +181,7 @@ aarch64_local_addr_space_init (void)
-   local_addr_space.acc.access_fpreg = access_fpreg;
-   local_addr_space.acc.resume = aarch64_local_resume;
-   local_addr_space.acc.get_proc_name = get_static_proc_name;
-+  local_addr_space.big_endian = (__BYTE_ORDER == __BIG_ENDIAN);
-   unw_flush_cache (&local_addr_space, 0, 0);
- }
- 
--- 
-1.9.1
-
-- 
2.8.2


