Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.1182.1604335795431695919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egjOEgM0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id 7so19846014ejm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ua48f0K+Rge8L6HqRpCRgMFbB+J0V0XsAbZDDCfjIs=;
        b=egjOEgM0BKC1EP5idanSIVQ3VksFIjEja8NPeGuc2vpf095nLqOZDjv7qtHc+HjqOV
         LyGXOLR/9NnLzbHWsIMKKTIxdgsZvFVcZt9kTXm5Qrj9PHcngo8EyEsYKy9pBWHVlVG0
         GFwWzTDOsAicBDPBogk6AlB6uaPrl0iUhoj3zNHYJ1XQS77odbxgrVOksEJRsfNw0jHh
         b2X5UQ4MDKrpjozk0TLSnY2RTP+C98B+voYH0KKLwLWGhh0sP8YR8U+dUQRf4XwFOC5S
         mbbRUsAld+jUi+X0DF7dXsg8qlTGMdDD7AHn6glfGvcj9vUwSiLy3ybWI8lIqNOHTmtp
         4acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ua48f0K+Rge8L6HqRpCRgMFbB+J0V0XsAbZDDCfjIs=;
        b=YWpc1HMnc+wTsc9qg2ibySptumrNq5zUyq53xTiXh/7KvMtIRCvuxBaHDgMsgZHjX1
         sOd9jlCT1kXej5he2iRcl9jkPBHEKasIXGhqXRfug7X4Qt5BrUP69LO4HzCV0H5jYGUB
         5hAOxgghng3Tl0gyEP9KQhWfIeP8CmqJo9BBlGjb6+oidmxDuXKAoUmTppGaS1WWG5nP
         c6JuHuKV1Uuf/cFqKWTpZcQAG3gwbyj1qF7Uz9GKr+eOr/5H5MjJPCR/MdethA1v2t1Q
         nZMNavUylt4zdcLQkJe5aSc7VlxQbmsPJEHKjXD6/LcgMrQjtKhmZn24rt9aA/sQ1GdS
         4zXQ==
X-Gm-Message-State: AOAM531zRA0hwKowOAdnzcFz+uTHzVeDBB7ehM06OrBSJZw6wzd2yIwj
	ctlM+UggQrQhmOfu4CYunji0AolKCsPUUA==
X-Google-Smtp-Source: ABdhPJzxVcUUDoj9rZqwbTsTgnte9Q1yWREWHRhmJiOot3iidmbOfUZ/bnVCvoO/0rQ580OvuYvczQ==
X-Received: by 2002:a17:906:4803:: with SMTP id w3mr15616935ejq.406.1604335793792;
        Mon, 02 Nov 2020 08:49:53 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:53 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/80] strace: upgrade 5.8 -> 5.9
Date: Mon,  2 Nov 2020 17:48:28 +0100
Message-Id: <20201102164907.27572-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.8.bb b/meta/recipes-devtools/strace/strace_5.9.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.8.bb
rename to meta/recipes-devtools/strace/strace_5.9.bb
index 0415588b97..bee2616a44 100644
--- a/meta/recipes-devtools/strace/strace_5.8.bb
+++ b/meta/recipes-devtools/strace/strace_5.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
            "
-SRC_URI[sha256sum] = "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
+SRC_URI[sha256sum] = "39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9"
 
 inherit autotools ptest
 
-- 
2.29.0

