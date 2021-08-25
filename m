Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.13913.1629891514643309576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dDhwhk//;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id i6so12187495wrv.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NkeTf6/TE2WtZ0hISuf5HM04VdL8udpcDfv9XI5VgMs=;
        b=dDhwhk//oiqcO8EGtSQFOggpSzB83EyB5rHpanwyTfuGaCI614wYFe9Fj14TWbckpA
         D6NgJPc08U9vLObDGLUMA0aR6rESIgp5JDxK3lP5Mg8g61KKgYPs+boAf/etGMqiv3LA
         P9o/RUFktbybv1IJ8r7bxAoBQHAWdjhviWoMQI8sw+vK6bUKUkhiAm279oLANrjKowKp
         aPwkPPAzWvbNZvAh1KNywQftmpbZFTamQIaGqi6fOHaSCBLL9+CKYtJP6WT5gKFKrYDu
         /uCeUL+EDe8LqMYSQ12KH/qFB4zHuwTZ4vCNuGHJWeoE5JVUfA3Ril8KxStQ7yet5hre
         AOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NkeTf6/TE2WtZ0hISuf5HM04VdL8udpcDfv9XI5VgMs=;
        b=rnMzQoGL3UndMvldCf/UaErsxz+mzaCEDCVPVsqw324po8Kfnm0YBa6jacxytEgVT9
         v0NHDRBhSwlYGBCc+AnetpKHwUlckrUX527JQ46F6+c0cr3uBTPm6/w/Mq9iM55KFyxx
         Cpfx2jdOIPfF3e9A9MRR5CXJ/p451gNERkdon2996jCqFmsWcS8/YUxSPOuemB5SKveT
         VmATHxOGEOM/nsL6/0cyQw0uNZExaRZxbVpKibdOU5vHeBXEdSQK8LDQbaWrUiq9kyFk
         unuUQXKIAZQKs0QfWcu9XH97CfnvkazIVbnJ6VHkygBd/xZEDpwTuN3dXo6fYLbzd78t
         JGyA==
X-Gm-Message-State: AOAM533yHtTqx1T6UWzhfjlYeNHnN0vY1cn7t/uVmkPSVRL/k6pCl3NV
	Tcld37wnCaUUI90H9vuYpuf4fQ4dXHR0Tw==
X-Google-Smtp-Source: ABdhPJxATgl0v1cd7OcVywLzG9eqr+VquWDt1W4YqnfD2GQh/bqcZrIBOkw6h2OV3t8LC/WMLnmMXQ==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr24343924wrw.116.1629891513183;
        Wed, 25 Aug 2021 04:38:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/16] libnsl2: upgrade 1.3.0 -> 2.0.0
Date: Wed, 25 Aug 2021 13:38:01 +0200
Message-Id: <20210825113804.779395-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index badb71d977..53be67fe85 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "1.3.0"
+PV = "2.0.0"
 
-SRCREV = "fbad7b36acaa89a54023930af70805649f962999"
+SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
 
 SRC_URI = "git://github.com/thkukuk/libnsl \
           "
-- 
2.31.1

