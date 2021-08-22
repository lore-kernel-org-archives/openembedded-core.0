Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.9769.1629636688691894256
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgjPkz1T;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id f5so21723179wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kAejlEw7rCd5rvWpa9GJTmh4gyksg51mJ2h5qdz4T6I=;
        b=fgjPkz1TzWWwHP3AgkOxahe/Gc/44fuBEZXmi/iGXrnqgSYA4a60/yLPzIAi1XNFPA
         8aDJctwSrKl19pi4HHRRlDbCdJjVC8yWjOIb46YAvpp+qCz0CxCo9r/G1If/pEDuqVzB
         1zPr5Rguan2ABeBwq7rnumZ+K7JILHCKPRMQ1Owkkj7aCCwjIhl/RinLHcrg9NW2zADf
         YmCF4QQHk1w6RXXDNRvswiZvH3WGnFhAGM4WrZhZzN+1WSBFVqPW5kBvdy2PTOjpOrA2
         KY165L7qtVV3jL5pp6kwk1Z2PL2ntCvffYr2mzmogOPg8DtyAb3xx67mZ36WFsyfiW6F
         CdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kAejlEw7rCd5rvWpa9GJTmh4gyksg51mJ2h5qdz4T6I=;
        b=Yfge91cNgGr4YUSYYcrcx3z00zzEFyV3FTzvQZW5VnTxhaucoI5ngUH2gLxMgrLyK6
         fe3LxDtjNaTkOkWUI1ELb9E1ZMtNolEvogCzgSihCavwXIkNznv6Ai8LilnxujGVH7jQ
         w7U1Yk5S5o5Uj7XMKKZnrVsglvmOSVdzuvHSD2soJ6mp1alBAGb4APSO0qWI0CZmbxut
         xUAyv+sWM4U4leC7dKZDXlJNlrog8ME5qY24iujP3wNQCCiEcT5Xv6GYvmlfD/Ojpt72
         QY1ST8hw7VccNyIiT9R3A0ajJ820wiJHARlVzEwWhe/vjx9e9/oOgosQY2KvpSiobSp4
         OcFg==
X-Gm-Message-State: AOAM533wUtwgx1qnqXoGwcbXYaBDToZcZ/PqO1sIqpg645GWu0/43k5R
	mD0qJpJBnM5TJO1ZuPy5FNs/U8O0kK72Ow==
X-Google-Smtp-Source: ABdhPJyz44JpQJn8r67cvukkAp4g1Gilw3T3F/cPl5yA7jPsdrumQewZ0jikabxlfny51+mK/wz1IA==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr8655028wrv.243.1629636687356;
        Sun, 22 Aug 2021 05:51:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/55] mtools: upgrade 4.0.34 -> 4.0.35
Date: Sun, 22 Aug 2021 14:50:32 +0200
Message-Id: <20210822125103.310416-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch               | 2 +-
 .../mtools/{mtools_4.0.34.bb => mtools_4.0.35.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.34.bb => mtools_4.0.35.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index c78f73d255..8041b13ae0 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From bd2ec723326b6d57350da73b444dd43e923011e8 Mon Sep 17 00:00:00 2001
+From dc11f3e7bdfa524a3e395a0f9d5e035dbc40c047 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.34.bb b/meta/recipes-devtools/mtools/mtools_4.0.35.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.34.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.35.bb
index e64015c13f..61e98bb0fe 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.34.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.35.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "ada543eb1b0ffe5440d4ee42634309ea1e286d7ebb80c99ba50db5cb2c360cab"
+SRC_URI[sha256sum] = "34769e173751d2f0d891a08c76c80427e929b8ee43438019b8666cc3d7a44749"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.31.1

