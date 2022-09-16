Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC439ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.899.1663362514713185061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vjt3OkeK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id ay36so7285517wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=RxniurOYay7P8tx2ENsfSzPvwaYtV5X1yPT1yvRYuJM=;
        b=Vjt3OkeK9gKxWk0ng67vyJV3Rr+tBd0Fn6fD6hgC8LDIzt7g5SLAwCtMhKQ6zzF3hv
         AHglnxBjBbpWHUUGzCVg+WHJOKigo6Ia7i2I8Bx1g9EeZPkiAbFxO0DtIwTOLhDxl0lC
         ocIH/gG1+01GwhIVcDjJRnCBbMGya3ZU1oNyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RxniurOYay7P8tx2ENsfSzPvwaYtV5X1yPT1yvRYuJM=;
        b=SPj/kIsA4x1Dc4dWIZzkrwyX7Mx7RQigEfb3lbWKZIejyKDznmkWjmCnrSJev0MxKF
         QWqh5BsiSFBVARAxDb043TN6BwvdfCUbzVP85YjH7GA5ITiPBTyno/PtFjBvEE2RGCns
         syHhmNGedCFg9m00+udDRFlO1s8fxYsO1bq0YHSQKSgfsTSvID2ylV5KdNRKOKOwgshG
         MGV3F1oxIzWKaK8+CHFg9JL4iTDZMCfM2jEhu36r4zR+7ItGBihaKyi7crYrKRMGknSD
         P8oMrqmpY5/PD60SxGS+kxI5Xdytb3dqUtwkCL5ObUajeJYfnGZAq4Vd3iUBqSUxNwWy
         ajBA==
X-Gm-Message-State: ACrzQf0zaz9AkOSGeO7cRM3tAdxX7gcPxaNN87vF2TpbpKZEAQ2S8h+Z
	A47mYDJYP0EPirIZkiSypSoXmZqlPbyHSg==
X-Google-Smtp-Source: 
 AMsMyM4i7b3ZbArrJelc/Q/VlM5HY4OXwSBD5xkVeH+aik/2mn6FtR/zgDix2UfL6arScg1PHpw8KQ==
X-Received: by 2002:a1c:4c18:0:b0:3b4:9b1d:5501 with SMTP id
 z24-20020a1c4c18000000b003b49b1d5501mr4563277wmf.13.1663362512871;
        Fri, 16 Sep 2022 14:08:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/24] meson: upgrade 0.63.1 -> 0.63.2
Date: Fri, 16 Sep 2022 22:08:06 +0100
Message-Id: <20220916210818.1228761-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170810

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/meson/{meson_0.63.1.bb => meson_0.63.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.63.1.bb => meson_0.63.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.63.1.bb b/meta/recipes-devtools/meson/meson_0.63.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.63.1.bb
rename to meta/recipes-devtools/meson/meson_0.63.2.bb
index 7f77a7de34a..406f5bf05ea 100644
--- a/meta/recipes-devtools/meson/meson_0.63.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9"
+SRC_URI[sha256sum] = "16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.34.1


