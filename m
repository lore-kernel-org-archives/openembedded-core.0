Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.10543.1592494942107875042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TwiKfpP4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id k15so4870746otp.8
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gvEdz+G9v6fXh0C1By55W9oKaftnoGElYk3/8QVDWo8=;
        b=TwiKfpP4IcU6yUVz4kWsBN0NpdvzBazD0xYUs+pm/vlZhqDWPXWBJnG06LPbkWECd2
         A1NMu0BG5WjGrRcMKfMgX18VILGAXm566WSiHEFlTQaMjs/PeCFl0WMlohQMHeATPNJ8
         6ES+jMTqm8SHMOhWklh/cRObI/7Mz6LewR+dMMSmsC/8PxW/RQFuG06ax8/b4t9TL+3E
         67CdEj5qVeoyZ4Rzu3y7W65oZbcvRaw7IGCl9erHvAIKDEDx0MOdlv3pa2VVcRCIcTs6
         Sm/q+8tiqBWQaSgyOT6KK8qpsUTzORmW6F7hZFC1U6EDbvKk/FzAhFe+kmHB67JjczuI
         5lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gvEdz+G9v6fXh0C1By55W9oKaftnoGElYk3/8QVDWo8=;
        b=Y1V8vfy93AWrghjTul2D57qe6q+ppd/4c3fwtuuYEZIw2rCTrxDUEm7+iKiwwX6QQ8
         7GX8wQnR2bBatdMVvpBv8AEwwafLomFq38aY3HTb8BL5zcXRVUmbWR3wVLCO2MmzOFGk
         Sb2GsZzjVs3p6H1CJmgkl53UJ2dWvzjCP3FOvTi5ml0BBPTfgzV30iEhplqfKkujP6P5
         J7SU9rCxNl5Ryy8LFcoPCV/vNvisOQcgig2DXz2HP/x4RPMCSwvZ/bOMBDksaIFLZom4
         tKhU1vaXDfhKZHc6PXUPG2hhYhpbyn6ogiE+iqoQ5+/NWXS03JugYOpYvIFp1x9rmY6b
         ZCJg==
X-Gm-Message-State: AOAM533N8vJ19P9tQOpSAS5RBqK+CktlC72oH1RYmL/wxmvYI5NOjxCS
	XsDEIEnlqvIkMbkY4IFFhrQK0tu4kp6nBQ==
X-Google-Smtp-Source: ABdhPJzgHGQpJAHlC+DyYnnJaQdckn1GBXTR5m65+7FZK6kOGOMpwQJ/Hy0VX20D8iZgxfebXvG2rA==
X-Received: by 2002:a9d:2f47:: with SMTP id h65mr3780191otb.173.1592494940842;
        Thu, 18 Jun 2020 08:42:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/21] mesa: Remove -fcommon
Date: Thu, 18 Jun 2020 05:40:40 -1000
Message-Id: <eb47eaa3f06e49f635bd774808ddb4f28fa3d718.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This was fixed in upstream version 20.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d269a3f3a84cae92e611e02082150cfd97f8258)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa_20.0.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_20.0.2.bb b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
index 56ee28c870..ee0260e073 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] = "aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-CFLAGS += "-fcommon"
-
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-- 
2.17.1

