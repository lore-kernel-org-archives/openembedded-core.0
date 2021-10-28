Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F07C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:22:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.247.1635456138373009379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=uqkXkD01;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id n7so13018259ljp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ69nfhAmbo0CclxPzf+ZtCpl01MDMbxblw+Vd7N1VU=;
        b=uqkXkD01wyvkUS6+ScChpnPqgvR+3r8C+YhW0V4LnlNjVCLDAhjqm0qRd/Pnc06z4s
         CQd+FGR2ScMmZ2dGLJTV76JYUCu/BtvQ4WbeBCStrddV9hHaR9P9RVNITb6FuQsP5761
         DVPQAWpgcI6HtWxVWeKLd0GV4DxPKwk7E6K2t5Sbs3AOBu0cyjw6C7dSm2eBZ4I6c7hn
         S/lt30JLZD3nfVMxmZHvdgM3FPsAp5gaqttlUdC2iKqvolylmScNpCskF5JxaoldlbFs
         k2FZDIz600/ZoDDteM4nq8YnO18Riubx4y322InsvIQfk+kSZtcK3Ct1xMxbOXlHRCEp
         G68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQ69nfhAmbo0CclxPzf+ZtCpl01MDMbxblw+Vd7N1VU=;
        b=P+h906uL4C4xE98wb4g+p5uPi/JJCB/Wea+gnQ5gCpY4LSqOmuqnkrds9WL8RHrvvn
         ZLc6UGZnWSQlxOWv3wip31UABROdd0AaQLOwXvwzihe21J+csRf6qeZPD7FdJK5Mq/VT
         ZI6mfGQIJW1/zxG82TduiXiJ76TCgtPzS678UgRXT7VgQO3BK7OIn8NELAgtzN1cJHXv
         p7Iu2RmKmFLWvy7H7owDnXu2B+EqC6zQ6EMezIhVpkyNn55AXf8z4T+mLnVEc0U6cqyh
         TSOFBUiiGSqrq70t4Emj7kcy/C8F3bnugU40h1JzrP+uSfTT3n6LstIPgD4xypGcbb/8
         MBBA==
X-Gm-Message-State: AOAM533gImZ9ckfEI2ySgZmbMoKzSk5YQEfDHVA8ryBVKdc5VVIOdc/f
	kTdA4l+4f+qq4g7PipYoP7DhL5atzaTWijpq
X-Google-Smtp-Source: 
 ABdhPJyY2mB4LyBGs3c97z+zM6PnZ/YaSS71I853mPCSgGg6w3miM9xCkqBNi7QT+wIFzOHwVBGCWA==
X-Received: by 2002:a05:651c:989:: with SMTP id
 b9mr7037306ljq.335.1635456136247;
        Thu, 28 Oct 2021 14:22:16 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id t1sm212196ljd.43.2021.10.28.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:22:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-google-api-core: update to 2.2.0
Date: Thu, 28 Oct 2021 23:22:14 +0200
Message-Id: <20211028212214.1361906-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157610

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...oogle-api-core_2.1.1.bb => python3-google-api-core_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.1.1.bb => python3-google-api-core_2.2.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
index 34489af72..d6293613b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "646d9399c3c478fe475cfe523e84572ab31a340814ea977fb2774eca5a6549a2"
+SRC_URI[sha256sum] = "dca67b5e369a5127ec00c8ea02de48517e39c1aad882e2e6d85da8050520cab6"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


