Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9678.1629636687390555918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KQDo5xFi;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d26so1443435wrc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XurfYlVL2EXz68uowsvt1Q+33p0Wq4lmm1o4BuDhnCs=;
        b=KQDo5xFiApsblqZarG2HJfPjCl/mp/1qex/RQSnhU44feWJleslKCrh6t06LjiMfFT
         tNkrVUhlvdiU4q5UtTl9R0hSKF8AV+v2T8925UZ9HDJwJPkdLEZUbnHyyB00N0k6ynGv
         ElQ/B5NApqw25hew9V7XaSq+fwH3uBS+DRV6bi14MppEaFznfx4i2EyC3x4OFoySS2qh
         V2wqhhLEcGdcSC4gC3qpgAbItQaU8v3qikfCWJle7EkaahM6W/PJQm7Vq5rBPpryc0ny
         FOFqkjURPAGnltxjWZk5W3VZS0RcX7loSjnnCjndaOzwM08WQbvJsIUqcTvItg2kvbRo
         fmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XurfYlVL2EXz68uowsvt1Q+33p0Wq4lmm1o4BuDhnCs=;
        b=tDwo803qW4BWO1nOksG3UG02SYKUVUDtU/8ol0vizH+z6gGxb889tIkXuBLRnAplec
         1dFazFr5FenJS4pOyo21I00yPZt1GxuF4mi7TLqhX37GNdxboFh6bl2hR7qLPTnnkn5t
         q7OW6JqTt8wlbDMcLrALVoujNMtOwM9E6wHXDZn1mOIg12v50ZAduu/fKwpwzA5byVGQ
         5EL0J2uE2//QNF5wRW30mUzzuo7h2PCMr5c9z7cNAGpr0PJbGw0ro5z+jG+KzwSa9pqA
         bWrOH1tlYkHynzfhcycgtfJgzapl90wsO5wOb6f4L2Ta+NBDN7FXA50cERMvUYxKbSOI
         4few==
X-Gm-Message-State: AOAM533qbgtXkZSUWZBwefxi4GAu9SZi4ESlMo1N3tCKyr80mrV/+2Ny
	N/9d+6g44M80xRmUVu64odm2am7tTeGAzQ==
X-Google-Smtp-Source: ABdhPJzgR+ishDOc0/WzzQ5vuEnNGnI0OCi/167RoiMwJ7nrUmvJT7kG5PgkGBgKhA/6P4sy2FVTuw==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr8336365wrf.319.1629636686056;
        Sun, 22 Aug 2021 05:51:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/55] libedit: upgrade 20210522-3.1 -> 20210714-3.1
Date: Sun, 22 Aug 2021 14:50:30 +0200
Message-Id: <20210822125103.310416-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libedit_20210522-3.1.bb => libedit_20210714-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210522-3.1.bb => libedit_20210714-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
index 72392dd190..8d68d6874a 100644
--- a/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "0220bc2047e927c0c1984ef5f7b4eb2a9469a5b7bf12ba573ca3b23ca02bbb6f"
+SRC_URI[sha256sum] = "3023b498ad593fd7745ae3b20abad546de506b67b8fbb5579637ca69ab82dbc9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.31.1

