Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.19461.1608974878129922327
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T2zQ/qyj;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id cm17so5579175edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6B+qHPi0ceV1b+zn8tmc7Y2MconUcOaE7ThhN57sqvQ=;
        b=T2zQ/qyjMskZ9dz/1iFwIYHuQ5s3qOt6NPRwm4MpIpm2e6j7K7w45MNJwCPcI3tmBP
         Tim5463SSBvULbrBVemgEC4LIm8r5D2BAWDRJUpzJCzCCiflsN8WN1a5X5lUL7R62aaV
         F0XF/FKcvsjh1GzIMYEiHlAHAxEjjQHlQSTs+cSwLYXmRQBt8rZFo7K+1rxpYOZs47Qr
         rC9gtxSQbR11+0lQ2RjB7JxfxUEaxd+VIqvb+ROP2AEJVfpt7Aq7XSECQAshVy1N8gbl
         8j3Y7O/NgJ1POAjB7HI/NuhrClajqPJHSjDHrudofmV8FGFhlDP19I1z6NOG1n1YWLGX
         kqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6B+qHPi0ceV1b+zn8tmc7Y2MconUcOaE7ThhN57sqvQ=;
        b=HUWJDaZLPU7zNgjGJhMc/zHbznVFQ9v3tQzxuxKzt1HisTaf0QYEbSZd4DBLmzrzcc
         9R6xCrVuQeB7Bibzv9zD79svbMXulcshSY3le8GPNm8GgBBq3yTIZcDovAzgfCgf47m2
         JYo5EV+bD/lhfXES2EHgm31OGe5cxQhN1LSmWR3L44uPGPnbT7uvZ0q12x/8DLDER8Yx
         UhDN6/uwCSOGdsc43FkfZKEuI2S4SVlBaQp26nZy0VqxUapsNu+gN34YCBhSY3Oy+TGu
         b1XSjsZNwyZkKmhT9lTl5hNPe0uSfV26nWsc1jtlhwG0Nc2i+IC/DoNKZ5QDzv80r7di
         8rhA==
X-Gm-Message-State: AOAM531JtFzMBi36uCIgZ5x3y2j7Z6rD2/0t67lNn8jQtDq7+HuSa0r4
	54QEUSd9sF+1Y02JRS//B9i21QfTBGw=
X-Google-Smtp-Source: ABdhPJy0EFI3vVK4uIB/tmd3Z0ykVH1T2dNizveQp5zzfsRxHIoCChdf8T2qtgv5CQA4udWYFVSfSw==
X-Received: by 2002:a50:fd88:: with SMTP id o8mr34833956edt.386.1608974876695;
        Sat, 26 Dec 2020 01:27:56 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:56 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/48] libx11: upgrade 1.6.12 -> 1.7.0
Date: Sat, 26 Dec 2020 10:27:02 +0100
Message-Id: <20201226092732.52323-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/files/libx11-whitespace.patch    | 56 -------------------
 .../xorg-lib/libx11-compose-data_1.6.8.bb     |  2 +-
 .../{libx11_1.6.12.bb => libx11_1.7.0.bb}     |  6 +-
 3 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.12.bb => libx11_1.7.0.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch b/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch
deleted file mode 100644
index 3f97143082..0000000000
--- a/meta/recipes-graphics/xorg-lib/files/libx11-whitespace.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libx11/merge_requests/33]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b41469c5f08b1f3365667ff3c430b104c9b8e25f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 22 Jan 2020 17:11:23 +0000
-Subject: [PATCH libX11] cpprules.in: squash whitespace in generated files
-
-CPP is used to generate files, but as cpp reads files from the build host the
-output has a number of blank lines at the beginning which varies depending on
-what GCC and friends is used.
-
-Pathalogical example:
-
- $ cpp -undef -traditional /dev/null
- # 1 "/dev/null"
- # 1 "<built-in>"
- # 1 "<command-line>"
- # 31 "<command-line>"
- # 1 "/usr/include/stdc-predef.h" 1 3 4
-
- # 17 "/usr/include/stdc-predef.h" 3 4
-
- [ 40 blank line ]
-
- # 32 "<command-line>" 2
- # 1 "/dev/null"
-
-So depending on the content of stdc-predef.h and what other headers CPP will
-load, the amount of whitespace in the generates files varies. This can result in
-differences in reproducible environments, and file conflicts in multilib
-environments.
-
-As whitespace is irrelevant to these machine-readable files, extend the sed to
-just delete blank lines.
----
- cpprules.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/cpprules.in b/cpprules.in
-index 03d6701e..ce6b3c98 100644
---- a/cpprules.in
-+++ b/cpprules.in
-@@ -23,7 +23,8 @@ CPP_SED_MAGIC = $(SED) -e '/^\#  *[0-9][0-9]*  *.*$$/d' \
-                        -e '/^[	 ]*XCOMM[^a-zA-Z0-9_]/s/XCOMM/\#/' \
-                        -e '/^[	 ]*XHASH/s/XHASH/\#/' \
-                        -e 's,X11_LOCALEDATADIR,$(X11_LOCALEDATADIR),g' \
--                       -e '/\@\@$$/s/\@\@$$/\\/'
-+                       -e '/\@\@$$/s/\@\@$$/\\/' \
-+                       -e '/^$$/d'
- 
- .pre:
- 	@$(MKDIR_P) $(@D)
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index 3d97ad78d2..0f4be35770 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
 SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
 SRC_URI += "file://0001-Drop-x11-dependencies.patch \
-            file://libx11-whitespace.patch"
+           "
 
 XORG_PN = "libX11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
index de7f1c366e..3faee6e497 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
@@ -11,10 +11,10 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-            file://disable_tests.patch \
-            file://libx11-whitespace.patch"
+           file://disable_tests.patch \
+           "
 
-SRC_URI[sha256sum] = "f108227469419ac04d196df0f3b80ce1f7f65059bb54c0de811f4d8e03fd6ec7"
+SRC_URI[sha256sum] = "36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.29.2

