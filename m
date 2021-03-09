Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.95.1615320842711784473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 12:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=KU3C94Ur;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0D60A5C0106;
	Tue,  9 Mar 2021 15:14:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 09 Mar 2021 15:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=ScFk5DNzMNbB0O42PIjg6fITb2
	NbC1pAVAAc6QwhXok=; b=KU3C94UrAdAw+smMXPxNVVBJFteXsK/c3NuMjcmKai
	z/VqJSAxyPyjlrXEvlfa3ijL46wC0Y5FkzlPfL1L8Db8XYj2dAh0PyJlCK8MH2as
	2spCwhpQeBScDc0jwKbbIqY35PCREQ3UoDuGFBX/BGmn/tg9f85xeoKF5M32lqyd
	M1pW/ZOZXaiQlCERXCdB4ZA43Ydkf9pfS+MgNGru7vt3t8kjgrcma/nsdAOqBnfg
	CJNS/Eim6tpotuiOhVoyrY4WewNx9SrLCxgj+bq5oX9fv1216FWEOEwqtywrmFGz
	mYdR9eV1WuaRJx7WxySOz0kAq7Jk6fvFoBcsGGR+48vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ScFk5DNzMNbB0O42P
	Ijg6fITb2NbC1pAVAAc6QwhXok=; b=bi/ouHvC2vljuSlJRMi11yPskdV8al4oB
	xGFOmkRmpjOeaKwo9tKfuMT5yzyJiUBDxnwuYxJ2tO1RznQSH3ErwDT5swW+IpyL
	SIfrsnWXAq6bjLQXI1MIBE4Wq2IjkCGni39e0f/AJAc6QFEXbgesIAvw4AovFr6S
	/Ht9vntCwl5kh+CDP1YanDGBerm1GucSjcPE3PfVlOARIW8CP4ZBjNASyF+dmI7l
	MJ1NKsIRdQgjderx7U+Io7J2GfGXzehWtwtWYpPc0Feb0SzHIO6S9/6J4q5OxokK
	DX5AY/eR16p1ScZYLgvGxfwGpl1Bp9eBMbnPpzfIimj8E8qI09GRA==
X-ME-Sender: <xms:CddHYMQXgAZtWSUpccaCojBelU3MqnUwK_rXHdNxzTXSQVUAhDVbEg>
    <xme:CddHYJxSigIM-PEv8SWgI-sEuxkct0a2O-RiTEn5qVCYypWBJ_fN30DyfxBkbhOXN
    iwWbsXUAbVaBOCY5Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnheptedtffekfedtkeffudelgfdtge
    efkeegfeefkeetgeefudfgkefhffeuvefhudeinecuffhomhgrihhnpehsohhurhgtvgif
    rghrvgdrohhrghdpghhnuhdrohhrghenucfkphepuddtledrudegiedrfeejrddukedvne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:CddHYJ2sTcJW7o4ONWdm8sWt6q4QJ7W3g7zIHizdUI-xIK4y1u7GMw>
    <xmx:CddHYAD5xg9N3GApzyTnL4zoOPrHYVCl9CF0dFZGsZyxLnZ9YGMCLA>
    <xmx:CddHYFjJsUOZHsH9QLfVHXopHFbu30hrpf4PQUpHvlhSUpAsbprtEA>
    <xmx:CtdHYFLgNuih7Vv6BSvD5ygHUkb7y-tQUijeOAcPq4iGYjhYUFRWyQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1438D1080059;
	Tue,  9 Mar 2021 15:13:59 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] glibc: Backport patch to fix _SC_LEVEL1_ICACHE_LINESIZE
Date: Tue,  9 Mar 2021 20:13:21 +0000
Message-Id: <20210309201321.1200205-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch

diff --git a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
new file mode 100644
index 0000000000..3a004e227f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
@@ -0,0 +1,185 @@
+From 750b00a1ddae220403fd892a6fd4e0791ffd154a Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Fri, 18 Sep 2020 07:55:14 -0700
+Subject: [PATCH] x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]
+
+    x86: Move x86 processor cache info to cpu_features
+
+missed _SC_LEVEL1_ICACHE_LINESIZE.
+
+1. Add level1_icache_linesize to struct cpu_features.
+2. Initialize level1_icache_linesize by calling handle_intel,
+handle_zhaoxin and handle_amd with _SC_LEVEL1_ICACHE_LINESIZE.
+3. Return level1_icache_linesize for _SC_LEVEL1_ICACHE_LINESIZE.
+
+Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27444]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ sysdeps/x86/Makefile                          |  8 +++
+ sysdeps/x86/cacheinfo.c                       |  3 +
+ sysdeps/x86/dl-cacheinfo.h                    |  6 ++
+ sysdeps/x86/include/cpu-features.h            |  2 +
+ .../x86/tst-sysconf-cache-linesize-static.c   |  1 +
+ sysdeps/x86/tst-sysconf-cache-linesize.c      | 57 +++++++++++++++++++
+ 6 files changed, 77 insertions(+)
+ create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize-static.c
+ create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize.c
+
+diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
+index dd82674342..d231263051 100644
+--- a/sysdeps/x86/Makefile
++++ b/sysdeps/x86/Makefile
+@@ -208,3 +208,11 @@ $(objpfx)check-cet.out: $(..)sysdeps/x86/check-cet.awk \
+ generated += check-cet.out
+ endif
+ endif
++
++ifeq ($(subdir),posix)
++tests += \
++  tst-sysconf-cache-linesize \
++  tst-sysconf-cache-linesize-static
++tests-static += \
++  tst-sysconf-cache-linesize-static
++endif
+diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
+index 7b8df45e3b..5ea4723ca6 100644
+--- a/sysdeps/x86/cacheinfo.c
++++ b/sysdeps/x86/cacheinfo.c
+@@ -32,6 +32,9 @@ __cache_sysconf (int name)
+     case _SC_LEVEL1_ICACHE_SIZE:
+       return cpu_features->level1_icache_size;
+ 
++    case _SC_LEVEL1_ICACHE_LINESIZE:
++      return cpu_features->level1_icache_linesize;
++
+     case _SC_LEVEL1_DCACHE_SIZE:
+       return cpu_features->level1_dcache_size;
+ 
+diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
+index a31fa0783a..7cd00b92f1 100644
+--- a/sysdeps/x86/dl-cacheinfo.h
++++ b/sysdeps/x86/dl-cacheinfo.h
+@@ -707,6 +707,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
+   long int core;
+   unsigned int threads = 0;
+   unsigned long int level1_icache_size = -1;
++  unsigned long int level1_icache_linesize = -1;
+   unsigned long int level1_dcache_size = -1;
+   unsigned long int level1_dcache_assoc = -1;
+   unsigned long int level1_dcache_linesize = -1;
+@@ -726,6 +727,8 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
+ 
+       level1_icache_size
+ 	= handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
++      level1_icache_linesize
++	= handle_intel (_SC_LEVEL1_ICACHE_LINESIZE, cpu_features);
+       level1_dcache_size = data;
+       level1_dcache_assoc
+ 	= handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
+@@ -753,6 +756,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
+       shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
+ 
+       level1_icache_size = handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
++      level1_icache_linesize = handle_zhaoxin (_SC_LEVEL1_ICACHE_LINESIZE);
+       level1_dcache_size = data;
+       level1_dcache_assoc = handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);
+       level1_dcache_linesize = handle_zhaoxin (_SC_LEVEL1_DCACHE_LINESIZE);
+@@ -772,6 +776,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
+       shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
+ 
+       level1_icache_size = handle_amd (_SC_LEVEL1_ICACHE_SIZE);
++      level1_icache_linesize = handle_amd (_SC_LEVEL1_ICACHE_LINESIZE);
+       level1_dcache_size = data;
+       level1_dcache_assoc = handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
+       level1_dcache_linesize = handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);
+@@ -833,6 +838,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
+     }
+ 
+   cpu_features->level1_icache_size = level1_icache_size;
++  cpu_features->level1_icache_linesize = level1_icache_linesize;
+   cpu_features->level1_dcache_size = level1_dcache_size;
+   cpu_features->level1_dcache_assoc = level1_dcache_assoc;
+   cpu_features->level1_dcache_linesize = level1_dcache_linesize;
+diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/cpu-features.h
+index 624736b40e..39a3f4f311 100644
+--- a/sysdeps/x86/include/cpu-features.h
++++ b/sysdeps/x86/include/cpu-features.h
+@@ -874,6 +874,8 @@ struct cpu_features
+   unsigned long int rep_stosb_threshold;
+   /* _SC_LEVEL1_ICACHE_SIZE.  */
+   unsigned long int level1_icache_size;
++  /* _SC_LEVEL1_ICACHE_LINESIZE.  */
++  unsigned long int level1_icache_linesize;
+   /* _SC_LEVEL1_DCACHE_SIZE.  */
+   unsigned long int level1_dcache_size;
+   /* _SC_LEVEL1_DCACHE_ASSOC.  */
+diff --git a/sysdeps/x86/tst-sysconf-cache-linesize-static.c b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
+new file mode 100644
+index 0000000000..152ae68821
+--- /dev/null
++++ b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
+@@ -0,0 +1 @@
++#include "tst-sysconf-cache-linesize.c"
+diff --git a/sysdeps/x86/tst-sysconf-cache-linesize.c b/sysdeps/x86/tst-sysconf-cache-linesize.c
+new file mode 100644
+index 0000000000..642dbde5d2
+--- /dev/null
++++ b/sysdeps/x86/tst-sysconf-cache-linesize.c
+@@ -0,0 +1,57 @@
++/* Test system cache line sizes.
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <array_length.h>
++
++static struct
++{
++  const char *name;
++  int _SC_val;
++} sc_options[] =
++  {
++#define N(name) { "_SC_"#name, _SC_##name }
++    N (LEVEL1_ICACHE_LINESIZE),
++    N (LEVEL1_DCACHE_LINESIZE),
++    N (LEVEL2_CACHE_LINESIZE)
++  };
++
++static int
++do_test (void)
++{
++  int result = EXIT_SUCCESS;
++
++  for (int i = 0; i < array_length (sc_options); ++i)
++    {
++      long int scret = sysconf (sc_options[i]._SC_val);
++      if (scret < 0)
++	{
++	  printf ("sysconf (%s) returned < 0 (%ld)\n",
++		  sc_options[i].name, scret);
++	  result = EXIT_FAILURE;
++	}
++      else
++	printf ("sysconf (%s): %ld\n", sc_options[i].name, scret);
++    }
++
++  return result;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index c47826a51e..ac73bbeb7f 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -45,6 +45,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
            file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
+           file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.1

