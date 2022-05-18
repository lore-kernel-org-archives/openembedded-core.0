Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2294CC3527A
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.3538.1652871543737349880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duOoHrno;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id s3so2460552edr.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mPIyouY3nR4FuIjJ/0XkcPzbbcHEdlmCHoJAn0qkGkU=;
        b=duOoHrnoOwKEZsVkl52NpV4N/DNS07LZfB7ryshE8IYYpOGugwyYI0kfh/g14pxl9I
         2+RH1q7loEmiG05XfmCABkGv6LLzfg+omIfwHsc2eVetlLDi48Ptv/Br8uFgyv0iZJfX
         LQc5sUHX8Pv1wHcjKlxXtjiY6M41UJ1tYqqOnhzo1Xfjot7k7jdZa4G/JGlWUbYl8KMe
         Ob7Cid1BhS1leDrWAZKE7bZEkwXrIHM5F6Ep5gXm7tDvbZKymjWynD8+mh7+zXqeqpYw
         ivFAmshPw/AI7+tto7rN0SuDrA5jysKuWKI/0YPYgttAmLY9uUAb6X5X1vLx7QSCKdWt
         2CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mPIyouY3nR4FuIjJ/0XkcPzbbcHEdlmCHoJAn0qkGkU=;
        b=rQ58MEioUxb9VOwjsoVdcaB+yB0QQgY/N2wcaMCqd1IHJhD6XvzTP6OIikpQGB+p7o
         vKTFeVHu6Nwz56EqwtUNiWDPNKJxqgK5F1ISVhOYy2EOlqqyq6kic8VFVOQWdb2keZlB
         b1fDxkJ08vF5YuKDJveWMkYkOnr1nGOoy0i6dTtEpwQgBWT+xBjuiKJTRIJU9H9DR66M
         U5FGFZSv7DCJK7BNbxxJrqT6Hiuo+oM785QOvTXT+UXFo/EPrym8QyATUZ/xTF5vDeZ+
         Wahn8WJrjqm9fvKyKPwoTOCCOITD1ROomPR3uXjcrc8SJYO6dcHqBGz0BQPYuLnvc1oT
         QM/g==
X-Gm-Message-State: AOAM531kI3OrvC32RVDT9PvAb/F+3UqGRiimigimSb1FmoonHBlmZiw2
	QWEBKhgcPEttOrWx6yPQfb66BZ5MAWg=
X-Google-Smtp-Source: 
 ABdhPJxV4fg8CD37y8d8x/TvkKWmQ2bLrPCWwMUo4nT6Q/90P0ZInLYu7SFDKd6gg//aGPw8l707BQ==
X-Received: by 2002:a05:6402:50d1:b0:42a:2e52:c286 with SMTP id
 h17-20020a05640250d100b0042a2e52c286mr24348419edb.390.1652871542370;
        Wed, 18 May 2022 03:59:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/49] git: upgrade 2.36.0 -> 2.36.1
Date: Wed, 18 May 2022 12:58:09 +0200
Message-Id: <20220518105843.3299331-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165812

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.36.0.bb => git_2.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.36.0.bb => git_2.36.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.36.0.bb b/meta/recipes-devtools/git/git_2.36.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.36.0.bb
rename to meta/recipes-devtools/git/git_2.36.1.bb
index 0d7d56303c..2c53616642 100644
--- a/meta/recipes-devtools/git/git_2.36.0.bb
+++ b/meta/recipes-devtools/git/git_2.36.1.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "9785f8c99daea037b8443d2f7397ac6aafbf8d5ff21fbfe2e5c0d443d126e211"
+SRC_URI[tarball.sha256sum] = "37d936fd17c81aa9ddd3dba4e56e88a45fa534ad0ba946454e8ce818760c6a2c"
-- 
2.30.2


