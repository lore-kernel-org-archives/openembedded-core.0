Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195CEC7618A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 22:18:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7257.1678918687462615472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 15:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EnRia98T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1981057wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678918686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eDKcecngOr/Y+scPa9erih8I1lCE9ImaaLC6NKFvac=;
        b=EnRia98ThhMnPUi7JPjYVGUlrTwoZN9TQYvcHCvUH0ep0uc3zvKQz+d/5muFxGdTmp
         Ktc41IBquuUGNceQuilfw0m6spkwre/Kb5qMcIOTw104uRcYDEXr9llYpql6kg56D+dj
         0t2HmFU8HRDLmK4iJxIInc+XmKPrtnhpezUCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678918686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eDKcecngOr/Y+scPa9erih8I1lCE9ImaaLC6NKFvac=;
        b=eQt3qqYQTuZL41mop/9Hsx8B58SaumSjeGuVQjEaay7WEwcJlGIOfBatfrY+qfV6SW
         rrXZ01qG7UddLqafN7jCaYMNAPkiUpyQZFG/nmmfWDZBzj21iW3/HVtSFIbleFCMXu+a
         SkUMQCzhgKFAmugH7jZtp5UCH5eWJKab3qfXBEq2hINsCowRCxKI7RJVxHSIX8Y0A4QR
         3ZIjaJBMY1Y3YxaOK9lpSzHRjgreR2XgI4sKzEM0jOMx26HUifdDoeshO5fJf9AYb9XF
         4m8ta6JEJK3Ddby1wer5hLG6D6Blbwk8pJkGUJEyyMHvYN5YZXFSZSvZa1sv1bOm65we
         YpYw==
X-Gm-Message-State: AO0yUKX0ixCN2mzzlLrjPt6Kt/2DF3esAZaHrHvDiM75r/+rLUy1njZl
	XYiB71x2WxIUJHic5var7es+UEqjeLqaM6wwxxk=
X-Google-Smtp-Source: AK7set8M6duKanzkrkQ9lSrJc/FvhP3cxSoiDX9HBwdOlEXU3AE5tHt21t8DvdhWnaiZaN7Dzzk66Q==
X-Received: by 2002:a05:600c:3ac8:b0:3eb:3f2d:f237 with SMTP id d8-20020a05600c3ac800b003eb3f2df237mr19263110wms.6.1678918685564;
        Wed, 15 Mar 2023 15:18:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b002cfefad9c1dsm4258160wrq.66.2023.03.15.15.18.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:18:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] matchbox-desktop-2: Update 2.2 -> 2.3
Date: Wed, 15 Mar 2023 22:18:01 +0000
Message-Id: <20230315221803.4189345-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
References: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178659

License changes were the addition of SPDX license headers and license
header fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{matchbox-desktop_2.2.bb => matchbox-desktop_2.3.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.2.bb => matchbox-desktop_2.3.bb} (80%)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
similarity index 80%
rename from meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
rename to meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index b05a9c48ad4..9d3a2eca33b 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -5,14 +5,13 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/desktop.c;endline=20;md5=36c9bf295e6007f3423095f405af5a2d \
-                    file://src/main.c;endline=19;md5=2044244f97a195c25b7dc602ac7e9a00"
+                    file://src/desktop.c;endline=20;md5=2e488557570c7dee53bfd0567e4273a9 \
+                    file://src/main.c;endline=19;md5=5d2234b35efa927ab3ae36ebac52ba59"
 
 DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
 
-# SRCREV tagged 2.2
-SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
+SRCREV = "0fd6a0c3f3b7bbf4f4b46190d71f7aef35d6bbfd"
 SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
            file://vfolders/ \
            "
-- 
2.38.1


