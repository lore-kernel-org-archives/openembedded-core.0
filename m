Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4118.1588240721759289398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ipqB5/1A;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id x17so6097838wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/KkoOqrS06rNfxPT8mLjvq2hEOOD8kpSTpOX0alFSrQ=;
        b=ipqB5/1AtUG8cPgdnfhOPfL9thcPcNT7gu94DbRvnwmJf9Nvldzfh275ihs6GCuV+8
         qcgYB57//aceUdeRcfosrxJzSc05a0hysOUMbCVyr3wu2iAcOmqfV5CcIutsM9rHbh31
         6qlbRXDJhlUTSvfd5H5hb900TBjhLOloI9UtqyCfp3aZT0RAB/q6q9Lcd7BDACuv/fTe
         W8Cb1IF40Y5J8vsVZ7totDEQOP3yt6eeittzP25w11I8fs8nvtghPBoQKaNLIa35irCQ
         AkMQ7vNl4B5gAyaLHTJdEveTDGReCficKAv42v+54tIMxTwbbwXDT076JCJxXFLml1EO
         6ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/KkoOqrS06rNfxPT8mLjvq2hEOOD8kpSTpOX0alFSrQ=;
        b=bcnBbtsPYkUFXXHGLr95ng8vKIqQMfr8b1AG7g9ZsCqmfrAZv/BtvIKKCClIsL3F+5
         xKBK1rOTyipTIFqT9AaVvwYw03zdbn6TI8FNm6y0/cLiq3GXgxI1A9/+rp2tXcsWOHyu
         kiaxOTrtoMniHMbpBd3hn6vcFhC5FZYjgIkxth1k7WId5F3i6tvkNuz4j8GMidCd4YkY
         E+2H2Tq1gibj2GfXu2+lq2Paog/AwVbpxgBGyj2lm0YxRyjIltH0csd60T5swsKKlUiK
         O9Vtr9A3n70dW/qjY6StnHfCIW3n89YC4tn5rpEaGr7lq+NRlvviZCyYUDrm3ani1nH9
         mKTg==
X-Gm-Message-State: AGi0Pubdonqgdc6ygcbPJPJR/XwSiyk82ZwqFTFXap+xES/CE5nEqjDR
	ZDqYzVj+xWv01HwX/wx+YfZOrMyq
X-Google-Smtp-Source: APiQypJnTN1Ua1EjMoMuQkyYTb6OqF5LXoZPKOOYbSc/IZfovMkhxpQo0a0aKKUC5RPeDPrd+eqlYg==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr3203897wrg.105.1588240720202;
        Thu, 30 Apr 2020 02:58:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/17] python3-gitdb: update to 4.0.4
Date: Thu, 30 Apr 2020 11:58:10 +0200
Message-Id: <20200430095815.2824-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: text reformatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-gitdb.inc                | 5 ++---
 .../{python3-gitdb_2.0.6.bb => python3-gitdb_4.0.4.bb}       | 0
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_2.0.6.bb => python3-gitdb_4.0.4.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 23ec2986b1..a91bb32c3b 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 
 inherit pypi
 
-PYPI_PACKAGE = "gitdb2"
+PYPI_PACKAGE = "gitdb"
 
-SRC_URI[md5sum] = "1a7ea3362e405f8a5634f7ee53636094"
-SRC_URI[sha256sum] = "1b6df1433567a51a4a9c1a5a0de977aa351a405cc56d7d35f3388bad1f630350"
+SRC_URI[sha256sum] = "6f0ecd46f99bb4874e5678d628c3a198e2b4ef38daea2756a2bfd8df7dd5c1a5"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_2.0.6.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.4.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-gitdb_2.0.6.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.4.bb
-- 
2.26.1

