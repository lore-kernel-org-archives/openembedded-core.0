Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DAAC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.3729.1647299846697806489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K73cD+Pw;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id i8so26408223wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wX6UL/GaxzWEi7Xm/cDfsY8OJPDHXiKGQVnzZpR1U3U=;
        b=K73cD+PwGce5GkbUUjTvr+udjuZYE+w57vQUt5ITStvhMFimOOLGInLuwfcWQqL3AV
         l/KDJcqcsNzPnOJ9YcuAGyoWs3xTrSGjv2hNw465eOL+IG6xxg4ztwOTbmolvI7YgSkk
         B8ifOJBnEh8vfK69PYk6AMNvl/7UEUXApfRWEFXUcYml+bNZznzr7T3PoLKIGQZ+ohye
         PdteNs/P9szfxchx/svEyyG6Y+s1+EaZCsv/RnzvdY8uChZAstRNwFX4WZdBtw/zWt9S
         OzmeyyMhIcbYlTjXAbdIMZPCfMwXUM1oTRsLHA1KB3OqjeOSOwXbvYCzuEAW9vIsr2Op
         PRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wX6UL/GaxzWEi7Xm/cDfsY8OJPDHXiKGQVnzZpR1U3U=;
        b=2HG6Ca5QfHFld8UxxFJH05yaxGsoTqOAZth8lrZEaoXipto8/n/QbqZQcw5CD3Vua7
         9VkkxfwvY5O/iYiTg9eBB15hNmqXBoqBkAzG4tfOlgd8LKBL20hB5/FD8j/yQW60k/Uf
         ZDA9nlhXDD31BQw4Kj3mAl/HPMu0CxS/Y1DiIRyhj53bh2BpONvjrOe9jMgFUySR8Osd
         e8bSi3PD2CsfuVdaehncaYQ2vv5WsKL3E4x48iWBw2wNcTC+l9ZhHzkiS2KTtaK9REqV
         FyL0YvMTI7fywffkLZ9uALpJ2cNg5VJXktcMld3OoK/jVfmV5gM1w4p6J/Br66uybQsj
         mvRg==
X-Gm-Message-State: AOAM533T5dv2VUZXBUy5G1q1aOK/0fPrTtMilJY/1owmDA60zdEdAK8L
	ZOgt1vN/j/2sq/WWRPn5qnbWWbhbKcM=
X-Google-Smtp-Source: 
 ABdhPJzlmtcqak1MxHzKMApV6wU+WQeklLYkCUwTa3iM7RjrIGr8qkgW7gPEL1v/7oSX1H7uHph8lw==
X-Received: by 2002:adf:e989:0:b0:203:74ea:fa8f with SMTP id
 h9-20020adfe989000000b0020374eafa8fmr18110069wrm.415.1647299845016;
        Mon, 14 Mar 2022 16:17:25 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:24 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 03/11] gstreamer1.0-plugins-good: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:04 +0000
Message-Id: <20220314231712.296796-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163207

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-good_1.20.0.bb => gstreamer1.0-plugins-good_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.0.bb => gstreamer1.0-plugins-good_1.20.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
index 17086bc3b8..08ff5a0bb5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a1464991659c"
+SRC_URI[sha256sum] = "3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


