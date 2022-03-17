Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B62CC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 02:10:33 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.5514.1647483032313285496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRzLAlPX;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id bc27so1558727pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7FpQ6hHm0VuxxZ8LQ322ttYDb/5YJqitxLIyPv2S48=;
        b=iRzLAlPXusJq18IYfCEQhF1PgasFYgBZEvg9QRcyiQ4q52RKF2P4mApOSsXB1+AtbW
         fLC8h2HRykhWbW+MatE8clXTu8esUWvvVVM1/h2mnyTRoZyi0j9e+3ByqAuVxNGeVAYy
         guf9N1GMAED0LOJQqBjwx7N0lZjJ2WL8oGyzpPdGvWTtjwTxRA3fLBZ91GngFKnrmQSC
         8cZ3r9qfKRDd6PWD/Pkp0sz/mGGxRGfrI5c3RtMXfoMXauoVvGVFZf5/J5ekvejBszA6
         92CD4RfK9uWYecbAKx05jbtBnF/GKhV3hc6INO7yCR0Pge9b2UEi9Ej2IdsPri8cqV6L
         C9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7FpQ6hHm0VuxxZ8LQ322ttYDb/5YJqitxLIyPv2S48=;
        b=IwUK/K1rKfD9R1DaKWyUZuRmMgAbGQHVNwZGMpnSSJcvAOUAww2bgGNTa/Fzf5NCKp
         cvMhV2EudFGJ1KaVDJItcR5rR7cntVHUwsa7zaaAQQjMP8X+wtqX4a3bv8YQ0N90j1ZD
         OA/9m+STeXFYewgG53dMLaSeqoYl/pMFuvrv+kPTZgeg1LAS5eZtYdv93EzuHINxAD0b
         fiEUg9YP9GbQMrSjTyTYrnocmsqggJ9Z2llRBSWWMCWWgk250VZhudfeJIIW19a6LAoc
         iCOWhLGNBOv7YSXNJ3wzESHzgyaQ09ENiuiUDZPjHxp5lZBvELMoqJXGJfb2zbyMlkke
         1/kw==
X-Gm-Message-State: AOAM531rAD8yaFvPUc38NNodAVsicYU8mLsc4dPwdFWbJcX1eP96axoP
	DR8qzQ5nZqLXhNCQcHaEpY2VKkau0Dc=
X-Google-Smtp-Source: 
 ABdhPJxK5cdvH6A7uWzgCGzbgoZ4PaI6H9MzYgZ3RDEBnHCvzHx0gJ/mglA9d6q6oQ2bEpifCGUzSA==
X-Received: by 2002:a63:c048:0:b0:381:7aad:57c5 with SMTP id
 z8-20020a63c048000000b003817aad57c5mr1831592pgi.595.1647483031293;
        Wed, 16 Mar 2022 19:10:31 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:96ed:2179:adc5:9d0f])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a7f9100b001b9e4d62ed0sm7622752pjl.13.2022.03.16.19.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 19:10:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-snowballstemmer: upgrade to 2.2.0
Date: Wed, 16 Mar 2022 19:10:24 -0700
Message-Id: <20220317021024.721357-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 02:10:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163370

License is BSD-1-Clause, update LIC_FILES_CHKSUM

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...allstemmer_2.0.0.bb => python3-snowballstemmer_2.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_2.0.0.bb => python3-snowballstemmer_2.2.0.bb} (51%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_2.0.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
similarity index 51%
rename from meta/recipes-devtools/python/python3-snowballstemmer_2.0.0.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
index 7db58928619..bbf844868fc 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Snowball compiler and stemming algorithms"
 HOMEPAGE = "https://github.com/snowballstem/snowball"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../git/COPYING;md5=2750797da77c1d784e7626b3f7d7ff3e"
+LICENSE = "BSD-1-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
 
-SRC_URI[sha256sum] = "df3bac3df4c2c01363f3dd2cfa78cce2840a79b9f1c2d2de9ce8d31683992f52"
+SRC_URI[sha256sum] = "09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1"
 
 PYPI_PACKAGE = "snowballstemmer"
 
-- 
2.30.2


