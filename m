Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1839EC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.14209.1645301748919863765
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z43I0w37;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i14so20106815wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4F57pY1Q5VnwzqEIKNEhRWESvTk8rLZ33gGUVvMoGbc=;
        b=Z43I0w37UifHGUV3z34n3PTNDAMJ0yMBVxRgxSc3f5HHiLahahUw/0onG6o64D1NU9
         40RQunrr/0tE8dk3R5iBwJjtZ2rjS9HghaQQ9rGL0ruh5+ULKoUmILrxqSs39EidA3w1
         C8X2jARlcjhRyMjbY0X+e+lvzF8XHIEgXkbqKas9Mm/fD/fDKO5PX/CIF+cSGY1K8tlb
         4GHFEn7Qu8z6kl0Zl1Obmr1s8myEp8bMZSl6IguZrvJoodu4r9YpN2Wo6aDT/4cRGD+H
         RW6eyahKZcIA8T+zQR67myIzDbQauIgtUgPP/vwmMdxi1k0ZFNdFvAbRgswyWmWSvE/C
         AyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4F57pY1Q5VnwzqEIKNEhRWESvTk8rLZ33gGUVvMoGbc=;
        b=LDGPzo9W7x3nPN72ReDR3flHj1/tpzo/Pfpw7Mip3/oMsmDg+1Z91XSRHMvigqh+zC
         GrKNgPqArwesdDS3KcSRBgDA3ac5zgdgrqD8zldoUjcgohWrtOog+Tl5t4B+HMcxIOV2
         /zVuPwq5NjTCuKgP236gw4f5VGfQpwaM0HhA1KCQtBell+OIFKMRKNBGaHtuPzIK0voA
         OWmggNS1YTaWHuFalUF/nGu6i6iqfvolOjad1Y6xITHU1+tBkq3swV9pOeq1Y4RbmEUz
         yVsWccU59OYCPxlWKrh6O4BekotIv1sPNZi1c7zmGupCEL6OW9q9JDlKByVykB6/JiG1
         8rrQ==
X-Gm-Message-State: AOAM530U7AgWNhnWo8KSaWGPdlwmoG6xisIU7Ztbs4Sco4fbNK7U6BJx
	W9Ykk7UuPpaEHxDSb40XZL2sHZYHqN4=
X-Google-Smtp-Source: 
 ABdhPJyaWIJ9IywyEkva4235YoJfz1PBLIYnUJi1QMD3XX16CAPbZwhR1dQ5LcUAFyCVp3ET4bO/NA==
X-Received: by 2002:a5d:4590:0:b0:1e6:889d:feb6 with SMTP id
 p16-20020a5d4590000000b001e6889dfeb6mr10547304wrq.378.1645301747135;
        Sat, 19 Feb 2022 12:15:47 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:46 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 03/12] gstreamer1.0-plugins-good: 1.18.5
 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:05 +0000
Message-Id: <20220219201514.1551306-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161967

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
index ade935df9e..a43b8095c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
+SRC_URI[sha256sum] = "26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


