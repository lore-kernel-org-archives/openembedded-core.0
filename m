Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.59.1626378001137954443
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bFymjoKk;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so6755188wms.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWFnVWt3wFsz+lTHLjcxErGZZdCY02gc9cUxdhG4PUU=;
        b=bFymjoKk9diovV288qmJBcpF3P54965iMOmvqaQSvSI5kMGEg8A5wHJJqNUNYxGkIm
         d7T6D3RkgmoYWkEEHUrF1oxjzKQKqLdsb6kiyyIq4hFmio4KpWIh26EN5pnHgpxySjlN
         6bPmt0cEU26vZN3T+dDsXeMVppjB0j7wuKx6yU1FjwpCgfkAC7M8kINFu/apSrCiz+PL
         d35GJt3JclybYqpR44wnJP2sDSVh7kK6v9HUscrWdTtuhTRKZQOS8qYqAfwveLL1eCGI
         UBHPJccYGt0mlbXAdY0sEcXRWrT8Ci49TPqOHHfmlJfKzxH04tQ+Ek6w5uSKXNO4Dsyp
         p00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWFnVWt3wFsz+lTHLjcxErGZZdCY02gc9cUxdhG4PUU=;
        b=QkXsiwimvTS45dpZfDf3ikkcp9Ih3o30FRvurSCSOWPbLLhudzFw2igQDyaK+EwCuK
         wOL2ZQjxa7JTyUUMCA1uWj/w6nDMP6W2jJaENB8HeWbE4ciUATN8M53Ajxi7BTGspwc+
         axZn8ITSU9viHvyKwehkkTJeo1bGDjNFPKOfq9eOs8KIGibE4lKm0kLi3aQfoCHLp7lH
         AndlMwwKn/0sWU8vb0P72udmMK1oHHr2kk9cFs5dXGSF6+BO0NyBfg44exa9Cr348Ywt
         hUcPGfUjVEbmHYgDQUDAEecUrJvunoIlkgd765+qQgp43y+ieTq7NJcklxav6GFF2kiz
         +h1Q==
X-Gm-Message-State: AOAM532EjKlLHjoLrFXcr0Y2aOsTiEyhUP0u1jACohH7qBWsw/EHgCJH
	Wj8+5YF8/P1O5ZSvX5jNRHN2Lz9slAIkTg==
X-Google-Smtp-Source: ABdhPJzmUvDxaTw7KnCZJ4GsCWYgDQmVLW145Fta1n0AxIOGnHKQVU17npdfYTYOMOn95doF5M/O9Q==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr12420067wmc.65.1626377999539;
        Thu, 15 Jul 2021 12:39:59 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:39:59 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 3/8] maintainers.inc: overlayfs bbclass maintainer
Date: Thu, 15 Jul 2021 21:39:28 +0200
Message-Id: <20210715193933.66120-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e59f01d66a..90b20c9223 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -808,3 +808,5 @@ RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+BBCLASS_MAINTAINER_overlayfs = "Vyacheslav Yurkov <uvv.mail@gmail.com>"
+BBCLASS_MAINTAINER_overlayfs-qa = "Vyacheslav Yurkov <uvv.mail@gmail.com>"
-- 
2.28.0

