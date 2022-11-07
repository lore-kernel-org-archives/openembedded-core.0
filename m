Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7956C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.91.1667835421960325107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OCkUbNxn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id p21so11388515plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP440TBQnhskFPvOjuHdcKRY/urEBH3UGfD7cw0iTug=;
        b=OCkUbNxnTNJZlM2bKPXSv2Sz4+JbmgW+o47KtFZfQygJKi5n+N2/sAEaTsluYXxcUK
         JYSQPNoGPso+iUdx0l0G9RvCxjpzrnOJQoQNBFkVvvhzt53Iz435aVxofTuIlGBtRryX
         JLbx1eas7RUz6FrErxwcbapeeF999IOjEZ2vNuWOpp2ccWereDhoG1ZjCg/PATD3hsIf
         6ZhLmuXX/Z46wVp96B0pfc2aQzOeuTjWYDupoVRHjOudV4WIRK2KIZqqclyQq7fH9dXf
         7olX6abYuiYF7Kfrb0EZGxuANT0lkhznwGI56BHhrOaRXRg6QpLLjPTTQyRzrrzRzdBp
         G2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP440TBQnhskFPvOjuHdcKRY/urEBH3UGfD7cw0iTug=;
        b=7Ev5T4aIILM7N+osDlNa50MTGYZZ1fJieD9hFdJyZ9JNbegISH3MPl82RvxjycawTC
         +YAzi1DI2i0QA91+aEFP/QapIWfAWw2HIMx1TweqaqJZj6Lz0LggEDT3XRE0rgYZvttk
         I5xbvPe7TUmbwmdhPUdMhMrfxhGhJ+ylq9sVYtpOBXnbI83Z9+N69+ZaJBmSnSkrszqT
         Bb6tEarGGUx3mq8tezIKKl0GnvBOsTq3m063+ktlO4Bw6krKOWx/9FLilibHYKHngUTZ
         DDDdpbq20fPzsG6lJ/5PhaieQ0wPF84qLmdAm9KJjBv/cD4Gk8mG+WmJSzj15moL5VCY
         mvzQ==
X-Gm-Message-State: ACrzQf0WxPhtcq+b6buqsm84VQO+2MBG2xjznBxXheqiGtqoPYOLfV5H
	ixRkfMLP+lbhj8q7LQaZEaMNAmyRp8sKGVBe
X-Google-Smtp-Source: AMsMyM5LN/iqdYMdckBSbhRXB7E5Da6CAma+SUmctJuVCESI42eln94qlMh76F7t75GZKu1yvg02/Q==
X-Received: by 2002:a17:90a:558c:b0:213:8cf1:2ac2 with SMTP id c12-20020a17090a558c00b002138cf12ac2mr56070623pji.67.1667835421054;
        Mon, 07 Nov 2022 07:37:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/25] numactl: upgrade 2.0.15 -> 2.0.16
Date: Mon,  7 Nov 2022 05:36:23 -1000
Message-Id: <5a51b44967fff256ec298f7c3cfae1c084bf1b32.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172903

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6d9ed8d4b13c2d87dae482bbadef039de050bc9d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 712cf0203f..23be0a3b4f 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "01a39cb4edc0dd0f4151b7ad11e0c56d2e612a02"
-PV = "2.0.15"
+SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
+PV = "2.0.16"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.25.1


