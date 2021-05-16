Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.11570.1621204377722114866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SMhboMoJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id v12so4456295wrq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j/6GCR263nS8Gjs3B9dqB2qD2RtlHuPLooTnysywimY=;
        b=SMhboMoJgfQw5sLgONA84dMtcnYvMDphmZpzcSDKx2IDzkoiJOb+QGf+fefylOIvQN
         zTjpOc2bvNPCcKk1eeXbd6QRumnDsCogP7PaFtWb8iqnxEpncdbz+hL+5XCnp7X+ChS4
         EBeEKyKyOHtyXuV8UKRKxGnsrOc4fg7t9xgJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/6GCR263nS8Gjs3B9dqB2qD2RtlHuPLooTnysywimY=;
        b=WxC9+8lRIIL09GqXmdEQVXatxSroRYzrD+k7U5AEj2wg5Rz4zfKJ1Njcd0JoYecv0Y
         f2wmgwVjg9xRBDXLVOMCBqO/C7kAcWjZMcFSCEUbp39D03ZWAeCZx8LUIb5U6Y6ugcXD
         nbeIWkgLZg9RWffn0RNV+b+ugTbtBQbh7PLzKHyLfGgb+97mdGk76F0Gm5j/4I6TkTsg
         ibyRzLJdUMmCcnkvvJ/paqM50kUcqaI7atv106tbNlbe6GjQO7N91YdPjP2FsdK1g1tJ
         w9p3bMdvWRV1eurQodbGYoT8xSn649vCaAdOwp5w8IbDsBpMHVZjm3eEFs0a1JB8Gcp2
         j6vQ==
X-Gm-Message-State: AOAM532uHb6yWxukm56PI8tGdfECXGFBVP7gBHrMkVMGY1aVojXqJ15Z
	FTEAET5qZBrrKgbXq/B5SsLigRSAv+t6sQ==
X-Google-Smtp-Source: ABdhPJz10npbtOJ2wXVU0aA/OBtsQiL6ZAeB/uNvgqVsn9KRAQo4C64fyYx/bVK/l0nXx7XcOG4HAg==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr69942727wrs.48.1621204376314;
        Sun, 16 May 2021 15:32:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/27] stress-ng: upgrade 0.12.06 -> 0.12.08
Date: Sun, 16 May 2021 23:32:34 +0100
Message-Id: <20210516223247.2401235-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reserve-ownership-when-installing-example-jo.patch | 11 ++++++-----
 .../{stress-ng_0.12.06.bb => stress-ng_0.12.08.bb}    |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.06.bb => stress-ng_0.12.08.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
index c860c717ac4..2ee0be54bac 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
@@ -1,21 +1,22 @@
-From bbc85a439672120fa1d36be79e959b28fe840919 Mon Sep 17 00:00:00 2001
+From f14d9d8184753dfbff99d7a51939145355627dcd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 30 Jul 2019 18:38:03 +0200
 Subject: [PATCH] Do not preserve ownership when installing example jobs
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index f36e57e..20488af 100644
+index 91d8ed4..72d0ca0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -452,6 +452,6 @@ install: stress-ng stress-ng.1.gz
- 	mkdir -p ${DESTDIR}${MANDIR}
- 	cp stress-ng.1.gz ${DESTDIR}${MANDIR}
+@@ -502,6 +502,6 @@ else
+ 	cp stress-ng.1 ${DESTDIR}${MANDIR}
+ endif
  	mkdir -p ${DESTDIR}${JOBDIR}
 -	cp -rp example-jobs/*.job ${DESTDIR}${JOBDIR}
 +	cp -r example-jobs/*.job ${DESTDIR}${JOBDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
index 7e9135ad01c..24de8e39be8 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "75eb340266b1bbae944d8f9281af978bd5bc2c8085df97a098d5500d6f177296"
+SRC_URI[sha256sum] = "39e98cbb682bd3f907b2c718c20747bc94804abc92fbc4dad3a50bf530108d09"
 
 DEPENDS = "coreutils-native"
 
-- 
2.30.2

