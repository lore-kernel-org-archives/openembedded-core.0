Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17C2C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.52890.1638136782825367316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3u6VibJ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso13859847pji.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6n27uOVBquzCfRUVvEzoqrso7KhW84QIUXUUjp8BTYo=;
        b=3u6VibJ0hLY6z6NmAgUzz1A6w/Za6bHB67iBdTVbwXqDkRM6MiviiKM18cOnBlDnvq
         XABDG0+qBO540YdE9O0oDnBtCqGJUW9lA+fwzw4SjOSCFDZvBpHL16i7iE1ujI/Hxmjh
         gcy3CxfeR/o8mMklcWa1zPOLuUvj3ubOpX/cl78nGyBv+h1Ie/YgcYO1MMTcgowQ5n5C
         rVm+Z1L593t4LRCx0bmKx2xcwfCvlt0DKN5FirHKRn9wJcLO6vLGiAHVnEwbvxYDxXYc
         3Ax+NWVtFBFNtvMVPeZIDbgaynwpbFTDhB2l7slEYkvGHGpR+hPgU03kBhwnZKzyubAj
         8ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6n27uOVBquzCfRUVvEzoqrso7KhW84QIUXUUjp8BTYo=;
        b=SoIlD0pE+HJSUsft1h/xKqkbeXETcO0xzjud8SAQ5zh7fdEWEEdav0qvT1ggMbU6l0
         +l7XVDeT50j48eD8iJVhJ3QRT03+LTdAz6hM8v5O/mSZWyDOIKoeChXJo0oUb/yx0UYY
         Jfk1QLZSDAPWtE0j2p9/XfcFN8KwPAsOh/DEo961VIzm4ZdU2mtxNrdAngVRPwQA+qu1
         fKLCzOfhfleMM/vEImyTJH0C9YqUyGco14Z0Iin7UO/NVl2CVek1O683Vzw7eW0DUiEq
         L02/joYFMbraKDRSAA/d4fbbBiuza95qWY4i4ROqzETnC2KGaYJ64mCLKZjVvebqIoFH
         09rw==
X-Gm-Message-State: AOAM532c5JcOj5R0U8ws+ZUotV/CstN0hBrqMGnT6jEIyM1lFEJ66UQi
	MpG9hkQAW8PMZRjwAyXVtu2pmChDhKfFT1dtHQI=
X-Google-Smtp-Source: 
 ABdhPJz7M0LrYu0iqvhwJhSQGs37oMzJqd21vHOFRPReAzk5WlE/nRqWf3a2Z0akiu2fLA17SkwXOQ==
X-Received: by 2002:a17:90a:3e09:: with SMTP id
 j9mr33576785pjc.24.1638136781678;
        Sun, 28 Nov 2021 13:59:41 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/42] unzip/zip: mark all patches as
 non-upstreamable
Date: Sun, 28 Nov 2021 11:57:45 -1000
Message-Id: 
 <bf6c3fb4d6e2d249e8271c7334c2187e3b8a09cd.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158915

From: Alexander Kanavin <alex.kanavin@gmail.com>

While upstream is not technically dead as of today [1], it has not made
a release in over a decade, and there is no source code repo to
rebase the patches on. If/when a new release ever comes, or someone
takes over the maintenance, we can reassess the situation with these patches.

[1] Discussion in https://sourceforge.net/p/infozip/bugs/53/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 982e5fa5d7ca9920e2a63b5a3f1435cf57d94345)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/unzip/unzip/avoid-strip.patch         | 2 +-
 meta/recipes-extended/unzip/unzip/define-ldflags.patch      | 2 +-
 meta/recipes-extended/unzip/unzip/fix-security-format.patch | 2 +-
 meta/recipes-extended/unzip/unzip/symlink.patch             | 2 +-
 meta/recipes-extended/zip/zip-3.0/fix-security-format.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/avoid-strip.patch b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
index 8f30e42674..e0c89d81b7 100644
--- a/meta/recipes-extended/unzip/unzip/avoid-strip.patch
+++ b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 unix/Makefile: remove hard coded strip commands
 
diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
index 659c6e3315..dc554c32cb 100644
--- a/meta/recipes-extended/unzip/unzip/define-ldflags.patch
+++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
@@ -1,6 +1,6 @@
 Pass LDFLAGS to the linker 
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
index 8e9b06c423..ba6ead3b5e 100644
--- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
+++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
@@ -5,7 +5,7 @@ Fix security formatting issues related to sprintf parameters expeted.
 [YOCTO #9551]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9551]
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/symlink.patch b/meta/recipes-extended/unzip/unzip/symlink.patch
index a38f6f1612..c1d82ac187 100644
--- a/meta/recipes-extended/unzip/unzip/symlink.patch
+++ b/meta/recipes-extended/unzip/unzip/symlink.patch
@@ -6,7 +6,7 @@ a symlink entry."
 
 This patch is taken from Fedora (https://bugzilla.redhat.com/show_bug.cgi?id=972427)
 
-Upstream-Status: Pending (upstream is dead)
+Upstream-Status: Inappropriate [need a new release]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- unzip60/process.c.sav	2013-06-09 12:08:57.070392264 +0200
diff --git a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
index 19d8548273..5cdbf22a54 100644
--- a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
+++ b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
@@ -14,7 +14,7 @@ zip.c:1228:5: error: format not a string literal and no format arguments [-Werro
 [YOCTO #9552]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9552]
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
-- 
2.25.1


