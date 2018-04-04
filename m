Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1DC974CD6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:45:37 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 91-v6so14570956pld.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1ppQRKzRjNQX3U8Wafx6nKrLSr+pd+R9NzebqJp+SNk=;
	b=MccNGNaHuvU84blJ90JOSDhDqf+b4HbUzTwRGzdONVAK763e1gw1KQMD9uUGvM6jXR
	0GaTYM/EmwxvOTqxjfYZG7YCf9pMJYBYviKFSQNVsLek11a9Px/90HLw/riJnrqnGnKR
	246XUJON4dAQ4AySRSEuLlVMicOUcaeOYVpqjHi/7gESQNvaZVWY28nIj10w13VwvzE8
	nnRQlLjUMF7wHSSA8JZngh1JSDUX7PO6npTXLarB+Paee+YzuaLO2d8PWHfFxTGc/Lzn
	8jv2OXGbyMGoDjrhLs3RsHQNQ2fWdszxASOWDek8BAl035sETnKmOk4Qerqx0uhwBR4b
	wR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1ppQRKzRjNQX3U8Wafx6nKrLSr+pd+R9NzebqJp+SNk=;
	b=mOuxJr/PxKl8K1TL5xv1rTUq+Mc/oMopzy/zxnwlo1BSgceqgRRbQ3RnuVeK3fnZ74
	irRJdA1K/7NXQxMm+5a7wiJH4doJOQ108ymgGbia5OanvVcWi9GLEpbRhjy/SPZCmUgM
	U5E9W17RNmuf8WBe2Jb7RyePnzzRRVyMILB68qh8zPSP7F0GYRmD7gJ0D8pRyGvOXtuH
	JyA5UOWLEJHlp3guayGgaOQ6p6zV32emgiuRsMhmJ589hpe9aBfB0kafl91hORdO7bi6
	309MWqzyMT6CsF/P5Jz/yIX7YXGdMyUkWQ90+ApePQRul20WHydZIKxKZwrVdTe4nkx2
	MdQA==
X-Gm-Message-State: AElRT7GW4JJyee0AmUtYgOsFwmnidZwO+OXXgkLjYFR96ZN6RZeRYLOV
	FNrmBmT5ZvwgN231IuvV1RzhxQ==
X-Google-Smtp-Source: AIpwx4+OQ8phoInbWSjb9oE58F7ZfmZCltDo5r+GDaXii0alwgVKjMj3x+5PljlsrsgaLadnaLSnIQ==
X-Received: by 2002:a17:902:8304:: with SMTP id
	bd4-v6mr19171885plb.70.1522856738232; 
	Wed, 04 Apr 2018 08:45:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b184sm3611392pfg.110.2018.04.04.08.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 08:45:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 08:45:28 -0700
Message-Id: <78b6ff5dc94c3988a8ce3e77e432af78d55d4e9b.1522856627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522856627.git.raj.khem@gmail.com>
References: <cover.1522856627.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] llvm: Upgrade to 6.0 release
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
X-List-Received-Date: Wed, 04 Apr 2018 15:45:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...etLibraryInfo-Undefine-libc-functions-if-th.patch | 20 ++++++++++----------
 .../0002-llvm-allow-env-override-of-exe-path.patch   |  4 ++--
 meta/recipes-devtools/llvm/llvm_git.bb               | 11 ++++++-----
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index e251799259..209764c8ba 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,4 +1,4 @@
-From 28293e48cf1a52004c6a78de448718441f9e05f9 Mon Sep 17 00:00:00 2001
+From 96558c4f25d5132936014f6f2d6252cfdfdf478a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
 Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if they
@@ -15,10 +15,10 @@ Upstream-Status: Pending
  1 file changed, 21 insertions(+)
 
 diff --git a/include/llvm/Analysis/TargetLibraryInfo.def b/include/llvm/Analysis/TargetLibraryInfo.def
-index 9cbe917c146..aff8419cf54 100644
+index a461ed813b9..f9fd9faeee0 100644
 --- a/include/llvm/Analysis/TargetLibraryInfo.def
 +++ b/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
+@@ -665,6 +665,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
  TLI_DEFINE_ENUM_INTERNAL(fopen)
  TLI_DEFINE_STRING_INTERNAL("fopen")
  /// FILE *fopen64(const char *filename, const char *opentype)
@@ -28,7 +28,7 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_ENUM_INTERNAL(fopen64)
  TLI_DEFINE_STRING_INTERNAL("fopen64")
  /// int fprintf(FILE *stream, const char *format, ...);
-@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
+@@ -700,6 +703,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
  /// int fseeko(FILE *stream, off_t offset, int whence);
  TLI_DEFINE_ENUM_INTERNAL(fseeko)
  TLI_DEFINE_STRING_INTERNAL("fseeko")
@@ -38,7 +38,7 @@ index 9cbe917c146..aff8419cf54 100644
  /// int fseeko64(FILE *stream, off64_t offset, int whence)
  TLI_DEFINE_ENUM_INTERNAL(fseeko64)
  TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
+@@ -710,6 +716,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
  TLI_DEFINE_ENUM_INTERNAL(fstat)
  TLI_DEFINE_STRING_INTERNAL("fstat")
  /// int fstat64(int filedes, struct stat64 *buf)
@@ -48,7 +48,7 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_ENUM_INTERNAL(fstat64)
  TLI_DEFINE_STRING_INTERNAL("fstat64")
  /// int fstatvfs(int fildes, struct statvfs *buf);
-@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
+@@ -725,6 +734,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
  TLI_DEFINE_ENUM_INTERNAL(ftello)
  TLI_DEFINE_STRING_INTERNAL("ftello")
  /// off64_t ftello64(FILE *stream)
@@ -58,7 +58,7 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_ENUM_INTERNAL(ftello64)
  TLI_DEFINE_STRING_INTERNAL("ftello64")
  /// int ftrylockfile(FILE *file);
-@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
+@@ -845,6 +857,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
  TLI_DEFINE_ENUM_INTERNAL(lstat)
  TLI_DEFINE_STRING_INTERNAL("lstat")
  /// int lstat64(const char *path, struct stat64 *buf);
@@ -68,7 +68,7 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_ENUM_INTERNAL(lstat64)
  TLI_DEFINE_STRING_INTERNAL("lstat64")
  /// void *malloc(size_t size);
-@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
+@@ -1064,6 +1079,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
  TLI_DEFINE_ENUM_INTERNAL(stat)
  TLI_DEFINE_STRING_INTERNAL("stat")
  /// int stat64(const char *path, struct stat64 *buf);
@@ -78,7 +78,7 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_ENUM_INTERNAL(stat64)
  TLI_DEFINE_STRING_INTERNAL("stat64")
  /// int statvfs(const char *path, struct statvfs *buf);
-@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
+@@ -1193,6 +1211,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
  TLI_DEFINE_ENUM_INTERNAL(tmpfile)
  TLI_DEFINE_STRING_INTERNAL("tmpfile")
  /// FILE *tmpfile64(void)
@@ -89,5 +89,5 @@ index 9cbe917c146..aff8419cf54 100644
  TLI_DEFINE_STRING_INTERNAL("tmpfile64")
  /// int toascii(int c);
 -- 
-2.13.1
+2.16.1
 
diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
index 832bd729ef..21d2f81b58 100644
--- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From d776487bac17650704614248d19d1e6b35775001 Mon Sep 17 00:00:00 2001
+From 2f8ea767afdaa440c6368040630e1b3ea6a0977a Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH 2/2] llvm: allow env override of exe path
@@ -35,5 +35,5 @@ index 08b096afb05..d8d7742744e 100644
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
 -- 
-2.13.1
+2.16.1
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de06e12ae4..77c095d9a3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -8,7 +8,7 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
 
-DEPENDS = "libffi libxml2-native zlib ninja-native llvm-native"
+DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
 
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
@@ -19,10 +19,11 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "81029f142231bde8e119becda112a2173f1459c9"
-PV = "5.0"
-PATCH_VERSION = "1"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http \
+SRCREV = "089d4c0c490687db6c75f1d074e99c4d42936a50"
+PV = "6.0"
+BRANCH = "release_60"
+PATCH_VERSION = "0"
+SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
-- 
2.16.3


