Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE06C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:14:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.343.1647980097333153680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F3WZO+uV;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bi12so38685431ejb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV4DKtxKzhUbApTJ7vnjKyZd3R9wWxqxkmafNJCye6Y=;
        b=F3WZO+uVRp0FtJQe0+n51In2mW/O994g5TtsuEk6QNZj8bQiVkmyLRJ/c72i8kw1Fp
         uaQQHTrIxfLA6y2fMPYrFyLfr5EPuANQ94EEMNasjmiL9GTb/N5PMudu3OnXHRTwbh9m
         Iq/zIGM+bHsu4dTOiSMbK9VQsTXmHMjFuVwEfWgEbYiPHa/xuU5oS1xygrrUSUaeax5d
         QXr1kidcd6yJwwClDIO1mlJvexkAb23CSCHtGfyXdlYZQpDPhguTkCG2+uDqc8765K7X
         uwMgbSd6TBSqZZX+n65rQpeVrCBSgaraNO5gsDDIXUqJqQ3YHtht/0Luc8nHacn0zDMn
         6SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV4DKtxKzhUbApTJ7vnjKyZd3R9wWxqxkmafNJCye6Y=;
        b=IS+UDK57D/Ku/nnNlvLD4k6X5F4/yPMQvPdoDXjuZpUCHft96CaReVIPibj0m7RpiW
         p+ph6HFKYoeGCz4wUdAfW8a497/Sy1AQ8HKOGCDcvFRJ0xSyeAb4chV/tAQB21wdX/IW
         ikUvu0W10vPjmyPDuFye9Ds+Up50FkQdL3Ty5p8jeZ6ri1ZUw4tThVp5GfaSWTen31G3
         /Yf1E6UobOxBjqaI0IHLdgfNq2dQ8vtfPfiN0IdQ54t0jiVxJpDOVnVTyzGcu6PMfEu7
         SgpnOYhHEJTkKDA1Pn3tzOHsX03MC4+vjK+k56Gk8pSWKHYSVKQfcVfbKg0wDUbT0x76
         gUog==
X-Gm-Message-State: AOAM533heyEbpM2tFRe0hkfcN46a058iq36EABIu24Wood/dSTYXZ4Qf
	QQs4/HKejpxhFm7Mkk8mNSK5YPmPv/iHkzj7
X-Google-Smtp-Source: 
 ABdhPJw4olL/BkKDeVyPBm6U/JaYraGEC1bYija9YhVF1tBTduDbDUpfs8XlIm1kPCZb+XaYBt5z7A==
X-Received: by 2002:a17:906:3ac7:b0:6ce:c3a1:3dcf with SMTP id
 z7-20020a1709063ac700b006cec3a13dcfmr27139759ejd.182.1647980095477;
        Tue, 22 Mar 2022 13:14:55 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 sb15-20020a1709076d8f00b006dfe4cda58fsm4650635ejc.95.2022.03.22.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:14:55 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [hardknott][PATCHv2] virglrenderer: update SRC_URI
Date: Tue, 22 Mar 2022 21:14:49 +0100
Message-Id: <20220322201449.2703-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 20:14:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163573

The git repo for virglrenderer was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index d92359565a..1c32a573b2 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/libgl libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
-- 
2.25.1


