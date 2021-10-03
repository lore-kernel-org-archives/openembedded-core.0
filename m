Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A02C433FE
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.2544.1633304546168740549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L485jWBM;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so17686229wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=75zi1M/CBG0t08qZOkvZnL7OTJo3U3CQBJjKhlRePGU=;
        b=L485jWBMG2Rkr5p/JBqUVSV4k6IQ/vHsKPMp40so2vfbEu80kX8qULMedYxXOIosGs
         LLWf4eRXIHDnzpv6PbvyQ7i/Qtrdhwf9NJDeXPA86vEycLICG4c0zygI6FZ9S1keI1wA
         FUogcLgg2IHhD3/2zbROs0S2FRiJvOlmO1fIsuSfVSRIkGjj3BaxADV72LHJrF8jzf+J
         H08yUHA841FOQrst61/l+Uht6TWNBojD6ifkDo7sxPWB4tAFQSE7rBJ3pDlFDoutXVIT
         Mq4vRmkChJfwi5KVJg9jTRdDzryKwipLA1PlbUH+tMZQg9ZQPCwmo2STF+OWVmu83TTd
         O9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75zi1M/CBG0t08qZOkvZnL7OTJo3U3CQBJjKhlRePGU=;
        b=5qBlhM0IEP0Yp8YgECP8OmCIWfxEQztGwCfKj2jKPIgyG6X2iNw3DRBmwaUFk5bLYz
         Ai6AtJ9TG98/aJtWxTxXVE6XTOyTq9fzSNfKD90WkCYtesXY6vNCX7zFik2d73FFNb1F
         BcPJ/vj2t9kctqoqnyybfcXZgoxerpDzoo0QTw6uvX5qxGd/khkvAObK6u8kjdfBuwke
         GxU/djaec2g352k38IDxSp+s2kfbZfrzcJwvIJeGsmdZMxBy2dvozGy4FOGaPZ5zzKhB
         qKFNOOaIj6UXqhaJnJ1tAHFMaOrSWihuJfUYNacGVWbH/USi3Z1VB5FnAVee2Yy7QCu6
         u8Ng==
X-Gm-Message-State: AOAM533otasHwrHHN9S2ZzqD4YR/lrdW8Gov6nCN6tLqzy3eYGlX07Wk
	e5VP5kaSJ2b4pROYpm94ZOh/15IqMWxaug==
X-Google-Smtp-Source: 
 ABdhPJyp7mIaLSdETNKCKHW+HlGUnwpHE06YtiBTlSeWj5VTj26wMY3FD1kE3dcK7zb77wya28yLJg==
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr15472623wms.27.1633304544309;
        Sun, 03 Oct 2021 16:42:24 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:23 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 12/12] gst-examples: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:06 +0100
Message-Id: <20211003234206.949967-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156576

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-examples_1.18.4.bb => gst-examples_1.18.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.4.bb => gst-examples_1.18.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
index 9d8fef86ed..a720bb73ff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "959bb246a5b1f5f9c78557da11c3f22b42ff89c0"
+SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0


