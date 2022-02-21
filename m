Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20237C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.5668.1645406914504112689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XjTti4jZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id q1so3059252plx.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=XjTti4jZJmYMFhV6lgpyAHcb6gO+i6z01xL1lBFuFwasemMqai+P63/x2hjDhSa2yW
         2ZOEXQpp7doeqlrm8Jvet5XaCFgnuUbMWt6QUQyNjD9Z6fm5jHR3xs2VQkaVh76YoYJe
         2w5QSGsnKtz5hgJp/lsZJlgEUMgjPbZuYM/+fzpr1ZwBTa1HgAeQ36Y7vVqz6GwjnJ1h
         YygxDk3V5j2/Wt723ac/KUEDNDugoB2oLpWjGm7HP/ZFOI30eSRjt+zV7nU2ullEtIii
         mDq1sZ8XTt8kdJsEj1wVcswIdLdPUhY8pD817w3NX4TOOQuwi5qI+Te2zWb+IqYMTS7r
         lTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=qPz7g8B0t9QjnuL4YuNkoUOjEi3JiWgXYWdGf6wKJ2Tblz2QP5vep3hzB5AlKkjTRS
         qFT3xlP2b57I2+AyXR+0mWZof8edBkVWc6ufNKIvwzjQ/OjfYtl4xRM4Ut9ovvP9Bpp3
         pa+WVAWzurEu17Cn7gx6xlL0JAjcQcQ9kZrZnS4SKpk+VFiFoGvOioTRhNomawnSjmsQ
         NH5qfKlKdaoZVWPMYOWzM85FbE9iLXaUZSq6UFPEqTeXz+48lZMhJTUMClQdK6j132nr
         6nPt4DNaIXFdTSTDjD4ep9qMdMnd87vee+AB46MwwVe8Lva6iITfUzYOv1hV/MoUUrWN
         th2g==
X-Gm-Message-State: AOAM531rd89qkYZi+tkkUCCan8pAhzluAh+AMdI9rCIdv9BRBOcttqNl
	zaz0QR9XwHWvBpTqqXCfv4vytOi9nxWaog==
X-Google-Smtp-Source: 
 ABdhPJw1gqu0/nLmNbR3sWvDaL4O/05dfzMiG3QykbysliiUqUyo01LCxp2CgHrbVEtd0MURg+cHsw==
X-Received: by 2002:a17:90b:388d:b0:1b9:950c:f08b with SMTP id
 mu13-20020a17090b388d00b001b9950cf08bmr23508155pjb.49.1645406913539;
        Sun, 20 Feb 2022 17:28:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/19] python3-more-itertools: set PIP_INSTALL_PACKAGE
Date: Sun, 20 Feb 2022 17:27:48 -0800
Message-Id: 
 <9b260ea23a9ea79fa3750694fb41c1fa5fcd6993.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162011

Define PIP_INSTALL_PACKAGE as more_itertools to match the name of the
wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
index c1e34b205da..5788af3f71e 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d24
 
 inherit pypi setuptools3 ptest
 
+PIP_INSTALL_PACKAGE = "more_itertools"
+
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.30.2


