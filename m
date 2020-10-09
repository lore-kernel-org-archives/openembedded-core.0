Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.13009.1602248303138224169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 05:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fcfIKXqZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id p13so9239307edi.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZEgAX10OLqJ80oOm3642KDSTJgy5lts9da7E4FLJ90=;
        b=fcfIKXqZTA7f3eztVu8eBDtiU5pTo9I4q1hwDYtHbjlxoqTkm3ZmQLGY0DYXV59VTU
         5f4V2ltkpppAU75TBZMd8fmb590mlcm1QKW8bzwwRWKAm55LoDSGMrgqOGMvoeME/Epv
         XnwrPcEnx5KzT2lk50+iKpPnY+X9WzZMLkb7ZJKpshOCDmv+VvVjhgAJxelpnClTuBEp
         lplMaDPZpmPREaCa9zbnlfOU99CvJT6KSjBS4LWjuowMeYdPNq2vYkVTmyVCtpf3ycV7
         b9Gv7HEbFWfH+B4eEQ7QtY4oOQnMD9hoPvc84mWnOIGWxY+o/CcpGo4GKZ5fz+jmZPKg
         b56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZEgAX10OLqJ80oOm3642KDSTJgy5lts9da7E4FLJ90=;
        b=Apl1lO+dxzfvbYTzPaTxbqTRjqHQZNh0NNpDS4R8iz/a0RkaXlcSfnguXeBLuMbPNk
         4ILSeUWg7KmnOdMEBixi93VlJ/CleQaivewSbE8oWxPiGUGo8vkfpC0afd8NN4AEPV05
         KgpsBVspQCxUZmk5XNWuO8nTb+MemgiQjQMS/VglZ2kyl0Lmn7W1fdK1q6y35ocnKm6m
         BYSQYuz09TBx/Qn/UJNn3LoqteCLMLqChzC6Hp9ir/rTGGlfmV1Ou05iFM2yZ5YWpaIV
         PtuhFJBS0HdQpclfRPP7YcbSoDFCd17nHp4yO0DyBm0AzUA3xxD16mi7fFWIOarYjmpn
         AT8g==
X-Gm-Message-State: AOAM531WPW9KmpUru2PF5fCtpNZS7anBfUe2krcp+r2HZ4yAEl5r0VMY
	l7HqrDpFXgq2WeIIpGPhV0qXK3s1jAM=
X-Google-Smtp-Source: ABdhPJzdGb39tGi2DQ6RVAJdMdN/hF4j+Msv3FPAVmkyZiJVu14HzOvjtWMOvScGMlwKPKo9qEEcnA==
X-Received: by 2002:a50:a455:: with SMTP id v21mr11810984edb.180.1602248301391;
        Fri, 09 Oct 2020 05:58:21 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g18sm6242991eje.12.2020.10.09.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:58:20 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] mtd-utils: don't use trailing slash in S
Date: Fri,  9 Oct 2020 14:58:13 +0200
Message-Id: <20201009125814.3035266-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009125814.3035266-1-Martin.Jansa@gmail.com>
References: <20201009125814.3035266-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 9181413427..8d6bbfca3f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-install-tests"
 
-- 
2.25.1

