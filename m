Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.19459.1608974870395348664
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tRtsToas;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id x16so8300878ejj.7
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NcV72zBFAWxuzcXNo8hXYe7sNv56eo8uMEtbaIZ9JQU=;
        b=tRtsToasd/tCXn5GyDBSZAwzPDHqcGBtcjkvhinxWCIpGg5g5RgAKN7YRs1bbcrS2C
         vYuMV5aNgVs3fyM5TeEmuzh/6trXNtoxiI4alIJbTQlcxTAxBdjot3SulPJsqs7WLREA
         W1UH8MFMRra7W9HGsbd1t/mxXyxO+TKkqgmVhsclkmPJnp+70gZ/HejVYQ46RB0s+o4r
         xmy6QQbVoWUwe7PdDq1hPJPuOUc79/1KWI01nN8uSWF/pIoOMcPSzka9of73wXN8uPLK
         W1oz+Q2H/viuBBjsQEro9fdXZP1RI/IJAJx0MjHMPRQd9KEquJoovuL6fb2NUuVo2p8R
         bItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NcV72zBFAWxuzcXNo8hXYe7sNv56eo8uMEtbaIZ9JQU=;
        b=dtWmHe4F4Z1X/w+QSnBn1tsd35/TgWAyP1IWn0sQ9SOecS7WCSzKeqGxXHQmHsEpNG
         4Uc4+OVKs87sluhPq0uldWYV2PcWSiwzmJo+OXBvOCPRQwkO8YW0baCp+34+JdhIB+3t
         pbgnXAZyK08EBcv8sxwlOS4GlpTyYlATqvMkz43Sp1MCye+6Ip1sfU1x6LnvOuNiIJQk
         AoBuACpvuo9FTD57sjyFxghbmjWUCSpL0LEMYkKzoqDva6W46gFvhkiHTCiyU1J1utt/
         BXJbkbkGSM+Ys9WKqapvfBTOC15QAkBHenTAd0fRaJ7tB1ULYCm3RuoCDWSy6rY48WSf
         GNBQ==
X-Gm-Message-State: AOAM533kdamyoyranLCrIBFve9tqCzM1JcdU8aqbvcmKshkv3kS7P0ha
	8AkK6EPUBOTnAbsGZUoXozsL79wcTH0=
X-Google-Smtp-Source: ABdhPJxniKP+uzDI08/VGxTdsLNoiHn3V5/ZjlektDifsXhTyctssmVSY7+uFZyF4LROxmWl3CflNg==
X-Received: by 2002:a17:906:259a:: with SMTP id m26mr34768238ejb.399.1608974869042;
        Sat, 26 Dec 2020 01:27:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/48] ethtool: upgrade 5.9 -> 5.10
Date: Sat, 26 Dec 2020 10:26:52 +0100
Message-Id: <20201226092732.52323-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.9.bb => ethtool_5.10.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.9.bb => ethtool_5.10.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 673b35033f..54aec01284 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 538bd5ec36d88f17803cb848cbbfe62ad51fc2f4 Mon Sep 17 00:00:00 2001
+From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0162155..6866e72 100644
+index 13c2bc0..0b6ca1d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.9, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.10, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.9.bb b/meta/recipes-extended/ethtool/ethtool_5.10.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.9.bb
rename to meta/recipes-extended/ethtool/ethtool_5.10.bb
index 2d2f9b77f0..5c0df3acbc 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.9.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "f934a830554c46d7d60b1a9147f4cab15589b7e09344c4b79b1948b740f0a725"
+SRC_URI[sha256sum] = "4b86adb3ed913c1ef14a276301981f696ab4ec360c19f0a5b68235c4756abae5"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.29.2

