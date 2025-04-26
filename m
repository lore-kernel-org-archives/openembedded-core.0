Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDDFC369D8
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 17:08:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.12671.1745687320015143286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 10:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6I3GXd0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so31683335e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745687318; x=1746292118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f2CYDLF0Mo6ikfoq/SLDXMgmIpDBZjfc18qaiRM1VQ=;
        b=m6I3GXd0iNRJIHBPE4MpSWeyurHeD6o92UxdKGi7EkI+hhhMgsaEhWXpR8l0FhMZl1
         axaPSw0vAgCkIJ9Xjwe80GiH867Ca9QmtOMb31Nzeih4WL/8NK5St2Sgjgd871YuxI7s
         Jz4RTj8dTgYBqu3RaOHOaKbJUaJVF2PIiRDRPqH31Db6tEFn5+nHsR1HJhQ+i+icsYaS
         yvnfE/S8Oi88xSycYciRBdiiYcj+bfcLZo2NWWvSBi2tcZ60iROe7ImjO5PmOflysTbe
         PGToba1yAV0T5+U/LzuF9FTcxASUGuHAC7WCfWxotOs1wuOWDDqMS6xp+NVurUVcwmFj
         B+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745687318; x=1746292118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f2CYDLF0Mo6ikfoq/SLDXMgmIpDBZjfc18qaiRM1VQ=;
        b=aZN17+N54422WH2xMMWYIBYibSB0UroR4U8WEGDTqKU3kSAfx3ohdeAE/P/XT+XiXs
         i1NV1woF1Ua95ntTNFMgpffmEX7DpPVZl/Fy/qo6ZWrXllWWKYZ6MnHxF5Y9Gdktrafy
         tYiWW5wobcBvWsvHMFoZhnCBmNlMK9NUgwXl9tdCqzHAQfuWLo3UicyXMdsov73Wxnv9
         mkGzCzY4EmLs1qj4j1xg8PaTfn0sBljoPAWhrpkXGnpiMn7WvGCWJvN/xLGHgHMlTiCr
         EoZrskpZExFk495GNEi7ZPHVtmD/h3WQK00H6Cgn13oY5byjKJrL1DbjfgH65MtBJAut
         iiQQ==
X-Gm-Message-State: AOJu0YyxrpxDnWJmWjaJAOX/8Q6bkJZs06hi5DyiiA78rS4LEzL4xEFN
	xbdv6zfg+gQj08CDOb6D1ohe9tVUm8TQPCr9XvS0w5OeLScE3q3i8e2OBss9
X-Gm-Gg: ASbGncv9ccw0Gb0vPgDvYqiOtz7XbTYEZ23+LGw+/2JR7NDEy2wnbsARIgJkm6CGWAs
	AT6UK8nc+z+LyCkQdl+5obpfUXKVsNpPOvC6uyn7TWWIgsdjVkUivpje4EEGjMfsh9nyL3Oa9y3
	IsfY/04n6w6UWowutwyxk/nFfPKQ953D2xLVk7IxJEPhlyv5AcJzOw7J2ZqDPVxq4jtMEnwRgvq
	b0nMIqly8OwQL1v17iWhjztLRoZfU3A5uBBicx9J36HxiDaA92tNmMw4e/UH85HIRPlnXWnmV4U
	BTUZ7+yYU5hAYPKxamnGwp1RIV8qMlQNLvW7SFQCR0wUgW0hI/3Abs1OLGyb8T9X9biaIS6ntQ=
	=
X-Google-Smtp-Source: AGHT+IFRoGrYN2XpYjJV3Ap7kEU/km7hcnxFjRJm3uaCr4HI9CA5MwbdQu/HI+YyjDLXJ4tmSVYlzg==
X-Received: by 2002:a5d:5f82:0:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-3a074e1d651mr5642163f8f.14.1745687318300;
        Sat, 26 Apr 2025 10:08:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d769sm6205603f8f.12.2025.04.26.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 10:08:37 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/3] ghostscript: fix build with gcc-15 on host
Date: Sat, 26 Apr 2025 19:08:22 +0200
Message-ID: <20250426170826.2580706-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426170826.2580706-1-martin.jansa@gmail.com>
References: <20250426170826.2580706-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 17:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215523

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.0.bb        |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
new file mode 100644
index 0000000000..78f3fc1c34
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
@@ -0,0 +1,67 @@
+From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
+From: Alex Cherepanov <alex@coscript.biz>
+Date: Thu, 3 Apr 2025 17:19:41 +0100
+Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/853021/
+
+In file included from ./base/genconf.c:18:
+./base/stdpre.h:348:13: error: ‘bool’ cannot be defined via ‘typedef’
+  348 | typedef int bool;
+      |             ^~~~
+./base/stdpre.h:348:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
+./base/stdpre.h:348:1: warning: useless type name in empty declaration
+  348 | typedef int bool;
+      | ^~~~~~~
+
+Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=ae940946473ceb8c5353bc6e7f04673c6e60502d]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ base/stdpre.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/base/stdpre.h b/base/stdpre.h
+index dda30b6..2f9c84e 100644
+--- a/base/stdpre.h
++++ b/base/stdpre.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -341,7 +341,9 @@ typedef signed char schar;
+  * and the MetroWerks C++ compiler insists that bool be equivalent to
+  * unsigned char.
+  */
+-#ifndef __cplusplus
++
++/* C23 has bool as a builtin type. */
++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
+ #ifdef __BEOS__
+ typedef unsigned char bool;
+ #else
+diff --git a/base/gp.h b/base/gp.h
+index ad5bb61..cf2c9cf 100644
+--- a/base/gp.h
++++ b/base/gp.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
+ /* Create a second open gp_file on the basis of a given one */
+ FILE *gp_fdup_impl(FILE *f, const char *mode);
+ 
+-int gp_fseekable_impl(FILE *f);
++bool gp_fseekable_impl(FILE *f);
+ 
+ /* Force given file into binary mode (no eol translations, etc) */
+ /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index e937f04cb3..c0e2654701 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -25,6 +25,7 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
+           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
 SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"

