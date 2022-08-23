Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73863C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.4509.1661294181689775320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7ciG+iZz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id r69so13468641pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=+12+5GXEgsIJTDlwD0k0vUqL44MgGGRsR6zn97Cqx8U=;
        b=7ciG+iZzUp6/IdFj7WOh4Mp1Cdo57d3nQ+DBV4WEdYFvWeVWSi6WJ7z9oNN6jnuPQZ
         DVf/LmXqHJ/7TFkrVOKDdhb8xq2wNPaL9seeZ/9PdjefZVpkmpaPNZ6GtPnlY4TtBprV
         bwA/LIuyrwPJhU+fnOvLrDOEGW1OgYGxtBx2RVn3qXKuYZc8Enj8yqMhCeHoGCp7VVNT
         LTJXwP2DENCui0kX596RpE5sPyjMGSNk5ZL7FWdOqepzPch5VZvi5bRxl2B0HStoGezZ
         QNzw4yV4ob+fFNTv0MqLiQGC4F7+XUOc33oI3E0avJV7oI3DZmnzsFeYD7CsrPAM1ZKi
         MVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=+12+5GXEgsIJTDlwD0k0vUqL44MgGGRsR6zn97Cqx8U=;
        b=Hn2WjUsso6LGgQ1LpIyrPgXF3joLy/+8uvWImJbHTxeNgBSkzt/2NEbwy1IZ6OeD/R
         HiBxS2p1Qtpuoja4NUg4G11+Rm+ZiuFCAU0SJuQ2ZjX4k0YdMcxDp4k0yVzd91NCO7HV
         Z8yaPeyJAcH1bfqBga1hch22/0jhXBEoX4CbVweGrMuhW6tAeUCYLcHgvTO1k4zglIZ7
         N4VBVVyArp/YOU+9RxkFglJlixYkG8SzEZbqKy7qnxEw6uR0OsbniqQ9xOav+yySXo7l
         /JBUBDd38IYX73ZT3HxNDrIwVxEQVf6/Z7KKeL/wH/C3bC3nWUl3v8KLejXGUQqk7DxG
         shbA==
X-Gm-Message-State: ACgBeo3khnLw5VZrH9vyIlzCzGrhJ9pcdLPzEv5M4AQ1PfBPlJV44re6
	1FIjIGD5uMM9wa/y96CTDMPdtu/r7oTVii6U
X-Google-Smtp-Source: 
 AA6agR4AX1mIE2eOJ/NPOXeRFW0JnJ9MHd5KuPelmKWtAHfHECOJXXX4irlgh6/ixD1Z0gy70svX1g==
X-Received: by 2002:a63:2b8e:0:b0:41d:6d37:b259 with SMTP id
 r136-20020a632b8e000000b0041d6d37b259mr21774612pgr.208.1661294180690;
        Tue, 23 Aug 2022 15:36:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/28] libwebp: upgrade 1.2.2 -> 1.2.3
Date: Tue, 23 Aug 2022 12:35:27 -1000
Message-Id: 
 <8dc75fd36bb523a2d10305fd1fec91081d4ce274.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169747

From: Alexander Kanavin <alex.kanavin@gmail.com>

- 6/30/2022: version 1.2.3
  This is a binary compatible release.
  * security fix for lossless encoder (#565, chromium:1313709)
  * improved progress granularity in WebPReportProgress() when using lossless
  * improved precision in Sharp YUV (-sharp_yuv) conversion
  * many corrections to webp-lossless-bitstream-spec.txt (#551)
  * crash/leak fixes on error/OOM and other bug fixes (#558, #563, #569, #573)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ab7d3bd94f8aeffc1e126a1ef80d5ca6bd3d6c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/{libwebp_1.2.2.bb => libwebp_1.2.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.2.bb => libwebp_1.2.3.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.2.bb b/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.2.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.3.bb
index 281cff1bf2..2d523df749 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6"
+SRC_URI[sha256sum] = "f5d7ab2390b06b8a934a4fc35784291b3885b557780d099bd32f09241f9d83f9"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.25.1


