Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0591774725
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 07:20:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y69so7811780pfb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1ppQRKzRjNQX3U8Wafx6nKrLSr+pd+R9NzebqJp+SNk=;
	b=BFD33mTr3gruwwoI3n9dpW/CmDpoq1XgZbbOV1ek78iFFWPx3VraUpnkylwjjAjTyH
	2Ve9hOzyIYmQs9geLlG/TkShvFFm5NzyuoC6Tw+MP2uc/8v2Wg+UPoadGG6vSGBjJUr/
	vtQcyIYCNlvGyZr/sVIjx9pJ7rHHF4UJEQI52rMXTwGvVnhdAC+Yz2sk89EmKjWQ9epx
	xO2FE3BiuKYklYCPv7+fNj5CVRmhDIezRUoNZ7sJmO+YKG7+Pmy30oKhoQHMsl4UD0gH
	D4V3MtEz4/AJrGTN+uXLHiFzt3+CbZSMNBFyTGPPxckriiPXsXQwLgdhZunCCsMRClFT
	TsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1ppQRKzRjNQX3U8Wafx6nKrLSr+pd+R9NzebqJp+SNk=;
	b=HCwVNN8UN+OT09UxVb3DJU94rPNuxpOfsNuzwhMo2Qu9udWp+MY33R/uUv70MnjXse
	E76Akzl6+XLHyu1LUHP9e7Ssgp+xXm7XfieF7D1ObG11eM47stEF3AjSFs0BjsILt3UL
	/8td1vpKGlPCiBQGLSZ9OJpnuB+qqhF7KvLtw57nsmFKnGBaIwkikbPYvEYsax88+J/d
	eX5KL95MBp03+M+Tgla8C6sqnAnKSIOYhhl+tAQLh9+I+mdxeP01md7HU0K6tU/bxsbb
	mBKyCjOyonAaoF5LvwsrqMk7GzRWlEhKtHA/DfIcKS9BqkXy0scPhIJ6GuGfaA0TUMq0
	Bd4A==
X-Gm-Message-State: AElRT7ExCDpjODrmmpobTaN0wrhIdOCZANwuapjOKAzAgePZf99cI9Gu
	n7UbrdlTtjgaO0p4i5NCj7Uumg==
X-Google-Smtp-Source: AIpwx4/jgBay4WQOEPpnxMJWIunNBP2o7Jh2tALc8Ev1N2IilmuduZFtrzYlYsPg9ejqeRVsYmPdeg==
X-Received: by 10.101.89.6 with SMTP id f6mr3357888pgu.178.1522567201511;
	Sun, 01 Apr 2018 00:20:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	x128sm21481749pgb.31.2018.04.01.00.20.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 00:20:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 00:19:46 -0700
Message-Id: <bba83c6d8f4a7fc752066be5334a87f39c73ee68.1522567040.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522567040.git.raj.khem@gmail.com>
References: <cover.1522567040.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] llvm: Upgrade to 6.0 release
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
X-List-Received-Date: Sun, 01 Apr 2018 07:20:01 -0000

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


