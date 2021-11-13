Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9FEC433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 08:32:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.3991.1636792356429665030
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 00:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hfBvKJe5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u1so19680869wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 00:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NDAXh5Qv+ztu/3su+AhXbx2kSiCec+zMENFXcdF76c=;
        b=hfBvKJe5/w/hT0ichycNwmbqdVpwfl6JkazTPf+UHtKmFhb7pd20iQ3wWKTRnXvYK6
         Xr8lSLP7JdxFnog2KTyhPzTgRbs7mT95dYpGAnrjGxGCe23yaZd3987b0hEf1z45vCrg
         HekTSTlO4noWysXCTOMeuHzqXndiDD7h1BFjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NDAXh5Qv+ztu/3su+AhXbx2kSiCec+zMENFXcdF76c=;
        b=J5cxyXKURKOD2w+P958+OmD8AtLRsmtpNuUWN+hOWj3yjrE+tVH7HO4yaysyfEIYtj
         KCayG+Ha9nMpua6kYUMCRVpZDf0fE2N3RmaxX+/NWhtXDZTbLuUzJZ3Jg+IMVJAmW2Zt
         33+n+Ro6R13QqwVBGOq3/Dh39pxR+YXEqEw6obht0uA0TsMEGJaYQpRj4FE6gNwWfGkz
         pg7W0gOg32bjzoY12muz6U0dootNgDrDJeY5LCyPgoXoCdiKq8Hw8jQhlzz7XzzQKmSH
         CMa6jSuWBRoQ5S6qoDdkvw1AJDdWdmYmeE63x4hPLyAufk+PjX8KHT8p26dH7hAkZKF5
         +iZA==
X-Gm-Message-State: AOAM53075bFz2S0eDsA8ym6EOekjQmDXVsH7rLc6SUjgIt8+ZA96hUAO
	9Upiv7Mgq+oWWDokUfAJ2cOh6xReHJbZ0w==
X-Google-Smtp-Source: 
 ABdhPJzhUY50DvbVRqOAPW7f5mb4tV8qZjY6Yr/pqvHsA/90GFA3BfntOVfpIWjbV19zBLKG7FHQ9Q==
X-Received: by 2002:adf:db47:: with SMTP id f7mr25949930wrj.113.1636792354861;
        Sat, 13 Nov 2021 00:32:34 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5])
        by smtp.gmail.com with ESMTPSA id
 g18sm7900176wrv.42.2021.11.13.00.32.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 00:32:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] packagegrou-core-x11-base: Drop dbus dependency
Date: Sat, 13 Nov 2021 08:32:34 +0000
Message-Id: <20211113083234.3913831-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 08:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158240

dbus isn't an x11 dependency and this suffers from debian renaming. Simply drop
the dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 4e6d9908c74..0185c93354c 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -9,7 +9,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 RDEPENDS:${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
-    dbus \
     matchbox-terminal \
     matchbox-wm \
     mini-x-session \
-- 
2.32.0


