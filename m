Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5905.1626265583364462395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6nVq/C4;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso1329989wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+Kcr6qzKje1cvFexhItUqgVhMjVTA3zJP0fAFXmzaI=;
        b=u6nVq/C4MRXN8CoJHQBo0dsZ5zYFjpjV+6JxbGAJdu39QWIMxK2d98x+hf/SP9FFoE
         fQ4q0k6FTa0g0kMUjYQvg2lMAke09fYiwO0otJuLV4lVj90xOyD9bwc4gh7wiTGiyLKF
         aSXErHgfg2jKo8lkZXtWtkwZb/BkqAZl4NhdbaEYArTvFps6qYfkQi/aZEQZ2MnkzEnt
         CV5PGkpLjBxFbyczBNTbit5rxQnIHcOnK6x0J5uRf4ZDJRsMm2giao5t8Nk7D37aFYWH
         oauj2tUJEheYSmAQRcvezD8yl0ccf9l9eiuCF/JSQLQjbMpgwWzJmRd84FG6tbDW+vdR
         BFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+Kcr6qzKje1cvFexhItUqgVhMjVTA3zJP0fAFXmzaI=;
        b=BiWu4cFHTn33B0a+7TZhGj34r5jUeoFjPXRo9XAaNzPJuQWPJ971oCyMAw+NQvNQ78
         dld8VOSwKzdIC5/NZkTuIaZWN7NJpGkodmWThP0Slbp4Ya2pUtTtVIaiw9Mi6tOvpe8/
         zj++DOdBGjl6FmiuVEoU7gm7mzuh2+NrTA9QrBO4QqoS6qOo/krCrnPUtb99h1v76HAe
         Xsgg8yF9V3mb6LNdWKZnW6SJtODREiJyGgiUQkj3xnGv7/x6Rw2A+3sQ8oXsUZwsvPCk
         wpE1aJk/lty1wpM7IASVizzt5JyptYXJKE3pwYmCy4c5iOjP6Phnc4YIH1v66ZLgkMIJ
         8AMw==
X-Gm-Message-State: AOAM533hWS9G0D/j6B4NAUNjqJWQ9Ss1HRH6Or93IaHxeodzFQ6szWpc
	0I9cKiPErZFEhj+7dSTxdkHyV1mGRA8=
X-Google-Smtp-Source: ABdhPJxIpywZc2QDhIzpqrAjTxOHf1pRS+qDfX3w05zANS87yjO8Fd3HfhxFzbLCV/sw5cbRlbs3kw==
X-Received: by 2002:a05:600c:a4c:: with SMTP id c12mr3753978wmq.38.1626265582038;
        Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/21] libgit2: upgrade 1.1.0 -> 1.1.1
Date: Wed, 14 Jul 2021 14:25:59 +0200
Message-Id: <20210714122606.605142-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libgit2/{libgit2_1.1.0.bb => libgit2_1.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.1.0.bb => libgit2_1.1.1.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.1.0.bb b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.1.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.1.1.bb
index 2bbf59ea74..ae30a7a100 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
-SRCREV = "7f4fa178629d559c037a1f72f79f79af9c1ef8ce"
+SRCREV = "8a0dc6783c340e61a44c179c48f832165ad2053c"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

