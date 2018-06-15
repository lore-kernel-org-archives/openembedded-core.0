Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D60577112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:08:15 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f1-v6so5501781plt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EZlnfIiyUULGtlKUQtLxxCaeEzTaJ+4iHBsvKKKUpWw=;
	b=gtJlITKd/8MIch4dbR8oYfMgV75ViQEBTWl7zSUYNy1DOH6DRhBQHKPpsBcaBEG9rJ
	EkU8HTmKNe0fjnAysBoz+HkBSvIJg91hOrlWzZsGmUTI/IWpvyx2d3N0HR4OyJXh7sDV
	fDwbTjnSaGG8ihU23XAWloKN6r/3YVR1ICXa5/SrvtMupkS1dwwhjhAPGrq7wKyQgWt6
	+18TrLXrbdSYu2Iu51g5FP4VjsnBPE1HerOLjrJ8Xi3OdXSErH1RH7aWeNg1ral77YYO
	WUwGY+1x1gdCx0ic8Q3gxfSfJAjaYyE1k/X4+TmaTPkz3KSYprmzGXyh660zl9LpqIEV
	u/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EZlnfIiyUULGtlKUQtLxxCaeEzTaJ+4iHBsvKKKUpWw=;
	b=nrpcicyXEEMo+I8WADj7+2/YM0xvhjDi8Z0BtDj7IZH+/8gGOGTZovI7U8VJMibo3P
	PR64jHBNk55m2TQCuit/EVPC6Sadc81yXeYg1mDej+6FDjNX4RLAaATbYi5+erEl03RN
	NzPARVF6VM96yoGJvVkA5yvf9XEtQlIK355okZtQRsQYLMsHzsLzqsVZXtVPBa0rULmI
	7dptMe/UzV24NJNt15ZQvdmMl06GxSm9H7D5nPkqPX1TYWws1xS6W+vtYm4NZws/hkIA
	xQiBsb6GzpxZp7UfaBzQG2nUxejA4wMkFYBQjoFm4kOlpNOgAkiQ96iGN6KNdj0GtMcq
	40Cg==
X-Gm-Message-State: APt69E1OI72r3GtAFJoMzEi5JfPIJFwncKLPs69iprK+2YlOw0J12Ba3
	3HGItQ/TRFTVS2L9o9oY2jBuiA==
X-Google-Smtp-Source: ADUXVKI7riVYOfZSi8Ef7umlsjUTcg201rRQLUeYgN170pXuNu/UQ7P0h0OzmHaEPjEsqHQH3fGG8A==
X-Received: by 2002:a17:902:4424:: with SMTP id
	k33-v6mr2490683pld.242.1529075296071; 
	Fri, 15 Jun 2018 08:08:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p1-v6sm13069521pfp.137.2018.06.15.08.08.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 08:08:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 08:08:15 -0700
Message-Id: <4c34013aff0916d9eef169deee2d26211eb720e8.1529075133.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529075133.git.raj.khem@gmail.com>
References: <cover.1529075133.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc8: drop stray uClibc specific patch
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
X-List-Received-Date: Fri, 15 Jun 2018 15:08:15 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The patch was previously removed for gcc7 but came back with gcc8.

  http://git.openembedded.org/openembedded-core/commit/?id=f71bc69e5b7581c53071055b694bb0dbfe4b4a87

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc         |  1 -
 .../gcc/gcc-8.1/0002-c99-snprintf.patch       | 28 -------------------
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index cb0fbd9379..d83ba6555e 100644
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
index aa123b41a1..0000000000
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
2.17.1


