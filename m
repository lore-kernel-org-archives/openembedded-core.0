Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E492C3A59D
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.4402.1649843824959418442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iHobvoaI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r13so1806984wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Andt9DR0TNwT4Y6DKvXfEd8LGV9D61QxkOVR+NbZpUY=;
        b=iHobvoaIn3QHqZBFqrM0CpawDBnK/7uctVxtW5A4M0WI0EM22s8/mwFM4JNQCakZ/I
         LT5kvoR7a9ECaOoQ+rVY0XEemjVE9vH7A5+gT4ZGFN+gadb2TY5QMgPJHcDMouaWszv1
         xNo4WhTXuxbtW+2xt+yZXd66qsGgptSiUW0R/bTqh2QkYTmMuv9+ahMeb6l/qKOGHOoT
         9kCVIZHX8wuUttXG8vvfcypcLlPeCH7Opga7vlvwekBpcgTZZRrVp1K9uWM0A1KStFDO
         miSnLekeR7qMa7NAUwWjS6DIgV8qdRoetZbPKqIizjZfuv6CWJTXYeWYZ8qsBD+BWDZm
         4cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Andt9DR0TNwT4Y6DKvXfEd8LGV9D61QxkOVR+NbZpUY=;
        b=Rc6hiWNwuGV1X+HOyzNE/QASNK43mPwMagEuTg4G2V8tFuU1+UcmseuQ3vxR+XtYFc
         0tHEdJMabIATgJ7i5Q3vgoiHP1HBkeYZDTZFQ8mPXQ80fCz+OFDn/73qVnoVE5sF1L+H
         yNbpLjyykItwWQMQxX7uJzY31OdNz0z5yoX88iwI4rjKWKwHWx3xjMuoINbO6Qd2cUNc
         Nw5mTtWxHvmoX0e4C7L3NmndS8Lo+w4Vkkf4uzmy6CmJcIJAvdVgelKpMK+zTa4PV9N/
         /+93Vl7q3Q9E8FejQfrGg8yzaKD3oLOXgcZuSwQhSOAaENXiZwFdxYMGmlCiAk/qm+zb
         Dlhw==
X-Gm-Message-State: AOAM533ZShoaCDN91g5gbju7tQyVfjZTkkPfT5FwPqPRxXCasSlbDkd/
	XxWrkyUlB+okwXd+rIGUnexKA1APwtfWsg==
X-Google-Smtp-Source: 
 ABdhPJw3Ul6206XtwASEmUQ/jtbeVb5C7OgHYGtBGCQCzoFRBYBKEx7GRY5uGNh6EET1ijFOMA83CA==
X-Received: by 2002:a05:6000:1106:b0:207:aac0:f5ae with SMTP id
 z6-20020a056000110600b00207aac0f5aemr8758449wrw.360.1649843823112;
        Wed, 13 Apr 2022 02:57:03 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.130])
        by smtp.gmail.com with ESMTPSA id
 100-20020adf806d000000b00205ba671b25sm31031498wrk.56.2022.04.13.02.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 02:57:02 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] "script/autobuilder-worker-prereq-test: Added quotes to
 variables to prevent splitting and gobbling"
Date: Wed, 13 Apr 2022 10:56:49 +0100
Message-Id: <20220413095649.5978-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164312

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 scripts/autobuilder-worker-prereq-tests | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 82e9a77bd5..cdf00bead6 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -15,11 +15,11 @@
 # test buildistory git repo works?
 #
 
-if [ ! -x $HOME/yocto-autobuilder-helper/scripts/checkvnc ]; then
+if [ ! -x "$HOME/yocto-autobuilder-helper/scripts/checkvnc" ]; then
     echo "$HOME/yocto-autobuilder-helper should be created."
     exit 1
 fi
-$HOME/yocto-autobuilder-helper/scripts/checkvnc
+"$HOME/yocto-autobuilder-helper/scripts/checkvnc"
 
 . ./oe-init-build-env > /dev/null
 if [ "$?" != "0" ]; then
-- 
2.25.1


