Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C45BECAAD4
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 09:21:08 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.1531.1662196864258001270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o1pahRIC;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 73so3963591pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=lI+eN0+NK7Ob7VuPAul++96MUBOFyR1z2QLYRQx6/tw=;
        b=o1pahRICA3G0HN1BLcASpyNcvzWukSIctapHhkxAdXEqSi5FsoNnBtE8O+PwKy86GF
         KtPiajKsAHaR+L38gr0qb5ae9ab76vL3gd2nEUgZ9jv0puDGPoV74Ag0bZxjSo5m2VJC
         7SOeISpahiRcPxOxiD7eISNpDdij6jHqT9sNqpSovJFTMFP1SR4BFHCT8zc5pgdTn63o
         e5oWswVjlbL6JWOINqRmraT7mWKba7amLodq/3Xc+Q6K7wPqUUuXXh3m88+Lqly3ujHx
         DqWe38oYzej9Bp7hgLti3IXxl+UX8dMfLqe58UpyzvKM5LFiXgiExFptWLaFdCoig+Li
         6pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=lI+eN0+NK7Ob7VuPAul++96MUBOFyR1z2QLYRQx6/tw=;
        b=F/Jy1g5eKeCxZpVD0khj3L91YTJfZ5bVOwpvZWfaHfiNZwkqId8pThoiqbFDTPhzx3
         C8WGU+JXs1Q5o6PcZ8kWkI0vIWbIFjMKFg44kQDc0wxPta7LMr0xwZGib2o5BWAZ9Eq4
         304lbfoC0DHqmHPZ6dJxXTrsqNQNq/33hW3XLkl1SJ4wtscZQZEbGP9CSYEGCbox8dP2
         gsXVlbuzWpu2qmRkohgN6dr1kZmHmvXE7JehInlkNeY+rHrdwOw7Mo/wXWaX2ua9LCjD
         9ESUyyRH9XEfhITZmyMWmDHjhm1b3KMLGrSAC93FJCwoIl1LC8US4Xl/4PLObKKJ54DD
         UO2A==
X-Gm-Message-State: ACgBeo2SWpL488jrr4p4x3j2goPKA7cEkGmsQCyT7jCusEy4WXxBfw4V
	M4fPojBZ5RohRdfnz+AC60m7WhynKgFncQ==
X-Google-Smtp-Source: 
 AA6agR5mct485MaqD4ybmZSjYvy6A+tMa5iVKKqUjTCFb55/HzzHt+LXd+S/D3sViXNn1Z8LowXvaA==
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id
 d9-20020a056a00244900b005283a29e79dmr41004130pfj.39.1662196863132;
        Sat, 03 Sep 2022 02:21:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b0017315b11bb8sm3158101plg.213.2022.09.03.02.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 02:21:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Update to 2.6.37
Date: Sat,  3 Sep 2022 02:21:00 -0700
Message-Id: <20220903092100.3544874-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 09:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170267

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
index 37b977f9ba..026e24ae39 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
@@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
-
-SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
+SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.37.3


