Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web12.4176.1617860475742792360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WisbUD9S;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860474; i=@fujitsu.com;
	bh=PnVbjFjC5Pe/rMQJQJLz0qRl2gOVcJa8pfXDUx2L64s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WisbUD9S4EeS6GhVZRN0cYL3dD7kI/3SAAnJGlk0Xg5RIPDQOogBl9fRAeBitFpDz
	 9nKHdb5LzsXDT7FfcAcbTWEh16ReaEL75QlKtqMCfSvOo/lLzn8HaCBtna4OKvc4Ge
	 1gkUQwXaeQwgG3YKc3p1Ne+8K1qvRPbsmxNXG3fP6I3elL7ZNZl2inBjNlkIVRZzBt
	 pKYfAEr+rRkgs2bKAXismmIGujoxXKdz/b+ODVDZu4TwEW/FEiBWSI5Myo3T1Uf2wN
	 aEez+tgy65qogDfhu2bpmdMxJoGUj4odzwYkugJnDW5XRkeT0ucIYX7lCfu+IPobzY
	 7DkT8erzpnE/g==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 58/3E-55620-A779E606; Thu, 08 Apr 2021 05:41:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRqls5PS/
  B4MhBC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP5t48sBStFKpY1tTE2MG4T6mLk4hAS2MIk
  0bj5ERuEc5xRYvXSpcxdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCpxb
  /0KFhCbBSh+8/crNpByXgFHid6/FSBhCQEFiSkP34NN5BRwkti77TwriC0EVNI34xQbiM0rIC
  hxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6S6PxwnG0CI/8sJC2zkLQsYGRaxWiRVJSZnlGSm5i
  Zo2toYKBraGika2hpoWtkaKqXWKWbpJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERiMKQXH
  ru9gvPr6g94hRkkOJiVR3qxJeQlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjtpgHlBItS01Mr0
  jJzgJEBk5bg4FES4XUHSfMWFyTmFmemQ6ROMepyvPu5eBGzEEtefl6qlDivOUiRAEhRRmke3A
  hYlF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbBTKFJzOvBG7TK6AjmICOKDmYC3JESSJ
  CSqqByZ/xwo6i8smpdq7r9WrDnVii5rqvNozi3/Rr84dt84PrcsQskg8/68peUVT86+jL38ee
  NFYsdTqa3JX58+YdvqknlledaSmasOjbAaXPxc38v2q6vILVvz+v/Sw3derzqzHbXvTdMLG7n
  +Tmsqzt1nlrrya1yreBD2SFg0yOLJ5zJYUhVfPs3LddSTqv2KT5fXJqzcw19H1MVxyaLcx3te
  2z1OcVAo8mr31WbRsaLS16Ru3CgfxN5xh+L3oqd/dljfETkbgNa/Sb3a2tuk7sSktoWDT/gPL
  Ly94/axgPa8U+e2xa37Ll2RVbj5wmBbllBeZCYpxhd2Z02mvnnp6bvvqG9VM3E6d1/f/ddZqT
  lFiKMxINtZiLihMBCI3fzU0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-285.messagelabs.com!1617860473!614140!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1508 invoked from network); 8 Apr 2021 05:41:13 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:41:13 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385fDH1028858
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:41:13 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:41:11 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] file: upgrade 5.39 -> 5.40
Date: Thu, 8 Apr 2021 13:40:50 +0800
Message-ID: <1617860454-5064-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

0001-src-compress.c-correct-header-define-for-xz-lzma.patch
removed since it is included in 5.40

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../file/{file_5.39.bb => file_5.40.bb}       |  5 ++--
 ....c-correct-header-define-for-xz-lzma.patch | 27 -------------------
 2 files changed, 2 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/file/{file_5.39.bb => file_5.40.bb} (90%)
 delete mode 100644 meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch

diff --git a/meta/recipes-devtools/file/file_5.39.bb b/meta/recipes-devtools/file/file_5.40.bb
similarity index 90%
rename from meta/recipes-devtools/file/file_5.39.bb
rename to meta/recipes-devtools/file/file_5.40.bb
index abaa8149a3..ec79839bd2 100644
--- a/meta/recipes-devtools/file/file_5.39.bb
+++ b/meta/recipes-devtools/file/file_5.40.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS_class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git \
-           file://0001-src-compress.c-correct-header-define-for-xz-lzma.patch"
+SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "87731415de945660b00f02207d8e9d986ef9b82e"
+SRCREV = "f49fda6f52a9477d817dbd9c06afab02daf025f8"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch b/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
deleted file mode 100644
index f8ba2f6153..0000000000
--- a/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ffb6ebdb42590cb9f7d3f5177b7b820a9edc4c81 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 18 Oct 2020 23:40:42 +0200
-Subject: [PATCH] src/compress.c: correct header define for xz/lzma
-
-Upstream-Status: Submitted [https://github.com/file/file/pull/98]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/compress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/compress.c b/src/compress.c
-index 67f21583..9670b72c 100644
---- a/src/compress.c
-+++ b/src/compress.c
-@@ -71,7 +71,7 @@ typedef void (*sig_t)(int);
- #include <bzlib.h>
- #endif
- 
--#if defined(HAVE_XZLIB_H) && defined(XZLIBSUPPORT)
-+#if defined(HAVE_LZMA_H) && defined(XZLIBSUPPORT)
- #define BUILTIN_XZLIB
- #include <lzma.h>
- #endif
--- 
-2.28.0
-
-- 
2.25.1

