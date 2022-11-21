Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A48C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 18:06:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.1065.1669053964986211322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 10:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EnvvGa+X;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id kt23so30349557ejc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTfFz/dYD0Zp3C9fowOjw/1dTd7ukZVu/4bH9l95nn4=;
        b=EnvvGa+XNiVpwx+kAaB1Y/AobXUCZk5oUzjVq/gl8Sb2YhsqR8AeWDTNyF4+ONqMa7
         phjhoLBgKTtVHBc7rHKM8wXjGf6TSBjPwjej6HZe0DGs6XNnHyRDu0pRBXRDUn9HArGK
         trJ8J9NoUBiEuC6JmgznkNvYE4SdR055Xo9i+E5Q6/KYK8mERlGjFCW7J98xTeTdkPwM
         89cwtjW6saIA3Ofl70ocgfdTmRhNedyTyU2IWpnyUAiHfXdEkQX5qAqnK+d/GUF2yfHt
         0q2bN7jzTUBVEzypFqgV9+TG9fITzzKuUHueyzd5PLws5znUZQW9Y3jjX1X5wM0MhHy2
         J4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTfFz/dYD0Zp3C9fowOjw/1dTd7ukZVu/4bH9l95nn4=;
        b=wiIWfCFG425BZ2fG25OybNSdgqdlDisUYsutC1wBmWLvlmxhlgb8MdYRMnWB5L1sFA
         kV9L5dpHOAXxBPezArq6fmR2o3whve0qXyTcEAZa7/YHdIykWEQ7zGAVwRIvdC2dzcwP
         j0bG4m5UvWoreh19LpW4XhhEqmHhkiEp/u9bgl1apKseJDg359yDVvIXBVvJCICGMUuB
         OPxLb+fKyPCWAv9Ob9y1Gex2Jf7cWwTxfYUBzE8FIWJ6SgopPxZi6IBaShpiTr+00iiY
         pC5xSSe1OJIKKR8qx59Ej2PYbaJDdS8xbZztw2dRuUyzrMJgxg8nR3YDhXOYHM/mTYN6
         mnFg==
X-Gm-Message-State: ANoB5pla94NTSnnZUE3N53hFTtn7mSGR7r0uHKa5tN8Mb1KhyczKxfY2
	7X8+i/NfubipQjNS1AF4GiaggRrJpQU=
X-Google-Smtp-Source: AA0mqf7Q4rlQNUTHBf6nksYfF3thIHiFZtajPc1C2AmFjvYxduviB1pJXCjalG2rGtoswzR+Y6Jqfw==
X-Received: by 2002:a17:907:c007:b0:78d:b371:16d4 with SMTP id ss7-20020a170907c00700b0078db37116d4mr2056479ejc.434.1669053963102;
        Mon, 21 Nov 2022 10:06:03 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709060dd600b007ae566edb8bsm5233583eji.73.2022.11.21.10.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 10:06:02 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] opencv: follow changed name license_flags_accepted
Date: Mon, 21 Nov 2022 19:05:29 +0100
Message-Id: <20221121180529.3358952-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 18:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173660

From: Max Krummenacher <max.krummenacher@toradex.com>

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/opencv/opencv_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index da1e659a4..158cb6342 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -109,7 +109,7 @@ EXTRA_OECMAKE:remove:x86 = " -DENABLE_SSE41=1 -DENABLE_SSE42=1"
 
 PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG:remove:powerpc = "tbb"
-- 
2.35.3


