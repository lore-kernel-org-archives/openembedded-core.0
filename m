Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.1179.1604335789069313266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jr/CpHcy;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id dk16so19219703ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7mPH5fBQoJkryTiuRBAB1G5oWoy62fMP/t/VdymIGmM=;
        b=Jr/CpHcyZyW3FPueVLagTfRKFvz+klKEiGrZNLQgP6HGnjNGUmsHvHAm1VWLWnoUBG
         ksQNja5MkqVV+rGLx1TQZu4MYPV5wZ/hPxnhzrHWwXYKM8TouNOp6bXtvtWtzLDpWWNC
         j9tvwU2AfitwRIW5lWzKx2cHRLodJlNHiXxfRclYZpHoqXF/e6FfFSUnEpRly8YLAxwB
         H/ZLsy0E6JQnlSsGv+plLjdZw5VLBpR3dq5OfRI9QGKQFR3HxtK5FNFPQPWy0XLsouLh
         KNAqygrWMtvUW3HKc3uXnELJHk45rEqlsJTs9EVP3JuKDmJzizW76M+1rTmCxxITTFXN
         7P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7mPH5fBQoJkryTiuRBAB1G5oWoy62fMP/t/VdymIGmM=;
        b=ojfTVT9YOAQ4TGCPKjvwB+a3CD9Ejh/u97hSMXaNVT1pVOyCyKjygSI/cltMnnoFqr
         DmQHhrws0g0+3OXCL/vgQJeTal9yVHbEsK4P4Rpjqm+uNAIHhbTYIZbH4Rn2Me3gcXSx
         EMTGrHAY3FBN13sVSIaKYhIQlQ2OBMKqAIRio/AuMTi2ExDYnw/dkTqKMj9dDiH8usyO
         wmCYc825y3HOf0AOmueuc55PqxT5tHOG2pfXQ2EhGUt0+XE64rnzSAC/wf+fXVg1wIon
         FGckDenTNWoPJ3XjDBxwcXjqJYxeQAtAq45dyaGUOO1erOcryOX8AEIHTv1+zYMQARlh
         bN+w==
X-Gm-Message-State: AOAM531vdm5GiOxoJ801JaEGA+vD/fJAVbjNQ4zLfByReAQnM+0Wrjd4
	zslrCNT3vhRNupz4VPFWXnfSa94NHq/MXA==
X-Google-Smtp-Source: ABdhPJzN2LJO3VaV6Dbmc3ESuREaDNVCTzIe4UV22KEO3r1pQvAZNpcpSVsmC+TN4eTqonLK972Yrg==
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr15730558ejb.548.1604335787462;
        Mon, 02 Nov 2020 08:49:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:47 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/80] libuv: upgrade 1.39.0 -> 1.40.0
Date: Mon,  2 Nov 2020 17:48:21 +0100
Message-Id: <20201102164907.27572-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.39.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.40.0.bb
index b6ce4757fd..f793db09be 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "25f4b8b8a3c0f934158cd37a37b0525d75ca488e"
+SRCREV = "4e69e333252693bd82d6338d6124f0416538dbfc"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.29.0

