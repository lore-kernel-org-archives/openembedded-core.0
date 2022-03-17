Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38576C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 00:59:36 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.4883.1647478775833751489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aTUjCe2l;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 6so1447284pgg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAlDnx8pUC01Gbk+TM4yPa+ZGcm0WN/fwH9oA1St+kY=;
        b=aTUjCe2lcE7KtK4bsWSZnoHH+rE96vHOyu8F4UouJgktRBnRrxjRhUl5/EHk6HY94g
         dqShPVZr2SaF9hWGeUyX7LMwRMppVW6BcIbtbMuFE6If4fFOiDVU/VR7e747bJiYksni
         mvkJoj+JmK3IWexS7E6yl+b8Zs74vszAsMaTBOT0goGv0ISU7gGgzeiSFqnXbKCdyHnA
         37nSo9AUGoiXJokQkYUuqBBKNnL/FMbC4jNiIdgh2nZIxzSYUMEi5uyj9fyWGLEVXJ9+
         LobT+C61UjqjCEOePBnRA1j8N98y09Cm2KdYF1AmzE2GKborExk43VR/v4ThdDriI3fj
         lKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAlDnx8pUC01Gbk+TM4yPa+ZGcm0WN/fwH9oA1St+kY=;
        b=e2dPeQTAwJd7y7g82nQrihX6sQV/4CVaXd9vauC/iS2tUFM5924Wqo2CwLAKdpmmhv
         bnI1EzxQTyfgOdN/HOQfvx50NxfJBorMvywQmE1u4QqEqZwrJ29GPkTBhdbx02NOYGtc
         yfwmXsxzefk9Ub3Ft1IOUK3N6D5g3GuwwOzJtorU6rqg5/sOYo7OQTG0FvMR9TjCtcTm
         N9gn52BUh17HZrXWWPPkD8mHGPA95pJIMvUi2nOfmEtWOgzeh9F8mGLJ1QkfYgbEwGQ+
         uMv7PTiXgZ/MOXagpvjdEBvfQ5V4TboQ4irOC5NICppyvOhMhl2P9DERsiMCYNnByfUf
         lgog==
X-Gm-Message-State: AOAM531WSO1vxRPC5BlYFtNMFPqvQanzJDrtN4kyFg5trD9jIxYGJOky
	G5BAzmKOKscBmb0BIzxjcZRL6IK/sOY=
X-Google-Smtp-Source: 
 ABdhPJxE5V94vkwuznvLEQHDhjKhi0LrnisdSLvpXzQ/Z4HcoHU/4hf5llqNRN+Cy1lh+cjV/3oodw==
X-Received: by 2002:a05:6a00:1a11:b0:4f7:bf07:c068 with SMTP id
 g17-20020a056a001a1100b004f7bf07c068mr2091849pfv.81.1647478774655;
        Wed, 16 Mar 2022 17:59:34 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:96ed:2179:adc5:9d0f])
        by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm4677564pfh.174.2022.03.16.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 17:59:34 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-sphinxcontrib-jsmath: LIC_FILES_CHKSUM
Date: Wed, 16 Mar 2022 17:59:26 -0700
Message-Id: <20220317005926.709185-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 00:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163367

Fix the LIC_FILES_CHKSUM

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
index f1653399a4a..0dbe5a9db9d 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A sphinx extension which renders display math in HTML via JavaScript"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f0064c10bd544bcffccbc67a41c108d3"
 
 SRC_URI[sha256sum] = "a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8"
 
-- 
2.30.2


