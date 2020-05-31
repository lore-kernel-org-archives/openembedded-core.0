Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.17650.1590940448141425819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a8Yf5hOZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id o15so6835033ejm.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CzM8YfF4oJLSzh1T6/qWgLDErApjCTRhT7tBGf1Wp+I=;
        b=a8Yf5hOZlSosMk36wqRMVbQjbX6VAwW/wGD0gec5mGlB0ulmaOk8HuCHbLJMmcN+UM
         VJ/3TxmQIej5tU2GGGppjw33yqD3Kg45uLBNb0BNEhGqAvT6aB4eWN2xco2HlQRezg32
         aJ9XVwJoVOPh9gQb5Vbk9PixUYjBuT4qWY15GKhDkNbeoqBvip9CVsQdC6N6QmAkHo+q
         0CL9X3iXfVxLA/r0MZx4980pJ32aaf0Ca17ox12Nky4WRLsKopOItn5ZGkJcGOXUzGJ2
         vnCV87LEmqXAaQpNkMihtI3bhpPUhobNqhUjacK0tPazBvrV3hw1FjppjpwMTcg75pOH
         TWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CzM8YfF4oJLSzh1T6/qWgLDErApjCTRhT7tBGf1Wp+I=;
        b=K8hB+pih91j9eNGOjT1a7ZY2cRchQmeamwUaRf+Z4AfR7hhgA0CHXTAsBCBd7nTvFf
         zvHiCWhFBFl/UXddnmyChgMf0t9XunwPbmSMJ7UzFFlCimus+0VTXJias6hFlNie4e/X
         nExx/u9CgHPC0HGE4UEUny+J8Gp/x+Vl9MQZYxbor25bHCJM22lCZ5Onl8mT6M3G+3Qw
         ucjaSnMe1R27OVX37YRKBG2mHp39gbayQaWPsMSOBylE58GYIxFtYI0hh5MCVPEbfbbd
         Kxp9xiez2XkEeeVNaO5l/8lfOBh9AqvTdGOyBOu45nOS6XZR4jiAhFl2WTxKbiqSqA+O
         lATg==
X-Gm-Message-State: AOAM531C/UuEqagOE3Vof8NNcDseP0I81oNQQisCZgcLyk+VoeOWMODd
	Oe0e3rA1Ilrl9bZr7geepfc+ZF3U
X-Google-Smtp-Source: ABdhPJwTAvh/Q8K00Q1XyEyS/L3jCRotBgEAWywb9srgoIPZYqWWHWByeTeZ6iSy7nN+Xd/dGiNtcA==
X-Received: by 2002:a17:906:e0c:: with SMTP id l12mr15486895eji.435.1590940446437;
        Sun, 31 May 2020 08:54:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/70] libunwind: upgrade 1.3.1 -> 1.4.0
Date: Sun, 31 May 2020 17:52:29 +0200
Message-Id: <20200531155254.10283-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libunwind/musl-header-conflict.patch      | 27 ++++++++++++-------
 ...{libunwind_1.3.1.bb => libunwind_1.4.0.bb} |  4 +--
 2 files changed, 19 insertions(+), 12 deletions(-)
 rename meta/recipes-support/libunwind/{libunwind_1.3.1.bb => libunwind_1.4.0.bb} (87%)

diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
index 79f63fd84e..63b78a8a30 100644
--- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
+++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
@@ -1,4 +1,7 @@
-If you:
+From 49b21f0fe5fb93b30b94cc449429fd33de0652a7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 18 Aug 2016 14:46:32 +0100
+Subject: [PATCH] If you:
 
 TCLIBC=musl bitbake unwind
 TCLIBC=musl bitbake gcc-runtime -c cleansstate
@@ -6,12 +9,12 @@ TCLIBC=musl bitbake gcc-runtime
 
 you will see libstdc++ fail to build due to finding libunwind's header file.
 
-Khem: "When we build any of gcc components they expect to use internal version 
-and that works with glibc based gcc since the search headers first look into gcc 
-headers, however with musl the gcc headers are searched after the standard 
+Khem: "When we build any of gcc components they expect to use internal version
+and that works with glibc based gcc since the search headers first look into gcc
+headers, however with musl the gcc headers are searched after the standard
 headers ( which is by design the right thing )."
 
-This patch hacks around the issue by looking for a define used during gcc-runtime's 
+This patch hacks around the issue by looking for a define used during gcc-runtime's
 build and skipping to the internal header in that case.
 
 [YOCTO #10129]
@@ -20,11 +23,15 @@ RP 2016/8/18
 
 Upstream-Status: Inappropriate [really need to fix gcc]
 
-Index: git/include/unwind.h
-===================================================================
---- git.orig/include/unwind.h
-+++ git/include/unwind.h
-@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
+---
+ include/unwind.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/unwind.h b/include/unwind.h
+index 7cf128d..31c2871 100644
+--- a/include/unwind.h
++++ b/include/unwind.h
+@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
  
diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
similarity index 87%
rename from meta/recipes-support/libunwind/libunwind_1.3.1.bb
rename to meta/recipes-support/libunwind/libunwind_1.4.0.bb
index 037e04c3c0..f50205f1b9 100644
--- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-SRC_URI[md5sum] = "a04f69d66d8e16f8bf3ab72a69112cd6"
-SRC_URI[sha256sum] = "43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8"
+SRC_URI[md5sum] = "5114504c74ac3992ac06aa551cd55678"
+SRC_URI[sha256sum] = "df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435"
 
 EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
 
-- 
2.26.2

