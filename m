Return-Path: <ricardo@foundries.io>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id EC3857E726
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:05:02 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id m29so1915663qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nETa+zJPyAGGY624cclmtHvd/bMDqSUOQ5jZMee2QFs=;
	b=DfOFGEpLkC/Gmln7Kkjteq8+7YRAZ2oEKJNvQzqKi4ud2TmPqHH/+x0XR/6Ofeq12x
	5pf25suY5b5JdAyitObQIZp1dl2P2982ejn1c5Yla2VgI3hYnTqYc9KLKEEyeYmBweRi
	3wG9YDwXXu+ZKFyveZxO9fgDV/2hoY/QoI6OAVxBlqBX43HoZW1vUP3K0luvQ+NobJpT
	vEL5CfUsYeMeAdQ/15HTh8+6jNDzy/q8eTkaeXPLbYaiZn/87Q9fQRvSlblXf8jQF1qK
	wT5k3XnIKSgRqQzY0QS03bnwrg6fpMYBG1TUaTRkUijQc0YyPyV/qaM+0Rc8NiHsNTxh
	r5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nETa+zJPyAGGY624cclmtHvd/bMDqSUOQ5jZMee2QFs=;
	b=fmeF/KxkRVEQ4tdVwERbm+LofJfl/T8b0G1QVIEjNOMzmaBU73rRIojRSN8mFTlouQ
	uY8OIuiHe3TBT7oaykX17slMWBRddxpQg9+vX9q18ghNrsguoUYAnT/4z8d20LIwFPrF
	kZ1J9J5FaDiS0QlBtdZiuy4MZCFpd98HFGK5HMDY/Ie8e3d8J5yIVn8oRwfutDN3Zhd+
	M642ahl8cW8qrzWkxnS/aSw7q2Z1m2sutY7b/Am3hHPyUmDd1/th9nh4CmGjPHT13wwK
	f33LNhcN1p8Cse2HWbBj1oUMt5NdBHy5+Q4BvKYRRYv3QVjfCy11pQBmo13/2uPE9qwE
	pm+A==
X-Gm-Message-State: APjAAAXzyMD/O6qbVK+G49aUnKt8J0QK9VGlTdla1+qmWbsI4mPL6Y7/
	iqOM6mXuepAXPA0DERnpZ8gNp6H8pQ==
X-Google-Smtp-Source: APXvYqyZq0VoyZpCrx71ochiK3WOpHjF/ukELXKOBeGCiqolhOImHflYaVd6E5iPD0BKdL5GqfC7jw==
X-Received: by 2002:ad4:4112:: with SMTP id i18mr26791343qvp.175.1562169903365;
	Wed, 03 Jul 2019 09:05:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:bade:802c:ed43:8f2e:1ee5:17d7])
	by smtp.gmail.com with ESMTPSA id a6sm872207qkn.59.2019.07.03.09.05.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 09:05:02 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 13:04:41 -0300
Message-Id: <20190703160441.19644-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] gcc-9.1: add back GLIBC_DYNAMIC_LINKER riscv changes
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
X-List-Received-Date: Wed, 03 Jul 2019 16:05:03 -0000
Content-Transfer-Encoding: 8bit

The riscv GLIBC_DYNAMIC_LINKER changes were dropped during the gcc 9.1
update, breaking usrmerge support.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index f23a314c13..1ff85c8073 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 492f008dce784749e39e1c396aeea6fa1d977374 Mon Sep 17 00:00:00 2001
+From 0e13b09ae400d8c8755e2869c72a158ed0dbc0b6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH 12/37] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -23,11 +23,12 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/i386/linux64.h    |  6 +++---
  gcc/config/linux.h           |  8 ++++----
  gcc/config/mips/linux.h      | 12 ++++++------
+ gcc/config/riscv/linux.h     |  2 +-
  gcc/config/rs6000/linux64.h  | 15 +++++----------
  gcc/config/sh/linux.h        |  2 +-
  gcc/config/sparc/linux.h     |  2 +-
  gcc/config/sparc/linux64.h   |  4 ++--
- 11 files changed, 28 insertions(+), 33 deletions(-)
+ 12 files changed, 29 insertions(+), 34 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
 index 824861befec..6afacce3292 100644
@@ -152,11 +153,24 @@ index 6f79ac9c01a..25de96f9561 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index 58dd18b89f3..112ba9cd764 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
+     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
+   } while (0)
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
+ 
+ #define MUSL_ABI_SUFFIX \
+   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index bcc540b5ff2..982ca274621 100644
+index 5380f6a6a6f..c0f2dc1f43e 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -428,24 +428,19 @@ extern int dot_symbols;
+@@ -435,24 +435,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -200,10 +214,10 @@ index c9897b7aca5..82f275319cc 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 2db9ea2172e..1979cfff5d3 100644
+index 08476f1d94d..80440e712ad 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
-@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -213,7 +227,7 @@ index 2db9ea2172e..1979cfff5d3 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 21e13001951..d39c38a531f 100644
+index 789d1df4bd5..b920c680fb1 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
-- 
2.22.0


