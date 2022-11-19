Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DFAC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.30661.1668892551976033218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CL32AE7r;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id u6-20020a17090a5e4600b0021881a8d264so5739462pji.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlTQRtJN7M6xwBlIpmF3GxFuAe/T2bKCVhKbkGGWjrY=;
        b=CL32AE7rqijJm/4TvYs+5vDBvdXDiYfLSJr2Om/yeplT9zKYocDbqEzZo/Gx1kZdCn
         M7Q+E3ivPc3azFFuqS69rNwfLZedh2vwbQMuOJylqhKZzXziuWuwnfv4cu7hUwIda1s9
         CcKFYtYWHGGnTfGQfkk7c4KdxuHEpEAOReceIC866YAC9bzdRx4bDW3fwX4W4MHHN8m1
         quJ4optLDZCAPKK1+CVjDDnTh7K6VJTxHl7TmHhEhbiB/A7Sf8k59EIktnq7HRiUK4es
         wxsD0dSP3GDmFJOWLZ0zZueciLPFLt7/yTxdDz+GDvNhrujA+eLjwHW1AIOiAfPVDxrU
         s6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlTQRtJN7M6xwBlIpmF3GxFuAe/T2bKCVhKbkGGWjrY=;
        b=svKsjkmyFfffmVRTdrjn7fUYzEeU5x2WXDqInC6WyhdC/1VZulYmzHdUS0RRYrfY2P
         p8nalCgfYrWgIem4p8W/dtT4EPi9PpY3lpFQaTvPmlBzcusJQa1pdOzp6pi9uKy/F74G
         5llRfL8+cBYDVLgQ+Gd2ThVV+icJsgBRMd9fTQx58W4+t9k1JiPEyPQ1wtQZHJMBtSbO
         Bmy9BZTdNgGPpyoyucW0+qT+SK0W9lQt85sD5BKFU8Qgspldbg8gdtyrb8I2h08TRkAR
         KHwecKwUEYg7WD7Aj6WDUGjLHdHTPxigLGz0rgAxbd+LUjps394OhsKPEYQemkKU9Oo7
         q/Vg==
X-Gm-Message-State: ANoB5pn5KKj47L1rDzgKQWhHWHIgCnSJPeZyGIBJ2I++CstodA4085SE
	OXwPMl7XbTXO2K5kKEyCa8tiyoq3zrfg2575MK4=
X-Google-Smtp-Source: AA0mqf7ll2by9XgBPQEL0fhdPKn9KFtt+R35uDFy4fHRH3HkYwz2T4HfBk9M4uyIUiSJizAhior1KA==
X-Received: by 2002:a17:903:3255:b0:176:9842:c651 with SMTP id ji21-20020a170903325500b001769842c651mr5308617plb.108.1668892551064;
        Sat, 19 Nov 2022 13:15:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/35] tcl: correct patch status
Date: Sat, 19 Nov 2022 11:14:54 -1000
Message-Id: <d480c9842cc4a8cc9370cc9893b2de8535e5b960.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173555

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f37e5b83db662bba92605c8741516108aad3c5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 44b2ce0a30..5a10c93a31 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream does not support installed tests]
 
 Index: unix/Makefile.in
 ===================================================================
-- 
2.25.1


