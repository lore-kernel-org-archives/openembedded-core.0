Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E86C47085
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.1088.1649350851104370348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=px3syIPR;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id n6so12087808ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eX0kgLXTigbBosK/WOJmJAqS3DndjxJJ42XmYKQOlk=;
        b=px3syIPRDf8r2gJ8whPAg8ZHEbCpt1/UfEGHmegsw5qHLC5jqzH9SLOkQLtVtsYErN
         dRMvpT1AB8XzRetis2oN0Oin8T0FWgOoBquwuzpEqq6y4j5nX3c13upyy17yTK6r8sa2
         ybyEjQlME4ZIDos3qQ0FxsNl8BVoVePQP/I9lrJ2T91QxAMPrUd4J15rueTFfIM2kXVf
         EdSSHY/61d25nlS5byIiko2ugmWzJ5/ympfu5AecyMJXhJVdkbF5Emv9x6qn8Imkb53k
         rkJNSk1jUpMoGqKJwQor1ShR/i9XuBSl8Q0OW5N39G078/ttNpUPMR7DxhVoFnJkc5+g
         2f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eX0kgLXTigbBosK/WOJmJAqS3DndjxJJ42XmYKQOlk=;
        b=xRiwyqvMfJ2xVBapxSj99vddf5IypQH3BDQz8xkNqgzgQUsViem/YM9iShILRPq3Xx
         1510/aksFuiI+SDeXfkhZO1WN0qaZcsH+c2LuQgeX9BGajb8L347KuZd9QQhfIVBoZ+v
         GMeWpf3z2dZX788UhwcOm1k9v8yE1D1+fwxRV5Gyh1izO5Jc03TIWfBkKXW9wthORPzV
         Y+uMDdxMbEmKsHlfcbtyQjrqKxMIUglTQJD4hbOvgs3uI5XfiRMKMvT+42U1EAug11/o
         iUozfzftkJ+CyXHwiPnpdLQNiMd9Rv3bs4hUSJaNZjKjXBQJ7JFIUPIu5f/flHPcGcvm
         ZgUw==
X-Gm-Message-State: AOAM530cGssWh1T1tHrrWyrWyIeNqnw0fusj8oCza35CaTuFBRW8S2A+
	tRgXEjUS7NP+zJlK7eXZ7AJvLuBcXSw=
X-Google-Smtp-Source: 
 ABdhPJz0zFwx4oXGd4fQ/by5Do8arLbMKdrBFdvYQMDOq3zQJAqhfeFhsePNXdsH8t32XED0IEdW9g==
X-Received: by 2002:a17:906:1319:b0:6e7:ef73:8324 with SMTP id
 w25-20020a170906131900b006e7ef738324mr14627496ejb.234.1649350849625;
        Thu, 07 Apr 2022 10:00:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/17] libsndfile1: update 1.0.31 -> 1.1.0
Date: Thu,  7 Apr 2022 19:00:21 +0200
Message-Id: <20220407170029.3500874-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164125

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsndfile/libsndfile1/noopus.patch       | 39 ++++++++++++-------
 ...ndfile1_1.0.31.bb => libsndfile1_1.1.0.bb} |  5 +--
 2 files changed, 28 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.31.bb => libsndfile1_1.1.0.bb} (85%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch
index 6bcb932429..cb1778bede 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/noopus.patch
@@ -1,19 +1,29 @@
-We don't have opus in OE-Core which causes all the external libs to be disabled 
+From 593256a3e386a4e17fe26cfbfb813cf4996447d7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 4 Apr 2022 19:46:44 +0200
+Subject: [PATCH] Disable opus library
+
+We don't have opus in OE-Core which causes all the external libs to be disabled
 silently. The silent issue is discussed in the link below and hints a patch
 to make things configurable may be accepted.
 
 This patch removing the opus piece at least gets most of the functionality
 we previously used back whilst the issue is discussed.
 
-Upstream-Status: Pending [https://github.com/libsndfile/libsndfile/pull/812]
+Upstream-Status: Denied [https://github.com/libsndfile/libsndfile/pull/812]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac   | 10 +++++-----
+ src/ogg_opus.c |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
-Index: libsndfile-1.0.31/configure.ac
-===================================================================
---- libsndfile-1.0.31.orig/configure.ac
-+++ libsndfile-1.0.31/configure.ac
-@@ -361,13 +361,13 @@ AS_IF([test -n "$PKG_CONFIG"], [
+diff --git a/configure.ac b/configure.ac
+index 727b67bc..f9d2e447 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -373,13 +373,13 @@ AS_IF([test -n "$PKG_CONFIG"], [
  				enable_external_libs=yes
  			])
  
@@ -31,19 +41,19 @@ Index: libsndfile-1.0.31/configure.ac
  
  					if test x$ac_cv_speex = "xyes" ; then
  						EXTERNAL_XIPH_REQUIRE="$EXTERNAL_XIPH_REQUIRE speex"
-@@ -716,7 +716,7 @@ AC_MSG_RESULT([
+@@ -788,7 +788,7 @@ AC_MSG_RESULT([
  
      Experimental code : ................... ${enable_experimental:-no}
      Using ALSA in example programs : ...... ${enable_alsa:-no}
 -    External FLAC/Ogg/Vorbis/Opus : ....... ${enable_external_libs:-no}
 +    External FLAC/Ogg/Vorbis : ....... ${enable_external_libs:-no}
+     External MPEG Lame/MPG123 : ........... ${enable_mpeg:-no}
      Building Octave interface : ........... ${OCTAVE_BUILD}
  
-   Tools :
-Index: libsndfile-1.0.31/src/ogg_opus.c
-===================================================================
---- libsndfile-1.0.31.orig/src/ogg_opus.c
-+++ libsndfile-1.0.31/src/ogg_opus.c
+diff --git a/src/ogg_opus.c b/src/ogg_opus.c
+index dfa446ee..0d4fe57b 100644
+--- a/src/ogg_opus.c
++++ b/src/ogg_opus.c
 @@ -159,7 +159,7 @@
  #include "sfendian.h"
  #include "common.h"
@@ -53,3 +63,6 @@ Index: libsndfile-1.0.31/src/ogg_opus.c
  
  #include <ogg/ogg.h>
  #include <opus/opus.h>
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
similarity index 85%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
index ea14fe29cb..70626b3c16 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
@@ -8,13 +8,12 @@ DEPENDS = "flac libogg libvorbis"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 
-SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-SRC_URI[md5sum] = "3f3b2a86a032f064ef922a2c8c191f7b"
-SRC_URI[sha256sum] = "a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163"
+SRC_URI[sha256sum] = "0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.30.2


