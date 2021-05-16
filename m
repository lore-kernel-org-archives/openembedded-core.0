Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.11572.1621204380518446899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUvF8WC3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a4so4483352wrr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8kEh2xDfQk21bIma091QVgN0IzEQww95oU1xylsoY8Y=;
        b=VUvF8WC307dp5DmOl4RIYcSYTgV1OX0gaHQPRwtiRg5Se8KZ47bENujerdjXHTD55Q
         iiFfrhu/vJjBqMKQc9D5F7pfJlzF6udq0B6vN8AiLPJ+caRbCVEzUFu8XfwB6oGvoYid
         bzzLwvIGvJHDUkyYnPIzTazAeCSmuE5uws3eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kEh2xDfQk21bIma091QVgN0IzEQww95oU1xylsoY8Y=;
        b=Odcm7HY1ukyrei73FWO/RNuZrzQvzE/CNdBNA1sE/HtuOdU6JYUtVdJ3s6UzAeICpL
         JkmUS3/fW6WyAwcNxZTX0+RG1NAKx/6QuBn5Ciq1Hr3eoldRo804JCHVPbURikC4Z42E
         we2KELgq4cZvFWrKQqbFUQgffxWtKnZQGfLjcM6i+0wgDgWGkQ+PSrmtl4RJ177PRT9+
         UuzAk1jFmP+KKRQTOCBYCuGVxgyeOShNh8CadzBnKeR4BfCShPGYzbNcb8C10pWSRq4g
         6HPZ+hdLzyHa0uauQ3Ot2ZuBMFAdwP6b0g2ejvCBae02Aa6jur4AAbMmcam6F9HBeCF+
         bZZg==
X-Gm-Message-State: AOAM530jOE8/FE/bFZp8a7jka1uafURgyjFcfL8vcObTrYMZeW6Z5EtX
	JLC/SheX38j8m8f9xS542EYP22Dt3Se+aQ==
X-Google-Smtp-Source: ABdhPJyWI63XY2NqH3dNZM1He3Fl3R4vUo3sc+oKh6qodW0bHm2d6JGdoWHScoJ2kL9+nRwLjUjDLA==
X-Received: by 2002:adf:f805:: with SMTP id s5mr70195723wrp.143.1621204379100;
        Sun, 16 May 2021 15:32:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/27] libxkbcommon: upgrade 1.2.1 -> 1.3.0
Date: Sun, 16 May 2021 23:32:40 +0100
Message-Id: <20210516223247.2401235-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxkbcommon_1.2.1.bb => libxkbcommon_1.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.2.1.bb => libxkbcommon_1.3.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
index 3df90f7c3e1..26bbaadcb54 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e833a7d3024c9bb9d5eb2b20f6d5de08865541f21bb7ba227c83cbd236691fb3"
+SRC_URI[sha256sum] = "7b09e098ea69bc3054f0c57a9a25fda571c4df22398811606e32b5fffeb75e7b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.30.2

