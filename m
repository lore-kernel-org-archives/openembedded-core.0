Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.34634.1622397954872886774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 11:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yotn/Dse;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ot16so5326158pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wCp4VyVkENvQUgwZPj8GYNP00rT/YE7jq9SIuBTVGBg=;
        b=Yotn/Dse7Zkk57S0Wsf6ZBhsz5xTKppJrRc3Jse0cLH+C4zK2QgISOcGUrc1LJsUuY
         MWJebYaOxFWNPPihunYBF0lQY2jRYjPfumFqbVnE/j1QFPX1kpB+zmWBUJcArGpXx9Hd
         O2WPYohGG2ILTLSQjRBIB0XjEWLDXUYp4aKd6zl7dw95htCZ2IBpCnwhlKigAVCMMX4y
         EZVPkne/z/6pzJfp7gtBsRGM4isNkwk/Q3/3v46vKzI7dGBWYU9z6DBGcI7pUK18qgGt
         eFcCEM7UIjMkqp9DRayoZkr9T3ZzrO8RVX80Dw0Mb/4A2N5uM/v7diOzr6YFv4HuUZij
         b2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wCp4VyVkENvQUgwZPj8GYNP00rT/YE7jq9SIuBTVGBg=;
        b=UXMvt3nPp6FBCjPv5hmFxIX8S09M3/grLboqjg4xyKvW8mpJiE4/lz6tz2lq3Knz3T
         ZNZZx0C7OHVkNjZj0/Y/WZOeJoYAvinmNd2LcqIxFPtlEJiHWDEJQ7hdeDvyzLrKiG0q
         FbQ72k+rq2MgiSa2Z8sR+H2f1HpbRhC96DA01mF5t8Fh/+KlWZT5FwzA9zo0o29i+z8h
         r3vGhVO+HN9YRKnOK6Uyf5myNZn6bN2+RU1Y2sp4M3qINWpbcwtiIre7olzmaPimBXPU
         qFIgYlrUyorPRix7JO7GX5knJ6n6CVWl0qDmDoRiJTiWkMkzYyNm6DhmKo6ZOGEr1E5O
         hnYg==
X-Gm-Message-State: AOAM530uTp1yqnm6+ncifUjNg3RLVNkI0vQDl6SkFaOATFsl8SLsPBGN
	E5E1Cw6oU5lAXTBI3ar3bd1DmBdjxH6SoQ==
X-Google-Smtp-Source: ABdhPJxldlhJm5V/sE7Bwu2J2SPCnAXDjzrYFhPYipvy8BOzh6q61pV3i7hZxRpGaKMkA7wxgQ6Ojw==
X-Received: by 2002:a17:902:aa02:b029:f0:cc19:faae with SMTP id be2-20020a170902aa02b02900f0cc19faaemr16765785plb.57.1622397954347;
        Sun, 30 May 2021 11:05:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id d127sm2918718pfc.50.2021.05.30.11.05.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:05:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel.bbclass: include kernel-kfrag
Date: Sun, 30 May 2021 18:05:52 +0000
Message-Id: <20210530180552.580308-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
In-Reply-To: <20210530180552.580308-1-akuster808@gmail.com>
References: <20210530180552.580308-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be8..ea2b037d2e0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base kernel-module-split
+inherit linux-kernel-base kernel-module-split kernel-frag
 
 COMPATIBLE_HOST = ".*-linux"
 
-- 
2.24.3

