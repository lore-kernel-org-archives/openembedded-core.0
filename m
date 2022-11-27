Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D36DC46467
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.92036.1669557346444140563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ORCPXsMY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id t17so7225108pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYSY+QO0/1beQS5neaOQEh6K9kXTYeGc8Nku57AyQLo=;
        b=ORCPXsMYUq0tYyxVa7rv/xmoX2wCF6FEY+LGV13yVt6+UoODoFUXUPiizkamxsTbPv
         1zo8bEEB3efAneX2gsHfnHlycwT977D6rl7ALpQR6Jc1vvw8Ulxkbp61tw2FOVnlnHPV
         eXzEyM0NiSJF8WrASUaw+pN9L2YHjd1pqWgMNym7+oMIAQH3erI/j7LbVIdZcuyIpTDC
         33PMRpd8uNzhCWasrFEfn9psYDp8XUAe5azNdZ+i+iiiyWbmlTTKdbscKC+reUCmzsUr
         Am7SdcYrVeDDdWb8kncUDMe2uZeraoZwhCfJqihkRiXHO8wwSED6W7pml/QqT2yvDuzW
         pcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYSY+QO0/1beQS5neaOQEh6K9kXTYeGc8Nku57AyQLo=;
        b=OgJ5VpUtqlyr3/9cOpU1rUo0ITOLJbQ4/81M3HSQzvdvC9BFq23efHClv/HN3stiz9
         YDe2lib5dyAp7enUgqnqIPvV80oW+NRq8JMR/9FexDe7BvCg6F6N7gBLiWV1bdwkRiRl
         zBFO9/SCgg9kIqhfGDY6OORSZ73ix0FdplsZ2pLBXB5rd0nuCA7jnxVALZjxwQs8OHZm
         rhEqV2gIrAIIEmxL4iIhszsTCxvMo6jWI/+sPwWnKyL3w1K07TPwOlMouy0ebICVzUNl
         lqIJbC0nC0ShpUgOH+OHFFIBSL0S++7O6BrpoI5Y18aWduUnEgRjNPQjKDgk/VQh3T2A
         SDDQ==
X-Gm-Message-State: ANoB5pkLnJjYkMroO0kWkDF8cq3jo/c/ptGbf26bsLqQXTignWHW1Pub
	wDIg2176Z/FBY9w16HFtncJPX9t4og7HduS1MIk=
X-Google-Smtp-Source: AA0mqf4O9IWJV6a+euXHJ+xIUC9cMP7qr/9hY6BAunHWBSkftXD8EW0dGQMIxvH5g+iDYECApWCCvg==
X-Received: by 2002:a17:902:b101:b0:188:abb9:288 with SMTP id q1-20020a170902b10100b00188abb90288mr29413514plr.123.1669557345508;
        Sun, 27 Nov 2022 05:55:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/31] xwayland: upgrade 22.1.3 -> 22.1.4
Date: Sun, 27 Nov 2022 03:54:54 -1000
Message-Id: <eafe1a235894790a28a8f951cff9ddc7913ba227.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173853

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 553c080e0e30c8f6b69b4c5fae72903ee45ef6ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.3.bb => xwayland_22.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.3.bb => xwayland_22.1.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
index da1b27525d..8597d07a7d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a712eb7bce32cd934df36814b5dd046aa670899c16fe98f2afb003578f86a1c5"
+SRC_URI[sha256sum] = "5c39bdd77444c3fa7a0e2ef317ae69ddde89a901dc8914dbc8eac39a9313512a"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


