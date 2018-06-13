Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5107827E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 17:28:40 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id c41-v6so1916563plj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5mzCC6Agwciekd5v6gHJUY6mpi0ZzkHCyaxLFJYBNCU=;
	b=niuBZOgecDejuFDi3A3F018CzfV8mUDU361z0wk/J8bcUznM4mv7JvOe7zSF7RAIjD
	WlTrFbljfDBZ61OyWMNSbti7/aqtsvpfVY5gwZCN9/PXcr4lof6tx31DlJ7aousOtRzJ
	FpwQbKB18OHoSTsxsQbFRB+3TXWcz/xSeP+QpnX45fAh5bZkHU6/meocaAtHsvS1Wt2Q
	p0bMqSQRHQ/8iJdgE07+KGrDnqSyWf02uw12T9eaekL9m1N/+ywwjl4piKd9grZiujWB
	EI1/H7nZx5z1eBaGrZkC9TM4NfpwXx4klOQtkHVplZB6X3oX0tkjbVPzYPY7b440B7nH
	F6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5mzCC6Agwciekd5v6gHJUY6mpi0ZzkHCyaxLFJYBNCU=;
	b=LseMwF+i7/3kYvi50WmhbYcxfrYeJ5iTok6lTLqacpsd1wQ5JJL9w1q9hItoGG++j1
	MrkS1oxcY2gprP0dMfoz3XXHP118GuH6LouHU5cukhSP5yFGoWz6z5G1cuL1GCrXKsBn
	ysfOrpRjarwemxHBoky81WppaSk1CEEtWutxiPLuj3u2qvkkYGPd2marBAaq+G3Py0as
	9uQYFc5ZdYcPjZSY79jRIYus+3M7tBG9Z0hyX8K7zRXyBMaW3twoPb4cJXvXtq1Mq38e
	nNyj80ocEVy89wYevNdqziKAFAU51SGcYABs1RrM7dOakVfJHLunWCAABC3FeEwTgZ8e
	EahQ==
X-Gm-Message-State: APt69E1WhBhG5rQ0XvWXJiyyaYXhu5K06CZb0CIVSp4xAAq0/v7ndihi
	uLQ2L2qs5HEUVamEsktu9FZ3ag==
X-Google-Smtp-Source: ADUXVKJ7nLlTr6znPOJsNMQNcDhdsY/R61PVnOFSihbwHJ5Yh7xchfAnsXwgSnlD1JtpoxSnFzoPlw==
X-Received: by 2002:a17:902:9b82:: with SMTP id
	y2-v6mr6156909plp.69.1528910921428; 
	Wed, 13 Jun 2018 10:28:41 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q71-v6sm4077619pfd.165.2018.06.13.10.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jun 2018 10:28:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 10:28:35 -0700
Message-Id: <1528910915-4480-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc8: drop stray uClibc specific patch
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
X-List-Received-Date: Wed, 13 Jun 2018 17:28:40 -0000

The patch was previously removed for gcc7 but came back with gcc8.

  http://git.openembedded.org/openembedded-core/commit/?id=f71bc69e5b7581c53071055b694bb0dbfe4b4a87

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc              |  1 -
 .../gcc/gcc-8.1/0002-c99-snprintf.patch            | 28 ----------------------
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index cb0fbd9..d83ba65 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -32,7 +32,6 @@ BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0002-c99-snprintf.patch \
            file://0003-gcc-poison-system-directories.patch \
            file://0004-gcc-poison-dir-extend.patch \
            file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
deleted file mode 100644
index aa123b4..0000000
--- a/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5fbfcf247ed6dd01263639daf0c9c3a291e2fd3a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:49:03 +0400
-Subject: [PATCH 02/39] c99-snprintf
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- libstdc++-v3/include/c_std/cstdio | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_std/cstdio
-index 1b9571eaa8d..ad816be4fd1 100644
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@ namespace std
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99_STDIO
-+#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
--- 
-2.17.0
-
-- 
1.9.1


