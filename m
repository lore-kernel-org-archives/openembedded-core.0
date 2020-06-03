Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.16781.1591198497132770062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iZcRU8dE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id s23so514948pfh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Vg5YZocpUK6dAE3v8Hgb9HsxQEYrMnCRF2UhXy9/meI=;
        b=iZcRU8dEAg/VJc7qcROURxCkq5TNjUgCYWl522uHSH0WuVanbs8YPQUfR3UE9bsMM+
         NykeE/6Ss7nQK/vf2m9cEj3cFD0iuqt52UZqtXaTqiW4KJakilQ6uTD9A//UcyiHzTY7
         QLXYqbbM1+3S9cui9Xg8NgnX1EdsO/SuK/litHgKg88ulHfIknRUEwCwDOi7l7F3QtjB
         E1E6GZ28PWB+SBsNxpHRj6UvEIJyV3o06TZN86cu+kiyGPtblr1ZlitmnJ1HVimYxVDj
         4zoOZ/DTsuyGHJ2k5I8wOQl7vxztF2J+pheUccXg9q3HiAZA3oWle3wvwpSijJ6vWvLq
         vVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Vg5YZocpUK6dAE3v8Hgb9HsxQEYrMnCRF2UhXy9/meI=;
        b=MH7lkFfW+cezftzJbui4MQ3arfsFBxTZr6auAQOdIqg/kXeFI+Fr0Cgg+1ob3Cx4Fg
         4+ClCQw1BX823/Rl8mXpjgwzrMn6x0TBMTVKWvDgP9QhNCkYHW03Wc92kDwiShTNFgtJ
         dV5ZEPaMNdAkTh1vKaVxf/BiVyfYt02atlkUsG5iQNGfT0IeGdFEO5Jo4IBnuVfMHItm
         mbe+z11V88nHOjLAyCG9ZAwwiCHLOozoS/+wJAC/EYNfPKBj52IGmbA9yNkgDwwRQAtb
         AN/Z2+gz1C7VAU0bybu01nybQG09Dp3DzWD48JuzblAhCFKp+cHt9FItwV0JC8qpyoyU
         AJOA==
X-Gm-Message-State: AOAM531odW4k/Wy6GIKajFRNsXIoUeCH2JolZge763qgnsR50JjIiWlN
	+SvB+BcYYkEfi4xn2FSSiHVcUC0fnqA=
X-Google-Smtp-Source: ABdhPJxejAVzzL3bolmRBz2NsgJx1JEIPX8rHbeoqFafFEULnznmuc6TOMUz/IRMO41IYfPr21smQw==
X-Received: by 2002:a17:90a:36d0:: with SMTP id t74mr266370pjb.27.1591198496086;
        Wed, 03 Jun 2020 08:34:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] python3-pyelftools: Upgrade 0.25 -> 0.26
Date: Wed,  3 Jun 2020 05:34:01 -1000
Message-Id: <b2306d00dc82cb780a439b569104c0f526e6e4d5.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
References: <cover.1591197295.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0323e12624ef45e64e7a8ba6384c06e4d42df064)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{python3-pyelftools_0.25.bb => python3-pyelftools_0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.25.bb => python3-pyelftools_0.26.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta/recipes-devtools/python/python3-pyelftools_0.26.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-pyelftools_0.25.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.26.bb
index 03d96db3c2..575dfc4dc9 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.26.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+SRC_URI[md5sum] = "0ba0de4b47127249c4d632ae299cb0e8"
+SRC_URI[sha256sum] = "86ac6cee19f6c945e8dedf78c6ee74f1112bd14da5a658d8c9d4103aed5756a2"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.17.1

