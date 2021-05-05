Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.9828.1620227966933337541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lWvaWVJW;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id f24so3445185ejc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MB4fjLkG4Qp+/CqP1CtGaQ8/oQWrBBu0ojhcU+sdFrY=;
        b=lWvaWVJWy3pLKtHg3YuSCghQTbLI8uYXlBe4Zvxm2+hV4aaIN29gjeCKzk6MCYCRKI
         S7ZfbY6h5PCad2H84EcVX1pcnlbIijMkU+3Hs8OtlmELFIVucBF/rfJQc/yZZZueJv63
         diJv6DZgqhTLljn4mnmNBgtb5otwIvxfx0m4wzZPBKWAhRib/a/NU65PGznF4S9Co5Qp
         rdyUPpTOMrXEI4Peo1194Sok4CIh9UIZvTqM/3lnw7XaQsidunLecYSCmApItqManORR
         5upGLvUtGEenEHFbpr16VEcwt/pa80I5uXAIYGk7jepKAxzyEXHX4WjUZFn1AYn4+UY5
         G83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MB4fjLkG4Qp+/CqP1CtGaQ8/oQWrBBu0ojhcU+sdFrY=;
        b=S+xYFpG6rFnT/AAiLMxjJdTUd1MWOCKdr9vQMX7m+x/+jLyKi2ZVuonsM74X4Nn3L+
         uPpfPe2OH3WPOk75AnO6ecKmV7F9+4rMI64fpz9R/7szzekdQLidPSAOudJmLgiVNEgC
         y023M8J2e7dqFBGI+pCz+ZuI7DzqarEqJJUgUHCjTLyLJrAQiDyA6jJKnP8CLGaJyxCe
         icNwCmuEetuEXdRHuqixS/7Hb0b63VwQAp2FTP4q9zBy/kXLJzY7xLQ8EKUDXolrIUla
         mbcX2MDBCkA2wmiG41y74xke18hVCrBq8n7ywozcVxLLEflD8hgIqjFmBLbN43e5HTLj
         7dAQ==
X-Gm-Message-State: AOAM531tdbaSDCN1/0LvRiUurYsBAM8UP3AdLO+k6nF1hpt1uaID+umV
	fZEv7ku3bJvq0Qh7e7eDH82aSUBJwQgkmQ==
X-Google-Smtp-Source: ABdhPJwC4tBWa0cRIEF+yCsWFIjnfWY1x+/Gru1dKBfUCRpXfQlcWZY5a9jGx1S0sJhWnUjIftY87w==
X-Received: by 2002:a17:907:3e06:: with SMTP id hp6mr27946110ejc.273.1620227965462;
        Wed, 05 May 2021 08:19:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/61] less: upgrade 563 -> 581
Date: Wed,  5 May 2021 17:18:26 +0200
Message-Id: <20210505151850.660512-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/less/{less_563.bb => less_581.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_563.bb => less_581.bb} (93%)

diff --git a/meta/recipes-extended/less/less_563.bb b/meta/recipes-extended/less/less_581.bb
similarity index 93%
rename from meta/recipes-extended/less/less_563.bb
rename to meta/recipes-extended/less/less_581.bb
index 123522b5dc..17f8dfb6b9 100644
--- a/meta/recipes-extended/less/less_563.bb
+++ b/meta/recipes-extended/less/less_581.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a"
+SRC_URI[sha256sum] = "1d077f83fe7867e0ecfd278eab3122326b21c22c9161366189c38e09b96a2c65"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.31.1

