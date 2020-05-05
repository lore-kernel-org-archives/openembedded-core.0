Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.7070.1588683740179656142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HnwIAmaa;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id h4so2199499wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v71ixfGwEgPRmaW242yTuIv4V4kSD0Mq0KK0EaePL3M=;
        b=HnwIAmaaLLP1Py1oiLF5OrzPGbxawS8vy7Z4jN2b1/mIYY+PG35LRODGkop1CFIbKc
         xTnLYkr/ONeiV+f1sgqWms3xqjOOnOlXc/Yz4ME+U8S8ywtuOyDgUAQMH3oBpcp2Okv/
         MTEYyj9AR5FIj7jRU+PPYIRjQkBTkJMHd/xEplkflHsjKapkWf5gI5wjp5lycbNQbK+C
         mep2NCUCSn1DFpO2xW7vPZtqlu/xKl3azHL2cIo5JIFeesXThXdHM5xEiXfSfms3bxV8
         I1bU8HI+LqyvLSKsFNoA1Xs0zuA5WhvkLoRerDyIg9tLH4Ne8qbl10RqKd0GuTeR+EPe
         h+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v71ixfGwEgPRmaW242yTuIv4V4kSD0Mq0KK0EaePL3M=;
        b=KqCDM46+Tr6gcSTNWlwYTjv62zPM8wCOSfNQA1t8Bi/kpG0ai20LVTwU9SObYi8hKe
         dhsdNJMMQwhZS8MCG7dUCKq1AL48+yYouR3gOoFfmfHzbaUEX/g54oAUoKxMsUZTwoTo
         SJxBCi6TswgVc0PV26uqQz6ofrbEdDZ6RZ2QjAe578eFOsyLPla5dTwUjjycsjcpVZKd
         DxiuFiBCnc8/dBZh4CQKqyBZvYIT2K+5EVc5BOGGbxZ3OG1WepiTB03qhETmxeWGWs/o
         f2XD+0ydD2k/LvF48RoZaYnIwTGac/1fcoMEoKHEr8kK1iNbTqic4vapIWbNJa61nd61
         aehg==
X-Gm-Message-State: AGi0PubkEmdDxCaWRD0dZ8MYhYs1rIL6ocIQBBW6jT+0l/nqpnTxHUl2
	5rQD4n6l6OuwW+W4HWdjU3IYwjwX
X-Google-Smtp-Source: APiQypK+w76QOvfA5ufL+KmrdCA2VXSR62lRXppM4GDAfXOBhcPrD2jprXu/Pac1ecPS/QffoRiKbw==
X-Received: by 2002:a1c:b70a:: with SMTP id h10mr3264738wmf.172.1588683738335;
        Tue, 05 May 2020 06:02:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/24] vulkan-demos: upgrade to latest revision
Date: Tue,  5 May 2020 15:01:27 +0200
Message-Id: <20200505130133.24930-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gli is replaced upstream with ktx.

lfs objects are not in a revision that we use, so they can be ignored.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...uild-demos-with-questionably-licensed-data.patch | 13 ++++++++-----
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb    |  6 +++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
index 76240610f5..153e662733 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
@@ -1,4 +1,4 @@
-From 0cbf9c9831f773e0da66209be9a6ff28d57c2321 Mon Sep 17 00:00:00 2001
+From 663d51cd31fd98411e25f37aaf52b591d9639bf5 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Mon, 30 Jul 2018 17:23:29 +0300
 Subject: [PATCH] Don't build demos with questionably licensed data
@@ -33,16 +33,15 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
 ---
  examples/CMakeLists.txt | 14 --------------
  1 file changed, 14 deletions(-)
 
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index e07918c..08b6e23 100644
+index a53c834..71a12e7 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
-@@ -55,18 +55,12 @@ set(EXAMPLES
+@@ -55,9 +55,6 @@ set(EXAMPLES
  	conditionalrender
  	conservativeraster
  	debugmarker
@@ -52,9 +51,10 @@ index e07918c..08b6e23 100644
  	descriptorsets
  	displacement
  	distancefieldfonts
- 	dynamicuniformbuffer
+@@ -65,9 +62,6 @@ set(EXAMPLES
  	gears
  	geometryshader
+ 	gltfscene
 -	hdr
 -	imgui
 -	indirectdraw
@@ -93,3 +93,6 @@ index e07918c..08b6e23 100644
  )
  
  buildExamples()
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index c94e768b52..9d7cb2b1e8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
                     file://examples/triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
 
 SRCREV_glm = "1ad55c5016339b83b7eec98c31007e0aee57d2bf"
-SRCREV_gli = "7da5f50931225e9819a26d5cb323c5f42da50bcd"
+SRCREV_ktx = "726d14d02c95bb21ec9e43807751b491d295dd3c"
 
 SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
            git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
-           git://github.com/g-truc/gli;destsuffix=git/external/gli;name=gli \
+           git://github.com/KhronosGroup/KTX-Software;destsuffix=git/external/ktx;name=ktx;lfs=0 \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "6d63dc32c320a49be0a56c365151c8f2f176bc59"
+SRCREV = "10a1ecaf7bbcbc316c83f7c52742baaba0ae2f45"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
-- 
2.26.1

