Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.35402.1607956639363416400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0srDpZYk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id b5so5161184pjk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=r1Ot8DNOqPaSqXpAXyzl5zY365KVcXGEL80IL0McpoY=;
        b=0srDpZYkHOim7v4aNnnkYBW+4g/5xKDpV/zrujx9ZqOzfFIxLnfeIYYNJHmHtaBTQJ
         D/+3Zonzg9TEgw+mIyd+z174/G6qzL+ddcP9kWFpceoM668uQ2//ocbcwtfdXDP6xnMY
         HHy8sBbibCt+HPephQReE0TRrDEZ+SNmh6QeNNjXlgtHuwhhjM8zyx08IRqQomuVwC6l
         XifMst0C9IXJf1l4GMr7hTviCKS4+4nz+WBqCu+/mUTQXfB7twk+z2Q94enNK3UkjPLJ
         8FCyyxq1D2U8b23FT8g7fiSCYGSiiYWFz3qOoad01pDjiAYDKwuDmEVYl6X2dFU9+FAl
         eQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=r1Ot8DNOqPaSqXpAXyzl5zY365KVcXGEL80IL0McpoY=;
        b=iL8SjaCzDvE1k+7J/5i3AeE3ecI9Oy68OKnpeKugFd06HEi0PABBvw+nZ+LYaMcczv
         zZXKWSUx9hB1XYsUr3qwuo6lsTt4fhhNgWGVOGs2dnE4pfGw0qCZiBXOMNo9iviG9WUU
         R2BBfpGNxEyow1p2crCqnMy/IPvgDCX8BSlT1obVESQ6WfsajDgqza/3upnsrDjyc0mC
         YkDR3MBsJvKGFmgrS8Kqng87Cfi+5O0UjLke58y3qEaBiNSPbyenrg1dNCer8lY1YPn0
         75/c8DD8GVks5Zd0yCAK6g2llhLe5CPltDdSV9BRBWxPBOvwX5Cj/VA0B6DqPTWXG6zR
         cHfg==
X-Gm-Message-State: AOAM533/C9qyyBd0JYYyJE6Bf/KgtwCqBFQBPUk7rK9AFWVd5nUgY/+U
	fKuqnVMFOkcewGwTHibMXHcgQ6qTFrAiOJeX
X-Google-Smtp-Source: ABdhPJwQITur73IuYJS1MtdZCnp3kpJ+3YbH7+T4u4MnpjrgwOuuwk1iY13JXNDGbGBXPHvw1fSAKQ==
X-Received: by 2002:a17:902:6905:b029:d9:9114:280d with SMTP id j5-20020a1709026905b02900d99114280dmr23330501plk.74.1607956638524;
        Mon, 14 Dec 2020 06:37:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/25] lz4: Use the new branch naming from upstream
Date: Mon, 14 Dec 2020 04:36:33 -1000
Message-Id: <5d7ddba37e8f59f181e47bf122a551c212bbb8ac.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream renamed master -> dev, update SRC_URI to match.

[YOCTO #14135]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3369aa0322693604533ef7d30dca234e52605fe2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 6510156ed0..455d2a5141 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -11,7 +11,7 @@ PE = "1"
 
 SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
-SRC_URI = "git://github.com/lz4/lz4.git \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.17.1

