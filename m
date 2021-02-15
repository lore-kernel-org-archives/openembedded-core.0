Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.31706.1613399932915212561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S8+FzqzM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id l23so6190232otn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1NbUfBdqnzSvxrf+yvU8v5faXsGqwC6a9zN/l0vGV7Q=;
        b=S8+FzqzM52o/RHKphJ9yQB0N09UB2ZnNSQw9aXPS5x3Bk6GAb3bixTCb62kUvtKNRL
         H5VfVSX/EPulJQoEgZ0Cp+LuPJ0fJoFf3HTWdiDCVN3RKu5ei0i4K1pdSEPrLeJhZjlR
         isM2Z1DaPAKk82hIHChx4GATckWsaMXc5zHePXRDfWPSfHGa6LNikaXA7oJBpnULbdGt
         iPhlvIHeXAMiqWJGQfL2E6yqmcJEl4EIksrZ8ZxIUPKOR396TSonlGKveE9KrjCZ0aoS
         Oht+Am3dVyrtNrP1KjN4E5tyFhA6peopiIsh/K9eOc48d8yVdYaiijEmU8hgGrGfRCkd
         Ij8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NbUfBdqnzSvxrf+yvU8v5faXsGqwC6a9zN/l0vGV7Q=;
        b=P77sK9z2NqbmpfhWlQvGi87a8xPJ3/Mu+1eW3v1Q1TCiIE38zVEk2tDyUwi1E9N+Na
         eXca3Kb/JeLXNe3wyMMUcZA8aWW8L+RbB3j5wd2MCKZNe5UrlFlkzqLb4EYcgxUSPax3
         9wX1+nGORERwNdHIcIrxwntihqfd5KDAoYtLRIz9Neta8quvt3aNNZlZuzFpUf+H6VAZ
         0sEesQD6zb9Zkln8hk38nRrX5WKAPqQTysSfaaDM4bdyt1bBUUA5BB9zQ1xwCEQgQ7At
         FR61TnjrOwql6v7OQTXvo2p4Syn5f5NNsblKGk/5p2eqlGFiSULlX2vkf80p/pxTBjgO
         xEIw==
X-Gm-Message-State: AOAM531qRilMUt9EgSye+7X7QQ+8sEy6ffmPkMy0MosWqoJZwRmFdISM
	1hqbV2wFRUtATU/JqnX2XvVGlJyRYpuAIfyu
X-Google-Smtp-Source: ABdhPJzm0pB2zf0oWhwIf53jVaplrkTeogl6pnwYyJjySyWnCJVQn+HJi4L10ZzudQpeBCy9sr4ypA==
X-Received: by 2002:a05:6830:1bf4:: with SMTP id k20mr11625004otb.336.1613399931893;
        Mon, 15 Feb 2021 06:38:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] python3-pycairo: use python3targetconfig
Date: Mon, 15 Feb 2021 04:37:24 -1000
Message-Id: <ba32302980f3885acc97f1aa85bfcede29099b47.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dadf001c85938b831def8da5851a40dc0977e3d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.19.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
index 8f60834c17..8452d7fa9f 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed464fe4efa06
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-inherit meson pkgconfig
+inherit meson pkgconfig python3targetconfig
 
 CFLAGS += "-fPIC"
 
-- 
2.25.1

